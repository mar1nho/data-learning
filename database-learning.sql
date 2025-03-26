-- =========================================
-- 1. Criação das Tabelas
-- =========================================

-- Tabela Clientes
CREATE TABLE Clientes
(
    id          SERIAL PRIMARY KEY,
    nome        VARCHAR(200) NOT NULL,
    email       VARCHAR(200),
    telefone    VARCHAR(20),
    aniversario DATE,
    estado      CHAR(2)
);

-- Tabela ItensCardapio
CREATE TABLE ItensCardapio
(
    id        SERIAL PRIMARY KEY,
    nome      VARCHAR(100)   NOT NULL,
    descricao TEXT,
    preco     DECIMAL(10, 2) NOT NULL,
    categoria VARCHAR(50)
);

-- Tabela Pedidos
CREATE TABLE Pedidos
(
    id               SERIAL PRIMARY KEY,
    cliente_id       INTEGER NOT NULL,
    item_cardapio_id INTEGER NOT NULL,
    data_pedido      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quantidade       INTEGER NOT NULL CHECK (quantidade > 0),
    observacoes      TEXT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes (id),
    FOREIGN KEY (item_cardapio_id) REFERENCES ItensCardapio (id)
);

-- =========================================
-- 2. Inserção de Dados
-- =========================================

-- Inserção de Clientes
INSERT INTO Clientes (nome, email, telefone, aniversario, estado)
VALUES ('Ana Souza', 'ana.souza@example.com', '11987654321', '1985-02-15', 'SP'),
       ('Bruno Lima', 'bruno.lima@example.com', '21976543210', '1990-06-20', 'RJ'),
       ('Carla Mendes', 'carla.mendes@example.com', '31965432109', '1982-11-30', 'MG'),
       ('Daniel Oliveira', 'daniel.oliveira@example.com', '41954321098', '1995-04-10', 'PR'),
       ('Eduarda Fernandes', 'eduarda.fernandes@example.com', '51943210987', '1988-09-25', 'RS'),
       ('Fernando Costa', 'fernando.costa@example.com', '61932109876', '1992-12-05', 'DF'),
       ('Gabriela Martins', 'gabriela.martins@example.com', '71921098765', '1980-07-14', 'BA'),
       ('Henrique Rocha', 'henrique.rocha@example.com', '81910987654', '1998-03-22', 'PE'),
       ('Isabela Almeida', 'isabela.almeida@example.com', '91909876543', '1987-01-17', 'CE'),
       ('João Pereira', 'joao.pereira@example.com', '11998765432', '1993-08-09', 'SP');

-- Inserção de Itens do Cardápio

-- Entradas
INSERT INTO ItensCardapio (nome, descricao, preco, categoria)
VALUES ('Bruschetta de Tomate', 'Pão italiano com tomate fresco, manjericão e azeite.', 12.50, 'Entrada'),
       ('Carpaccio de Carne', 'Finíssimas fatias de carne bovina com molho de mostarda e alcaparras.', 18.00,
        'Entrada'),
       ('Ceviche de Tilápia', 'Tilápia marinada em limão com cebola roxa e coentro.', 22.00, 'Entrada'),
       ('Bolinho de Bacalhau', 'Porção com 6 unidades de bolinhos de bacalhau.', 15.00, 'Entrada'),
       ('Salada Caprese', 'Tomate, mussarela de búfala e manjericão, temperados com pesto.', 17.00, 'Entrada');

-- Pratos Principais
INSERT INTO ItensCardapio (nome, descricao, preco, categoria)
VALUES ('Filé Mignon ao Molho Madeira', 'Acompanhado de arroz branco e batatas coradas.', 45.00, 'Prato Principal'),
       ('Risoto de Funghi', 'Arroz arbóreo com cogumelos funghi secchi e parmesão.', 38.00, 'Prato Principal'),
       ('Salmão Grelhado', 'Servido com purê de batata e legumes salteados.', 42.00, 'Prato Principal'),
       ('Frango à Parmegiana', 'Peito de frango empanado com molho de tomate e queijo, acompanhado de fettuccine.',
        35.00, 'Prato Principal'),
       ('Lasanha de Berinjela', 'Lasanha vegetariana com camadas de berinjela, molho de tomate e queijo.', 32.00,
        'Prato Principal');

-- Sobremesas
INSERT INTO ItensCardapio (nome, descricao, preco, categoria)
VALUES ('Tiramisù', 'Sobremesa italiana com camadas de biscoito, café e creme mascarpone.', 18.00, 'Sobremesa'),
       ('Petit Gâteau', 'Bolo de chocolate com recheio cremoso, servido com sorvete de baunilha.', 20.00, 'Sobremesa'),
       ('Pavlova de Frutas Vermelhas', 'Merengue crocante com chantilly e frutas vermelhas.', 22.00, 'Sobremesa'),
       ('Mousse de Maracujá', 'Mousse leve e aerada de maracujá.', 15.00, 'Sobremesa'),
       ('Cheesecake de Frutas Vermelhas', 'Cheesecake clássico com calda de frutas vermelhas.', 19.00, 'Sobremesa');

-- Bebidas
INSERT INTO ItensCardapio (nome, descricao, preco, categoria)
VALUES ('Suco de Laranja Natural', 'Suco fresco de laranja.', 8.00, 'Bebida'),
       ('Caipirinha de Limão', 'Cachaça, limão e açúcar.', 18.00, 'Bebida'),
       ('Refrigerante Lata', 'Opções: Coca-Cola, Guaraná, Sprite.', 6.00, 'Bebida'),
       ('Água Mineral', 'Sem gás ou com gás.', 4.00, 'Bebida'),
       ('Chopp Pilsen', 'Chopp claro e gelado.', 12.00, 'Bebida');

-- Inserção de Pedidos
INSERT INTO Pedidos (cliente_id, item_cardapio_id, data_pedido, quantidade, observacoes)
VALUES (1, 1, '2025-03-23', 2, 'Sem cebola, por favor.'),
       (2, 2, '2025-03-23', 1, 'Adicionar queijo extra.'),
       (3, 3, '2025-03-23', 3, 'Sem pimenta.'),
       (4, 4, '2025-03-23', 1, 'Molho à parte.'),
       (5, 5, '2025-03-23', 2, 'Trocar arroz por salada.'),
       (6, 6, '2025-03-23', 1, 'Bem passado.'),
       (7, 7, '2025-03-23', 2, 'Sem glúten.'),
       (8, 8, '2025-03-23', 1, 'Adicionar bacon.'),
       (9, 9, '2025-03-23', 3, 'Sem alho.'),
       (10, 10, '2025-03-23', 1, 'Molho extra.');

-- =========================================
-- 3. Consultas Exemplares
-- =========================================

-- Seleciona todos os clientes
SELECT *
FROM Clientes;

-- Seleciona clientes nascidos após 1º de janeiro de 1990, ordenados por nome
SELECT *
FROM Clientes
WHERE aniversario > '1990-01-01'
ORDER BY nome;

-- Seleciona id, nome, email, telefone e estado dos clientes que são de SP ou RJ
SELECT id, nome, email, telefone, estado
FROM Clientes
WHERE estado = 'RJ'
   OR estado = 'SP';

-- Seleciona nome, email e estado dos clientes cujo nome contém 'Rocha'
SELECT nome, email, estado
FROM Clientes
WHERE nome LIKE '%Rocha%';

-- Conta o número de itens do cardápio com preço superior a 15
SELECT COUNT(*)
FROM ItensCardapio
WHERE preco > 15;

-- Calcula soma, média, mínimo e máximo dos preços dos itens do cardápio
SELECT SUM(preco) AS soma_precos, AVG(preco) AS media_precos, MIN(preco) AS preco_minimo, MAX(preco) AS preco_maximo
FROM ItensCardapio;

-- Seleciona informações dos pedidos com detalhes dos clientes e itens do cardápio
SELECT Pedidos.id         AS pedido_id,
       Pedidos.data_pedido,
       Clientes.nome      AS nome_cliente,
       ItensCardapio.nome AS nome_item,
       Pedidos.quantidade,
       Pedidos.observacoes
FROM Pedidos
         JOIN
     Clientes ON Pedidos.cliente_id = Clientes.id
         JOIN
     ItensCardapio ON Pedidos.item_cardapio_id = ItensCardapio.id;

-- LEFTJOIN
SELECT * FROM Clientes
LEFT JOIN Pedidos ON Pedidos.cliente_id = Clientes.id;

-- RIGHT JOIN
SELECT * FROM Clientes
RIGHT JOIN Pedidos ON Pedidos.cliente_id = Clientes.id;

-- FULL JOIN
SELECT * FROM Clientes
FULL JOIN Pedidos ON Pedidos.cliente_id = Clientes.id
FULL JOIN ItensCardapio C on C.id = Pedidos.item_cardapio_id;

-- UPDATE Query
SELECT * FROM Clientes WHERE nome LIKE '%Daniel%';
UPDATE Clientes set email = 'daniel.oliveira@jmail.com' WHERE id = 4;

