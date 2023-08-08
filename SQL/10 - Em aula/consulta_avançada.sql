-- Tabela disponível no 3 - Introdução ao modelo relacional
SET SCHEMA 'empresa';
-- Contagem de tuplas não nulas em um atributos
SELECT COUNT(*)
FROM nome_tabela
WHERE ...;

-- Monstra o valor mínimo dentro do atributo dentro das tuplas
SELECT MIN(*)
FROM nome_tabela
WHERE ...
/*
1 - Encontre o número de empregados lotados no departamento de informática
2 - Encontre o valor total da folha de pagamento
3 - Encontre o valor do salário médio pago pela emrpresa
*/
-- 1
SELECT COUNT(*)
FROM funcionario f, departamento d
WHERE f.dnr = d.numero and d.nome = 'Informática'; 

-- 2
SELECT SUM(salario)
FROM funcionario;

-- 3
SELECT AVG(salario)
FROM funcionario f;

-- Group by

-- Salário, maior, menor e média dos salários do supervisor
SELECT SUM(salario), MAX(salario), MIN(salario, AVG(salario)
FROM funcionario
GROUP BY (cpf_supervisor);

/*
1 - O número médio de horas alocados por projeto
2 - A quantidade de funcionários trabalhando em cada porjeto
3 - Quantos projetos tem cada departamento
4 - Todos os supervisores que tem pelo menos dois funcionários
*/
INSERT INTO trabalha_em VALUES
('33344555587',1,10),
('33344555587',2,4),
('12345678966',1,10),
('33344555587',4,4),
('99988777767',1,8),
('33344555587',2,3);

-- 1 
/*
grupos pro projeto
filtro?
avg
*/
SELECT AVG(horas)
FROM trabalha_em
GROUP BY (pnr);

DELETE FROM trabalha_em WHERE pnr = 4;

SELECT pnr, AVG(horas)
FROM trabalha_em, projeto
WHERE pnr = projnumero
GROUP BY (pnr, projnome);

-- 2
SELECT pnr, COUNT(fcpf)
FROM trabalha_em
GROUP BY(pnr);

-- 3
SELECT dnum, COUNT(*)
FROM projeto, departamento
WHERE dnumero = dnum
GROUP BY(dnum);

-- Having

-- Quantidade de funcionários que trabalham em média 3 horas
SELECT dnum, COUNT(*)
FROM projeto, departamento
WHERE dnumero = dnum
GROUP BY(dnum)
HAVING AVG(*) >= 3;

-- 4
SELECT COUNT(*)
FROM funcionario f 
GROUP BY(cpf_supervisor)
HAVING COUNT(*) <= 2; 