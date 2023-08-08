/*
para cada morador
mostre o nome que tem 
*/

SELECT mnome
FROM l01_morador JOIN l04_familiar
ON mnome = fnomemorador
AND msobrenome = fasobrenomemorador
---------------------------------------------
/*
para cada morador mostre o nomes do morador e a quantidade de familiares
*/
SELECT mnome, msobrenome, count(fanome)
FROM l01_morador LEFT JOIN l04_familiar
ON mnome = fasobrenomemorador
AND msobrenome = fasobrenomemorador
GROUP BY (nome, msobrenome);

/*
para cada unidade conte a quantidade de veículos, id da unidade e a quantidade
*/
SET SCHEMA 'public';
SELECT unro, COUNT(vplaca) as qtd_veiculos,  1 + COUNT(fanome)
FROM l03_veiculo RIGHT JOIN l02_unidade 
ON vnrounidade = unro LEFT JOIN l01_morador 
ON ucpfmorador = mcpf LEFT JOIN l04_familiar
ON mnome = fanomemorador and msobrenome = fasobrenomemorador
WHERE mnome != 'desocupado'
-- agrupamento
GROUP BY(unro);

SELECT * FROM l01_morador;

select count(distinct fanome) + count(distinct mcpf )
from l01_morador left join l04_familiar
on mnome = fanomemorador
and msobrenome = fasobrenomemorador
where mnome <> 'desocupado'