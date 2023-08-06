set schema 'apprel';


-- Q1 Listar nome de quem foi curtido e de quem curtiu
/*
select usuario.nome
from curtidas, usuario
where usuario.id_u = curtidas.id_curtido ;
 SEPARADAMENTE
select usuario.nome
from curtidas, usuario
where usuario.id_u = curtidas.id_curtiu ;
*/

select
	(select nome from usuario where id_u = ctd.id_curtido) as curtido_por,
	(select nome from usuario where id_u = ctd.id_curtiu) as curtiu
from
	curtidas as ctd;
	
-- Q2 Listar os id's do matches da Ana
-- Mais específico
select id_u1 from matches 
where matches.id_u2 = '3';
-- Uma análise mais geral
select 
	(select nome from usuario where id_u = mat.id_u1) as match1,
	(select nome from usuario where id_u = mat.id_u2 and nome = 'Ana') as match2
from
	matches as mat;

-- Q4 Listar as pessoas que nasceram nos anos de 2000 a 2005
select usuario.nome, usuario.idade from usuario
where date_part('year',data_nasc) between 2000 and 2005;

-- Q5 Listar nome dos hobbies das pessoas que nasceram nos anos de 2000 a 2005
select usuario.nome, hobbies.descricao, usuario.idade
from usuario, hobbies, user_hobbies
where usuario.id_u = user_hobbies.id_u and 
user_hobbies.id_h = hobbies.id_hobbie
and date_part('year',data_nasc) between 2000 and 2005;

-- Q6 Listar todos os dadaos pessoas que curtem praia e balada
select u.nome, h.descricao
from usuario as u, user_hobbies as uh, hobbies as h
where u.id_u=uh.id_u and uh.id_h=h.id_hobbie and descricao = 'balada';
-- SEPARADAMENTE
select u.nome, h.descricao
from usuario as u, user_hobbies as uh, hobbies as h
where u.id_u=uh.id_u and uh.id_h=h.id_hobbie and descricao = 'praia';


-- Q7 Listar as mensagens da última semana do chat da 'Ana'
-- NÃO SEI 🥲
