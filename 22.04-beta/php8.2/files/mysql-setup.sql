CREATE USER 'probo'@'localhost' IDENTIFIED BY 'strongpassword';
CREATE USER 'probo'@'127.0.0.1' IDENTIFIED BY 'strongpassword';
CREATE USER 'probo'@'::1' IDENTIFIED BY 'strongpassword';
GRANT ALL PRIVILEGES ON * . * TO 'probo'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON * . * TO 'probo'@'127.0.0.1' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON * . * TO 'probo'@'::1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
