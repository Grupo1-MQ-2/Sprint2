CREATE DATABASE canalytics;

USE canalytics;

CREATE TABLE usuario (
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
razao_social VARCHAR(100),
nome_fantasia VARCHAR(100),
apelido VARCHAR(45)
);

CREATE TABLE dispositivo (
id_dispositivo INT PRIMARY KEY AUTO_INCREMENT,
nome_dispositivo VARCHAR (100),
latitude DECIMAL (9,6),
longitude DECIMAL (9,6),
dispositivos_status TINYINT, 
data_instalacao DATETIME,
fk_usuario INT,
CONSTRAINT fk_dispositivos_usuario FOREIGN KEY
(fk_usuario) REFERENCES usuario (id_usuario)
);


CREATE TABLE leitura (
id_leitura INT PRIMARY KEY AUTO_INCREMENT,
valor_gas_ppm INT NOT NULL,
data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
fk_dispositivo INT,
status_risco TINYINT AS (
  CASE
    WHEN valor_gas_ppm > 2000 THEN 0
    WHEN valor_gas_ppm > 1000 THEN 1
    ELSE 2
  END ),
CONSTRAINT fk_leitura_dispositivo FOREIGN KEY (fk_dispositivo) REFERENCES
dispositivo (id_dispositivo)
);

CREATE TABLE alerta (
id_alerta INT PRIMARY KEY AUTO_INCREMENT,
nivel_risco VARCHAR(45),
mensagem VARCHAR(255),
datahora_leitura DATETIME,
fk_leitura INT,
CONSTRAINT fk_alerta_leitura FOREIGN KEY
(fk_leitura) REFERENCES leitura (id_leitura) );


INSERT INTO usuario (razao_social, nome_fantasia, apelido) VALUES 
('Empresa CanaSP Ltda', 'CanaSP Products', 'CanaSP'),
('Beta Cana', 'Cana beta', 'beta'),
('Cana Rio Ltda', 'Caldicana', 'CanaRIO'),
('Fazendo SUL S.A.', 'SUL produções', 'FARMSUL'),
('Omega Cana Power', 'Omega Cana', 'omega');


INSERT INTO dispositivo (nome_dispositivo, latitude, longitude, dispositivos_status, data_instalacao, fk_usuario) VALUES 
('Sensor Galpão A', -23.547301, -46.637235, 1, '2024-01-10 08:00:00', 1),
('Sensor Linha B', -22.903539, -43.172321, 1, '2024-02-15 09:30:00', 2),
('Sensor Setorw C', -19.916681, -43.934493, 0, '2024-03-20 10:00:00', 3),
('Sensor Setor D', -12.971600, -38.501600, 1, '2024-04-05 07:45:00', 4),
('Sensor Plataforma E', -3.717220, -38.543400, 1, '2024-05-01 11:00:00', 5);

INSERT INTO leitura (valor_gas_ppm, data_hora, fk_dispositivo) VALUES 
(450,  '2024-06-01 08:15:00', 1),
(1200, '2024-06-01 09:30:00', 2),
(2500, '2024-06-01 10:45:00', 3),
(800,  '2024-06-01 11:00:00', 4),
(1750, '2024-06-01 12:20:00', 5);

INSERT INTO alerta (nivel_risco, mensagem, datahora_leitura, fk_leitura) VALUES 
('Baixo', 'Aceitável',         '2024-06-01 08:15:00', 1),
('Médio', 'Atenção',      '2024-06-01 09:30:00', 2),
('Alto',  'PERIGO',    '2024-06-01 10:45:00', 3),
('Baixo', 'Aceitável', '2024-06-01 11:00:00', 4),
('Médio', 'Atenção',   '2024-06-01 12:20:00', 5);



