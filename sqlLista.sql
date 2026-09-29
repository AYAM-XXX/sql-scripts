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

