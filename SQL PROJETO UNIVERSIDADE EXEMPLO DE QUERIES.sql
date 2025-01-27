-- Listar todos os departamentos e os cursos pertencentes a cada um:

SELECT d.nome AS Departamento, c.nome AS Curso
FROM Departamentos d
JOIN Cursos c ON d.id_departamento = c.id_departamento
ORDER BY d.nome, c.nome;

-- Exibir todos os alunos matriculados em um curso específico (exemplo: 'Curso X'):

SELECT a.nome AS Aluno, a.email
FROM Alunos a
JOIN Cursos c ON a.curso_id = c.id_curso
WHERE c.nome = 'Medicina';

-- Exibir todos os professores e as disciplinas que lecionam:

SELECT p.nome AS Professor, d.nome AS Disciplina
FROM Professores p
JOIN Disciplinas d ON p.id_professor = d.professor_id
ORDER BY p.nome, d.nome;

-- Consultar todas as disciplinas de um curso específico (exemplo: 'Curso X'):

SELECT d.nome AS Disciplina, d.carga_horaria
FROM Disciplinas d
JOIN Cursos c ON d.curso_id = c.id_curso
WHERE c.nome = 'História';

-- Exibir horários de uma disciplina específica (exemplo: 'Disciplina X'):

SELECT h.dia_semana, h.hora_inicio, h.hora_fim
FROM Horarios h
JOIN Disciplinas d ON h.disciplina_id = d.id_disciplina
WHERE d.nome = 'Anatomia Humana I';

-- Listar todos os alunos e suas respectivas matrículas:

SELECT a.nome AS Aluno, m.data_matricula, d.nome AS Disciplina
FROM Alunos a
JOIN Matriculas m ON a.id_aluno = m.aluno_id
JOIN Disciplinas d ON m.disciplina_id = d.id_disciplina
ORDER BY a.nome, m.data_matricula;

-- Listar todos os cursos oferecidos por um departamento específico (exemplo: 'Departamento X'):

SELECT c.nome AS Curso
FROM Cursos c
JOIN Departamentos d ON c.id_departamento = d.id_departamento
WHERE d.nome = 'Departamento de Ciências Exatas';

-- Verificar se um aluno está matriculado em uma disciplina específica (exemplo: aluno 'Aluno X' e disciplina 'Disciplina Y'):

SELECT a.nome AS Aluno, d.nome AS Disciplina, m.data_matricula
FROM Alunos a
JOIN Matriculas m ON a.id_aluno = m.aluno_id
JOIN Disciplinas d ON m.disciplina_id = d.id_disciplina
WHERE a.nome = 'João Silva' AND d.nome = 'Cálculo I';

-- Exibir todos os professores de um curso específico (exemplo: 'Curso X'):

SELECT p.nome AS Professor
FROM Professores p
JOIN Disciplinas d ON p.id_professor = d.professor_id
JOIN Cursos c ON d.curso_id = c.id_curso
WHERE c.nome = 'Matemática';

-- Listar os alunos que pertencem a um curso com duração maior que 6 semestres:

SELECT a.nome AS Aluno, c.nome AS Curso
FROM Alunos a
JOIN Cursos c ON a.curso_id = c.id_curso
WHERE c.duracao > 6;

-- Listar as disciplinas que um aluno está matriculado e os horários correspondentes:

SELECT a.nome AS Aluno, d.nome AS Disciplina, h.dia_semana, h.hora_inicio, h.hora_fim
FROM Alunos a
JOIN Matriculas m ON a.id_aluno = m.aluno_id
JOIN Disciplinas d ON m.disciplina_id = d.id_disciplina
JOIN Horarios h ON d.id_disciplina = h.disciplina_id
ORDER BY a.nome, d.nome;

-- Consultar a carga horária de todas as disciplinas ministradas por um professor específico (exemplo: 'Professor X'):

SELECT d.nome AS Disciplina, d.carga_horaria
FROM Disciplinas d
JOIN Professores p ON d.professor_id = p.id_professor
WHERE p.nome = 'Profa. Maria Oliveira';

-- Exibir todos os departamentos e o número de cursos associados a cada um:

SELECT d.nome AS Departamento, COUNT(c.id_curso) AS NumeroDeCursos
FROM Departamentos d
LEFT JOIN Cursos c ON d.id_departamento = c.id_departamento
GROUP BY d.nome
ORDER BY NumeroDeCursos DESC;

-- Exibir todos os alunos que possuem mais de uma matrícula:

SELECT a.nome AS Aluno, COUNT(m.id_matricula) AS QuantidadeDeMatriculas
FROM Alunos a
JOIN Matriculas m ON a.id_aluno = m.aluno_id
GROUP BY a.id_aluno
HAVING QuantidadeDeMatriculas > 1;

-- Consultar todos os alunos matriculados em disciplinas de um determinado professor (exemplo: 'Professor X'):

SELECT a.nome AS Aluno, d.nome AS Disciplina
FROM Alunos a
JOIN Matriculas m ON a.id_aluno = m.aluno_id
JOIN Disciplinas d ON m.disciplina_id = d.id_disciplina
JOIN Professores p ON d.professor_id = p.id_professor
WHERE p.nome = 'Profa. Maria Oliveira';