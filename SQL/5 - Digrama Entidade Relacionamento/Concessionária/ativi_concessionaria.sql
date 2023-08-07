SET SCHEMA 'public';
CREATE TABLE Marca (
  cod_marca INTEGER PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
);

CREATE TABLE Modelo (
  cod_modelo INTEGER PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  cod_marca INTEGER NOT NULL,
  FOREIGN KEY (cod_marca) REFERENCES Marca(cod_marca)
);

CREATE TABLE Veiculo (
  num_chassi INTEGER PRIMARY KEY,
  num_placa VARCHAR(7) NOT NULL,
  cor VARCHAR(20) NOT NULL,
  ano_fabricacao INTEGER NOT NULL,
  quilometragem INTEGER NOT NULL,
  cod_modelo INTEGER NOT NULL,
  FOREIGN KEY (cod_modelo) REFERENCES Modelo(cod_modelo)
);

CREATE TABLE Comprador (
  cpf INTEGER PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  estado_civil VARCHAR(20) NOT NULL,
  nome_conjuge VARCHAR(50),
  cpf_conjuge INTEGER,
  FOREIGN KEY (cpf_conjuge) REFERENCES Comprador(cpf)
);

CREATE TABLE Corretor (
  num_matricula INTEGER PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  data_admissao DATE NOT NULL
);

CREATE TABLE Venda (
  num_chassi INTEGER NOT NULL,
  cpf_comprador INTEGER NOT NULL,
  num_matricula INTEGER NOT NULL,
  data DATE NOT NULL,
  valor_venda DECIMAL(10,2) NOT NULL,
  valor_comissao DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (num_chassi, cpf_comprador, num_matricula),
  FOREIGN KEY (num_chassi) REFERENCES Veiculo(num_chassi),
  FOREIGN KEY (cpf_comprador) REFERENCES Comprador(cpf),
  FOREIGN KEY (num_matricula) REFERENCES Corretor(num_matricula)
);
