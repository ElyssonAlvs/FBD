-- Questões Atividade:  Construção do esquema relacional com SQL básico

/*
1 - Execute o comando para alterar a tabela Poltrona inserindo uma coluna extra e uma chave única.
alter table poltrona
add column idp integer;

alter table poltrona
add constraint unk_idp unique(idp);
*/
set schema 'bilheteria';
alter table poltrona
add column idp integer;

alter table poltrona
add constraint unk_idp unique(idp);

/*
2 - Insira 5 tuplas válidas em cada tabela, respeitando as restrições de nulidade, 
chave primária e chave estrangeira.
*/
set schema 'bilheteria';
insert into filme(codigo,titulo,sinopse,duracao_min,classificacao) values
(1,'Logan', 'Último filme da sequência X-men',137, 16),
(2,'Adão Negro', 'História de um Deus que nasceu da raiva e da fúria',125, 14),
(3,'John Wick Chapter 3: Parabellun', 'Terceiro filme da sequência John Wick', 131, 14),
(4,'Senhor dos Aneis: O Retorno do Rei', 'Terceiro filme da sequência Senhor do Anéis', 210, 14),
(5,'Harry Potter e o Enigma do Príncipe', 'Sexto filme da sequência Harry Potter', 153, 12);
select * from filme;
/* +++++ */
insert into poltrona(numero_sala, cod_poltrona) values
(3,'A3'), (1,'A3');
select * from poltrona;
/* +++++ */
insert into sala(qtd_poltronas) values
(20);
select * from sala;
/* ++++ */
insert into sessao (dt,horario,dim,linguagem,sala_num,filme_id) values
('2023-04-16', 16, '3D', 'Português', 1, 1),
('2023-04-17', 17, '3D', 'Português', 2, 2),
('2023-04-18', 13, '2D', 'Português', 3, 3),
('2023-04-19', 18, '3D', 'Português', 4, 4),
('2023-04-20', 14, '2D', 'Português', 5, 5);
select * from sessao;

/*
3 – Use o comando SELECT * FROM NOME_TABELA para visualizar os dados inseridos em cada tabela.
*/
select * from filme;
select * from poltrona;
select * from sala;
select * from sessao;
/*
4 – Considere a tabela Bilhete(cod_sessao, id_poltrona, cod_bilhete)

a) Quem são as chaves estrangeiras dessa tabela? Quais tabelas e atributos referenciam?
Chaves estrangeiras cod_sessao e id_poltrona.Sessão e poltrona, respectivamente.

b) Quem são as chaves candidatas? Defina uma delas como chave primária.
id_poltrona e cod_sessao. Ambas se encaixam como chave primário, por serem únicas e não nulas.

c) Crie a tabela Bilhete especificando as chaves primárias, estrangeiras e únicas.

d) Insira 5 tuplas na tabela criada.

*/
set schema 'bilheteria';
create table bilhete(
	cod_bilhete serial primary key,
	cod_sessao integer not null, 
	id_poltrona integer not null,
	foreign key (cod_sessao) references sessao(cod_sessao),
	foreign key (id_poltrona) references poltrona(idp),
	unique(cod_sessao, id_poltrona)
);
select * from sessao;
select * from poltrona;
insert into bilhete(cod_sessao, id_poltrona) values
	(1, 1),
  	(2, 2),
  	(3, 1),
  	(3, 3),
  	(1, 3);
/*
5 – Modifique o banco de dados para incluir o atributo gênero_filme que é multivalorado (no caso, um filme pode ter vários gêneros).

a) Crie uma tabela para permitir que o filme tenha inúmeros gêneros.

b) Como é o esquema dessa tabela? Inclua o comando SQL especificando chaves primárias e estrangeiras.

c) Insira 5 tuplas nessa tabela.
*/
select * from filme;
set schema 'bilheteria';
create table genero(
	cod_filme serial primary key,
	genero text,
	foreign key (cod_filme) references filme(codigo)
);
insert into genero(cod_filme,genero) values
	(1, 'Ação, Drama, Suspense, Super-Herói'),
	(2, 'Ação, Aventura, Drama, Suspense, Super-Herói'),
	(3, 'Ação, Aventura, Crime, Mistério, Suspense'),
	(4, 'Ação, Aventura, Drama, Fantasia'),
	(5, 'Aventura, Mistério, Romance');
-- Posso selecionar o genero dessa maneira, mas não é a mais eficiente 🥲; 
select genero from genero where genero like '%Drama%' ;
/*
6 – O comando DELETE FROM FILME WHERE codigo=X apaga do banco de dados
o filme cujo valor do código é X. Substitua X por um valor de cósdigo
existente no seu banco de dados para o qual existe uma sessão alocada.
O que acontece ao tentar executar esse comando? Por quê?
Ele não permite pois viola é restrito por uma chave estrangeira, dentro da 
tabela Sessao tem chaves que se referenciam a tabela Filme, não sendo possível
deletar um filme que está referenciado por uma sessao que existe.

7 - O comando UPDATE POLTRONA SET id_poltrona=Y WHERE id_poltrona=X 
altera o id da poltrona do banco de dados cujo valor do código é ‘X’ 
para o valor ‘Y’. Substitua X por um valor de código existente no seu
banco de dados para o qual existe umbilhete vendido. O que acontece ao
tentar executar esse comando? Por quê?
Vai ocorrer um erro, modificar o id da poltrona vai modificar o bilhete, a integridade
vai ser violada, devido a esse fator.
*/
