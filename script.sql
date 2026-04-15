-----------------------------------------------
-- Exercícios - Estrutura de Repetição 
-----------------------------------------------

-- Para os exercícios que não especifiquem intervalos explicitamente, considere os seguintes
-- intervalos.
-- Números inteiros: [1, 100]
-- Números reais: [1, 10]

-- 1.1 Faça um programa que gere um valor inteiro e o exiba.
DO $$
DECLARE
    limite_inferior INTEGER := 1;
    limite_superior INTEGER := 100;
    aleatorio INTEGER;
BEGIN    
    aleatorio := floor(
        random() * (limite_superior - limite_inferior + 1) 
        + limite_inferior
    )::int;

    RAISE NOTICE 'Número gerador: %', aleatorio;

END;
$$;

-- 1.2. Faça um programa que gere um valor real e o exiba.
DO $$
DECLARE
    valor_real NUMERIC(10,2);
BEGIN
    valor_real := random();
    RAISE NOTICE 'Valor real gerado: %', valor_real;
END;
$$;

-- 1.3 Faça um programa que gere um valor real no intervalo [20, 30] que representa uma
-- temperatura em graus Celsius. Faça a conversão para Fahrenheit e exiba.
DO $$
DECLARE
    celsius NUMERIC(10,2);
    fahrenheit NUMERIC(10,2);
BEGIN
    celsius := random() * (30 - 20) + 20;
    fahrenheit := celsius * 9/5 + 32;

    RAISE NOTICE 'Celsius: %', celsius;
    RAISE NOTICE 'Fahrenheit: %', fahrenheit;
END;
$$;

-- 1.4 Faça um programa que gere três valores reais a, b, e c e mostre o valor de delta: aquele
-- que calculamos para chegar às potenciais raízes de uma equação do segundo grau.
DO $$
DECLARE
    a NUMERIC(10,2);
    b NUMERIC(10,2);
    c NUMERIC(10,2);
    delta NUMERIC(10,2);
BEGIN
    a := random() * 10;
    b := random() * 10;
    c := random() * 10;

    delta := power(b, 2) - 4 * a * c;

    RAISE NOTICE 'Valor de a: %', a;
    RAISE NOTICE 'Valor de b: %', b;
    RAISE NOTICE 'Valor de c: %', c;
    RAISE NOTICE 'Delta: %', delta;
END;
$$;

-- 1.5 Faça um programa que gere um número inteiro e mostre a raiz cúbica de seu antecessor
-- e a raiz quadrada de seu sucessor.
DO $$
DECLARE
    n INTEGER;
    antecessor INTEGER;
    sucessor INTEGER;
    raiz_cubica NUMERIC(10,2);
    raiz_quadrada NUMERIC(10,2);
BEGIN
    n := floor(random() * 100 + 1)::int;
    
    antecessor := n - 1;
    sucessor := n + 1;

    raiz_cubica := power(antecessor, 1.0/3.0);
    raiz_quadrada := sqrt(sucessor);

    RAISE NOTICE 'Número gerado: %', n;
    RAISE NOTICE 'Antecessor: %', antecessor;
    RAISE NOTICE 'Raiz cúbica do antecessor: %', raiz_cubica;
    RAISE NOTICE 'Sucessor: %', sucessor;
    RAISE NOTICE 'Raiz quadrada do sucessor: %', raiz_quadrada;
END;
$$;

-- 1.6 Faça um programa que gere medidas reais de um terreno retangular. Gere também um
-- valor real no intervalo [60, 70] que representa o preço por metro quadrado. O programa deve
-- exibir o valor total do terreno.
DO $$
DECLARE
    largura NUMERIC(10,2);
    comprimento NUMERIC(10,2);
    preco_m2 NUMERIC(10,2);
    area NUMERIC(10,2);
    valor_total NUMERIC(10,2);
BEGIN
    largura := random() * 50 + 1;
    comprimento := random() * 50 + 1;
    preco_m2 := random() * (70 - 60) + 60;

    area := largura * comprimento;
    valor_total := area * preco_m2;

    RAISE NOTICE 'Largura do terreno: % m', largura;
    RAISE NOTICE 'Comprimento do terreno: % m', comprimento;
    RAISE NOTICE 'Preço por m²: R$ %', preco_m2;
    RAISE NOTICE 'Área do terreno: % m²', area;
    RAISE NOTICE 'Valor total do terreno: R$ %', valor_total;
END;
$$;

-- 1.7 Escreva um programa que gere um inteiro que representa o ano de nascimento de uma
-- pessoa no intervalo [1980, 2000] e gere um inteiro que representa o ano atual no intervalo
-- [2010, 2020]. O programa deve exibir a idade da pessoa em anos. Desconsidere detalhes
-- envolvendo dias, meses, anos bissextos etc.
DO $$
DECLARE
    ano_nascimento INTEGER;
    ano_atual INTEGER;
    idade INTEGER;
BEGIN
    ano_nascimento := floor(random() * (2000 - 1980 + 1) + 1980)::int;
    ano_atual := floor(random() * (2020 - 2010 + 1) + 2010)::int;

    idade := ano_atual - ano_nascimento;

    RAISE NOTICE 'Ano de nascimento: %', ano_nascimento;
    RAISE NOTICE 'Ano atual: %', ano_atual;
    RAISE NOTICE 'Idade: % anos', idade;
END;
$$;


-- Bloco de Código 2.5.1
-- Operadores aritméticos
-- DO 
-- $$
-- DECLARE
-- 	n1 INTEGER := 10;
-- 	n2 INTEGER := 5;
-- 	n3 NUMERIC(11,2) := 5.3;
-- 	n4 INTEGER := -5;
-- BEGIN
-- 	-- soma
-- 	RAISE NOTICE '% + % = %', n1, n2, n1 + n2; -- 15
-- 	-- unário
-- 	RAISE NOTICE '%', +n4; -- -5
-- 	-- subtração
-- 	RAISE NOTICE '% - % - % = %',
-- 	n1, n2, n4, n1 - n2 - n4; -- 10
-- 	-- unário
-- 	RAISE NOTICE '%', -n4; -- +5
-- 	-- divisão 
-- 	RAISE NOTICE '% / % = %', n1, n2, n1 / n2; -- 2
-- 	-- multiplicação
-- 	RAISE NOTICE '% * % = %', n1, n2, n1 * n2; -- 50
-- 	-- divisão (se envolve um real, a divisão é real)
-- 	RAISE NOTICE '% / % = %', n1, n3, n1 / n3; -- 1.88
-- 	-- divisão (formatando) --> '99.99' define formatação
-- 	RAISE NOTICE '% * % = %', n1, n2, to_char(n1 / n2, '99.99');
-- 	-- resto da divisão
-- 	-- usamos %% para mostrar um %
-- 	RAISE NOTICE '% %% % = %', n1, n3, n1 % n3; -- 10 % 5.30 = 4.70
-- 	-- exponenciação
-- 	RAISE NOTICE '% ^ % = %', n1, n2, n1 ^ n2;
-- 	-- raiz quadrada
-- 	RAISE NOTICE '|/ % = %', n1, |/ n1;
-- 	-- raiz cubica
-- 	RAISE NOTICE '||/ % = %', n1, ||/ n1;
-- 	-- valor absoluto (num sem sinal = negativo vira positivo e 
-- 	-- positivo continua igual
-- 	RAISE NOTICE '% = %', n4, @n4;
-- END;
-- $$


-- Bloco de Código 2.4.1
-- -- Declare Variáveis
-- DO $$
-- DECLARE
-- 	-- declara nome e tipo
-- 	idade INTEGER := 37;
-- 	nome_completo VARCHAR := 'William Santos';
-- 	salario NUMERIC(11,2) := 53.85;
-- BEGIN
--  	RAISE NOTICE 'Meu nome % e tenho % anos. Minha renda é %', 
-- 	nome_completo, idade, salario;
-- END;
-- $$


-- Bloco de Código 2.3.1
-- Placeholder de expressões em strings
-- DO 
-- $$
-- BEGIN
-- 	RAISE NOTICE '% + % = %', 10, 3, 10 + 3;
-- END;
-- $$


-- Bloco de Código 2.2.5
-- DO
-- $$
-- BEGIN
-- 	RAISE NOTICE 'MEU PRIMEIO BLOCO ANÔNIMO';
-- END;
-- $$