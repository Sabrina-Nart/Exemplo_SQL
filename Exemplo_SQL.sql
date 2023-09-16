
CREATE TABLE cidades (
	i_cidade INTEGER NOT NULL,
	nome varchar(70) NOT NULL,
	CONSTRAINT pk_pessoa PRIMARY KEY (i_cidade)
);

-----

ALTER TABLE pessoas
ADD COLUMN i_cidade INTEGER;

ALTER TABLE pessoas
ADD CONSTRAINT fk_pessoas_cidades FOREIGN KEY(i_cidade) REFERENCES cidades(i_cidade);

-----

CREATE TABLE lojas(
	i_loja INTEGER NOT NULL,
	nome VARCHAR(70) NOT NULL,
	cnpj CHAR(14),
	data_abertura DATE NOT NULL,
	i_cidade INTEGER NOT NULL,
	CONSTRAINT pk_lojas PRIMARY KEY(i_loja),
	CONSTRAINT fk_lojas_cidades FOREIGN KEY(i_cidade) REFERENCES cidades(i_cidade)
);

CREATE TABLE vendas(
	i_venda INTEGER NOT NULL,
	data DATE NOT NULL,
	valor NUMERIC(12,2),
	i_loja INTEGER NOT NULL,
	i_pessoa INTEGER NOT NULL,
	CONSTRAINT pk_vendas PRIMARY KEY(i_venda),
	CONSTRAINT fk_vendas_lojas FOREIGN KEY(i_loja) REFERENCES lojas(i_loja),
	CONSTRAINT fk_vendas_pessoas FOREIGN KEY(i_pessoa) REFERENCES pessoas(i_pessoa)
);

-----

INSERT INTO cidades VALUES(	10, 'Nova Veneza');
INSERT INTO cidades VALUES(	20, 'Criciúma');
INSERT INTO cidades VALUES(	30, 'Içara');
INSERT INTO cidades VALUES(	40, 'Siderópolis');

-----

UPDATE pessoas
	SET i_cidade = CASE i_pessoa WHEN 1 THEN 10 
								  WHEN 2 THEN 30
								  WHEN 3 THEN 40
								  ELSE 20
								  END;

-----

INSERT INTO lojas VALUES(1, 'Loja 01 - Criciúma - Centro', NULL, '2003-01-25', 20);
INSERT INTO lojas VALUES(2, 'Loja 02 - Criciúma - Próspera', NULL, '2009-06-01', 20);
INSERT INTO lojas VALUES(3, 'Loja 03 - Criciúma - Pinheirinho', NULL, '2012-09-01', 20);
INSERT INTO lojas VALUES(4, 'Loja 04 - Nova Veneza', NULL, '2012-11-20', 10);
INSERT INTO lojas VALUES(5, 'Loja 05 - Caravagio', NULL, '2015-03-03', 10);
INSERT INTO lojas VALUES(6, 'Loja 06 - Içara', NULL, '2018-01-20', 30);
INSERT INTO lojas VALUES(7, 'Loja 07 - Siderópolis', NULL, '2019-03-10', 40);

INSERT INTO vendas VALUES(1, '2003-01-25', 150.00, 1, 4);
INSERT INTO vendas VALUES(2, '2003-01-25', 350.00, 1, 2);
INSERT INTO vendas VALUES(3, '2003-01-30', 50.00, 1, 3);
INSERT INTO vendas VALUES(4, '2003-02-02', 75.00, 1, 1);
INSERT INTO vendas VALUES(5, '2003-02-11', 750.00, 1, 4);
INSERT INTO vendas VALUES(6, '2003-03-25', 250.00, 1, 3);

INSERT INTO vendas VALUES(7, '2010-02-25', 50.00, 2, 4);
INSERT INTO vendas VALUES(8, '2010-03-25', 75.00, 2, 2);
INSERT INTO vendas VALUES(9, '2010-07-30', 50.00, 2, 3);
INSERT INTO vendas VALUES(10, '2010-09-02', 75.00, 2, 1);
INSERT INTO vendas VALUES(11, '2010-10-11', 78.00, 2, 4);
INSERT INTO vendas VALUES(12, '2015-03-25', 120.00, 2, 3);

INSERT INTO vendas VALUES(13, '2013-02-25', 100.00, 4, 4);
INSERT INTO vendas VALUES(14, '2013-03-25',  30.00, 4, 2);
INSERT INTO vendas VALUES(15, '2014-07-30', 350.00, 4, 3);
INSERT INTO vendas VALUES(16, '2015-09-02', 520.00, 4, 1);
INSERT INTO vendas VALUES(17, '2017-11-11', 155.00, 4, 4);
INSERT INTO vendas VALUES(18, '2018-03-25', 256.00, 4, 3);

INSERT INTO vendas VALUES(19, '2018-02-25', 666.00, 6, 4);
INSERT INTO vendas VALUES(20, '2018-03-25', 421.00, 6, 2);
INSERT INTO vendas VALUES(21, '2019-07-30', 235.00, 6, 3);
INSERT INTO vendas VALUES(22, '2019-09-02', 623.00, 6, 1);
INSERT INTO vendas VALUES(23, '2020-11-11', 880.00, 6, 4);
INSERT INTO vendas VALUES(24, '2021-03-25', 150.00, 6, 3);

INSERT INTO vendas VALUES(25, '2019-06-25', 666.00, 7, 4);
INSERT INTO vendas VALUES(26, '2019-09-25', 421.00, 7, 2);
INSERT INTO vendas VALUES(27, '2020-07-30', 235.00, 7, 3);
INSERT INTO vendas VALUES(28, '2020-09-02', 623.00, 7, 1);
INSERT INTO vendas VALUES(29, '2021-11-11', 880.00, 7, 4);
INSERT INTO vendas VALUES(30, '2022-03-25', 150.00, 7, 3);
