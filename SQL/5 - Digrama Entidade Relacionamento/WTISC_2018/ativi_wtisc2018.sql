SET SCHEMA 'public';

CREATE TABLE Atividade (
  codigo INT PRIMARY KEY,
  descricao VARCHAR(50),
  qtd_max_participantes INT,
  valor DECIMAL(10,2)
);

CREATE TABLE Pessoa (
  cpf VARCHAR(11) PRIMARY KEY,
  nome VARCHAR(50),
  data_nascimento DATE,
  rua VARCHAR(50),
  numero VARCHAR(10),
  complemento VARCHAR(20),
  bairro VARCHAR(30),
  cidade VARCHAR(30),
  uf VARCHAR(2),
  cep VARCHAR(8),
  email VARCHAR(50)
);

CREATE TABLE Telefone (
  id INT PRIMARY KEY,
  cpf_pessoa VARCHAR(11),
  telefone VARCHAR(15),
  FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf)
);

CREATE TABLE Instituicao (
  codigo INT PRIMARY KEY,
  sigla VARCHAR(10),
  nome VARCHAR(50)
);
CREATE TABLE Participante (
  cpf_pessoa VARCHAR(11) PRIMARY KEY,
  codigo_instituicao INT,
  FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf),
  FOREIGN KEY (codigo_instituicao) REFERENCES Instituicao(codigo)
);

CREATE TABLE Ministrante (
  cpf_pessoa VARCHAR(11) PRIMARY KEY,
  FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf)
);

CREATE TABLE Atividade_Participante (
  codigo_atividade INT,
  cpf_participante VARCHAR(11),
  data_pagamento DATE,
  PRIMARY KEY (codigo_atividade, cpf_participante),
  FOREIGN KEY (codigo_atividade) REFERENCES Atividade(codigo),
  FOREIGN KEY (cpf_participante) REFERENCES Participante(cpf_pessoa)
);

ALTER TABLE Atividade ADD COLUMN cpf_ministrante VARCHAR(11);
ALTER TABLE Atividade ADD CONSTRAINT fk_ministrante FOREIGN KEY (cpf_ministrante) REFERENCES Ministrante(cpf_pessoa);