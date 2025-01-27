-- Criar o banco de dados e selecionar
CREATE DATABASE IF NOT EXISTS UniversidadeCompleta;
USE UniversidadeCompleta;

-- Criação de tabelas
CREATE TABLE Departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sigla VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE Cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    duracao INT NOT NULL, -- duração em semestres
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

CREATE TABLE Professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

CREATE TABLE Alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES Cursos(id_curso)
);

CREATE TABLE Disciplinas (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    professor_id INT,
    curso_id INT,
    FOREIGN KEY (professor_id) REFERENCES Professores(id_professor),
    FOREIGN KEY (curso_id) REFERENCES Cursos(id_curso)
);

CREATE TABLE Horarios (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    dia_semana ENUM('Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    disciplina_id INT,
    FOREIGN KEY (disciplina_id) REFERENCES Disciplinas(id_disciplina)
);

CREATE TABLE Matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    disciplina_id INT,
    data_matricula DATE NOT NULL DEFAULT CURDATE(),
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplinas(id_disciplina)
);

-- Trigger para verificar vagas em disciplinas antes de matrícula
DELIMITER $$
CREATE TRIGGER BeforeMatriculaInsert
BEFORE INSERT ON Matriculas
FOR EACH ROW
BEGIN
    DECLARE vagas INT;
    SET vagas = (SELECT COUNT(*) FROM Matriculas WHERE disciplina_id = NEW.disciplina_id);
    IF vagas >= 50 THEN -- Supondo que o limite de vagas é 50
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Limite de vagas atingido para esta disciplina!';
    END IF;
END$$
DELIMITER ;

-- Procedure para manipular dados
DELIMITER $$

CREATE PROCEDURE ManipularDadosUniversidadeComplexa(
    IN opcao INT,
    IN tabela VARCHAR(50),
    IN identificador INT,
    IN novo_nome VARCHAR(100),
    IN novo_email VARCHAR(100),
    IN nova_info1 VARCHAR(100),
    IN nova_info2 INT
)
BEGIN
    CASE opcao
        WHEN 1 THEN -- SELECT
            CASE tabela
                WHEN 'Alunos' THEN
                    SELECT * FROM Alunos WHERE id_aluno = identificador;
                WHEN 'Professores' THEN
                    SELECT * FROM Professores WHERE id_professor = identificador;
                WHEN 'Disciplinas' THEN
                    SELECT * FROM Disciplinas WHERE id_disciplina = identificador;
                WHEN 'Cursos' THEN
                    SELECT * FROM Cursos WHERE id_curso = identificador;
                WHEN 'Matriculas' THEN
                    SELECT * FROM Matriculas WHERE id_matricula = identificador;
                ELSE
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabela inválida!';
            END CASE;
        WHEN 2 THEN -- UPDATE
            CASE tabela
                WHEN 'Alunos' THEN
                    UPDATE Alunos SET nome = novo_nome, email = novo_email WHERE id_aluno = identificador;
                WHEN 'Professores' THEN
                    UPDATE Professores SET nome = novo_nome, email = novo_email, especialidade = nova_info1 WHERE id_professor = identificador;
                WHEN 'Cursos' THEN
                    UPDATE Cursos SET nome = novo_nome, duracao = nova_info2 WHERE id_curso = identificador;
                ELSE
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabela inválida!';
            END CASE;
        WHEN 3 THEN -- DELETE
            CASE tabela
                WHEN 'Alunos' THEN
                    DELETE FROM Alunos WHERE id_aluno = identificador;
                WHEN 'Professores' THEN
                    DELETE FROM Professores WHERE id_professor = identificador;
                WHEN 'Disciplinas' THEN
                    DELETE FROM Disciplinas WHERE id_disciplina = identificador;
                WHEN 'Matriculas' THEN
                    DELETE FROM Matriculas WHERE id_matricula = identificador;
                ELSE
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tabela inválida!';
            END CASE;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Opção inválida!';
    END CASE;
END$$

DELIMITER ;

-- Chamadas de exemplo
CALL ManipularDadosUniversidadeComplexa(1, 'Alunos', 1, NULL, NULL, NULL, NULL);
CALL ManipularDadosUniversidadeComplexa(2, 'Cursos', 1, 'Curso Atualizado', NULL, NULL, 8);
CALL ManipularDadosUniversidadeComplexa(3, 'Matriculas', 1, NULL, NULL, NULL, NULL);
