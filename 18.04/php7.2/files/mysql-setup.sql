ALTER USER 'root'@'localhost' IDENTIFIED BY 'strongpassword';
ALTER USER 'root'@'127.0.0.1' IDENTIFIED BY 'strongpassword';
ALTER USER 'root'@'::1' IDENTIFIED BY 'strongpassword';
GRANT ALL PRIVILEGES ON * . * TO 'root'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON * . * TO 'root'@'127.0.0.1' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON * . * TO 'root'@'::1' WITH GRANT OPTION;
CREATE USER 'probo'@'localhost' IDENTIFIED BY 'strongpassword';
CREATE USER 'probo'@'127.0.0.1' IDENTIFIED BY 'strongpassword';
CREATE USER 'probo'@'::1' IDENTIFIED BY 'strongpassword';
GRANT ALL PRIVILEGES ON * . * TO 'probo'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON * . * TO 'probo'@'127.0.0.1' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON * . * TO 'probo'@'::1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
