-- Criação Urblixo

SET SCHEMA 'urblixo';

-- Criação da tabela sobre os Pontos de coleta, local onde o lixo será coletado
CREATE TABLE ponto_de_coleta (
    id_ponto SERIAL PRIMARY KEY,
    bairro VARCHAR(50),
    rua VARCHAR(50),
    numero INT
);

-- Criação da tabela sobre o Lixo, entidade que julgamos ser a mais importante
CREATE TABLE lixo (
    id_carga SERIAL PRIMARY KEY,
    classificacao VARCHAR(20),
    id_ponto INT,
    id_caminhao INT
);

-- Criação da tabela sobre o Usuário, onde temos os atributos do usuário que irá acessar o sistema
CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(70) UNIQUE NOT NULL,
    senha VARCHAR(6) UNIQUE NOT NULL,
    email VARCHAR(70) NOT NULL
);

-- Criação da tabela sobre o Motorista do caminhão
CREATE TABLE motorista (
    id_motorista SERIAL PRIMARY KEY,
    cpf VARCHAR(11),
    nome VARCHAR(50),
    id_caminhao INT
);

-- Criação da tabela sobre as Rotas de coleta, onde os caminhões passarão para coletar o lixo
CREATE TABLE rota_de_coleta (
    id_rota SERIAL PRIMARY KEY,
    rua VARCHAR(100),
    bairro VARCHAR(100),
    id_ponto INT
);

-- Criação da tabela Caminhão, onde o lixo será armazenado
CREATE TABLE caminhao (
    id_caminhao SERIAL PRIMARY KEY,
    id_rota INT,
    modelo VARCHAR(20),
    capacidade INT,
    ano_de_fabricacao DATE
);

-- Conexão entre a tabela lixo e o ponto de coleta que ele veio
ALTER TABLE lixo ADD CONSTRAINT fk_lixo_ponto_de_coleta FOREIGN KEY (id_ponto) REFERENCES ponto_de_coleta(id_ponto);

-- Conexão entre o lixo e o caminhao de onde ele veio
ALTER TABLE lixo ADD CONSTRAINT fk_lixo_caminhao FOREIGN KEY (id_caminhao) REFERENCES caminhao(id_caminhao);

-- Conexão entre o motorista e o o carro que ele dirige
ALTER TABLE motorista ADD CONSTRAINT fk_motorista_caminhao FOREIGN KEY (id_caminhao) REFERENCES caminhao(id_caminhao);

-- Conexão entre a rota de coleta e o ponto onde o lixo será descartado
ALTER TABLE rota_de_coleta ADD CONSTRAINT fk_rota_de_coleta_ponto_de_coleta FOREIGN KEY (id_ponto) REFERENCES ponto_de_coleta(id_ponto);

-- Conexão entre o caminhão e a rota que ele faz
ALTER TABLE caminhao ADD CONSTRAINT fk_caminhao_rota_de_coleta FOREIGN KEY (id_rota) REFERENCES rota_de_coleta(id_rota);