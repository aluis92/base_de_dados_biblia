-- banco de dados Biblia 
USE Biblia;
GO

-- comentario de BD 
EXEC sp_addextendedproperty 
@name = N'Caption', 
@value = N'Banco de Dados da B�blia';

-- tabela Testamento 
-- comentario de tabela 
EXECUTE sp_addextendedproperty
N'MS_Description', N'Tabela que armazena os Testamentos da B�blia',
N'SCHEMA', N'dbo', N'TABLE', N'testamento';
-- comentario de coluna
EXECUTE sp_addextendedproperty
N'MS_Description', N'Nome do Testamento',
N'SCHEMA', N'dbo', N'TABLE', N'testamento',
N'COLUMN', N'id_testamento';
EXECUTE sp_addextendedproperty
N'MS_Description', N'Nome do Testamento',
N'SCHEMA', N'dbo', N'TABLE', N'testamento',
N'COLUMN', N'nome';

-- tabela Livro
-- comentario de tabela 
EXECUTE sp_addextendedproperty
N'MS_Description', N'Tabela que armazena os Livros da B�blia',
N'SCHEMA', N'dbo', N'TABLE', N'livro';
-- comentario de coluna
EXECUTE sp_addextendedproperty
N'MS_Description', N'Id do Livro da B�blia',
N'SCHEMA', N'dbo', N'TABLE', N'livro',
N'COLUMN', N'id_livro';
EXECUTE sp_addextendedproperty
N'MS_Description', N'N�mero de  ordem do Livro da B�blia',
N'SCHEMA', N'dbo', N'TABLE', N'livro',
N'COLUMN', N'ordem_livro';
EXECUTE sp_addextendedproperty
N'MS_Description', N'N�mero do Testamento',
N'SCHEMA', N'dbo', N'TABLE', N'livro',
N'COLUMN', N'id_testamento';
EXECUTE sp_addextendedproperty
N'MS_Description', N'Nome completo do Livro da B�blia',
N'SCHEMA', N'dbo', N'TABLE', N'livro',
N'COLUMN', N'nome';

-- tabela Palavra
-- comentario de tabela 
EXECUTE sp_addextendedproperty
N'MS_Description', N'Tabela que armazena os versiculos da B�blia',
N'SCHEMA', N'dbo', N'TABLE', N'palavra';
-- comentario de coluna
EXECUTE sp_addextendedproperty
N'MS_Description', N'Id do Livro da B�blia',
N'SCHEMA', N'dbo', N'TABLE', N'palavra',
N'COLUMN', N'id_livro';
EXECUTE sp_addextendedproperty
N'MS_Description', N'N�mero do cap�tulo da B�blia',
N'SCHEMA', N'dbo', N'TABLE', N'palavra',
N'COLUMN', N'capitulo';
EXECUTE sp_addextendedproperty
N'MS_Description', N'N�mero do vers�culo da B�blia',
N'SCHEMA', N'dbo', N'TABLE', N'palavra',
N'COLUMN', N'versiculo';
EXECUTE sp_addextendedproperty
N'MS_Description', N'Texto do vers�culo da B�blia',
N'SCHEMA', N'dbo', N'TABLE', N'palavra',
N'COLUMN', N'texto';
