# 🎓 Universidade Completa - Sistema de Gerenciamento Acadêmico

Este projeto apresenta um banco de dados relacional para o gerenciamento de informações de uma universidade fictícia. O objetivo é estruturar e organizar dados acadêmicos de forma eficiente, simulando situações reais com funcionalidades avançadas.

## 📂 Estrutura do Banco de Dados

O banco de dados inclui as seguintes entidades principais:

- **Departamentos**: Representam áreas de estudo da universidade.
- **Cursos**: Associados a departamentos, com duração em semestres.
- **Professores**: Informações sobre docentes, suas especialidades e departamentos.
- **Alunos**: Dados de alunos, incluindo curso associado.
- **Disciplinas**: Cadastradas por curso, ministradas por professores.
- **Horários**: Planejamento semanal para cada disciplina.
- **Matrículas**: Controle de matrículas dos alunos nas disciplinas.

## ⚙️ Funcionalidades

- **Triggers**: Garante o limite máximo de 50 vagas por disciplina.
- **Procedures**: Manipulação dinâmica de dados com operações de SELECT, UPDATE e DELETE em diferentes tabelas.
- **Consultas SQL**: Inclui uma coleção de queries complexas para análises e relatórios, como:
  - Listar cursos por departamento.
  - Verificar disciplinas por professor.
  - Consultar horários de aulas.
  - Monitorar matrículas por aluno ou disciplina.

## 🚀 Tecnologias Utilizadas

- **MySQL Workbench 8.0** para modelagem e manipulação do banco de dados.
- **SQL** para criação de tabelas, procedimentos, e consultas otimizadas.
## 📊 Exemplos de Uso

### Exemplo de Query
Listar todos os professores e suas disciplinas:
SELECT p.nome AS Professor, d.nome AS Disciplina
FROM Professores p
JOIN Disciplinas d ON p.id_professor = d.professor_id
ORDER BY p.nome, d.nome;

### Exemplo de Procedure
```sql
CALL ManipularDadosUniversidadeComplexa(1, 'Alunos', 1, NULL, NULL, NULL, NULL);
