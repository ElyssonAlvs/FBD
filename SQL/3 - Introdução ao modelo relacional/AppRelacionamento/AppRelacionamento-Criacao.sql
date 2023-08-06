set schema 'apprel';
-- Criação do Banco de Dados
create table usuario(id_u serial primary key, 
	email varchar(50) unique not null, 
	nome varchar(70) not null,
	cidade varchar(30),
	bio varchar(300), 
	genero char(1) not null,
	data_nasc date not null, 
	idade integer check (idade >= 18) not null
);

create table hobbies(
	id_hobbie serial primary key,
	descricao varchar(30) unique
);

create table user_hobbies(
	id_u integer,
	id_h integer,
	primary key(id_u,id_h)
);

create table chat(
	id_emissor serial primary key,
	id_receptor integer not null,
	mensagem varchar(100),
	data_hora date not null
);

create table matches(
	id_u1 serial primary key,
	id_u2 integer not null,
	data_hora timestamp not null
);

create table curtidas(
	id_u serial primary key,
	id_u_curtiu integer
);


alter table user_hobbies
add constraint user_hobbies_user_fk
foreign key (id_u) references usuario(id_u);

alter table user_hobbies
add constraint user_hobbies_hobbie_fk
foreign key (id_h) references hobbies(id_hobbie);

insert into usuario 
(email, nome, bio, genero, data_nasc, idade) 
values 
('joao92@gmail.com', 'João Pedro', 'Uma pessoa legal!','M', '1992-06-07',30),
('amandaXX@hotmail.com', 'Amanda S.','Linda de viver.', 'F', '2001-01-01',22),
('anaxxx@gmail.com', 'Ana', 'Uma pessoa legal', 'F', '1994-06-07',28),
('carlosxx@gmail.com', 'Carlos N.', 'Engenheiro Uber', 'M', '2000-05-03',23),
('jasonmomoa@gmail.com', 'Jason Momoa', 'Oceano e música', 'M', '2004-01-25',19),
('joaogomes@gmail.com', 'Joao Gomes', 'Pegada de vaqueiro', 'M', '2003-02-10', 20),
('eduardaxx@gmail.com', 'Eduarda Melo', 'Aventureira', 'F', '2001-04-20', 22),
('isabelaxx@gmail.com', 'Isabela Nobre', 'Gosta de gatos', 'F', '2002-07-15', 21);
 

insert into hobbies (descricao) values 
('praia'), ('plantas'), ('jogos'), ('futebol'), 
('cervejinha'), ('música'), ('balada');

insert into user_hobbies values
(1,1), (1,2), (2,4), (6,6), (6,1),
(5,4), (3,5), (3,7), (4,1), (4,7),
(7,5), (7,4), (8,2), (8,6);