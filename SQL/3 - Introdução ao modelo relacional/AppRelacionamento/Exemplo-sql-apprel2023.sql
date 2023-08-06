select *
from apprel.usuario;

select id_u, email, nome
from apprel.usuario;

select id_u, email, nome
from apprel.usuario
where idade >= 25 and idade <=30;

select id_u, email, nome
from apprel.usuario
where idade between 25 and 30;

select id_u, email, nome
from apprel.usuario
where data_nasc between '1992-06-07' and '1992-06-30';

select id_u, email, nome
from apprel.usuario
where date_part('year',data_nasc) = 1992;


select id_u, email, nome
from apprel.usuario
where nome like 'João Pedro';


select id_u, email, nome
from apprel.usuario
where nome like 'A%';

insert into apprel.usuario 
(email, nome, bio, genero, data_nasc, idade) 
values ('anaxxx@gmail.com', 'Ana', 'Uma pessoa legal!',
'F', '1994-06-07', 28);

select id_u, email, nome
from apprel.usuario
where nome like 'A__';
set schema 'apprel';

select usuario.id_u, email, nome
from usuario;

-- Obter o nome do usuário e o id dos hobbies de cada usuário
-- Resultado parcial com produto cartesiano
select * 
from usuario, user_hobbies;
-- Resultado final com junção (produto cartesiano + condição de junção)
select usuario.nome, user_hobbies.id_h
from usuario, user_hobbies
where usuario.id_u = user_hobbies.id_u;

-- outros exemplos 
-- colunas com mesmo nome
select usuario.nome, user_hobbies.id_h, user_hobbies.id_u
from usuario, user_hobbies
where usuario.id_u = user_hobbies.id_u;
-- renomeação
select u.nome, uh.id_h
from usuario as u, user_hobbies uh -- apelidando as tabelas
where u.id_u = uh.id_u;

-- Obter o nome do usuário e a descrição dos hobbies
-- de cada usuário
select u.nome, h.descricao
from usuario as u, user_hobbies as uh, hobbies as h
where u.id_u=uh.id_u and uh.id_h=h.id_hobbie;
-- renomeação de atributos
select u.nome, h.descr
from usuario as u, user_hobbies as uh, hobbies as h(idh, descr)
where u.id_u=uh.id_u and uh.id_h=h.idh;
