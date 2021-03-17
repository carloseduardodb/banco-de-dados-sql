/*
[1] Para o banco de dados loja criado na aula do dia 03/12 criar uma trigger que atualize a 
coluna estoque da tabela produtos com base no update da tabela itensvendas.
*/

CREATE TRIGGER `trg_UpdateValue` BEFORE UPDATE ON `itensvendas`
 FOR EACH ROW IF NEW.quantidade < OLD.quantidade THEN
SIGNAL SQLSTATE '01000'
      SET MESSAGE_TEXT = 'Voce nao vendeu um item, voce esta devolvendo', MYSQL_ERRNO = 1000;
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Voce nao vendeu um item, voce esta devolvendo', MYSQL_ERRNO = 1001;

ELSEIF (NEW.quantidade - OLD.quantidade) < (SELECT estoque from produtos WHERE codigo = NEW.produto) THEN
UPDATE produtos SET estoque = (produtos.estoque - (NEW.quantidade - OLD.quantidade)) WHERE codigo = NEW.produto;

ELSE
    SIGNAL SQLSTATE '01000'
      SET MESSAGE_TEXT = 'Erro o estoque provavelmente esta esgotado', MYSQL_ERRNO = 1000;
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Erro o estoque provavelmente esta esgotado', MYSQL_ERRNO = 1001;
      
END IF
