create database agencia_viagem;

CREATE TABLE cliente (
id_cliente INTEGER AUTO_INCREMENT PRIMARY KEY,
CPF VARCHAR(11),
nome VARCHAR(100),
endereco VARCHAR(100),
telefone VARCHAR(100),
sobrenome VARCHAR(100),
email VARCHAR(255),
id_pacote INTEGER
);

CREATE TABLE pacote (
tipo_pacote VARCHAR(10),
forma_pagamento VARCHAR(100),
id_pacote INTEGER PRIMARY KEY,
id_destino INTEGER,
id_hotel INTEGER,
id_transporte INTEGER,
id_aluguel_carro INTEGER,
data_ida DATETIME,
data_volta DATETIME,
preco DECIMAL(10,2)
);

ALTER TABLE pacote MODIFY id_pacote INT AUTO_INCREMENT;

ALTER TABLE cliente ADD FOREIGN KEY (id_pacote) REFERENCES pacote (id_pacote);

CREATE TABLE destino (
país VARCHAR(100),
cidade VARCHAR(100),
id_destino INTEGER PRIMARY KEY
);

CREATE TABLE hotel (
id_hotel INTEGER PRIMARY KEY,
ranking INTEGER,
cidade VARCHAR(100),
pais VARCHAR(100)
);

CREATE TABLE transporte (
tipo VARCHAR(10),
id_transporte INTEGER PRIMARY KEY,
classe VARCHAR(10),
id_aviao INTEGER
);

CREATE TABLE aluguel_carro (
id_aluguel_carro INTEGER PRIMARY KEY,
preco DECIMAL(10,2),
marca VARCHAR(50),
modelo VARCHAR(50),
ano DATETIME,
tipo VARCHAR(50)
);

CREATE TABLE onibus (
id_onibus INTEGER PRIMARY KEY,
tipo_onibus VARCHAR(10),
num_assento INTEGER,
empresa_onibus VARCHAR(100),
id_transporte INTEGER,
FOREIGN KEY(id_transporte) REFERENCES transporte (id_transporte)
);

CREATE TABLE avião (
id_aviao INTEGER PRIMARY KEY,
classe INTEGER,
num_assento INTEGER,
empresa_aviao VARCHAR(10)
);

ALTER TABLE pacote ADD FOREIGN KEY(id_hotel) REFERENCES hotel (id_hotel);

ALTER TABLE pacote ADD FOREIGN KEY(id_transporte) REFERENCES transporte (id_transporte);

ALTER TABLE pacote ADD FOREIGN KEY(id_aluguel_carro) REFERENCES aluguel_carro (id_aluguel_carro);

ALTER TABLE transporte ADD FOREIGN KEY(id_aviao) REFERENCES avião (id_aviao);

RENAME TABLE avião TO aviao;
