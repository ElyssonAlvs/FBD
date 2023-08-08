-- Retorna o numero dependente de cada funcionario (descendentes)
SELECT pnome,(
    SELECT COUNT(*)
    FROM dependente AS d
    WHERE d.fcpf = f.cpf
) FROM funcionario AS f;
-- Mesmo resultado seria usando LEFT JOIN, a execução das partes vai depender do sistema

IN -- sentido de pertencimentos de um elemento em um 
-- expressões booleanas são mais usadas em HAVING e WHERE

-- Retornar os funcionários dentor da tabela funcionario onde Fernanda e João devem estar dentro
SELECT *
FROM funcionario
WHERE pnome IN ('Fernanda', 'João');

-- Todos os funcionarios que trabalham no projeto 1
SELECT *
FROM funcionario AS f
WHERE cpf IN (
    SELECT fcpf 
    FROM trabalha_em
    WHERE pnr = 1;
);
-- Todos os funcionarios que não trabalham no projeto 1
SELECT *
FROM funcionario AS f
WHERE cpf NOT IN (
    SELECT fcpf 
    FROM trabalha_em
    WHERE pnr = 1;
);

-- Retorna funcionarios com o mesmo nome dos seus dependentes
SELECT *
FROM funcionario AS f
WHERE cpf IN (
    SELECT fcpf
    FROM dependente AS d
    WHERE f.pnome = d.nome_dependente
    AND f.cpf = d.fcpf;
);

-- Retorna funcionario cujo salario é maior que o salario de algum funcionario do departamento 1
SELECT *
FROM funcionario AS f
WHERE f.salario > ANY (
    SELECT f1.salario
    FROM funcionario AS f1
    WHERE f1.dnr = 4
);

-- SOME, verdadeira para pelo menos 1
-- ALL, verdadeiro para todos
-- Retorna um funcionario que ganha mais que todos
SELECT *
FROM funcionario AS f
WHERE f.salario >= ALL (
    SELECT f1.salario
    FROM funcionario AS f1
);

-- Funcionario que não trabalham em nenhum projeto
SELECT *
FROM funcionario AS f1
WHERE -- todos os projetos de f precisa ser vazio
NOT EXISTS (
    SELECT *
    FROM trabalha_em AS t
    WHERE t.fcpf = f.cpf
)
-- Existe um funcionario que trabalham em algum projeto
SELECT *
FROM funcionario AS f1
WHERE -- todos os projetos de f precisa ser vazio
EXISTS (
    SELECT *
    FROM trabalha_em AS t
    WHERE t.fcpf = f.cpf
)

-- Obter os departamentos que não tem projeto
SELECT *
FROM departamento AS d
WHERE NOT EXISTS(
    SELECT *
    FROM projeto AS p
    WHERE d.dnumero = p.dnum
)