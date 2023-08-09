set schema 'public';
-- mensagem lançada antes de inserir (impede inserção)
create or replace function verifica_cliente()
returns trigger
as $$
declare
    clienteRecord record;
begin
    select * into clienteRecord
    from clientes where nome = new.nome_cliente;
    if not found then
        raise notice 'Cliente não cadastrado - %', new.nome_cliente;
        return null;
    end if;
    return new;
end;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER verifica_cliente_trigger
BEFORE INSERT ON venda
FOR EACH ROW
EXECUTE PROCEDURE verifica_cliente();

insert into cliente(nome)
values ('Jose')
insert into cliente(nome)
values ('Luana')

select * from cliente

