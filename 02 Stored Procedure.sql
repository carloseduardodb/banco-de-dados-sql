/*
[1] uma stored procedure que passe todos os dados necessarios para gravacao de um aluno que deverá se chamar 
insere_aluno() e inserirá dados nas tabelas de instrutor, telefone_instrutor, turma, atividade e aluno;
*/

DELIMITER $
 CREATE PROCEDURE insere_aluno(
 	IN instructorId INT(11), IN instructorRg INT(11), IN instructorName VARCHAR(45),
	IN instructorDateBirth DATE, IN instructorTitration TINYINT(4)
    
	,IN instructorTelephoneId INT(11), IN instructorTelephoneNumber INT(11), IN instructorTelephoneType VARCHAR(45),
	IN instructorTelephoneInstrutorId INT(11)

	,IN classId INT(11), IN classSchedule TIME, IN classDuration INT(11), IN classDateStart DATE, IN classDateFinished DATE,
	IN classActivityId INT(11), IN classInstrutorId INT(11)

	,IN activityId INT(11), IN activityName VARCHAR(45)

	,IN studentCodMat INT, IN studentDateMat DATE, IN studentName VARCHAR(45), 
	IN studentAddress text, IN studentTel INT(11), IN studentDateBirth DATE, IN studentHeight float, 
	IN studentWeight INT(11), IN studentClass VARCHAR(45)
 )
 BEGIN
 
#instrutor

INSERT INTO instrutor(idInstrutor, RG, nome, dataNascimento, titulacao) 

VALUES 

(instructorId, instructorRg, instructorName, instructorDateBirth, instructorTitration);

#telephone instrutor

INSERT INTO telefone_instrutor(idTelefone, numero, tipo, instrutor_idInstrutor) 

VALUES 

(instructorTelephoneId, instructorTelephoneNumber, instructorTelephoneType, instructorTelephoneInstrutorId);

#turma

INSERT INTO turma(idTurma, horario, duracao, dataInicio, dataFIm, atividade_idAtividade, instrutor_idInstrutor) 

VALUES 

(classId, classSchedule, classDuration, classDateStart, classDateFinished, classActivityId, classInstrutorId);

INSERT INTO atividade(idAtividade, nome) 

VALUES 

(IN activityId, IN activityName);

INSERT INTO aluno(codMatricula, dataMatricula, nome, endereco, telefone, dataNascimento, altura, peso, turma_idTurma)

VALUES 

(studentCodMat, studentDateMat, studentName, studentAddress, studentTel, studentDateBirth, studentHeight, studentWeight, studentClass);

 END
 $