CREATE DATABASE FACULDADE;
USE FACULDADE;
CREATE TABLE TIPO(
  ID_tipo INT NOT NULL,
  PRIMARY KEY(ID_tipo),
  nome_tipo VARCHAR(31) NOT NULL);
  
CREATE TABLE PESSOA(
  matricula INT NOT NULL,
  PRIMARY KEY (matricula),
  nome_pessoa VARCHAR(255),
  data_nascimento DATE,
  CPF VARCHAR(15) NOT NULL,
  RG VARCHAR(31) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  email VARCHAR(255),
  endereco VARCHAR(511)
);

CREATE TABLE DISCIPLINAS(
  ID_disciplina INT NOT NULL,
  PRIMARY KEY(ID_disciplina),
  nome_disciplina VARCHAR(255),
  carga_horaria INT,
  pre_requisito INT,
  FOREIGN KEY(pre_requisito) REFERENCES DISCIPLINAS(ID_disciplina)
);

CREATE TABLE DISCIPLINAS_PROF(
  ID_disp INT NOT NULL,
  PRIMARY KEY(ID_disp),
  discipinas INT NOT NULL,
  FOREIGN KEY(discipinas) REFERENCES DISCIPLINAS(ID_disciplina)
);

CREATE TABLE DISCIPLINAS_CURSO(
  ID_dispc INT NOT NULL,
  disciplinas_curso INT NOT NULL,
  FOREIGN KEY(disciplinas_curso) REFERENCES DISCIPLINAS(ID_disciplina)
);

CREATE TABLE PROFESSOR(
  ID_professor INT NOT NULL,
  PRIMARY KEY(ID_professor),
  salario DECIMAL(4, 2),
  area VARCHAR(127),
  disciplinas_ministradas INT,
  FOREIGN KEY (disciplinas_ministradas) REFERENCES DISCIPLINAS_PROF (ID_disp)
);

CREATE TABLE CURSOS(
  ID_curso INT NOT NULL,
  PRIMARY KEY (ID_curso),
  nome VARCHAR(255),
  disciplinas_necessarias INT,
  FOREIGN KEY (disciplinas_necessarias) REFERENCES DISCIPLINAS_CURSO(ID_dispc),
  coordenador INT,
  FOREIGN KEY(coordenador) REFERENCES PROFESSOR(ID_professor)
);


CREATE TABLE NOTAS(
  ID_notas INT NOT NULL,
  PRIMARY KEY(ID_notas),
  disciplina_nota INT NOT NULL,
  FOREIGN KEY (disciplina_nota) REFERENCES DISCIPLINAS(ID_disciplina),
  P1 INT,
  P2 INT,
  media_final DECIMAL(2, 2),
  status INT
);

CREATE TABLE FREQUENCIA(
  ID_frequencia INT NOT NULL,
  PRIMARY KEY (ID_frequencia),
  disciplina_frequencia INT NOT NULL,
  FOREIGN KEY (disciplina_frequencia) REFERENCES DISCIPLINAS(ID_disciplina),
  numero_aulas INT NOT NULL,
  faltas INT
);

CREATE TABLE BOLETIM(
  ID_boletim INT NOT NULL,
  PRIMARY KEY(ID_boletim),
  notas INT NOT NULL,
  FOREIGN KEY (notas) REFERENCES NOTAS(ID_notas),
  frequencia INT NOT NULL,
  FOREIGN KEY (frequencia) REFERENCES FREQUENCIA(ID_frequencia)
);

CREATE TABLE ALUNO(
    curso INT NOT NULL,
    FOREIGN KEY(curso) REFERENCES CURSOS(ID_curso),
    boletim INT NOT NULL,
    FOREIGN KEY (boletim) REFERENCES BOLETIM(ID_boletim)
);
