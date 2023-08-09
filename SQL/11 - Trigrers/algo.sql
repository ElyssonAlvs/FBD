CREATE OR REPLACE -- escopo de criação
FUNCTION 
insert_or_update_resumo_trigger() -- nome
RETURNS trigger AS -- retorna uma trigger
$$
DECLARE	
	tem_cliente integer; -- variavel
BEGIN
	select count(*) into tem_cliente
	from resumo_vendas as rv
	where rv.nome_cliente = new.nome_cliente; -- new.  corresponde a nova linha a ser inserida.
	
	if tem_cliente = 0 then
		insert into resumo_vendas (nome_cliente, valor_total)
		values(new.nome_cliente, new.valor);
	else 
		update resumo_vendas 
		set valor_total = valor_total + new.valor
		where nome_cliente = new.nome_cliente;
	end if;	
	return new; 
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER atualiza_resumo_trigger
AFTER INSERT ON VENDA
FOR EACH ROW -- percorre as linhas
EXECUTE PROCEDURE insert_or_update_resumo_trigger();

