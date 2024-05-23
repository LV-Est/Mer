CREATE TABLE Usuario (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    tipo_usuario ENUM('aluno', 'professor') NOT NULL
);

CREATE TABLE Curso (
    curso_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE Disciplina (
    disciplina_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES Curso(curso_id)
);

CREATE TABLE Projeto (
    projeto_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    usuario_id INT,
    disciplina_id INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(disciplina_id)
);

CREATE TABLE RepositorioCodigo (
    repositorio_id INT PRIMARY KEY AUTO_INCREMENT,
    projeto_id INT,
    nome VARCHAR(100) NOT NULL,
    linguagem_id INT,
    FOREIGN KEY (projeto_id) REFERENCES Projeto(projeto_id),
    FOREIGN KEY (linguagem_id) REFERENCES LinguagemProgramacao(linguagem_id)
);

CREATE TABLE LinguagemProgramacao (
    linguagem_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE GrupoDiscussao (
    grupo_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    usuario_id INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id)
);

CREATE TABLE MensagemDiscussao (
    mensagem_id INT PRIMARY KEY AUTO_INCREMENT,
    grupo_id INT,
    usuario_id INT,
    conteudo TEXT NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (grupo_id) REFERENCES GrupoDiscussao(grupo_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id)
);

CREATE TABLE TrabalhoAcademico (
    trabalho_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    conteudo TEXT,
    usuario_id INT,
    data_publicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id)
);

CREATE TABLE SalaVirtual (
    sala_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    usuario_id INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id)
);

CREATE TABLE Arquivo (
    arquivo_id INT PRIMARY KEY AUTO_INCREMENT,
    sala_id INT,
    nome VARCHAR(100) NOT NULL,
    tipo_arquivo VARCHAR(50),
    data_upload TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sala_id) REFERENCES SalaVirtual(sala_id)
);

CREATE TABLE SugestaoIA (
    sugestao_id INT PRIMARY KEY AUTO_INCREMENT,
    repositorio_id INT,
    conteudo TEXT NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (repositorio_id) REFERENCES RepositorioCodigo(repositorio_id)
);

CREATE TABLE UsuarioCurso (
    usuario_id INT,
    curso_id INT,
    PRIMARY KEY (usuario_id, curso_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (curso_id) REFERENCES Curso(curso_id)
);

CREATE TABLE UsuarioGrupo (
    usuario_id INT,
    grupo_id INT,
    PRIMARY KEY (usuario_id, grupo_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
    FOREIGN KEY (grupo_id) REFERENCES GrupoDiscussao(grupo_id)
);
