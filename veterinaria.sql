-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/07/2026 às 17:21
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `veterinaria`
--
CREATE DATABASE IF NOT EXISTS `veterinaria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `veterinaria`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `animais`
--

CREATE TABLE `animais` (
  `idanimais` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `nomeanimais` varchar(255) NOT NULL,
  `especie` varchar(255) NOT NULL,
  `raca` varchar(255) NOT NULL,
  `datanascimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `animais`
--

INSERT INTO `animais` (`idanimais`, `idcliente`, `nomeanimais`, `especie`, `raca`, `datanascimento`) VALUES
(1, 1, 'luke', 'cachorro', 'RD', '2024-06-21'),
(2, 2, 'lua', 'cachorro', 'shitzu', '2024-08-16'),
(3, 3, 'artur', 'coelho', 'nova zelandia branco', '2025-07-06');

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `idatendimento` int(11) NOT NULL,
  `idanimal` int(11) DEFAULT NULL,
  `idveterinario` int(11) DEFAULT NULL,
  `datanascimentono` date NOT NULL,
  `horaatendimento` time NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nomecli` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  `endereço` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nomecli`, `telefone`, `email`, `cpf`, `endereço`) VALUES
(1, 'livia alves', '35 99856 3181', 'liviaalvesetec25@gmail.com', '569.171.798-76', 'rua severina pinheiro de sousa 60'),
(2, 'jordana dos santos', '11 95520 6082', 'jordana_biosantos@hotmail.com', '363.341.108-96', 'rua peri 57'),
(3, 'ketilyn santos', '11 91340 4157', 'santosketilyn1510@gmail.com', '470.462.588-56', 'rua peri 57');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veterinario`
--

CREATE TABLE `veterinario` (
  `idveterinario` int(11) NOT NULL,
  `nomevet` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  `crmv` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `animais`
--
ALTER TABLE `animais`
  ADD PRIMARY KEY (`idanimais`),
  ADD KEY `idcliente` (`idcliente`);

--
-- Índices de tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`idatendimento`),
  ADD KEY `idanimal` (`idanimal`),
  ADD KEY `idveterinario` (`idveterinario`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`idveterinario`),
  ADD UNIQUE KEY `crmv` (`crmv`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animais`
--
ALTER TABLE `animais`
  MODIFY `idanimais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `idatendimento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `idveterinario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `animais`
--
ALTER TABLE `animais`
  ADD CONSTRAINT `animais_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`);

--
-- Restrições para tabelas `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `atendimento_ibfk_1` FOREIGN KEY (`idanimal`) REFERENCES `animais` (`idanimais`),
  ADD CONSTRAINT `atendimento_ibfk_2` FOREIGN KEY (`idveterinario`) REFERENCES `veterinario` (`idveterinario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
