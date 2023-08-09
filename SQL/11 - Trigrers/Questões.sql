SET SCHEMA 'public';
-- 1 - Crie a tabela ResumoVendasProdutos(id_prod, qtd_vendas, valor_total_vendido);
CREATE TABLE ResumoVendasProdutos (
    id_prod integer,
    qtd_vendas integer,
    valor_total_vendido float
);
-- 2 - Altere a trigger que executa após a inserção em vendas de forma que ela também atualize a tabela ResumoVendasProdutos
CREATE OR REPLACE FUNCTION insert_or_update_resumo_trigger()
RETURNS TRIGGER AS
$$
DECLARE
    tem_cliente INTEGER;
BEGIN
    -- Atualiza tabela resumo_vendas
    SELECT COUNT(*) INTO tem_cliente
    FROM resumo_vendas AS rv
    WHERE rv.nome_cliente = NEW.nome_cliente;
    
    IF tem_cliente = 0 THEN
        INSERT INTO resumo_vendas (nome_cliente, valor_total)
        VALUES (NEW.nome_cliente, NEW.valor);
    ELSE
        UPDATE resumo_vendas
        SET valor_total = valor_total + NEW.valor
        WHERE nome_cliente = NEW.nome_cliente;
    END IF;

    -- Atualiza tabela ResumoVendasProdutos
    IF EXISTS (
        SELECT *
        FROM ResumoVendasProdutos
        WHERE id_prod = NEW.id_produto
    ) THEN
        UPDATE ResumoVendasProdutos
        SET qtd_vendas = qtd_vendas + 1,
            valor_total_vendido = valor_total_vendido + NEW.valor
        WHERE id_prod = NEW.id_produto;
    ELSE
        INSERT INTO ResumoVendasProdutos (id_prod, qtd_vendas, valor_total_vendido)
        VALUES (NEW.id_produto, 1, NEW.valor);
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';
-- 3 - Crie uma função imprimir_vendas(id_prod) que recebe o id do produto e imprime as 
-- informações das vendas relacionadas àquele produto. Use cursores para percorrer as tuplas que serão impressas.
CREATE OR REPLACE FUNCTION imprimir_vendas(id_prod integer)
RETURNS VOID AS
$$
DECLARE
    venda_cursor CURSOR FOR
        SELECT v.id, v.nome_cliente, v.valor
        FROM venda AS v
        WHERE v.id_produto = id_prod;
    venda_row RECORD;
BEGIN
    OPEN venda_cursor;
    
    LOOP
        FETCH venda_cursor INTO venda_row;
        EXIT WHEN NOT FOUND;
        
        RAISE NOTICE 'ID: %, Cliente: %, Valor: %',
            venda_row.id, venda_row.nome_cliente, venda_row.valor;
    END LOOP;
    
    CLOSE venda_cursor;
END;
$$
LANGUAGE 'plpgsql';