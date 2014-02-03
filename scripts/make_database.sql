CREATE ROLE kidsquest WITH LOGIN CREATEDB PASSWORD 'password';
CREATE DATABASE kidsquest_db WITH
  OWNER kidsquest;
\connect kidsquest_db;

-- generic schema and table, we don't really know what tables we need but this is
-- how we could add them if we did
CREATE SCHEMA IF NOT EXISTS admin AUTHORIZATION kidsquest;

CREATE TABLE admin.user(
  user_id integer PRIMARY KEY,
  name text
);
ALTER TABLE admin.user OWNER TO kidsquest;