CREATE TABLE clients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  phone_number VARCHAR(255),
  email VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT current_timestamp,
  updated_at TIMESTAMP DEFAULT current_timestamp
);

DO $$
BEGIN
  INSERT INTO clients (name, address, phone_number, email, created_at, updated_at)
  VALUES
    ('Davide', 'Rua dos Testes, 1', '(11)111111', 'davidedostestes@abiscoitado.com', current_timestamp, current_timestamp),
    ('Luiza', 'Rua dos Testes, 2', '', 'luiza@abiscoitado.com', current_timestamp, current_timestamp),
    ('Caê', 'Rua dos Testes, 3', '', 'cae@abiscoitado.com', current_timestamp, current_timestamp),
    ('Pinato', 'Rua dos Testes, 4', '', 'pinato@abiscoitado.com', current_timestamp, current_timestamp),
    ('Hika', '', '(55)555555', 'hikari@abiscoitado.com', current_timestamp, current_timestamp),
    ('Icaro', '', '(66)666666', 'icaro@abiscoitado.com', current_timestamp, current_timestamp),
    ('Yan', 'Rua dos Testes, 7', '(77)777777', 'yan@abiscoitado.com', current_timestamp, current_timestamp),
    ('Lucas', 'Rua dos Testes, 8', '(88)888888', 'lucas@abiscoitado.com', current_timestamp, current_timestamp),
    ('Edi', 'Rua dos Testes, 9', '(99)999999', 'edi@abiscoitado.com', current_timestamp, current_timestamp),
    ('Leandro', 'Rua dos Testes, 10', '(10)101010', 'leandro@abiscoitado.com', current_timestamp, current_timestamp);
END; $$
