SET SCHEMA 'urblixo';

-- Inserção de 10 dados em cada tabela
INSERT INTO ponto_de_coleta (bairro, rua, numero) VALUES
    ('São João', 'Rua Domicio Cassiano Almeida', 204 ),
    ('Centro', 'Rua Laerte Pinheiro', 105),
    ('Baviera', 'Rua Nabor Crebilon de Sousa', 135),
    ('Planalto Universitário', 'Rua José Enéas Monteiro Lessa', 245),
    ('Combate', 'Rua Nossa Senhora da Conceição', 271),
    ('Planato Renascer', 'Rua João Vicente Queiroz', 131),
    ('Carrascal', 'Rua José de Queiroz Pessoa', 247),
    ('Nova Jesusalém', 'Rua José Candido de Sousa', 303),
    ('Putiú', 'Rua Santa Isabel', 285),
    ('Jardim dos Monólitos', 'Rua Wagner Vasconcelos Braga', 140);

INSERT INTO usuario (nome, senha, email) VALUES
    ('Edson', '044179', 'edsonyuri@gmail.com'),
    ('Betina', '513815', 'betina_pereira@gmail.com'),
    ('Caio', '106606', 'caio_araujo@gmail.com'),
    ('Antonio', '659950', 'antonio_nicolas@gmail.com'),
    ('Pietra', '895819', 'pietra_tatiane@gmail.com'),
    ('Ruan', '449251', 'ruan_farias@gmail.com'),
    ('Otávio', '690140', 'otavio_gomes@gmail.com'),
    ('Lais', '078807', 'lais_mirela@gmail.com'),
    ('Bruna', '943969', 'brunanicole@gmail.com'),
    ('Eduarda', '526663', 'duda_castro@gmail.com');
	
INSERT INTO lixo (classificacao, id_ponto, id_caminhao) VALUES
    ('Plástico', 1, 1),
    ('Vidro', 2, 2),
    ('Papel', 3, 3),
    ('Lixo Orgânico', 4, 4),
    ('Madeira', 5, 5),
    ('Vidro', 6, 6),
    ('Metal', 7, 7),
    ('Plástico', 8, 8),
    ('Papel', 9, 9),
    ('Lixo Orgânico', 10, 10);

INSERT INTO motorista (cpf, nome, id_caminhao) VALUES
    ('34229986327', 'Daniel', 1),
    ('17247938374', 'Breno', 2),
    ('77664308356', 'Carlos', 3),
    ('48897924301', 'Pedro', 4),
    ('74321310318', 'João', 5),
    ('57560648347', 'Vitor', 6),
    ('84120283330', 'Carlos', 7),
    ('93233968345', 'Lucas', 8),
    ('00957756330', 'Gustavo', 9),
    ('63061022309', 'Paulo', 10);

INSERT INTO rota_de_coleta (bairro, rua, id_ponto) VALUES
    ('Planalto Renascer','Rua Nova Vida', 1),
    ('Centro', 'Rua Juvencio Alves de Oliveira', 2),
    ('Carrascal', 'Travessa Francisco Severino Figueiredo', 3),
    ('Jardim dos Monólitos', 'Rua Doutor Aldízio Alves Vieira', 4),
    ('Curicaca', 'Rua Municipalista Doutor Américo Barreira', 5),
    ('Centro', 'Travessa Clóvis Beviláqua', 6),
    ('Triângulo', 'Travessa Manoel Pereira de Santana', 7),
    ('Campo Novo', 'Travessa José Alencar de Macêdo', 8),
    ('Irajá', 'Rua Pedro Amaro', 9),
    ('Putiú', 'Rua Edilson Marques dos Santos', 10);

INSERT INTO caminhao (id_rota, modelo, capacidade, ano_de_fabricacao) VALUES
    (1, 'Mercedes-Benz', 10, '2020-01-01'),
    (2, 'Volvo', 20, '2019-01-01'),
    (3, 'Scania', 15, '2022-01-01'),
    (4, 'Renault Trucks', 12, '2018-01-01'),
    (5, 'Hino', 18, '2020-01-01'),
    (6, 'Iveco', 16, '2021-01-01'),
    (7, 'Isuzu', 10, '2019-01-01'),
    (8, 'Peterbilt', 25, '2022-01-01'),
    (9, 'International', 20, '2017-01-01'),
    (10, 'Mack', 15, '2020-01-01');