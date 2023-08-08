SET SCHEMA 'public'
-- Questão 01

CREATE VIEW peca_projeto AS
SELECT p.pid, p.pnome, COUNT(DISTINCT fpj.jid) AS total_projetos, SUM(fpj.qtd) AS quantidade_total
FROM peca AS p
INNER JOIN fpj ON p.pid = fpj.pid
GROUP BY p.pid, p.pnome;

select * from peca_projeto;

-- Questão 02
CREATE VIEW projetos_peca1 AS
SELECT fpj.jid AS numero_projeto
FROM fpj
INNER JOIN peca AS p ON fpj.pid = p.pid
WHERE p.pnome = 'peca1'
GROUP BY fpj.jid
HAVING AVG(fpj.qtd) > (SELECT MAX(fpj2.qtd) FROM fpj AS fpj2 WHERE fpj2.jid = 1);

-- Questão 03
CREATE VIEW pecas_fornecimento AS
SELECT p.pnome AS nome_peca, MAX(fpj.qtd) AS quantidade_maxima, MIN(fpj.qtd) AS quantidade_minima
FROM peca AS p
INNER JOIN fpj ON p.pid = fpj.pid
GROUP BY p.pid, p.pnome;

--Questão 04
CREATE VIEW peca_fornecimento_sem_f1 AS
SELECT p.pnome AS nome_peca, MAX(fpj.qtd) AS quantidade_maxima, MIN(fpj.qtd) AS quantidade_minima
FROM peca AS p
INNER JOIN fpj ON p.pid = fpj.pid
WHERE fpj.fid <> 1
GROUP BY p.pid, p.pnome;