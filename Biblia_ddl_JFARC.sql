--
-- Nome Artefato/Programa..: Biblia_ddl.sql
-- Autor(es)...............: Emerson Hermann (emersonhermann@gmail.com)  
-- Data Inicio ............: 04/02/2011 as 20:45
-- Data Atual..............: 07/02/2011 as 18:50
-- Versao..................: 0.05
-- Compilador/Interpretador: PostgreSql/PLpgSQL
-- Sistemas Operacionais...: Linux/Windows
-- SGBD....................: PostgreSql 8.x/9.x
-- Kernel..................: Nao informado!
-- Finalidade..............: Script de criação de estrutura de base de dados da Bíblia Sagrada  
-- ........................: 
-- OBS.....................:  
--
/*
--Poderia se criar dominio, como exemplo abaixo, já que é uma tabela pequena e imutavél, 
--porém por questão de compatibilidade com outros SGBDRs, deixamos como um tabela.
DROP DOMAIN IF EXISTS id_testamento_dominio;
CREATE DOMAIN id_testamento_dominio AS smallint
CHECK	
	(
	VALUE IN 
		(
		  1 --Antigo Testamento
		, 2 --Novo Testamento 
		) 
	);
COMMENT ON DOMAIN id_testamento_dominio IS 'Dominio do Testamento';
 
*/

DROP TABLE IF EXISTS Testamento;
CREATE TABLE testamento
(
	  id_testamento smallint NOT NULL PRIMARY KEY
	, nome varchar(21) NOT NULL
);
COMMENT ON TABLE Testamento IS 'Tabela que armazena os Testamentos da Bíblia';
COMMENT ON COLUMN Testamento.id_testamento IS 'Chave primária da tabela';
COMMENT ON COLUMN Testamento.nome IS 'Nome do Testamento';



DROP TABLE IF EXISTS Livro;
--DROP TABLE IF EXISTS Livro CASCADE;
CREATE TABLE Livro  
(
	  id_livro serial 
	, ordem_livro smallint NOT NULL 
	, id_testamento smallint NOT NULL
	, nome varchar(42) NOT NULL
	, abrev varchar(4) NOT NULL
	, CONSTRAINT Livro_pkey PRIMARY KEY (id_livro)
	, CONSTRAINT Livro_id_testamento_fkey FOREIGN KEY (id_testamento)
	  REFERENCES Testamento (id_testamento) 
	
);
COMMENT ON TABLE Livro IS 'Tabela que armazena os Livros da Bíblia';
COMMENT ON COLUMN Livro.id_livro IS 'Id do Livro da Bíblia';
COMMENT ON COLUMN Livro.ordem_livro IS 'Número de  ordem do Livro da Bíblia';
COMMENT ON COLUMN Livro.id_testamento IS 'Número do Testamento';
COMMENT ON COLUMN Livro.nome IS 'Nome completo do Livro da Bíblia';
COMMENT ON COLUMN Livro.abrev IS 'Nome abreviado do Livro da Bíblia';



DROP TABLE IF EXISTS Palavra;
CREATE TABLE Palavra
(
	  id_palavra serial 
	, id_livro integer NOT NULL 
	, capitulo smallint NOT NULL
	, versiculo smallint NOT NULL
	, texto TEXT
	, CONSTRAINT Palavra_pkey PRIMARY KEY (id_palavra)
	, CONSTRAINT Palavra_id_livro_fkey FOREIGN KEY (id_livro)
	  REFERENCES Livro (id_livro) 


);
COMMENT ON TABLE Palavra IS 'Tabela que armazena os versiculos da Bíblia';
COMMENT ON COLUMN Palavra.id_livro IS 'Id do Livro da Bíblia';
COMMENT ON COLUMN Palavra.capitulo IS 'Número do capítulo da Bíblia';
COMMENT ON COLUMN Palavra.versiculo IS 'Número do versículo da Bíblia';
COMMENT ON COLUMN Palavra.texto IS 'Texto do versículo da Bíblia';



INSERT INTO Testamento (id_testamento, nome) VALUES (1,'Velho Testamento');
INSERT INTO Testamento (id_testamento, nome) VALUES (2,'Novo Testamento');

SELECT * FROM Testamento;

--linux
	COPY livro(ordem_livro, id_testamento, nome, abrev) 
	FROM '/home/postgres/Biblia_JFARC/2_Livro_JFARC.csv' 
	 CSV 
   HEADER;

--windows
	COPY livro(ordem_livro, id_testamento, nome, abrev) 
	FROM 'c:/Biblia_JFARC/2_Livro_JFARC.csv' 
	 CSV 
   HEADER;


SELECT * FROM Livro;

--linux
	COPY palavra (id_livro, capitulo, versiculo, texto)  
	FROM '/home/postgres/Biblia_JFARC/3_Palavra_JFARC.csv' 
	 CSV  
   HEADER;

--windows

	COPY palavra (id_livro, capitulo, versiculo, texto)  
	FROM 'c:/Biblia_JFARC/3_Palavra_JFARC.csv' 
	 CSV  
   HEADER;


SELECT * FROM Palavra;



--
-- Nome Artefato/Programa..: sp_palavra.sql
-- Autor(es)...............: Emerson Hermann (emersonhermann@gmail.com)  
-- Data Inicio ............: 16/07/2009
-- Data Atual..............: 07/02/2011 as 18:50
-- Versao..................: 0.05
-- Compilador/Interpretador: PostgreSql/PLpgSQL
-- Sistemas Operacionais...: Linux/Windows
-- SGBD....................: PostgreSql 8.x/9.x
-- Kernel..................: Nao informado!
-- Finalidade..............: Store Procedure/Function Funcao de Consulta a Palavra, não é apenas uma 
-- ........................: caixinha de promessa, pois toda a Biblia Sagrada é usada para o mesmo
-- OBS.....................:  
--


DROP FUNCTION IF EXISTS Palavra();
CREATE OR REPLACE FUNCTION Palavra() RETURNS TEXT AS
$body$
  SELECT p.texto
      || ' '
      || rtrim(l.abrev)
      || ' '
      || cast(p.capitulo AS text)
      || ':'
      || cast(p.versiculo AS text)
      AS "Consulta a Palavra - Clame pelo Sangue de Jesus!!!" 
    FROM Palavra p
    JOIN Livro l
      ON l.id_livro = p.id_livro 
    JOIN Testamento te
      ON te.id_testamento  = l.id_testamento
ORDER BY RANDOM() 
   LIMIT 1
       ; 
$body$ 
LANGUAGE 'sql';
COMMENT ON FUNCTION Palavra() IS 'Função de Consulta a Palavra (Bíblia Sagrada) não é apenas uma caixinha de promessa, pois toda a Bíblia Sagrada é usada para o mesmo';

SELECT * FROM Palavra();



