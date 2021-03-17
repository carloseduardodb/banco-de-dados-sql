-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Mar-2021 às 05:27
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `academia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `codMatricula` int(11) NOT NULL,
  `dataMatricula` date NOT NULL,
  `nome` varchar(45) NOT NULL,
  `endereco` text DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `altura` float DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  `turma_idTurma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade`
--

CREATE TABLE `atividade` (
  `idAtividade` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `chamada`
--

CREATE TABLE `chamada` (
  `idChamada` int(11) NOT NULL,
  `data` date NOT NULL,
  `presente` tinyint(4) DEFAULT NULL,
  `matricula_aluno_codMatricula` int(11) NOT NULL,
  `matricula_turma_idTurma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `instrutor`
--

CREATE TABLE `instrutor` (
  `idInstrutor` int(11) NOT NULL,
  `RG` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `titulacao` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula`
--

CREATE TABLE `matricula` (
  `aluno_codMatricula` int(11) NOT NULL,
  `turma_idTurma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_instritutor`
--

CREATE TABLE `telefone_instritutor` (
  `idTelefone` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `instrutor_idInstrutor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `idTurma` int(11) NOT NULL,
  `horario` time NOT NULL,
  `duracao` int(11) NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFIm` date NOT NULL,
  `atividade_idAtividade` int(11) NOT NULL,
  `instrutor_idInstrutor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`codMatricula`),
  ADD KEY `turma_idTurma` (`turma_idTurma`),
  ADD KEY `turma_idTurma_2` (`turma_idTurma`),
  ADD KEY `turma_idTurma_3` (`turma_idTurma`);

--
-- Índices para tabela `atividade`
--
ALTER TABLE `atividade`
  ADD PRIMARY KEY (`idAtividade`);

--
-- Índices para tabela `chamada`
--
ALTER TABLE `chamada`
  ADD PRIMARY KEY (`idChamada`),
  ADD KEY `matricula_aluno_codMatricula` (`matricula_aluno_codMatricula`),
  ADD KEY `matricula_turma_idTurma` (`matricula_turma_idTurma`),
  ADD KEY `matricula_aluno_codMatricula_2` (`matricula_aluno_codMatricula`),
  ADD KEY `matricula_turma_idTurma_2` (`matricula_turma_idTurma`),
  ADD KEY `matricula_aluno_codMatricula_3` (`matricula_aluno_codMatricula`),
  ADD KEY `matricula_turma_idTurma_3` (`matricula_turma_idTurma`);

--
-- Índices para tabela `instrutor`
--
ALTER TABLE `instrutor`
  ADD PRIMARY KEY (`idInstrutor`);

--
-- Índices para tabela `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`aluno_codMatricula`,`turma_idTurma`),
  ADD KEY `turma_idTurma` (`turma_idTurma`);

--
-- Índices para tabela `telefone_instritutor`
--
ALTER TABLE `telefone_instritutor`
  ADD PRIMARY KEY (`idTelefone`),
  ADD KEY `instrutor_idInstrutor` (`instrutor_idInstrutor`),
  ADD KEY `instrutor_idInstrutor_2` (`instrutor_idInstrutor`),
  ADD KEY `instrutor_idInstrutor_3` (`instrutor_idInstrutor`);

--
-- Índices para tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`idTurma`),
  ADD KEY `atividade_idAtividade` (`atividade_idAtividade`),
  ADD KEY `instrutor_idInstrutor` (`instrutor_idInstrutor`),
  ADD KEY `atividade_idAtividade_2` (`atividade_idAtividade`),
  ADD KEY `instrutor_idInstrutor_2` (`instrutor_idInstrutor`),
  ADD KEY `atividade_idAtividade_3` (`atividade_idAtividade`),
  ADD KEY `instrutor_idInstrutor_3` (`instrutor_idInstrutor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `codMatricula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `atividade`
--
ALTER TABLE `atividade`
  MODIFY `idAtividade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `chamada`
--
ALTER TABLE `chamada`
  MODIFY `idChamada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `instrutor`
--
ALTER TABLE `instrutor`
  MODIFY `idInstrutor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `telefone_instritutor`
--
ALTER TABLE `telefone_instritutor`
  MODIFY `idTelefone` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `idTurma` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`turma_idTurma`) REFERENCES `turma` (`idTurma`),
  ADD CONSTRAINT `aluno_ibfk_2` FOREIGN KEY (`turma_idTurma`) REFERENCES `turma` (`idTurma`),
  ADD CONSTRAINT `aluno_ibfk_3` FOREIGN KEY (`turma_idTurma`) REFERENCES `turma` (`idTurma`);

--
-- Limitadores para a tabela `chamada`
--
ALTER TABLE `chamada`
  ADD CONSTRAINT `chamada_ibfk_1` FOREIGN KEY (`matricula_aluno_codMatricula`) REFERENCES `matricula` (`aluno_codMatricula`),
  ADD CONSTRAINT `chamada_ibfk_2` FOREIGN KEY (`matricula_turma_idTurma`) REFERENCES `matricula` (`turma_idTurma`),
  ADD CONSTRAINT `chamada_ibfk_3` FOREIGN KEY (`matricula_aluno_codMatricula`) REFERENCES `matricula` (`aluno_codMatricula`),
  ADD CONSTRAINT `chamada_ibfk_4` FOREIGN KEY (`matricula_turma_idTurma`) REFERENCES `matricula` (`turma_idTurma`),
  ADD CONSTRAINT `chamada_ibfk_5` FOREIGN KEY (`matricula_aluno_codMatricula`) REFERENCES `matricula` (`aluno_codMatricula`),
  ADD CONSTRAINT `chamada_ibfk_6` FOREIGN KEY (`matricula_turma_idTurma`) REFERENCES `matricula` (`turma_idTurma`);

--
-- Limitadores para a tabela `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`aluno_codMatricula`) REFERENCES `aluno` (`codMatricula`),
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`turma_idTurma`) REFERENCES `turma` (`idTurma`),
  ADD CONSTRAINT `matricula_ibfk_3` FOREIGN KEY (`aluno_codMatricula`) REFERENCES `aluno` (`codMatricula`),
  ADD CONSTRAINT `matricula_ibfk_4` FOREIGN KEY (`turma_idTurma`) REFERENCES `turma` (`idTurma`),
  ADD CONSTRAINT `matricula_ibfk_5` FOREIGN KEY (`aluno_codMatricula`) REFERENCES `aluno` (`codMatricula`),
  ADD CONSTRAINT `matricula_ibfk_6` FOREIGN KEY (`turma_idTurma`) REFERENCES `turma` (`idTurma`);

--
-- Limitadores para a tabela `telefone_instritutor`
--
ALTER TABLE `telefone_instritutor`
  ADD CONSTRAINT `telefone_instritutor_ibfk_1` FOREIGN KEY (`instrutor_idInstrutor`) REFERENCES `instrutor` (`idInstrutor`),
  ADD CONSTRAINT `telefone_instritutor_ibfk_2` FOREIGN KEY (`instrutor_idInstrutor`) REFERENCES `instrutor` (`idInstrutor`),
  ADD CONSTRAINT `telefone_instritutor_ibfk_3` FOREIGN KEY (`instrutor_idInstrutor`) REFERENCES `instrutor` (`idInstrutor`);

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`atividade_idAtividade`) REFERENCES `atividade` (`idAtividade`),
  ADD CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`instrutor_idInstrutor`) REFERENCES `instrutor` (`idInstrutor`),
  ADD CONSTRAINT `turma_ibfk_3` FOREIGN KEY (`atividade_idAtividade`) REFERENCES `atividade` (`idAtividade`),
  ADD CONSTRAINT `turma_ibfk_4` FOREIGN KEY (`instrutor_idInstrutor`) REFERENCES `instrutor` (`idInstrutor`),
  ADD CONSTRAINT `turma_ibfk_5` FOREIGN KEY (`atividade_idAtividade`) REFERENCES `atividade` (`idAtividade`),
  ADD CONSTRAINT `turma_ibfk_6` FOREIGN KEY (`instrutor_idInstrutor`) REFERENCES `instrutor` (`idInstrutor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
