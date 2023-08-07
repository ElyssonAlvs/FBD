set schema 'public';
-- Tabela Projeto
CREATE TABLE Projeto (
  sigla VARCHAR(10) PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

-- Tabela Funcionario
CREATE TABLE Funcionario (
  codigo_matricula INT PRIMARY KEY,
  cpf VARCHAR(11) NOT NULL,
  nome VARCHAR(100) NOT NULL
);

-- Tabela Participa
CREATE TABLE Participa (
  sigla_projeto VARCHAR(10) NOT NULL,
  codigo_matricula_funcionario INT NOT NULL,
  horas INT,
  PRIMARY KEY (sigla_projeto, codigo_matricula_funcionario),
  FOREIGN KEY (sigla_projeto) REFERENCES Projeto(sigla),
  FOREIGN KEY (codigo_matricula_funcionario) REFERENCES Funcionario(codigo_matricula)
);
