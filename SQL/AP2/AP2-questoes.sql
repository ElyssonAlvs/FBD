set schema 'public';
/*
Questão 1 : Apresente uma consulta em SQL par obter 
o nome das pessoas em que a quantidade de seguidores é a maior
*/
select pessoa.nickname, count(seguidor.id_seguidor) as quantidade_de_seguidores
from seguidor left join pessoa on pessoa.id = seguidor.id_pessoa
group by (nickname)
having count(seguidor.id_seguidor) > (
	select count(seguidor.id_seguidor)
	from seguidor
	group by (id_pessoa)
	order by count(id_seguidor) asc
	-- limitar a consulta, muitas query envolvidas, pgadmin acusou esse erro
	limit 1
);
/*
Questão 2: Apresente uma consulta em SQL para o nome das pessoas que seguem a 
Jessika e que também seguem a Fernanda.
*/
select pessoa.nickname as seguidores
from pessoa
where exists (
	select pessoa.nickname 
	from seguidor join pessoa on seguidor.id_pessoa = pessoa.id
	where pessoa.id = seguidor.id_seguidor and pessoa.nickname = 'Fernanda'
)
and exists(
	select pessoa.nickname
	from seguidor join pessoa on seguidor.id_pessoa = pessoa.id
	where pessoa.id = seguidor.id_seguidor and pessoa.nickname = 'Jessika'
);


/*
03 : Apresente uma consulta em SQL par obter o nome das pessoas que não possuem 
seguidores. Utilize o comando Not Exists.
*/
select pessoa.nickname as nao_seguidores
from pessoa
where not exists (
	select seguidor.id_pessoa
	from seguidor 
	where seguidor.id_pessoa = pessoa.id
);

/*
04 : Apresente uma consulta em SQL par obter o nome das pessoas que possuem ao menos 
uma postagem que tem curtidas. Utilize um dos comandos a seguir: IN ou Exists.
*/
select pessoa.nickname as pessoa_postagem
from pessoa
where exists (
	select postagem.id_pessoa
	from postagem join curtida
	on postagem.id_seq = curtida.id_seq_postagem
	where postagem.id_pessoa = pessoa.id
);

/*
05 :
a) Crie uma visão Pessoa_Estat(id, nickname, qtd_seguindo, qtd_seguidores, qtd_postagens, qtd_comentarios). 
O objetivo da visão Pessoa_Estat é apresentar para cada pessoa algumas estatísticas da rede social: a quantidade
de pessoas que ela segue, a quantidade de seguidores, a quantidade de postagens feita pela pessoa e a quantidade de
comentários em postagens que ela fez.
*/
create view Pessoa_Estat as
select pessoa.id, pessoa.nickname,
    (select count(*) from seguidor where seguidor.id_pessoa = pessoa.id) AS qtd_seguindo,
    (select count(*) from seguidor where seguidor.id_seguidor = pessoa.id) AS qtd_seguidores,
    (select count(*) from postagem where postagem.id_pessoa = pessoa.id) AS qtd_postagens,
    (select count(*) from comentario where comentario.id_seguidor = pessoa.id) AS qtd_comentarios
from pessoa;

/*
b) Utilize essa visão para responder à pergunta: Quais as pessoas que tem a quantidade de seguidores maior que a média?
*/
select Pessoa_Estat.nickname as acima_media
from Pessoa_Estat
where qtd_seguidores > (
	select avg(qtd_seguidores)
	from Pessoa_Estat
);
