SET SCHEMA 'public'
/*
1 - Criar uma visão 
Morador_Historico(qtd_familiares, qtd_veiculos,qtd_requsicoes)
*/
CREATE VIEW Morador_Historico AS
SELECT l01_morador.nrofamiliares AS qtd_familiares, COUNT(l03_veiculo.vnrounidade) AS qtd_veiculo, COUNT(l06_requisita.*) AS qtd_requisicoes
FROM l01_morador
LEFT JOIN l02_unidade ON l01_morador.mcpf = l02_unidade.ucpfmorador
LEFT JOIN l03_veiculo ON l02_unidade.unro = l03_veiculo.vnrounidade
LEFT JOIN l06_requisita ON l01_morador.mcpf = l06_requisita.rcpfmorador
GROUP BY l01_morador.mcpf;

/*
2 - Obter os moradores que possuem mais de um veículo
*/
SELECT * 
FROM Morador_Historico
WHERE qtd_veiculo > 1;
/*
3 - Obter os moradores que realizam o maior número de requisições (all e subconsulta)
*/
SELECT * FROM l01_morador
WHERE (
	SELECT COUNT(*) 
	FROM l06_requisita 
	WHERE rcpfmorador = l01_morador.mcpf) >= ALL
    	(SELECT COUNT(*) 
		 FROM l06_requisita 
		 GROUP BY rcpfmorador);
/*
4 -Obter os prestadores de serviço que realizaram uma quantidade de requisições maior que média
*/
SELECT * 
FROM l05_prestador
WHERE prcpf IN 
		(SELECT rcpfprestador 
		 FROM l06_requisita
    	 GROUP BY rcpfprestador
    	 HAVING COUNT(*) > (
				SELECT AVG(req_count)
				FROM (
					SELECT rcpfprestador, COUNT(*) AS req_count 
					FROM l06_requisita GROUP BY rcpfprestador) AS counts)
    );
/*
5 - Formule uma visão para auxiliar na seguinte consulta
Obter a quantidade total de funcionario contratados no mês de fevereiro (tercerizado ou permanente)
*/

