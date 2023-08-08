SET SCHEMA 'universidade';
/*
01 - Recupere a média de salário dos professores de cada departamento.
Apresente o nome do departamento e a média salarial. 
Ordene o resultado em ordem crescente por média.
*/

SELECT AVG(p.salario) AS media_salario, d.nome_depto
FROM professor AS p, departamento AS d
WHERE d.numero_depto = p.cod_depto
GROUP BY (d.nome_depto)
ORDER BY media_salario ASC;

/*
02 - Recupere o nome dos departamentos cuja média salarial dos professores é 
maior ou igual a 2500.
*/

SELECT d.nome_depto
FROM departamento AS d, professor as p
WHERE d.numero_depto = p.cod_depto
AND p.salario >= 2500
GROUP BY (d.nome_depto);

/*
03 - Para cada professor, obtenha o nome e a a quantidade de disciplinas ministradas por ele. 
Retorne inclusive os professores que não ministraram disciplinas. Ordene o resultado em 
ordem decrescente por quantidade
*/

SELECT p.nome, COALESCE(COUNT(m.siape), 0) AS quantidade_disciplinas
FROM professor AS p LEFT JOIN ministra AS m 
ON p.siape = m.siape
GROUP BY p.nome
ORDER BY quantidade_disciplinas ASC;

/*
04 - Obtenha a carga-horária ofertada por período
*/

SELECT SUM(d.carga_horaria), m.periodo
FROM disciplina AS d, ministra AS m
WHERE d.cod_disciplina = m.cod_disciplina
GROUP BY m.periodo;

/*
05 - Obtenha para cada professor, seu nome e a carga horária ministrada por período.
*/

SELECT p.nome, SUM(d.carga_horaria), m.periodo
FROM professor as p
JOIN ministra AS m ON p.siape = m.siape
JOIN disciplina AS d ON d.cod_disciplina = m.cod_disciplina
GROUP BY p.nome, m.periodo;

/*
06 - Obtenha o nome do departamento e a soma dos salários por departamento.
*/

SELECT d.nome_depto, SUM(p.salario) AS soma_salarios
FROM departamento AS d JOIN professor AS p 
ON d.numero_depto = p.cod_depto
GROUP BY d.nome_depto;

/*
07 - Obtenha o nome do departamento e a quantidade de professores em cada departamento.
*/

SELECT d.nome_depto, COUNT(p.siape) AS quantidade_professores
FROM departamento AS d JOIN professor AS p 
ON d.numero_depto = p.cod_depto
GROUP BY d.nome_depto;

/*
08 - Apresente para o professor que teve carga-horária maior que a média,
o nome do professor e do seu departamento. (Utilize consultas aninhadas)
*/
-- professores que tem a carga horaria maior que todas
select p.nome, d.nome_depto, sum(carga_horaria) as ch
from professor p left join departamento d
on cod_depto = numero_depto join ministra m
on p.siape = m.siape join disciplina ds
on m.cod_disciplina = ds.cod_disciplina
group by (p.siape, p.nome,d.nome_depto)
having sum(carga_horaria) >= all (
	select sum(carga_horaria) 
 	from professor p left join ministra m
	on p.siape = m.siape join disciplina ds
	on m.cod_disciplina = ds.cod_disciplina
	group by (p.siape)
);
/*
professores que tem a carga horaria maior que todas, 
vincular o prof da consulta interna para ser do mesmo
departamento do professo da consulta externa
*/
select p.nome, d.nome_depto, sum(carga_horaria) as ch
from professor p left join departamento d
on cod_depto = numero_depto join ministra m
on p.siape = m.siape join disciplina ds
on m.cod_disciplina = ds.cod_disciplina
group by (p.siape, p.nome,d.nome_depto)
having sum(carga_horaria) >= all (
	select sum(carga_horaria) 
 	from professor p2 left join ministra as m
	on p2.siape = m.siape join disciplina as ds
	on m.cod_disciplina = ds.cod_disciplina
	where p.cod_depto = p2.cod_depto
	group by(p2.siape)
);
/*
09 - Apresente para o professor que teve carga-horária maior que a média do
seu departamento, o nome do professor e do seu departamento.
(Utilize consultas aninhadas).
*/

SELECT p.nome AS nome_professor, d.nome_depto AS nome_departamento
FROM professor AS p JOIN departamento AS d 
ON p.cod_depto = d.numero_depto
WHERE p.carga_horaria > (
  SELECT AVG(p2.carga_horaria)
  FROM professor AS p2
  WHERE p2.cod_depto = p.cod_depto
);

/*
10 - . Recupere os professores que nunca ministraram a disciplina de código 1
(Utilize IN/NOT IN)
*/

SELECT p.nome AS nome_professor
FROM professor AS p
WHERE p.siape NOT IN (
  SELECT m.siape
  FROM ministra AS m
  WHERE m.cod_disciplina = 1
);

/*
11 - Apresente os dados do professor (inclusive o nome do seu departamento)
que ministrou o maior número de disciplinas (Utilize o operador ALL) 
*/

SELECT p.nome AS professor, Dept.nome_depto AS departamento, COUNT(*) AS total_disciplinas
FROM professor AS p
JOIN ministra AS m ON p.siape = m.siape
JOIN disciplina AS d ON m.cod_disciplina = d.cod_disciplina
JOIN departamento AS dept ON p.cod_depto = dept.numero_depto
GROUP BY p.siape, p.nome, dept.nome_depto
HAVING COUNT(*) >= ALL (
  SELECT COUNT(*)
  FROM professor AS p2
  JOIN ministra AS m2 ON p2.siape = m2.siape
  GROUP BY p2.siape
);

/*
12 - Apresente os dados do professor (inclusive o nome do seu departamento) 
que teve a maior carga horária em algum semestre (Utilize o operador ALL).
*/

SELECT p.nome AS nome_professor, dept.nome_depto AS nome_departamento
FROM professor AS p
JOIN ministra AS m ON p.siape = m.siape
JOIN departamento AS dept ON p.cod_depto = dept.numero_depto
WHERE p.salario >= ALL (
  SELECT MAX(p2.salario)
  FROM professor AS p2
  JOIN ministra AS m2 ON p2.siape = m2.siape
  WHERE m2.siape = p.siape
);

/*
13 - Obtenha o departamento que tem professor que não ministrou disciplina em 2013.1.
(Utilize os operadores IN ou NOT IN )
*/
SELECT d.nome_depto AS nome_departamento
FROM Departamento d
WHERE d.numero_depto NOT IN (
  SELECT DISTINCT p.cod_depto
  FROM Professor p
  JOIN Ministra m ON p.siape = m.siape
  WHERE m.periodo = '2013.1'
);

/*
14 - Obtenha as disciplinas que nunca foram ministradas (Utilize IN ou NOT IN).
*/

SELECT d.nome AS nome_disciplina
FROM disciplina d
WHERE d.cod_disciplina NOT IN (
  SELECT m.cod_disciplina
  FROM ministra AS m
);

/*
15 - Recupere o nome dos professores e o nome do departamento de todos os professores
que não ministraram disciplinas em 2013.1.
(Utilize os operadores EXISTS ou NOT EXISTS)
*/

SELECT p.nome AS nome_professor, d.nome_depto AS nome_departamento
FROM Professor p JOIN Departamento d ON p.cod_depto = d.numero_depto
WHERE NOT EXISTS (
  SELECT cod_disciplina
  FROM Ministra m
  WHERE m.siape = p.siape
    AND m.periodo = '2013.1'
);
