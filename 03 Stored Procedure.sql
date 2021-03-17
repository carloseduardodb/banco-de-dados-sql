/*
[2] uma stored procedure para trazer os dados: nome do instrutor, telefones do instrutor e
suas turmas que deverá se chamar turmas_por_instrututor.
*/

DELIMITER $
 CREATE PROCEDURE turmas_por_instrututor()
  BEGIN
  
  SELECT i.nome, t.numero, tu.* FROM instrutor AS i
  INNER JOIN telefone_instrutor AS t 
  ON t.instrutor_idInstrutor = i.idInstrutor
  INNER JOIN turma AS tu
  ON tu.instrutor_idInstrutor = i.idInstrutor;
  
  END
 $