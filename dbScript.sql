CREATE TABLE Usuario (
idUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
registro VARCHAR(10) UNIQUE NOT NULL, 
login VARCHAR(100) UNIQUE NOT NULL, 
senha CHAR(4) NOT NULL,/* últimos 4 dígitos do telefone */
coin INT DEFAULT 0,
perfil CHAR(5) CHECK (perfil='ADMIN' OR perfil='COLAB' OR perfil='COMUM')
);

CREATE TABLE Doacao (
idDoacao INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
idUsuario INT NOT NULL,
dataHora DATETIME NOT NULL,
CONSTRAINT fk_DoacaoUsuario FOREIGN KEY(idUsuario) REFERENCES idUsuario(Usuario)
);

CREATE TABLE Compra (
idCompra INT(10) AUTO_INCREMENT PRIMARY KEY,
idUsuario INT(10) NOT NULL,
dataHora DATETIME NOT NULL,
totalEmCoin INT(10) NOT NULL,
CONSTRAINT fk_CompraUsuario FOREIGN KEY(idUsuario)
REFERENCES idUsuario(Usuario)
);

CREATE TABLE Produto (
idProduto INT(10) AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) UNIQUE NOT NULL,
valorEmCoin INT(10) NOT NULL,  
quantidade INT(10) NOT NULL
);

CREATE TABLE DoacaoProduto (
idDoacao INT(10) NOT NULL,
idProduto INT(10) NOT NULL, 
quantidade INT(10) NOT NULL,
CONSTRAINT pk_DoacaoProduto PRIMARY KEY (idDoacao, idProduto),
CONSTRAINT fk_DoacaoProduto_Doacao FOREIGN KEY (idDoacao)
REFERENCES idDoacao(Doacao),
CONSTRAINT fk_DoacaoProduto_Produto FOREIGN KEY (idProduto)
REFERENCES idProduto(Produto)
);

CREATE TABLE CompraProduto(
idCompra INT(10) NOT NULL,
idProduto INT(10) NOT NULL, 
quantidade INT(10) NOT NULL,
totalEmCoinItem INT(10) NOT NULL,
CONSTRAINT pk_CompraProduto PRIMARY KEY (idCompra, idProduto)
CONSTRAINT fk_CompraProduto_Compra FOREIGN KEY (idCompra)
REFERENCES idCompra(Compra),
CONSTRAINT fk_CompraProduto_Produto FOREIGN KEY (idProduto)
REFERENCES idProduto(Produto)
);






