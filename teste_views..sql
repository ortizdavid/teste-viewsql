CREATE DATABASE teste_views;
USE teste_views;

-- CRIAÇÃO DAS TABELAS ---------------------------------------------------------------------------
CREATE TABLE cargos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cargo VARCHAR(50) UNIQUE
);
CREATE TABLE funcionarios(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cargo INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sexo ENUM('Masculino', 'Feminino'),
    num_identificacao VARCHAR(20) UNIQUE NOT NULL,
    CONSTRAINT fk_cargo FOREIGN KEY (id_cargo) REFERENCES cargos(id)
);
CREATE TABLE contactos(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    telefone INT(9) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE,
    CONSTRAINT fk_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id)
);

-- ---CRIAÇÃO DA VIEW-------------------
CREATE VIEW view_dados_funcionario AS
SELECT funcionarios.id, funcionarios.nome, funcionarios.sexo, funcionarios.num_identificacao,
    contactos.telefone, contactos.email, cargos.nome_cargo
FROM funcionarios
JOIN contactos ON(funcionarios.id = contactos.id_funcionario)
JOIN cargos ON(funcionarios.id_cargo = cargos.id);

-- INSERÇÃO DE REGISTOS -------------------------------------------------------------------------------------
INSERT INTO cargos (nome_cargo) VALUES ('Secretario'), ('Auxiliar de RH'), ('Analista de Negocios'), ('Contabilista');
INSERT INTO funcionarios (id_cargo, nome, sexo, num_identificacao) 
        VALUES  (1, 'Ana Maria', 'Feminino', '100000000LA001'),
                (2, 'Paulo Jorge', 'Masculino', '200000000LA002'),
                (3, 'António Joaquim', 'Masculino', '300000000LA003'),
                (4, 'Cláudia Francisco', 'Feminino', '400000000LA004');
INSERT INTO contactos (id_funcionario, telefone, email)
        VALUES  (1, 911111111, 'ana@gmail.com'),
                (2, 922222222, 'paulo@gmail.com'),
                (3, 933333333, 'antonio@gmail.com'),
                (4, 944444444, 'claudia@gmail.com');