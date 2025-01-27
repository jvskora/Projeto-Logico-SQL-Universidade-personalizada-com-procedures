-- Selecionar o banco de dados
USE UniversidadeCompleta;

-- Inserir dados nas tabelas

-- Departamentos
INSERT INTO Departamentos (nome, sigla) VALUES
('Departamento de Ciências Exatas', 'DCE'),
('Departamento de Ciências Humanas', 'DCH'),
('Departamento de Engenharia', 'DE'),
('Departamento de Medicina', 'DM'),
('Departamento de Administração', 'DA'),
('Departamento de Direito', 'DD'),
('Departamento de Psicologia', 'DP');

-- Cursos
INSERT INTO Cursos (nome, duracao, id_departamento) VALUES
('Matemática', 8, 1),
('História', 6, 2),
('Engenharia Civil', 10, 3),
('Medicina', 12, 4),
('Administração', 8, 5),
('Direito', 10, 6),
('Psicologia', 8, 7);

-- Professores
INSERT INTO Professores (nome, email, especialidade, id_departamento) VALUES
('Dr. Carlos Silva', 'carlos.silva@uni.edu', 'Cálculo Diferencial', 1),
('Profa. Maria Oliveira', 'maria.oliveira@uni.edu', 'História do Brasil', 2),
('Eng. João Pereira', 'joao.pereira@uni.edu', 'Estruturas de Concreto', 3),
('Dra. Ana Costa', 'ana.costa@uni.edu', 'Anatomia Humana', 4),
('Profa. Renata Souza', 'renata.souza@uni.edu', 'Administração de Empresas', 5),
('Dr. Luiz Gomes', 'luiz.gomes@uni.edu', 'Direito Penal', 6),
('Profa. Beatriz Lima', 'beatriz.lima@uni.edu', 'Psicologia Cognitiva', 7);

-- Alunos
INSERT INTO Alunos (nome, email, data_nascimento, curso_id) VALUES
('João Silva', 'joao.silva@student.edu', '1998-05-14', 1),
('Larissa Almeida', 'larissa.almeida@student.edu', '1999-03-22', 2),
('Felipe Santos', 'felipe.santos@student.edu', '2000-07-10', 3),
('Gabriela Costa', 'gabriela.costa@student.edu', '2001-01-25', 4),
('Vinícius Rocha', 'vinicius.rocha@student.edu', '1997-11-02', 5),
('Camila Oliveira', 'camila.oliveira@student.edu', '1998-09-14', 6),
('Rodrigo Alves', 'rodrigo.alves@student.edu', '1999-12-20', 7);

-- Disciplinas
INSERT INTO Disciplinas (nome, carga_horaria, professor_id, curso_id) VALUES
('Cálculo I', 60, 1, 1),
('História Geral', 60, 2, 2),
('Estruturas de Concreto I', 80, 3, 3),
('Anatomia Humana I', 90, 4, 4),
('Administração de Recursos Humanos', 60, 5, 5),
('Direito Constitucional', 80, 6, 6),
('Psicologia Geral', 60, 7, 7);

-- Horários
INSERT INTO Horarios (dia_semana, hora_inicio, hora_fim, disciplina_id) VALUES
('Segunda', '08:00:00', '10:00:00', 1),
('Terça', '14:00:00', '16:00:00', 2),
('Quarta', '10:00:00', '12:00:00', 3),
('Quinta', '08:00:00', '10:00:00', 4),
('Sexta', '16:00:00', '18:00:00', 5),
('Segunda', '10:00:00', '12:00:00', 6),
('Quarta', '14:00:00', '16:00:00', 7);

-- Matrículas
INSERT INTO Matriculas (aluno_id, disciplina_id, data_matricula) VALUES
(1, 1, '2025-01-10'),
(2, 2, '2025-01-15'),
(3, 3, '2025-01-12'),
(4, 4, '2025-01-18'),
(5, 5, '2025-01-22'),
(6, 6, '2025-01-20'),
(7, 7, '2025-01-25');