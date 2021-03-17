#atividade1
/*
[1] a primeira view deverá se chamar "view_atividade_instrutor" que deverá conter as seguintes informações: 
Nome da atividade, Nome do Instrutor, Telefone do Instrutor, id da turma, horario da turma, data de inicio 
da turma e data fim da turma.
*/
CREATE view view_atividade_instrutor AS
SELECT A.nome, I.nome as nameInstrutor, Te.numero, T.idTurma, T.horario, T.dataInicio, T.dataFim 
FROM atividade AS A 
INNER JOIN turma AS T on A.idAtividade = T.atividade_idAtividade 
INNER JOIN instrutor AS I on T.instrutor_idInstrutor = I.idInstrutor
INNER JOIN telefone_instritutor AS Te on I.idInstrutor = Te.instrutor_idInstrutor

#atividade2
/*
[2] a segunda view deverá se chamar "view_alunos_por_turma" que deverá conter as seguintes informações: 
codMatricula do aluno, dataMatricula do aluno, nome do aluno, nome da atividade da turma do aluno, id da 
turma do aluno e nome do instrutor da turma.
*/

CREATE view view_alunos_por_turma AS
SELECT A.codMatricula, A.dataMatricula, A.nome, T.idTurma, AT.nome AS nomeAtividade, I.nome AS nomeInstrutor
FROM aluno AS A
INNER JOIN turma AS T ON A.turma_idTurma = T.idTurma
INNER JOIN atividade AS AT ON T.atividade_idAtividade = AT.idAtividade
INNER JOIN instrutor AS I ON T.instrutor_idInstrutor = I.idInstrutor
