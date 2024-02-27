CREATE TABLE clients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  phone_number VARCHAR(255),
  email VARCHAR(255) NOT NULL
);

DO $$
BEGIN
  INSERT INTO clients (name, address, phone_number, email)
  VALUES
    ('Davide', 'Rua dos Testes, 1', '(11)111111', 'davidedostestes@abiscoitado.com' ),
    ('Luiza', 'Rua dos Testes, 2', '', 'luiza@abiscoitado.com'),
    ('Caê', 'Rua dos Testes, 3', '', 'cae@abiscoitado.com'),
    ('Pinato', 'Rua dos Testes, 4', '', 'pinato@abiscoitado.com'),
    ('Hika', '', '(55)555555', 'hikari@abiscoitado.com'),
    ('Icaro', '', '(66)666666', 'icaro@abiscoitado.com'),
    ('Yan', 'Rua dos Testes, 7', '(77)777777', 'yan@abiscoitado.com'),
    ('Lucas', 'Rua dos Testes, 8', '(88)888888', 'lucas@abiscoitado.com'),
    ('Edi', 'Rua dos Testes, 9', '(99)999999', 'edi@abiscoitado.com'),
    ('Leandro', 'Rua dos Testes, 10', '(10)101010', 'leandro@abiscoitado.com');
END; $$