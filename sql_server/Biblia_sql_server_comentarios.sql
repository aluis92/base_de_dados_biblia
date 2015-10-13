-- banco de dados Biblia 
USE Biblia;
GO

-- comentario de BD 
EXEC sp_addextendedproperty 
@name = N'Caption', 
@value = N'Banco de Dados da Bíblia';

-- tabela Testamento 
-- comentario de tabela 
EXECUTE sp_addextendedproperty
N'MS_Description', N'Tabela que armazena os Testamentos da Bíblia',
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
N'MS_Description', N'Tabela que armazena os Livros da Bíblia',
N'SCHEMA', N'dbo', N'TABLE', N'livro';
-- comentario de coluna
EXECUTE sp_addextendedproperty
N'MS_Description', N'Id do Livro da Bíblia',
N'SCHEMA', N'dbo', N'TABLE', N'livro',
N'COLUMN', N'id_livro';
EXECUTE sp_addextendedproperty
N'MS_Description', N'Número de  ordem do Livro da Bíblia',
N'SCHEMA', N'dbo', N'TABLE', N'livro',
N'COLUMN', N'ordem_livro';
EXECUTE sp_addextendedproperty
N'MS_Description', N'Número do Testamento',
N'SCHEMA', N'dbo', N'TABLE', N'livro',
N'COLUMN', N'id_testamento';
EXECUTE sp_addextendedproperty
N'MS_Description', N'Nome completo do Livro da Bíblia',
N'SCHEMA', N'dbo', N'TABLE', N'livro',
N'COLUMN', N'nome';

-- tabela Palavra
-- comentario de tabela 
EXECUTE sp_addextendedproperty
N'MS_Description', N'Tabela que armazena os versiculos da Bíblia',
N'SCHEMA', N'dbo', N'TABLE', N'palavra';
-- comentario de coluna
EXECUTE sp_addextendedproperty
N'MS_Description', N'Id do Livro da Bíblia',
N'SCHEMA', N'dbo', N'TABLE', N'palavra',
N'COLUMN', N'id_livro';
EXECUTE sp_addextendedproperty
N'MS_Description', N'Número do capítulo da Bíblia',
N'SCHEMA', N'dbo', N'TABLE', N'palavra',
N'COLUMN', N'capitulo';
EXECUTE sp_addextendedproperty
N'MS_Description', N'Número do versículo da Bíblia',
N'SCHEMA', N'dbo', N'TABLE', N'palavra',
N'COLUMN', N'versiculo';
EXECUTE sp_addextendedproperty
N'MS_Description', N'Texto do versículo da Bíblia',
N'SCHEMA', N'dbo', N'TABLE', N'palavra',
N'COLUMN', N'texto';
