-- Lívia - questão 1
set schema 'apprel';

select * from usuario u, user_hobbies uh, hobbies h
where u.id_u = uh.id_u and h.id_hobbie = uh.id_h
and h.descricao in ('praia', 'balada');

-- Lívia - questão 7
select *
from chat as c, usuario u
where (id_emissor = u.id_u or c.id_receptor = u.id_u)
	   and u.nome = 'Ana' and
	   data_hora between now() - interval '7days'
	   and now();