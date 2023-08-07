SET SCHEMA 'public';
CREATE TABLE Funcionario (
	matricula INTEGER PRIMARY KEY,
	cpf INTEGER NOT NULL,
	nome VARCHAR(50) NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	email VARCHAR(50) NOT NULL,
	departamento INTEGER NOT NULL,
	supervisor INTEGER,
	FOREIGN KEY (supervisor) REFERENCES Funcionario(matricula)
);

CREATE TABLE Departamento (
	codigo INTEGER PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	gerente INTEGER NOT NULL,
	FOREIGN KEY (gerente) REFERENCES Funcionario(matricula)
);

CREATE TABLE Dependente (
	id INTEGER PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	data_nascimento DATE NOT NULL,
	funcionario INTEGER NOT NULL,
	FOREIGN KEY (funcionario) REFERENCES Funcionario(matricula)
);

CREATE TABLE Vencimento (
	descricao VARCHAR(50) NOT NULL,
	valor DECIMAL(10,2) NOT NULL,
	funcionario INTEGER NOT NULL,
	FOREIGN KEY (funcionario) REFERENCES Funcionario(matricula)
);

ALTER TABLE Funcionario ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY(departamento) references Departamento(codigo);