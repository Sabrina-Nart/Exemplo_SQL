
CREATE TABLE PESSOAS(
	I_PESSOA INTEGER NOT NULL,
	NOME VARCHAR(70) NOT NULL,
	CPF CHAR(11),
	DATA_NASCTO DATE,
	CONSTRAINT PK_PESSOAS PRIMARY KEY (I_PESSOA)
);

COMMIT;

INSERT INTO PESSOAS VALUES(1, 'JOÃO', '12345678901', '2000-10-05');
INSERT INTO PESSOAS VALUES(2, 'MARIA', '23456789012', '2005-03-12');
INSERT INTO PESSOAS VALUES(3, 'CLAUDIA', '34567890123', '1999-07-15');
INSERT INTO PESSOAS VALUES(4, 'PEDRO', '45678901234', '2016-01-23');
