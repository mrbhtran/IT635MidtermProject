CREATE DATABASE company_resources;
CREATE USER resource_manager WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE company_resources to resource_manager;
\c company_resources

CREATE TABLE employees (
  employee_id INTEGER NOT NULL,
  name            VARCHAR(128) NOT NULL,
  email  VARCHAR(256) NOT NULL,
  phone           VARCHAR(16) NOT NULL,
  PRIMARY KEY     ( employee_id )
);

CREATE TABLE applications (
  application_id     INTEGER NOT NULL,
  name            VARCHAR(128) NOT NULL,
  employee_id  INTEGER NOT NULL,
  PRIMARY KEY     ( application_id ),
  CONSTRAINT fk_owner FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE servers (
  server_id         INTEGER NOT NULL,
  name            VARCHAR(128) NOT NULL,
  ip_address     VARCHAR(15) NOT NULL,
  application_id INTEGER NOT NULL,
  PRIMARY KEY ( server_id ),
  CONSTRAINT fk_application FOREIGN KEY (application_id) REFERENCES applications(application_id)
);

GRANT ALL PRIVILEGES ON employees, applications, servers TO resource_manager;

INSERT INTO employees VALUES (0, 'John Doe', 'johnDoe@llc.com', '6094485678');
INSERT INTO employees VALUES (1, 'Jane Doe ', 'janeDoe@llc.com', '6097991222');
INSERT INTO employees VALUES (2, 'Joel Bloom', 'joelBlooom@llc.com', '7327455200');
INSERT INTO applications VALUES (0, 'hrApplication', 2 );
INSERT INTO applications VALUES (1, 'financeApplication', 1);
INSERT INTO applications VALUES (2, 'itApplication', 0);
INSERT INTO servers VALUES (0, 'serverA1', '192.168.111.255', 0);
INSERT INTO servers VALUES (1, 'serverB2', '192.168.111.230', 1);
INSERT INTO servers VALUES (2, 'serverC3', '192.168.2.255', 2);
