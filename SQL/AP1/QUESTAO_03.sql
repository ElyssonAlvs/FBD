SET SCHEMA 'public';

-- a) Mostre os livros cujo nome do autor inicia com a letra A
SELECT *
FROM livro 
WHERE nome_autor like 'A%';
-- b) Para cada aluno, liste o nome e o código das disciplinas que o aluno cursou
SELECT aluno.nome, disciplina.cod_curso, disciplina.nome
FROM aluno, disciplina
WHERE disciplina.cod_curso = aluno.cod_curso;
/*
c)Mostre o título do livro e a quantidade de disciplinas em que cada livro foi
adotado. Mostre inclusive os livros que não foram adotados
*/
SELECT livro.titulo, COUNT(*)
FROM livro 
JOIN livro_adotado ON livro.cod = livro_adotado.cod_livro
GROUP BY titulo;
/*
d) Mostre o código das disciplinas que tiveram mais de 10 alunos que cursaram
com nota acima de 9
n consegui essa 🥲
*/
SELECT disciplina.cod_disciplina
FROM disciplina JOIN historico ON historico.cod_discplina = disciplina.cod_disciplina
WHERE historico.nota >= 9
GROUP BY disciplina.cod_disciplina;

