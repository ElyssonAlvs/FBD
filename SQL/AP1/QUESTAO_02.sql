SET SCHEMA 'public';
-- Questao 2
/*
a)Apresente o comando de criação da tabela HISTORICO, incluindo a criação das
chaves primárias, únicas e estrangeiras, quando houver.

HISTORICO(matricula_aluno, cod_disciplina, semestre, ano, nota)
*/

CREATE TABLE historico(
	matricula_aluno INT PRIMARY KEY,
	cod_discplina INT,
	semestre INT,
	ano DATE,
	nota REAL
);
ALTER TABLE historico
ADD CONSTRAINT cod_disciplina_fk
FOREIGN KEY(cod_discplina) 
REFERENCES disciplina(cod_disciplina);

-- b) Insira duas linhas em cada tabela
INSERT INTO historico(matricula_aluno, cod_disciplina, semestre, ano, nota)
VALUES 
(123,1,3,9),
(456,2,2,7);

INSERT INTO aluno(matricula, cpf, nome, cod_curso)
VALUES 
(123,'123456789105', 'Jose',1),
(456,'987654321112', 'Ana',2);

INSERT INTO disciplina(cod_disciplina, nome,cod_curso)
VALUES 
(1,'ED', 1),
(2, 'FBD',2);

INSERT INTO livro(cod, isbn,titulo, editora)
VALUES 
(1,111,'Principios do C++','Nacional', 'Amanda'),
(2,222,'Sistema de Banco de Dados','Internacional','Carlos');

INSERT INTO livro_adotado(cod_disciplina, cod_livro)
VALUES 
(1,1)
(2,2);

--c) Dadas as inserções feitas, mostre o comando de exclusão de uma linha que viole uma restrição referencial. Explique o porquê
DELETE FROM livro WHERE cod = 1;
/*
Ao tentar excluir, a exclusão viola a conexão entra livro e livro_adotado
visto que se tentar excluir um livro, dentro da tabela livro, sendo que esse livro está adotado
a exclusão não acontece, por viola essa lógica e viola o referencial de livro para livro adotado
*/




