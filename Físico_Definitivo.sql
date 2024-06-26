/* Lógico:*/

CREATE TABLE cupomDesconto (
    descricaoDesconto VARCHAR,
    idCupomDesconto INTEGER PRIMARY KEY,
    valorDesconto FLOAT,
    qntUtilizada INTEGER
);

CREATE TABLE ATT_cupomDesconto (
  idCupomDesconto INTEGER PRIMARY KEY,
  descricaoDesconto VARCHAR,
  valorDesconto FLOAT,
  data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE PESSOA_JURIDICA (
    CNPJ VARCHAR,
    IM INTEGER,
    IE INTEGER,
    idPessoaJuridica INTEGER,
    FK_CLIENTE_idCliente INTEGER,
    PRIMARY KEY (idPessoaJuridica, FK_CLIENTE_idCliente)
);


CREATE TABLE Estudante (
    carteiraEstudante INTEGER,
    desconto FLOAT,
    nomeEscola VARCHAR,
    fk_CLIENTE_idCliente INTEGER,
    PRIMARY KEY (carteiraEstudante, fk_CLIENTE_idCliente)
);

CREATE TABLE DESCONTO (
    DescontoEstudante FLOAT,
    idDesconto INTEGER,
    idPedido INTEGER,
    DescontoFuncionario FLOAT,
    DescontoBolsista FLOAT,
    DescontoPessoaJuridica FLOAT,
    FK_cupomDesconto_idCupomDesconto INTEGER,
    FK_PEDIDO_idPedido INTEGER,
    FK_PEDIDO_idCliente INTEGER,
    PRIMARY KEY (idDesconto, idPedido)
);

CREATE TABLE CLIENTE (
    idade INTEGER,
    senha VARCHAR,
    email VARCHAR,
    idCliente INTEGER PRIMARY KEY,
    bairro VARCHAR,
    numAp INTEGER,
    Rua VARCHAR,
    CEP VARCHAR,
    nome VARCHAR
);

CREATE TABLE ATT_REMOCAO_CLIENTE (
    idCliente INTEGER PRIMARY KEY,
    nome VARCHAR,
    email VARCHAR,
    data_remocao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE PESSOA_FISICA (
    CPF VARCHAR,
    IDPessoaFisica INTEGER,
    RG VARCHAR,
    FK_CLIENTE_idCliente INTEGER,
    PRIMARY KEY (IDPessoaFisica, FK_CLIENTE_idCliente)
);

CREATE TABLE PEDIDO (
    notaFiscal INTEGER,
    metodoPagamento VARCHAR,
    dataEntrega DATE,
    idPedido INTEGER,
    idCliente INTEGER,
    entregaExpressa BOOLEAN,
    entregaPadrao BOOLEAN,
    dataPedido DATE,
    totalVendas INTEGER,
    FK_CLIENTE_idCliente INTEGER,
    PRIMARY KEY (idPedido, idCliente)
);

CREATE TABLE AVALIACAO (
    estrelas_1 BOOLEAN,
    estrelas_2 BOOLEAN,
    estrelas_4 BOOLEAN,
    estrelas_5 BOOLEAN,
    estrelas_3 BOOLEAN,
    comentario VARCHAR,
    idAvaliacao INTEGER,
    idProduto INTEGER,
    FK_PRODUTO_idProduto INTEGER,
    PRIMARY KEY (idAvaliacao, idProduto)
);

CREATE TABLE TELEFONECLIENTE (
    telefoneCelular VARCHAR,
    telefoneEmpresarial VARCHAR,
    idCliente INTEGER,
    idTelefone VARCHAR,
    FK_CLIENTE_idCliente INTEGER,
    PRIMARY KEY (idCliente, idTelefone)
);

CREATE TABLE ATT_TELEFONECLIENTE (
    telefoneCelular VARCHAR,
    telefoneEmpresarial VARCHAR,
    idCliente INTEGER,
    idTelefone VARCHAR,
    FK_CLIENTE_idCliente INTEGER,
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (idCliente, idTelefone)
);

CREATE TABLE PRODUTO_PEDIDO_Contem (
    tipoProduto VARCHAR,
    fk_PEDIDO_idPedido INTEGER,
    fk_PEDIDO_idCliente INTEGER,
    fk_PRODUTO_idProduto INTEGER
);

CREATE TABLE PRODUTO (
    nome VARCHAR,
    valor FLOAT,
    avaliacaoMedia FLOAT,
    idProduto INTEGER PRIMARY KEY,
    totalVendas INTEGER
);

CREATE TABLE ATT_PRODUTO (
    idProduto INTEGER PRIMARY KEY,
    nome VARCHAR,
    valor FLOAT,
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE GERENTE_PRODUTOS (
    idGerenteProdutos INTEGER,
    FK_FUNCIONARIO_VIRTUAL_contrato BOOLEAN,
    PRIMARY KEY (idGerenteProdutos, FK_FUNCIONARIO_VIRTUAL_contrato)
);

CREATE TABLE DP_GERAL (
    idDepartamento INTEGER PRIMARY KEY
);

CREATE TABLE CEO_ (
    idCEO INTEGER,
    FK_DP_GERAL_idDepartamento INTEGER,
    PRIMARY KEY (idCEO, FK_DP_GERAL_idDepartamento)
);

CREATE TABLE DIRETORIA_ESC (
    idDiretoriaEsc INTEGER,
    biblioteca BOOLEAN,
    FK_DP_GERAL_idDepartamento INTEGER,
    PRIMARY KEY (idDiretoriaEsc, FK_DP_GERAL_idDepartamento)
);

CREATE TABLE CURSOS (
    nomeCurso VARCHAR,
    tema VARCHAR,
    idCursos INTEGER,
    ementa VARCHAR,
    professorCurso VARCHAR,
    certificado BOOLEAN,
    valor_cursos FLOAT,
    FK_PRODUTO_idProduto INTEGER,
    PRIMARY KEY (idCursos, FK_PRODUTO_idProduto)
);

CREATE TABLE EBOOKS (
    sinopse VARCHAR,
    autor VARCHAR,
    titulo VARCHAR,
    idEbooks INTEGER,
    quantEstoque INTEGER,
    valor_eBooks FLOAT,
    FK_PRODUTO_idProduto INTEGER,
    PRIMARY KEY (idEbooks, FK_PRODUTO_idProduto)
);

CREATE TABLE ACESSORIOSTEMATICOS (
    quantEstoque INTEGER,
    nomeAcessorio VARCHAR,
    descricao VARCHAR,
    idAcessoriosTematicos INTEGER,
    valor_acessorios FLOAT,
    FK_PRODUTO_idProduto INTEGER,
    PRIMARY KEY (idAcessoriosTematicos, FK_PRODUTO_idProduto)
);

CREATE TABLE FUNCIONARIO_FISICO (
    cpf VARCHAR,
    contrato BOOLEAN PRIMARY KEY,
    sobrenome VARCHAR,
    Primeiro_Nome VARCHAR,
    salario FLOAT,
    FK_DIRETORIA_ESC_idDiretoriaEsc INTEGER,
    FK_DIRETORIA_ESC_FK_DP_GERAL_idDepartamento INTEGER
);

CREATE TABLE PSICOLOGO (
    idPsicologo INTEGER,
    especializacao VARCHAR,
    FK_FUNCIONARIO_FISICO_contrato BOOLEAN,
    PRIMARY KEY (idPsicologo, FK_FUNCIONARIO_FISICO_contrato)
);

CREATE TABLE PROFESSOR (
    idProfessor INTEGER,
    Falta INTEGER,
    diploma BOOLEAN,
    FK_FUNCIONARIO_FISICO_contrato BOOLEAN,
    PRIMARY KEY (idProfessor, FK_FUNCIONARIO_FISICO_contrato)
);

CREATE TABLE FUNCIONARIO_VIRTUAL (
    contrato BOOLEAN PRIMARY KEY,
    cpf VARCHAR,
    salario FLOAT,
    Primeiro_Nome VARCHAR,
    sobrenome VARCHAR,
    FK_CEO__idCEO INTEGER,
    FK_CEO__FK_DP_GERAL_idDepartamento INTEGER
);

CREATE TABLE DISCIPLINA (
    idDisciplina INTEGER PRIMARY KEY,
    Presencial BOOLEAN,
    Remota BOOLEAN,
    Eletiva BOOLEAN,
    Obrigatoria BOOLEAN
);

CREATE TABLE ALUNO (
    Sobrenome VARCHAR,
    Primeiro_Nome VARCHAR,
    idAluno INTEGER PRIMARY KEY,
    Falta INTEGER,
    qntEmprestimo INTEGER,
    FK_Responsavel_idResponsavel INTEGER,
    FK_PSICOLOGO_idPsicologo INTEGER,
    FK_PSICOLOGO_FK_FUNCIONARIO_FISICO_contrato BOOLEAN
);

CREATE TABLE Bolsista (
    Comprovante_de_Renda BOOLEAN,
    idBolsista INTEGER,
    comprovante_de_contrato BOOLEAN,
    fk_ALUNO_idAluno INTEGER,
    PRIMARY KEY (idBolsista, fk_ALUNO_idAluno)
);

CREATE TABLE Responsavel (
    Nome VARCHAR,
    email VARCHAR,
    idResponsavel INTEGER PRIMARY KEY,
    fk_FUNCIONARIO_FISICO_contrato BOOLEAN
);

CREATE TABLE LIVROS (
    titulo VARCHAR,
    sinopse VARCHAR,
    idLivros INTEGER PRIMARY KEY,
    autor VARCHAR,
    FK_DIRETORIA_ESC_idDiretoriaEsc INTEGER,
    FK_DIRETORIA_ESC_FK_DP_GERAL_idDepartamento INTEGER
);

CREATE TABLE Gerencia (
    fk_GERENTE_PRODUTOS_idGerenteProdutos INTEGER,
    fk_GERENTE_PRODUTOS_FK_FUNCIONARIO_VIRTUAL_contrato BOOLEAN,
    fk_PRODUTO_idProduto INTEGER
);

CREATE TABLE Leciona (
    fk_PROFESSOR_idProfessor INTEGER,
    fk_PROFESSOR_FK_FUNCIONARIO_FISICO_contrato BOOLEAN,
    fk_DISCIPLINA_idDisciplina INTEGER
);

CREATE TABLE paga (
    fk_DISCIPLINA_idDisciplina INTEGER,
    fk_ALUNO_idAluno INTEGER,
    notaDisciplina FLOAT
);

CREATE TABLE emprestimo (
    fk_ALUNO_idAluno INTEGER,
    fk_LIVROS_idLivros INTEGER,
    multaAtraso FLOAT,
    dataEntrega DATE,
    dataEmprestimo DATE PRIMARY KEY
);

CREATE TABLE cliente_cupomDesconto (
    fk_cupomDesconto_idCupomDesconto INTEGER,
    fk_CLIENTE_idCliente INTEGER
);

ALTER TABLE PESSOA_JURIDICA ADD CONSTRAINT FK_PESSOA_JURIDICA_2
    FOREIGN KEY (FK_CLIENTE_idCliente)
    REFERENCES CLIENTE (idCliente)
    ON DELETE CASCADE;
 
ALTER TABLE Estudante ADD CONSTRAINT FK_Estudante_2
    FOREIGN KEY (fk_CLIENTE_idCliente)
    REFERENCES CLIENTE (idCliente)
    ON DELETE CASCADE;
 
ALTER TABLE DESCONTO ADD CONSTRAINT FK_DESCONTO_2
    FOREIGN KEY (FK_cupomDesconto_idCupomDesconto)
    REFERENCES cupomDesconto (idCupomDesconto)
    ON DELETE RESTRICT;
 
ALTER TABLE DESCONTO ADD CONSTRAINT FK_DESCONTO_3
    FOREIGN KEY (FK_PEDIDO_idPedido, FK_PEDIDO_idCliente)
    REFERENCES PEDIDO (idPedido, idCliente)
    ON DELETE CASCADE;
 
ALTER TABLE PESSOA_FISICA ADD CONSTRAINT FK_PESSOA_FISICA_2
    FOREIGN KEY (FK_CLIENTE_idCliente)
    REFERENCES CLIENTE (idCliente)
    ON DELETE CASCADE;
 
ALTER TABLE PEDIDO ADD CONSTRAINT FK_PEDIDO_2
    FOREIGN KEY (FK_CLIENTE_idCliente)
    REFERENCES CLIENTE (idCliente)
    ON DELETE CASCADE;
 
ALTER TABLE AVALIACAO ADD CONSTRAINT FK_AVALIACAO_2
    FOREIGN KEY (FK_PRODUTO_idProduto)
    REFERENCES PRODUTO (idProduto)
    ON DELETE CASCADE;
 
ALTER TABLE TELEFONECLIENTE ADD CONSTRAINT FK_TELEFONECLIENTE_2
    FOREIGN KEY (FK_CLIENTE_idCliente)
    REFERENCES CLIENTE (idCliente)
    ON DELETE CASCADE;
 
ALTER TABLE PRODUTO_PEDIDO_Contem ADD CONSTRAINT FK_PRODUTO_PEDIDO_Contem_1
    FOREIGN KEY (fk_PEDIDO_idPedido, fk_PEDIDO_idCliente)
    REFERENCES PEDIDO (idPedido, idCliente);
 
ALTER TABLE PRODUTO_PEDIDO_Contem ADD CONSTRAINT FK_PRODUTO_PEDIDO_Contem_2
    FOREIGN KEY (fk_PRODUTO_idProduto)
    REFERENCES PRODUTO (idProduto);
 
ALTER TABLE GERENTE_PRODUTOS ADD CONSTRAINT FK_GERENTE_PRODUTOS_2
    FOREIGN KEY (FK_FUNCIONARIO_VIRTUAL_contrato)
    REFERENCES FUNCIONARIO_VIRTUAL (contrato)
    ON DELETE CASCADE;
 
ALTER TABLE CEO_ ADD CONSTRAINT FK_CEO__2
    FOREIGN KEY (FK_DP_GERAL_idDepartamento)
    REFERENCES DP_GERAL (idDepartamento)
    ON DELETE CASCADE;
 
ALTER TABLE DIRETORIA_ESC ADD CONSTRAINT FK_DIRETORIA_ESC_2
    FOREIGN KEY (FK_DP_GERAL_idDepartamento)
    REFERENCES DP_GERAL (idDepartamento)
    ON DELETE CASCADE;
 
ALTER TABLE CURSOS ADD CONSTRAINT FK_CURSOS_2
    FOREIGN KEY (FK_PRODUTO_idProduto)
    REFERENCES PRODUTO (idProduto)
    ON DELETE CASCADE;
 
ALTER TABLE EBOOKS ADD CONSTRAINT FK_EBOOKS_2
    FOREIGN KEY (FK_PRODUTO_idProduto)
    REFERENCES PRODUTO (idProduto)
    ON DELETE CASCADE;
 
ALTER TABLE ACESSORIOSTEMATICOS ADD CONSTRAINT FK_ACESSORIOSTEMATICOS_2
    FOREIGN KEY (FK_PRODUTO_idProduto)
    REFERENCES PRODUTO (idProduto)
    ON DELETE CASCADE;
 
ALTER TABLE FUNCIONARIO_FISICO ADD CONSTRAINT FK_FUNCIONARIO_FISICO_2
    FOREIGN KEY (FK_DIRETORIA_ESC_idDiretoriaEsc, FK_DIRETORIA_ESC_FK_DP_GERAL_idDepartamento)
    REFERENCES DIRETORIA_ESC (idDiretoriaEsc, FK_DP_GERAL_idDepartamento)
    ON DELETE RESTRICT;
 
ALTER TABLE PSICOLOGO ADD CONSTRAINT FK_PSICOLOGO_2
    FOREIGN KEY (FK_FUNCIONARIO_FISICO_contrato)
    REFERENCES FUNCIONARIO_FISICO (contrato)
    ON DELETE CASCADE;
 
ALTER TABLE PROFESSOR ADD CONSTRAINT FK_PROFESSOR_2
    FOREIGN KEY (FK_FUNCIONARIO_FISICO_contrato)
    REFERENCES FUNCIONARIO_FISICO (contrato)
    ON DELETE CASCADE;
 
ALTER TABLE FUNCIONARIO_VIRTUAL ADD CONSTRAINT FK_FUNCIONARIO_VIRTUAL_2
    FOREIGN KEY (FK_CEO__idCEO, FK_CEO__FK_DP_GERAL_idDepartamento)
    REFERENCES CEO_ (idCEO, FK_DP_GERAL_idDepartamento)
    ON DELETE RESTRICT;
 
ALTER TABLE ALUNO ADD CONSTRAINT FK_ALUNO_2
    FOREIGN KEY (FK_Responsavel_idResponsavel)
    REFERENCES Responsavel (idResponsavel)
    ON DELETE RESTRICT;
 
ALTER TABLE ALUNO ADD CONSTRAINT FK_ALUNO_3
    FOREIGN KEY (FK_PSICOLOGO_idPsicologo, FK_PSICOLOGO_FK_FUNCIONARIO_FISICO_contrato)
    REFERENCES PSICOLOGO (idPsicologo, FK_FUNCIONARIO_FISICO_contrato)
    ON DELETE SET NULL;
 
ALTER TABLE Bolsista ADD CONSTRAINT FK_Bolsista_2
    FOREIGN KEY (fk_ALUNO_idAluno)
    REFERENCES ALUNO (idAluno)
    ON DELETE CASCADE;
 
ALTER TABLE Responsavel ADD CONSTRAINT FK_Responsavel_2
    FOREIGN KEY (fk_FUNCIONARIO_FISICO_contrato)
    REFERENCES FUNCIONARIO_FISICO (contrato)
    ON DELETE SET NULL;
 
ALTER TABLE LIVROS ADD CONSTRAINT FK_LIVROS_2
    FOREIGN KEY (FK_DIRETORIA_ESC_idDiretoriaEsc, FK_DIRETORIA_ESC_FK_DP_GERAL_idDepartamento)
    REFERENCES DIRETORIA_ESC (idDiretoriaEsc, FK_DP_GERAL_idDepartamento)
    ON DELETE RESTRICT;
 
ALTER TABLE Gerencia ADD CONSTRAINT FK_Gerencia_1
    FOREIGN KEY (fk_GERENTE_PRODUTOS_idGerenteProdutos, fk_GERENTE_PRODUTOS_FK_FUNCIONARIO_VIRTUAL_contrato)
    REFERENCES GERENTE_PRODUTOS (idGerenteProdutos, FK_FUNCIONARIO_VIRTUAL_contrato)
    ON DELETE RESTRICT;
 
ALTER TABLE Gerencia ADD CONSTRAINT FK_Gerencia_2
    FOREIGN KEY (fk_PRODUTO_idProduto)
    REFERENCES PRODUTO (idProduto)
    ON DELETE RESTRICT;
 
ALTER TABLE Leciona ADD CONSTRAINT FK_Leciona_1
    FOREIGN KEY (fk_PROFESSOR_idProfessor, fk_PROFESSOR_FK_FUNCIONARIO_FISICO_contrato)
    REFERENCES PROFESSOR (idProfessor, FK_FUNCIONARIO_FISICO_contrato)
    ON DELETE RESTRICT;
 
ALTER TABLE Leciona ADD CONSTRAINT FK_Leciona_2
    FOREIGN KEY (fk_DISCIPLINA_idDisciplina)
    REFERENCES DISCIPLINA (idDisciplina)
    ON DELETE RESTRICT;
 
ALTER TABLE paga ADD CONSTRAINT FK_paga_1
    FOREIGN KEY (fk_DISCIPLINA_idDisciplina)
    REFERENCES DISCIPLINA (idDisciplina)
    ON DELETE RESTRICT;
 
ALTER TABLE paga ADD CONSTRAINT FK_paga_2
    FOREIGN KEY (fk_ALUNO_idAluno)
    REFERENCES ALUNO (idAluno)
    ON DELETE RESTRICT;
 
ALTER TABLE emprestimo ADD CONSTRAINT FK_emprestimo_2
    FOREIGN KEY (fk_ALUNO_idAluno)
    REFERENCES ALUNO (idAluno)
    ON DELETE SET NULL;
 
ALTER TABLE emprestimo ADD CONSTRAINT FK_emprestimo_3
    FOREIGN KEY (fk_LIVROS_idLivros)
    REFERENCES LIVROS (idLivros)
    ON DELETE SET NULL;
 
ALTER TABLE cliente_cupomDesconto ADD CONSTRAINT FK_cliente_cupomDesconto_1
    FOREIGN KEY (fk_cupomDesconto_idCupomDesconto)
    REFERENCES cupomDesconto (idCupomDesconto)
    ON DELETE SET NULL;
 
ALTER TABLE cliente_cupomDesconto ADD CONSTRAINT FK_cliente_cupomDesconto_2
    FOREIGN KEY (fk_CLIENTE_idCliente)
    REFERENCES CLIENTE (idCliente)
    ON DELETE SET NULL;


-- Inserts para tabela PEDIDO
INSERT INTO PEDIDO (notaFiscal, metodoPagamento, dataEntrega, idPedido, idCliente, entregaExpressa, entregaPadrao, dataPedido)
VALUES
    (123456, 'Cartão de crédito', '2024-04-23', 1, 1, TRUE, FALSE, '2024-04-20'),
    (789012, 'Boleto bancário', '2024-04-25', 2, 2, FALSE, TRUE, '2024-04-21'),
    (345660, 'Boleto bancário', '2024-04-24', 3, 3, TRUE, FALSE, '2024-04-22'),
    (345679, 'Boleto', '2024-04-24', 4, 4, TRUE, FALSE, '2024-05-22'),
    (345680, 'Dinheiro', '2024-04-24', 5, 5, TRUE, FALSE, '2024-04-22');

-- Inserts para tabela ALUNO
INSERT INTO ALUNO (Falta, Sobrenome, Primeiro_Nome, idAluno, qntEmprestimo, FK_Responsavel_idResponsavel, FK_PSICOLOGO_idPsicologo, FK_PSICOLOGO_FK_FUNCIONARIO_FISICO_contrato)
VALUES
    (2, 'Silva', 'João', 1, 5, NULL, NULL, NULL),
    (0, 'Souza', 'Maria', 2, 6, NULL, NULL, NULL),
    (1, 'Oliveira', 'Pedro', 3, 8, NULL, NULL, NULL),
    (3, 'Santos', 'Ana', 4, 12, NULL, NULL, NULL),
    (1, 'Ferreira', 'Lucas', 5, 3, NULL, NULL, NULL),
    (2, 'Martins', 'Carla', 6, 1, NULL, NULL, NULL);

-- Inserts para tabela DISCIPLINA
INSERT INTO DISCIPLINA (idDisciplina, Presencial, Remota, Eletiva, Obrigatoria)
VALUES
    (1, TRUE, FALSE, FALSE, TRUE),
    (2, TRUE, FALSE, FALSE, TRUE),
    (3, TRUE, FALSE, FALSE, TRUE),
    (4, TRUE, FALSE, FALSE, TRUE),
    (5, TRUE, FALSE, FALSE, TRUE),
    (6, TRUE, FALSE, FALSE, TRUE);

-- Inserts para tabela PAGA
INSERT INTO paga (fk_DISCIPLINA_idDisciplina, fk_ALUNO_idAluno, notaDisciplina)
VALUES
    (1, 1, 9.5),
    (1, 2, 8.7),
    (1, 3, 9.0),
    (2, 1, 7.8),
    (2, 2, 8.0),
    (2, 3, 9.2),
    (3, 1, 8.9),
    (3, 2, 9.1),
    (3, 3, 8.5),
    (4, 1, 9.3),
    (4, 2, 8.6),
    (4, 3, 9.4),
    (5, 1, 8.8),
    (5, 2, 9.3),
    (5, 3, 8.7),
    (6, 1, 9.1),
    (6, 2, 8.9),
    (6, 3, 9.2);
    
-- Inserts para tabela PRODUTO
INSERT INTO PRODUTO(idProduto, nome, valor, avaliacaoMedia, totalVendas)
VALUES
    (2001, 'eBook1', 12.31, null, 100),
    (2002, 'eBook2', 12.31, null, 231),
    (2003, 'acessório1', 12.31, null, 231),
    (2004, 'acessório2', 12.31, null, 100),
    (2005, 'curso1', 12.31, null, 142),
    (2006, 'curso2', 12.31, null, 104),
    (2007, 'curso3', 12.31, null, 104),
    (2008, 'curso4', 12.31, null, 104),
    (2009, 'curso5', 12.31, null, 104),
    (2010, 'curso6', 12.31, null, 104);
    
-- Inserts para tabela AVALIAÇÃO
INSERT INTO AVALIACAO (estrelas_1, estrelas_2, estrelas_3, estrelas_4, estrelas_5, comentario, idAvaliacao, idProduto)
VALUES
    (TRUE, TRUE, TRUE, FALSE, TRUE, 'Gostei muito do produto ebook!', 1, 2001),
    (TRUE, FALSE, FALSE, FALSE, TRUE, 'Não gostei do produto ebook!', 2, 2001),
    (TRUE, TRUE, TRUE, TRUE, FALSE, 'Produto ebook2 atendeu minhas expectativas.', 1, 2002),
    (TRUE, TRUE, TRUE, TRUE, FALSE, 'Produto ebook2 atendeu minhas expectativas.', 2, 2002),
    (TRUE, TRUE, TRUE, TRUE, FALSE, 'Esse acessorio superou minhas expectativas.', 1, 2003),
    (TRUE, TRUE, TRUE, TRUE, TRUE, 'Esse acessorio superou minhas expectativas.', 2, 2003),
    (FALSE, FALSE, FALSE, FALSE, TRUE, 'Nao gostei desse acessorio2', 1, 2004),
    (FALSE, FALSE, FALSE, FALSE, FALSE, 'Nao gostei desse acessorio2', 2, 2004),
    (FALSE, FALSE, FALSE, TRUE, FALSE, 'esse curso nao é bom', 1, 2005),
    (FALSE, FALSE, TRUE, TRUE, FALSE, 'esse curso nao é bom', 2, 2005),
    (TRUE, FALSE, TRUE, TRUE, FALSE, 'Esse curso é bom', 1, 2006),
    (TRUE, TRUE, TRUE, TRUE, FALSE, 'Esse curso é bom', 2, 2006);

-- Inserts para tabela EBOOKS
INSERT INTO EBOOKS (sinopse, autor, titulo, idEbooks, quantEstoque, FK_PRODUTO_idProduto)
VALUES ('Sinopse do eBook 1', 'Autor 1', 'eBook 1', 1001, 10, 2001),
       ('Sinopse do eBook 2', 'Autor 2', 'eBook 2', 1002, 20, 2002);

-- Inserts para tabela ACESSORIOSTEMATICOS
INSERT INTO ACESSORIOSTEMATICOS (quantEstoque, nomeAcessorio, descricao, idAcessoriosTematicos, FK_PRODUTO_idProduto)
VALUES (5, 'Acessório 1', 'Descrição do acessório 1', 3001, 2003),
       (8, 'Acessório 2', 'Descrição do acessório 2', 3002, 2004);

-- Inserts para tabela CURSOS
INSERT INTO CURSOS (nomeCurso, tema, idCursos, ementa, professorCurso, certificado, FK_PRODUTO_idProduto)
VALUES ('Curso 1', 'Tema do Curso 1', 4001, 'Ementa do Curso 1', 'Professor 1', TRUE, 2005),
       ('Curso 2', 'Tema do Curso 2', 4002, 'Ementa do Curso 2', 'Professor 2', TRUE, 2006),
       ('Curso 3', 'Tema do Curso 2', 4002, 'Ementa do Curso 2', 'Professor 2', TRUE, 2007),
       ('Curso 4', 'Tema do Curso 2', 4002, 'Ementa do Curso 2', 'Professor 2', TRUE, 2008),
       ('Curso 5', 'Tema do Curso 2', 4002, 'Ementa do Curso 2', 'Professor 2', TRUE, 2009),
       ('Curso 6', 'Tema do Curso 2', 4002, 'Ementa do Curso 2', 'Professor 2', TRUE, 2010);

-- Inserções de desconto
INSERT INTO DESCONTO (DescontoEstudante, idDesconto, idPedido, DescontoFuncionario, DescontoBolsista, DescontoPessoaJuridica, FK_cupomDesconto_idCupomDesconto, FK_PEDIDO_idPedido, FK_PEDIDO_idCliente)
VALUES 
       (0.5, 1, 1, NULL, NULL, NULL, NULL, 1, 1),
       (0.5, 2, 2, NULL, NULL, NULL, NULL, 2, 2),
       (0.5, 3, 3, NULL, NULL, NULL, NULL, 3, 3),
       (0.5, 4, 4, NULL, NULL, NULL, NULL, 4, 4),
       (NULL, 5, 5, 0.25, NULL, NULL, NULL, 5, 5);
       
-- Insert para cupom desconto
INSERT INTO cupomDesconto (descricaoDesconto, valorDesconto, qntUtilizada, idcupomdesconto)
VALUES ('EstudanteMirim', 0.15, 0, 1),
       ('ClienteFiel', 0.10, 0, 2);
  
-- Inserts para tabela PRODUTO_PEDIDO_Contém
INSERT INTO PRODUTO_PEDIDO_Contem (tipoProduto, fk_PEDIDO_idPedido, fk_PEDIDO_idCliente, fk_PRODUTO_idProduto)
VALUES 
    ('eBook', 1, 1, 2001), -- Produto 1 - eBook1
    ('eBook', 2, 2, 2002), -- Produto 2 - eBook2
    ('acessorio', 2, 2, 2003), -- Produto 3 - Acessório 1
    ('acessorio', 2, 2, 2004),  -- Produto 4 - Acessório 2
    ('curso', 5, 5, 2005), -- Produto 5 - Curso 1
    ('curso', 5, 5, 2006), -- Produto 5 - Curso 2
    ('curso', 5, 5, 2007), -- Produto 5 - Curso 3
    ('curso', 5, 5, 2008), -- Produto 5 - Curso 4
    ('curso', 5, 5, 2009), -- Produto 5 - Curso 5
    ('curso', 5, 5, 2010); -- Produto 5 - Curso 6

-- Inserts para tabela cliente
INSERT INTO CLIENTE (idade, senha, email, idCliente, bairro, numAp, Rua, CEP, nome)
VALUES 
    (35, 'senha123', 'cliente1@example.com', 1, 'Centro', 101, 'Rua A', '12345-678', 'Cliente 1'),
    (45, '123456', 'cliente2@example.com', 2, 'Bairro X', 202, 'Rua B', '23456-789', 'Cliente 2'),
    (28, 'senha1234', 'cliente3@example.com', 3, 'Bairro Y', 303, 'Rua C', '34567-890', 'Cliente 3'),
    (25, 'senha123', 'cliente1@email.com', 4, 'Centro', 101, 'Rua Principal', '12345-678', 'Cliente Um'),
    (30, 'senha456', 'cliente2@email.com', 5, 'Bairro A', 202, 'Rua Secundária', '98765-432', 'Cliente Dois'),
    (40, 'senha789', 'cliente3@email.com', 6, 'Bairro B', 303, 'Rua Terceira', '54321-876', 'Cliente Três'),
    (35, 'senhaabc', 'cliente4@email.com', 7, 'Bairro C', 404, 'Rua Quarta', '87654-321', 'Cliente Quatro'),
    (28, 'senhaxyz', 'cliente5@email.com', 8, 'Bairro D', 505, 'Rua Quinta', '23456-789', 'Cliente Cinco');
-- Update na tabela CLIENTE
UPDATE CLIENTE
SET idade = 40
WHERE idCliente = 1;

-- Update na tabela PRODUTO
UPDATE PRODUTO
SET valor = 59.99
WHERE idProduto = 2;

-- Atualizar a tabela PRODUTO com as médias de avaliação
UPDATE PRODUTO
SET avaliacaoMedia = (
    SELECT SUM(
        CASE WHEN estrelas_1 THEN 1 ELSE 0 END +
        CASE WHEN estrelas_2 THEN 1 ELSE 0 END +
        CASE WHEN estrelas_3 THEN 1 ELSE 0 END +
        CASE WHEN estrelas_4 THEN 1 ELSE 0 END +
        CASE WHEN estrelas_5 THEN 1 ELSE 0 END
    ) / 2.0
    FROM AVALIACAO
    WHERE PRODUTO.idProduto = AVALIACAO.idProduto
);


-- Delete na tabela PRODUTO
DELETE FROM PRODUTO
WHERE idProduto = 14;  --apenas para teste

-- Delete na tabela PRODUTO
DELETE FROM PRODUTO
WHERE idProduto = 10; --apenas para teste

SELECT * FROM CLIENTE;
-- Triggers

-- Função para trigger 1

CREATE OR REPLACE FUNCTION atualizarValorProduto()
RETURNS trigger AS $$
BEGIN
  IF (OLD.valor IS DISTINCT FROM NEW.valor) THEN
    -- se o valor antigo for igual ao novo, nn mudará
    INSERT INTO ATT_PRODUTO (idProduto, nome, valor, data_modificacao) -- atualiza na tabela de atualizações de PRODUTO
    VALUES (NEW.idProduto, NEW.nome, NEW.valor, NOW());
  END IF;
  -- Return NEW to proceed with the update
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;



-- trigger 1 (trigger para atualizar o valor do produto)

CREATE TRIGGER tg_atualiza_valor_produto
AFTER INSERT OR UPDATE ON PRODUTO
  FOR EACH ROW
EXECUTE PROCEDURE atualizarValorProduto();


UPDATE PRODUTO SET valor= 15 WHERE idProduto= 2001;
UPDATE PRODUTO SET valor= 20 WHERE idProduto= 2004;

SELECT * FROM PRODUTO;

SELECT * FROM ATT_PRODUTO;


-- trigger 2

-- Função para trigger 2

CREATE OR REPLACE FUNCTION atualizarValorDesconto()
RETURNS trigger AS $$
BEGIN
  IF (OLD.valorDesconto IS DISTINCT FROM NEW.valorDesconto) THEN
    INSERT INTO ATT_cupomDesconto (idcupomdesconto, descricaoDesconto, valorDesconto, data_modificacao)
    VALUES (NEW.idcupomdesconto, NEW.descricaoDesconto, NEW.valorDesconto, NOW());
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- trigger 2 (trigger para atualizar o valor do desconto)

CREATE TRIGGER tg_atualiza_valor_desconto
AFTER INSERT OR UPDATE ON cupomDesconto
  FOR EACH ROW
EXECUTE PROCEDURE atualizarValorDesconto();

INSERT INTO cupomDesconto (descricaoDesconto, idCupomDesconto, valorDesconto, qntUtilizada)
VALUES ('cupomBom', 10, 0.20, 14);

SELECT * FROM cupomDesconto;

SELECT * FROM ATT_cupomDesconto;


-- trigger 3 

-- Função para trigger 3

CREATE OR REPLACE FUNCTION removerCliente()
RETURNS trigger AS $$
BEGIN
   INSERT INTO ATT_REMOCAO_CLIENTE (idCliente, nome, email, data_remocao)
   VALUES (OLD.idCliente, OLD.nome, OLD.email, NOW());
  
   RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- trigger 3 (trigger para atualizar o valor do desconto)

CREATE TRIGGER tg_remove_cliente
AFTER DELETE ON CLIENTE
  FOR EACH ROW
  EXECUTE PROCEDURE removerCliente();

DELETE FROM CLIENTE WHERE idCliente= 4;

SELECT * FROM CLIENTE;

SELECT * FROM ATT_REMOCAO_CLIENTE;

-- trigger 4 

-- Função para trigger 4

CREATE OR REPLACE FUNCTION atualizarNumeroCliente()
RETURNS trigger AS $$
BEGIN
  IF (OLD.telefoneCelular IS DISTINCT FROM NEW.telefoneCelular OR OLD.telefoneEmpresarial IS DISTINCT FROM NEW.telefoneEmpresarial) THEN
    INSERT INTO ATT_TELEFONECLIENTE (idCliente, idTelefone, telefoneEmpresarial, telefoneCelular, data_modificacao)
    VALUES (NEW.idCliente, NEW.idTelefone, NEW.telefoneEmpresarial, NEW.telefoneCelular, NOW());
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- trigger 4 (trigger para atualizar o valor do desconto)

INSERT INTO TELEFONECLIENTE (telefoneCelular, telefoneEmpresarial, idCliente, idTelefone)
VALUES ('98822-2802', '98822-2842', 2001, 100);

CREATE TRIGGER tg_atualiza_numero_cliente
AFTER INSERT OR UPDATE ON TELEFONECLIENTE
  FOR EACH ROW
  EXECUTE PROCEDURE atualizarNumeroCliente();

UPDATE TELEFONECLIENTE SET telefoneEmpresarial ='4002-8922' WHERE idCliente= 2001;

SELECT * FROM TELEFONECLIENTE;

SELECT * FROM ATT_TELEFONECLIENTE;


-- stored procedures

-- procedure 1 (atualiza uma disciplina de presencial para remoto, ou vice-versa)

SELECT * FROM DISCIPLINA;
CREATE OR REPLACE PROCEDURE trocar_ead()
LANGUAGE plpgsql
AS $$
  BEGIN
  
  UPDATE DISCIPLINA
  SET Remota = true WHERE idDisciplina = 2;

  UPDATE DISCIPLINA
  SET Presencial = false WHERE idDisciplina = 2;
  
END $$;

CALL trocar_ead();
SELECT * FROM DISCIPLINA;

-- procedure 2 (atualiza uma disciplina de obrigatório para eletiva, ou vice-versa)

CREATE OR REPLACE PROCEDURE trocar_obrigatoriedade()
LANGUAGE plpgsql
AS $$
  BEGIN
  
  UPDATE DISCIPLINA
  SET Eletiva = TRUE WHERE idDisciplina = 2;

  UPDATE DISCIPLINA
  SET Obrigatoria = FALSE WHERE idDisciplina = 2;
  
END $$;

CALL trocar_obrigatoriedade();
SELECT * FROM DISCIPLINA;

-- procedure 3 (contador de alunos)

CREATE OR REPLACE PROCEDURE qtd_alunos(
  qtd_total INTEGER
)
LANGUAGE plpgsql
AS $$
  BEGIN
  
  SELECT COUNT (*) INTO qtd_total FROM ALUNO;
  RAISE NOTICE '-PROCEDURE 3- O número de alunos é de: %', qtd_total;
  
END $$;

CALL qtd_alunos(NULL);

-- procedure 4 (contador de funcionários)

CREATE OR REPLACE PROCEDURE qtd_funcionarios(
  qtd_professor INTEGER,
  qtd_psicologos INTEGER,
  qtd_total INTEGER
)
LANGUAGE plpgsql
AS $$
  BEGIN
  
  SELECT COUNT (*) INTO qtd_professor FROM PROFESSOR;
  SELECT COUNT (*) INTO qtd_psicologos FROM PSICOLOGO;
  qtd_total = qtd_psicologos + qtd_professor;
  RAISE NOTICE '-PROCEDURE 4- O número de funcionários é de: %', qtd_total;
  
END $$;

CALL qtd_funcionarios(NULL, NULL, NULL);

-- PERGUNTA NUMERO 1
DO $$ 
DECLARE 
    contador INTEGER;
BEGIN

    SELECT COUNT(*) INTO contador
    FROM PEDIDO 
    WHERE dataPedido >= CURRENT_DATE - INTERVAL '1 month' AND dataPedido <= CURRENT_DATE;

    RAISE NOTICE '-PERGUNTA 1- O número de pedidos realizados no último mês foi: %', contador;

    -- Exibição do valor da variável
    UPDATE PEDIDO
    SET totalVendas = contador
    WHERE idPedido > 0;
END $$;

--PERGUNTA 2
DO $$
DECLARE
    contador_eBooks INTEGER;
    contador_cursos INTEGER;
    contador_acessorios INTEGER;
    maior_contador INTEGER;
BEGIN
    -- Contagem de eBooks
    SELECT COUNT(*) INTO contador_eBooks FROM EBOOKS;
    -- Atualização do atributo correspondente na tabela EBOOKS
    UPDATE EBOOKS SET valor_eBooks = contador_eBooks;

    -- Contagem de cursos
    SELECT COUNT(*) INTO contador_cursos FROM CURSOS;
    -- Atualização do atributo correspondente na tabela CURSOS
    UPDATE CURSOS SET valor_cursos = contador_cursos;

    -- Contagem de acessórios
    SELECT COUNT(*) INTO contador_acessorios FROM ACESSORIOSTEMATICOS;
    -- Atualização do atributo correspondente na tabela ACESSORIOSTEMATICOS
    UPDATE ACESSORIOSTEMATICOS SET valor_acessorios = contador_acessorios;

    -- Seleção do maior valor entre os contadores
    SELECT GREATEST(contador_eBooks, contador_cursos, contador_acessorios) INTO maior_contador;

    -- Exibir o maior contador com o nome do contador
    RAISE NOTICE '-PERGUNTA 2- O produto mais vendido é: % com % vendas', 
      CASE maior_contador
          WHEN contador_eBooks THEN 'eBook'
          WHEN contador_cursos THEN 'curso'
          WHEN contador_acessorios THEN 'acessorio'
      END,
      maior_contador;
END $$;

-- PERGUNTA NUMERO 3
SELECT 
    nome,
    avaliacaoMedia AS avaliacao,
    CASE 
        WHEN avaliacaoMedia < 3 THEN 'ruim'
        WHEN avaliacaoMedia > 4 THEN 'boa'
        ELSE 'média'
    END AS satisfacao
FROM 
    PRODUTO;
    
--PERGUNTA 4 
-- Inserts para tabela PEDIDO (para os últimos 6 meses)
INSERT INTO PEDIDO (notaFiscal, metodoPagamento, dataEntrega, idPedido, idCliente, entregaExpressa, entregaPadrao, dataPedido)
VALUES
    (123456, 'Cartão de crédito', '2024-04-23', 5, 1, TRUE, FALSE, '2024-04-20'),
    (789012, 'Boleto bancário', '2024-04-25', 5, 2, FALSE, TRUE, '2024-04-21'),
    (345660, 'Boleto bancário', '2024-04-24', 4, 2, TRUE, FALSE, '2024-04-22'),
    (345679, 'Boleto', '2024-04-24', 4, 3, TRUE, FALSE, '2024-05-22'),
    (344444, 'Dinheiro', '2024-04-24', 3, 1, TRUE, FALSE, '2024-04-22');

SELECT 
    c.nome AS Nome_Cliente,
    COUNT(p.idPedido) AS Total_Pedidos
FROM 
    CLIENTE c
INNER JOIN 
    PEDIDO p ON c.idCliente = p.idCliente
WHERE 
    p.dataPedido >= CURRENT_DATE - INTERVAL '6 months'
GROUP BY 
    c.nome
ORDER BY 
    Total_Pedidos DESC
LIMIT 3;

--PERGUNTA NUMERO 5
SELECT
    Tipo_Desconto,
    MAX(Quantidade_Utilizada) AS Quantidade_Utilizada
FROM (
    SELECT 'Desconto Estudante' AS Tipo_Desconto, 
           SUM(CASE WHEN DescontoEstudante IS NOT NULL THEN 1 ELSE 0 END) AS Quantidade_Utilizada
    FROM DESCONTO
    UNION ALL
    SELECT 'Desconto Funcionário' AS Tipo_Desconto, 
           SUM(CASE WHEN DescontoFuncionario IS NOT NULL THEN 1 ELSE 0 END) AS Quantidade_Utilizada
    FROM DESCONTO
    UNION ALL
    SELECT 'Desconto Bolsista' AS Tipo_Desconto, 
           SUM(CASE WHEN DescontoBolsista IS NOT NULL THEN 1 ELSE 0 END) AS Quantidade_Utilizada
    FROM DESCONTO
    UNION ALL
    SELECT 'Desconto Pessoa Jurídica' AS Tipo_Desconto, 
           SUM(CASE WHEN DescontoPessoaJuridica IS NOT NULL THEN 1 ELSE 0 END) AS Quantidade_Utilizada
    FROM DESCONTO
    UNION ALL
    SELECT 'Cupom de Desconto' AS Tipo_Desconto, 
           SUM(CASE WHEN FK_cupomDesconto_idCupomDesconto IS NOT NULL THEN 1 ELSE 0 END) AS Quantidade_Utilizada
    FROM DESCONTO
) AS Total_Descontos
GROUP BY Tipo_Desconto;




-- PERGUNTA NUMERO 6
WITH MediaNotasPorAluno AS (
    SELECT 
        A.idAluno,
        A.Primeiro_Nome,
        A.Sobrenome,
        AVG(P.notaDisciplina) AS MediaNotas
    FROM 
        ALUNO A
    INNER JOIN 
        PAGA P ON A.idAluno = P.fk_ALUNO_idAluno
    GROUP BY 
        A.idAluno, A.Primeiro_Nome, A.Sobrenome
),
Top3Alunos AS (
    SELECT 
        idAluno,
        Primeiro_Nome,
        Sobrenome,
        MediaNotas,
        ROW_NUMBER() OVER (ORDER BY MediaNotas DESC) AS Rank
    FROM 
        MediaNotasPorAluno
)
SELECT 
    idAluno,
    Primeiro_Nome,
    Sobrenome,
    MediaNotas
FROM 
    Top3Alunos
WHERE 
    Rank <= 3;

-- EASTER EGG 1
-- Verificar se o cliente comprou 5 cursos
WITH CursosComprados AS (
    SELECT
        FK_PEDIDO_idCliente,
        COUNT(DISTINCT CASE WHEN tipoProduto = 'curso' THEN fk_PRODUTO_idProduto END) AS TotalCursosComprados
    FROM
        PRODUTO_PEDIDO_Contem
    GROUP BY
        FK_PEDIDO_idCliente
)
INSERT INTO cliente_cupomDesconto (fk_cupomDesconto_idCupomDesconto, fk_CLIENTE_idCliente)
SELECT
    1 AS fk_cupomDesconto_idCupomDesconto,  -- ID do cupom "EstudanteMirim"
    FK_PEDIDO_idCliente
FROM
    CursosComprados
WHERE
    TotalCursosComprados >= 5;
    

SELECT * FROM cliente_cupomDesconto;

-- EASTER EGG 2
-- Verificar se o cliente comprou 3 acessórios ou eBooks
WITH ProdutosComprados AS (
    SELECT
        FK_PEDIDO_idCliente,
        COUNT(DISTINCT CASE WHEN tipoProduto IN ('eBook', 'acessorio') THEN fk_PRODUTO_idProduto END) AS TotalProdutosComprados
    FROM
        PRODUTO_PEDIDO_Contem
    GROUP BY
        FK_PEDIDO_idCliente
)
INSERT INTO cliente_cupomDesconto (fk_cupomDesconto_idCupomDesconto, fk_CLIENTE_idCliente)
SELECT
    2 AS fk_cupomDesconto_idCupomDesconto,  -- ID do cupom "ClienteFiel"
    FK_PEDIDO_idCliente
FROM
    ProdutosComprados
WHERE
    TotalProdutosComprados >= 3;

SELECT * FROM cliente_cupomDesconto;

-- SEGURANÇA

CREATE ROLE usuario_admin WITH PASSWORD 'admin123';
CREATE ROLE usuario_gerente WITH PASSWORD 'gerente123';
CREATE ROLE usuario_funcionario WITH PASSWORD 'funcionario123';
CREATE ROLE usuario_padrao WITH PASSWORD 'usuario123';


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO usuario_admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO usuario_gerente;
GRANT SELECT, INSERT, UPDATE ON CLIENTE, PEDIDO TO usuario_funcionario;
GRANT SELECT ON CLIENTE, PEDIDO TO usuario_padrao;

-- VIEWS DO BANCO DE DADOS

-- VIEW 1: Clientes e seus respectivos pedidos //Fornece uma visão geral dos clientes e seus pedidos.

CREATE VIEW Cliente_Pedido_Info AS
SELECT c.idCliente, c.nome, c.email, COUNT(p.idPedido) AS totalPedidos
FROM CLIENTE c
LEFT JOIN PEDIDO p ON c.idCliente = p.idCliente
GROUP BY c.idCliente, c.nome, c.email;


-- VIEW 2: Produtos mais vendidos //Fornecerá uma lista dos produtos mais vendidos, juntamente com o total de vendas.

CREATE VIEW Produtos_Mais_Vendidos AS
SELECT nome, totalVendas
FROM PRODUTO
ORDER BY totalVendas DESC;

-- VIEW 3: Total de clientes removidos //Mostrará o total de clientes removidos e a data de remoção.

CREATE VIEW Clientes_Removidos AS
SELECT COUNT(idCliente) AS totalRemovidos, DATE(data_remocao) AS dataRemocao
FROM ATT_REMOCAO_CLIENTE
GROUP BY DATE(data_remocao);

-- VIEW 4: Total de pedidos por método de pagamento //Fornecerá uma contagem de pedidos agrupados por método de pagamento.

CREATE VIEW Pedidos_Metodo_Pagamento AS
SELECT metodoPagamento, COUNT(idPedido) AS totalPedidos
FROM PEDIDO
GROUP BY metodoPagamento;