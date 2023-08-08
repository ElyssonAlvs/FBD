SET SCHEMA 'public';
/*
Q1) Responda às seguintes consultas.

Observação 1: Não utilizem a coluna nrofamiliares na solução das questões.

1 - Liste o número de requisições de serviços de cada prestador juntamente com o nome do prestador.
*/
SELECT prnome, COUNT(*) AS num_requisicoes
FROM l05_prestador JOIN l06_requisita 
ON l05_prestador.prcpf = l06_requisita.rcpfprestador
GROUP BY prnome;
/*
2 - Liste a quantidade total de moradores do condomínio, contando com o morador e seus familiares.
*/
SELECT mnome, msobrenome, COUNT(*) FROM l01_morador LEFT JOIN l04_familiar
ON mnome = fanomemorador
AND msobrenome = fasobrenomemorador
GROUP BY (mnome, msobrenome);
/*
3 - Liste o valor total arrecadado com condomínio de todas as unidades. 
*/
SELECT SUM(uvalorbasecond)
FROM l02_unidade;
/*
4 - Liste o maior e o menor valor pago de condomínio.
*/
-- se tivesse valores, acredito que o código seria esse:
SELECT MAX(uvalorbasecond), MIN(uvalorbasecond)
FROM l02_unidade;
/*
5 - Liste a quantidade de funcionários contratados para cada função.
*/
SELECT fufuncao, COUNT(*) AS qtd_funcionarios
FROM l09_funcionario
GROUP BY fufuncao;
/*
6 - Liste os prestadores que realizaram o mais que 3 serviços.
*/
SELECT prnome, COUNT(*) as servicos
FROM l05_prestador AS p
JOIN l06_requisita AS r ON p.prcpf = r.rcpfprestador
GROUP BY p.prnome
HAVING COUNT(*) > 3;
/*
7 - Liste as unidades que possuem mais de dois veículos.
*/
SELECT v.vnrounidade, COUNT (*) as qtd_veiculos
FROM l03_veiculo as v
JOIN l02_unidade as u
ON v.vnrounidade = u.unro
GROUP BY v.vnrounidade
HAVING COUNT(*) > 2;
/*
8 - Liste todas as unidades que não possuem veículos.
*/
SELECT v.vnrounidade, COUNT(*) AS qtd_veiculos
FROM l03_veiculo AS v
JOIN l02_unidade AS u 
ON v.vnrounidade = u.unro
GROUP BY v.vnrounidade
HAVING COUNT(*) = NULL;
/*
9 - Calcule o valor médio das despesas por tipo. 
*/
SELECT AVG(dvalordespesa), dtipo
FROM l08_despesa
GROUP BY dtipo;
/*
10 - Liste os tipos de despesas cujo custo médio foi maior que 20
*/
SELECT AVG(dvalordespesa), dtipo
FROM l08_despesa
GROUP BY dtipo
HAVING AVG(dvalordespesa) > 20;
