CREATE DATABASE FACULDADE;
USE FACULDADE;
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
  status INT,
);

CREATE TABLE FREQUENCIA(
  ID_frequencia INT NOT NULL,
  PRIMARY KEY (ID_frequencia),
  disciplina_frequencia INT NOT NULL,
  FOREIGN KEY (disciplina_frequencia) REFERENCES DISCIPLINAS(ID_disciplina),
  numero_aulas INT NOT NULL,
  faltas INT,
);

CREATE TABLE BOLETIM(
  ID_boletim INT NOT NULL,
  PRIMARY KEY(ID_boletim),
  notas INT NOT NULL,
  FOREIGN KEY (notas) REFERENCES NOTAS(ID_notas),
  frequencia INT NOT NULL,
  FOREIGN KEY (frequencia) REFERENCES FREQUENCIA(ID_frequencia)
);
