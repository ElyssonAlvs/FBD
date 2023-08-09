set schema 'public';
create table venda(
    id serial primary key,
	id_produto integer,
    nome_cliente varchar(50),
    valor float
);
create table resumo_vendas(
    id serial primary key,
    nome_cliente varchar(50),
    valor_total float
);
create table cliente(
	id_cliente serial primary key,
	nome varchar(50)
);

select * from cliente
select * from venda