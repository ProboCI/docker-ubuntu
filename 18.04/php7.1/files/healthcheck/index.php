<?php

/**
 * Database health check.
 *
 * Opens a connection to the configured database and runs a trivial query.
 * Returns HTTP 200 on success and HTTP 503 on any failure. Intended to be
 * served by Apache at /healthcheck.
 *
 * The engine is selected with DB_DRIVER (mysql|pgsql|mssql). The matching
 * PDO driver is provisioned at container runtime by the build manager; if
 * the requested driver isn't loaded the check reports 503.
 */

$driver = strtolower(getenv('DB_DRIVER') ?: 'mysql');
$host   = getenv('DB_HOST') ?: '127.0.0.1';
$user   = getenv('DB_USER') ?: 'root';
$pass   = getenv('DB_PASSWORD') ?: 'strongpassword';
$name   = getenv('DB_NAME') ?: '';
$port   = (int) getenv('DB_PORT');

header('Content-Type: text/plain; charset=utf-8');
header('Cache-Control: no-store');

// Normalise common aliases to a canonical engine name.
$aliases = [
    'mysql'      => 'mysql',
    'mariadb'    => 'mysql',
    'pgsql'      => 'pgsql',
    'postgres'   => 'pgsql',
    'postgresql' => 'pgsql',
    'mssql'      => 'mssql',
    'sqlsrv'     => 'mssql',
    'sqlserver'  => 'mssql',
    'dblib'      => 'mssql',
];
$engine = $aliases[$driver] ?? $driver;

try {
    [$dsn, $pdoDriver] = healthcheck_dsn($engine, $host, $port, $name);

    if (!in_array($pdoDriver, PDO::getAvailableDrivers(), true)) {
        throw new RuntimeException("PDO driver '$pdoDriver' is not loaded");
    }

    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_TIMEOUT => 2,
    ]);

    // Confirm the connection can serve a query, not just handshake.
    $pdo->query('SELECT 1');

    http_response_code(200);
    echo "OK\n";
} catch (Throwable $e) {
    error_log('Healthcheck DB connection failed: ' . $e->getMessage());
    http_response_code(503);
    echo "SERVICE UNAVAILABLE\n";
}

/**
 * Build a PDO DSN for the given engine.
 *
 * @return array{0:string,1:string} [dsn, required PDO driver name]
 */
function healthcheck_dsn(string $engine, string $host, int $port, string $name): array
{
    switch ($engine) {
        case 'pgsql':
            $port = $port ?: 5432;
            // Fall back to the built-in "postgres" database if none supplied.
            $db = $name !== '' ? $name : 'postgres';
            return ["pgsql:host=$host;port=$port;dbname=$db", 'pgsql'];

        case 'mssql':
            $port = $port ?: 1433;
            // Prefer Microsoft's PDO driver when present, otherwise fall back
            // to FreeTDS/pdo_dblib. Both speak to SQL Server.
            if (in_array('sqlsrv', PDO::getAvailableDrivers(), true)) {
                $dsn = "sqlsrv:Server=$host,$port";
                if ($name !== '') {
                    $dsn .= ";Database=$name";
                }
                return [$dsn, 'sqlsrv'];
            }
            $dsn = "dblib:host=$host:$port";
            if ($name !== '') {
                $dsn .= ";dbname=$name";
            }
            return [$dsn, 'dblib'];

        case 'mysql':
        default:
            $port = $port ?: 3306;
            // 127.0.0.1 (not "localhost") forces TCP so $port is honoured;
            // "localhost" would use a Unix socket and ignore the port.
            $dsn = "mysql:host=$host;port=$port";
            if ($name !== '') {
                $dsn .= ";dbname=$name";
            }
            return [$dsn, 'mysql'];
    }
}
