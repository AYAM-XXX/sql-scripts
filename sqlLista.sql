-- EX 01
create database atividade;
use atividade;
drop table aluno;
drop table telefone;
create table aluno(
	id int auto_increment not null primary key unique,
    nome varchar(50) not null
);
create table telefone(
	id int auto_increment not null primary key,
    idaluno int,
    telefone varchar(50),
    constraint fk_aluno foreign key (idaluno) references aluno(id)
);	

INSERT INTO aluno (nome) VALUES
('Joao Silva'),
('Maria Oliveira'),
('Carlos Santos'),
('Ana Souza'),
('Pedro Costa'),
('Lucas Almeida'),
('Juliana Lima'),
('Rafael Ferreira');

INSERT INTO telefone (idaluno, telefone) VALUES
(1, '34999990001'),
(1, '34988880001'),
(1, '34977770001'),

(2, '34999990002'),
(2, '34988880002'),

(3, '34999990003'),

(4, '34999990004'),
(4, '34988880004'),

(5, '34999990005'),
(5, '34988880005'),

(6, '34999990006'),

(7, '34999990007'),
(7, '34988880007'),

(8, '34999990008');

-- EX 02

create database EX02;
use ex02;

create table pedido(
	id int auto_increment,
    data_pedido date,
    constraint pk_pedido primary key (id)
);

create table produto(
	id int auto_increment,
    nome varchar(50),
    
    constraint pk_produto primary key(id)
);

create table item_pedido(
	id int auto_increment,
    id_pedido int,
    id_produto int,
    qtd int,
    
    constraint fk_pedido foreign key (id_pedido) references pedido(id),
	constraint fk_produto foreign key (id_produto) references produto(id),
    constraint pk_item_pedido primary key (id)
	);
    
INSERT INTO pedido (data_pedido) VALUES
('2026-09-25'),
('2026-09-26'),
('2026-09-27'),
('2026-09-28');

-- PRODUTOS
INSERT INTO produto (nome) VALUES
('Arroz'),
('Feijão'),
('Macarrão'),
('Leite'),
('Café'),
('Açúcar');

-- ITENS DOS PEDIDOS
INSERT INTO item_pedido (id_pedido, id_produto, qtd) VALUES
(1, 1, 2),
(1, 2, 3),
(1, 5, 1),

(2, 3, 2),
(2, 4, 1),

(3, 1, 1),
(3, 6, 2),
(3, 5, 2),

(4, 2, 1),
(4, 3, 3);

select * from pedido;
select * from produto;
select * from item_pedido;

create database ex03;
use ex03;

create table aluno(
	id int auto_increment,
	 nome_aluno varchar(50),
     constraint pk_aluno primary key (id)
);

create table curso(
	 id int auto_increment,
     nome_curso varchar(100),
     professor varchar(50),
     constraint pk_aluno primary key (id)
);

create table matricula(
id_aluno int,
id_curso int,
nota decimal(3,2),
primary key(id_aluno, id_curso),
constraint fk_aluno foreign key (id_aluno) references aluno(id),
constraint fk_professor foreign key (id_curso) references curso(id)
);
INSERT INTO aluno (nome_aluno) VALUES
('João'),
('Maria'),
('Pedro'),
('Ana'),
('Carlos');

INSERT INTO curso (nome_curso, professor) VALUES
('Desenvolvimento de Sistemas', 'Carlos'),
('Banco de Dados', 'Ana'),
('Programação Java', 'Marcos'),
('Engenharia de Software', 'Fernanda'),
('Redes de Computadores', 'Ricardo');

INSERT INTO matricula (id_aluno, id_curso, nota) VALUES
(1, 1, 8.50),
(1, 2, 9.00),
(2, 1, 7.50),
(2, 3, 8.00),
(3, 2, 8.00),
(3, 4, 9.50),
(4, 1, 9.00),
(4, 5, 7.50),
(5, 3, 8.50),
(5, 4, 9.00);

select * from aluno;
select * from curso;
select * from matricula;

create database ex04;
use ex04;
create table funcionario(
	id int auto_increment,
	id_departamento int,
    nome varchar(50),
    
    constraint pk_funcionario primary key(id), 
        CONSTRAINT fk_departamento
        FOREIGN KEY (id_departamento) REFERENCES departamento(id)
    );
    
create table gerente(
	id int auto_increment,
    nome varchar(50),
    
    constraint pk_gerente primary key(id)
);
create table departamento(
	id int auto_increment,
	id_funcionario int,
	id_gerente int,
	departamento varchar(100),
	constraint pf_departamento primary key(id),
	constraint fk_gerente foreign key (id_gerente) references gerente(id)
    );

INSERT INTO gerente (nome) VALUES
('Carlos'),
('Ana');

INSERT INTO funcionario (id_departamento, nome)
VALUES
(1, 'João'),
(1, 'Maria'),
(2, 'Pedro'),
(2, 'Lucas');
INSERT INTO departamento (id_funcionario, id_gerente, departamento)
VALUES
(1, 1, 'Tecnologia'),
(2, 1, 'Tecnologia'),
(3, 2, 'Financeiro'),
(4, 2, 'Financeiro');

select * from funcionario;
select * from gerente;
select * from departamento;

CREATE VIEW vw_funcionarios AS
SELECT
    f.id AS id_funcionario,
    f.nome AS nome_funcionario,
    d.id AS id_departamento,
    d.departamento AS nome_departamento,
    g.id AS id_gerente,
    g.nome AS nome_gerente
FROM funcionario f
JOIN departamento d
    ON f.id_departamento = d.id
JOIN gerente g
    ON d.id_gerente = g.id;
    
select * from vw_funcionarios;


create database ex05;
use ex05;
CREATE TABLE cliente (
    id INT AUTO_INCREMENT,
    nome VARCHAR(50),
    cidade VARCHAR(100),

    CONSTRAINT pk_cliente PRIMARY KEY (id)
);

CREATE TABLE venda (
    id INT AUTO_INCREMENT,
    data_venda DATE,
    id_cliente INT,

    CONSTRAINT pk_venda PRIMARY KEY (id),
    CONSTRAINT fk_venda_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);
CREATE TABLE produto (
    id INT AUTO_INCREMENT,
    produto VARCHAR(100),
    preco DECIMAL(10,2),

    CONSTRAINT pk_produto PRIMARY KEY (id)
);

CREATE TABLE item_venda (
    id_venda INT,
    id_produto INT,
    qtd INT,

    CONSTRAINT pk_item_venda
        PRIMARY KEY (id_venda, id_produto),

    CONSTRAINT fk_item_venda
        FOREIGN KEY (id_venda) REFERENCES venda(id),

    CONSTRAINT fk_item_produto
        FOREIGN KEY (id_produto) REFERENCES produto(id)
);

create database ex07;
use ex07;

create table usuario(
	id int auto_increment,
	matricula varchar(4) not null,
    nome_usuario varchar(50),
    constraint pk_usuario primary key (id)
);
create table livro(
	id int auto_increment,
	titulo varchar(50) not null,
    autor varchar(50),
    constraint pk_livro primary key (id)
);

create table emprestimo(
	id int auto_increment,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
	id_livro int,
    id_usuario int,
    data_devolucao date,
    constraint pk_emprestimo primary key (id),
    constraint fk_livro foreign key (id_livro) references livro(id),
    constraint fk_usuario foreign key  (id_usuario) references usuario(id)
);
INSERT INTO usuario (matricula, nome_usuario) VALUES
('1001', 'Ana Lima'),
('1002', 'Bruno Alves'),
('1003', 'Carlos Souza'),
('1004', 'Mariana Silva'),
('1005', 'João Santos');

INSERT INTO livro (titulo, autor) VALUES
('Dom Casmurro', 'Machado de Assis'),
('O Cortiço', 'Aluísio Azevedo'),
('1984', 'George Orwell'),
('O Hobbit', 'J.R.R. Tolkien'),
('Harry Potter', 'J.K. Rowling');

INSERT INTO emprestimo (id_livro, id_usuario, data_devolucao) VALUES
(1, 1, '2026-10-15'),
(2, 2, '2026-10-18'),
(3, 3, '2026-10-20'),
(4, 1, '2026-10-22'),
(5, 4, '2026-10-25');

select* from usuario;
select * from livro;
select * from emprestimo;

create database ex08;
use ex08;

-- Proponha CLIENTE, NOTA_FISCAL, PRODUTO e ITEM_NOTA

create table cliente(
    cnpj_cliente int not null,
    nome_cliente varchar(50),
    
    constraint pk_aluno primary key (cnpj_cliente)
);

create table nota_fiscal(
	id int auto_increment,
    data_nota date default(current_date),
    cnpj_clt int not null,

	constraint pk_nota primary key(id),
    constraint fk_cnpj foreign key (cnpj_clt) references cliente(cnpj_cliente)
);

create table produto(
	id int auto_increment,
    descricao varchar(70),
    valor numeric(10,2),
    
    constraint pk_produto primary key (id)
);
create table item_nota(
	id_nota int not null,
    id_produto int not null,
    qtd int not null,
    
    constraint pk_item_nota primary key(id_nota, id_produto),
    constraint fk_nota foreign key (id_nota) references nota_fiscal(id),
	constraint fk_produto foreign key (id_produto) references produto(id)

);

INSERT INTO cliente (cnpj_cliente, nome_cliente) VALUES
(111111111, 'Mercado Sol'),
(222222222, 'Supermercado Bom Preco'),
(333333333, 'Mercado Central');

INSERT INTO nota_fiscal (cnpj_clt) VALUES
(111111111),
(222222222),
(333333333);

INSERT INTO produto (descricao, valor) VALUES
('Arroz 5kg', 28.00),
('Feijao 1kg', 8.50),
('Macarrao 500g', 5.00),
('Cafe 500g', 18.90),
('Acucar 1kg', 4.50);

INSERT INTO item_nota (id_nota, id_produto, qtd) VALUES
(1, 1, 2),
(1, 2, 3),
(1, 4, 1),
(2, 1, 1),
(2, 3, 4),
(3, 2, 2),
(3, 5, 5);


SELECT *
FROM cliente;

SELECT *
FROM nota_fiscal;

SELECT *
FROM produto;

SELECT *
FROM item_nota;

create database ex09;
use ex09;

create table curso(
	id int auto_increment,
    nome varchar(50),
    
    constraint pk_curso primary key (id)
);

create table instrutor(
	id int auto_increment,
    nome varchar(50),
    
    constraint pk_cinstrutor primary key (id)
);

create table turma(
	id int auto_increment,
    id_curso int not null,
    id_instrutor int not null,
    sala varchar(10),
    horario varchar(10),
    
    constraint pk_instrutor primary key (id),
    constraint fk_curso foreign key (id_curso) references curso(id),
	constraint fk_instrutor foreign key (id_instrutor) references instrutor(id)

);

INSERT INTO curso (nome) VALUES
('Java'),
('Banco de Dados'),
('Python'),
('Desenvolvimento Web'),
('Engenharia de Software');

INSERT INTO instrutor (nome) VALUES
('Carlos Silva'),
('Mariana Souza'),
('Joao Santos'),
('Ana Paula'),
('Rafael Oliveira');

INSERT INTO turma (id_curso, id_instrutor, sala, horario) VALUES
(1, 1, 'A01', '08:00'),
(2, 2, 'A02', '10:00'),
(3, 3, 'B01', '14:00'),
(4, 4, 'B02', '16:00'),
(5, 5, 'C01', '19:00'),
(1, 2, 'A03', '20:00');

SELECT * FROM curso;

SELECT * FROM instrutor;

SELECT * FROM turma;


create database ex10;
use ex10;


CREATE TABLE cargo(
    id_cargo VARCHAR(10) NOT NULL,
    nome_cargo VARCHAR(50),
    salario_cargo DECIMAL(10,2),

    CONSTRAINT pk_cargo PRIMARY KEY(id_cargo)
);

CREATE TABLE setor(
    id_setor VARCHAR(10) NOT NULL,
    nome_setor VARCHAR(50),

    CONSTRAINT pk_setor PRIMARY KEY(id_setor)
);

CREATE TABLE funcionario(
    id_func INT NOT NULL,
    nome_func VARCHAR(50),
    id_cargo VARCHAR(10),
    id_setor VARCHAR(10),

    CONSTRAINT pk_funcionario PRIMARY KEY(id_func),
    CONSTRAINT fk_funcionario_cargo
        FOREIGN KEY(id_cargo) REFERENCES cargo(id_cargo),
    CONSTRAINT fk_funcionario_setor
        FOREIGN KEY(id_setor) REFERENCES setor(id_setor)
);

INSERT INTO cargo (id_cargo, nome_cargo, salario_cargo) VALUES
('C1', 'Analista', 3500.00),
('C2', 'Assistente', 2200.00);

INSERT INTO setor (id_setor, nome_setor) VALUES
('S1', 'TI'),
('S2', 'RH');

INSERT INTO funcionario (id_func, nome_func, id_cargo, id_setor) VALUES
(1, 'Paula', 'C1', 'S1'),
(2, 'Rafael', 'C2', 'S2'),
(3, 'Bianca', 'C1', 'S1'),
(4, 'Diego', 'C2', 'S2');


SELECT * FROM cargo;

SELECT * FROM setor;

SELECT * FROM funcionario;

