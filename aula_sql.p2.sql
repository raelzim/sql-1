CREATE DATAbase SEGURANCA_NOITE;

USE SEGURANCA_NOITE;

CREATE TABLE cliente (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(500),
cpf VARCHAR(15),
telefone VARCHAR(15) 
);

CREATE TABLE venda (
id INT AUTO_INCREMENT PRIMARY KEY,
dia DATETIME,
valor FLOAT 
);   

INSERT INTO cliente (nome, cpf, telefone)
VALUES 
("Israel", "12345678999", "89999999"),
("Thiago", "32165498711", "83888888");

SELECT * FROM cliente 

CREATE TABLE venda_log (
log_id INT AUTO_INCREMENT PRIMARY KEY,
old_id INT,
old_data DATETIME,
old_valor FLOAT,
new_id INT, 
new_data DATETIME, 
new_valor FLOAT,
acao VARCHAR (8),
usuario VARCHAR(50),
hora TIMESTAMP
);

CREATE TRIGGER venda_log_insert AFTER INSERT ON venda
FOR EACH ROW 
INSERT INTO venda_log
(old_id, old_data, old_valor, new_id, new_data, new_valor, acao, usuario, hora)
VALUES 
(NULL, NULL, NULL,NEW.id, NEW.dia, NEW.valor, 'INSERT',
USER(), NOW());


INSERT INTO venda (dia, valor)
VALUES 
('2023-09-18', 550.50);

select * FROM venda

SELECT * FROM venda_log

CREATE TRIGGER venda_log_update AFTER UPDATE ON venda 