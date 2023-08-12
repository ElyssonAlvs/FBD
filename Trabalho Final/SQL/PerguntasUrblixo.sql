-- Perguntas SQL, 10 perguntas no total sobre o BD
SET SCHEMA 'urblixo';

--01 - Quais os caminhões que possuem capacidade superior a 15 ?
SELECT * FROM caminhao WHERE capacidade > 15;

--02 - Qual o número total de cargas de lixo em cada rota de coleta ?
SELECT r.id_rota, COUNT(l.id_carga) AS total_cargas
FROM rota_de_coleta r
LEFT JOIN lixo l ON r.id_ponto = l.id_ponto
GROUP BY r.id_rota;

--03 - Qual a listar os usuários ordenados pelo nome em ordem alfabética ?
SELECT * FROM usuario ORDER BY nome;

--04 - Qual a contagem de motoristas associados a cada caminhão ?
SELECT c.id_caminhao, COUNT(m.id_motorista) AS total_motoristas
FROM caminhao c
LEFT JOIN motorista m ON c.id_caminhao = m.id_caminhao
GROUP BY c.id_caminhao;

--05 - Quais os dados do lixo, sua classificacao e de ponto pertence ?
SELECT l.id_carga, l.classificacao, pc.bairro, pc.rua, pc.numero
FROM lixo l
INNER JOIN ponto_de_coleta pc ON l.id_ponto = pc.id_ponto;

--06 - Quais os caminhões fabricados antes de 2020 ?
SELECT *
FROM caminhao as c
WHERE c.ano_de_fabricacao < '2020-01-01';

--07 - Qual a média de capacidade dos caminhões ?
SELECT AVG(capacidade) AS media_capacidade
FROM caminhao;

/*08 - Qual a contagem de cargas de lixo em cada ponto de coleta e 
	   exibir apenas os pontos que possuem mais de/igual a 1 carga ?
	   (obs : povoando mais o BD haverá mais resultados)
*/
SELECT p.id_ponto, p.bairro, p.rua, p.numero, COUNT(l.id_carga) AS total_cargas
FROM ponto_de_coleta p
LEFT JOIN lixo l ON p.id_ponto = l.id_ponto
GROUP BY p.id_ponto, p.bairro, p.rua, p.numero
HAVING COUNT(l.id_carga) >= 1;

--09 - Quais os pontos de coleta localizados no bairro "Centro" ?
SELECT * FROM ponto_de_coleta WHERE bairro = 'Centro';

--10 - Qual a contagem total de cargas de lixo em cada ponto de coleta ?
SELECT pc.id_ponto, pc.rua, COUNT(l.id_carga) AS total_cargas
FROM ponto_de_coleta pc
LEFT JOIN lixo l ON pc.id_ponto = l.id_ponto
GROUP BY pc.id_ponto, pc.rua;
