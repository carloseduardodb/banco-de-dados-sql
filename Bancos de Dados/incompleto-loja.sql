CREATE DATABASE LOJA;
USE LOJA;

CREATE TABLE PRODUTOS
(
	codigo varchar(3),
    descricao varchar(50) unique,
    estoque int not null default 0,
    primary key(codigo)
);

insert into produtos values('001', 'arroz', 10);
insert into produtos values('002', 'feijao', 5);
insert into produtos values('003', 'macarrao', 15);

CREATE TABLE ITENSVENDAS
(
	venda int,
    produto varchar(3),
    quantidade int
);

select * from produtos;

DELIMITER $
CREATE TRIGGER T_itensvenda_insert after INSERT
ON itensvendas
FOR EACH ROW
BEGIN
	update produtos set estoque = estoque - new.quantidade
		where codigo = new.produto;
END
$ DELIMITER ;

insert into itensvendas values (1, '001', 5);
#update produtos set estoque = 10 - 5 where codigo = '001'
insert into itensvendas values (2, '001', 4);
#update produtos set estoque = 5 - 4 where codigo = '001'
