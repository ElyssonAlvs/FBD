-- Visões UrbLixo, para facilitar visualização dados
SET SCHEMA 'urblixo';

-- Uma visão para obter os caminhões com os dados da rota alocada para ele
CREATE VIEW view_caminhao_rota AS
SELECT c.id_caminhao, c.modelo, c.capacidade, c.ano_de_fabricacao, r.rua AS rota_rua, r.bairro AS rota_bairro
FROM caminhao c
INNER JOIN rota_de_coleta r ON c.id_rota = r.id_rota;

--- Obter o total de cargas por rota e seus dados
CREATE VIEW view_rota_quantidade_carga AS
SELECT r.id_rota, r.rua, r.bairro, COUNT(l.id_carga) AS quantidade_carga
FROM rota_de_coleta r
LEFT JOIN lixo l ON r.id_ponto = l.id_ponto
GROUP BY r.id_rota, r.rua, r.bairro;

-- Dados dos lixos
CREATE VIEW view_dados_lixo AS
SELECT l.id_carga, l.classificacao, pc.bairro, pc.rua, pc.numero
FROM lixo l
INNER JOIN ponto_de_coleta pc ON l.id_ponto = pc.id_ponto;

-- Visão que mostra o id do caminhao e quantos motoristas estão alocados para ele
CREATE VIEW view_contagem_motoristas AS
SELECT c.id_caminhao, COUNT(m.id_motorista) AS total_motoristas
FROM caminhao c
LEFT JOIN motorista m ON c.id_caminhao = m.id_caminhao
GROUP BY c.id_caminhao;


