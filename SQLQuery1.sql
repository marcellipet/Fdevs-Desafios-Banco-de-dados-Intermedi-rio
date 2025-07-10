create table ProdutoCategoria (
    Id int primary key identity(1,1),
    Nome varchar(100) not null
);

create table Produto (
    Id int primary key identity(1,1),
    Nome varchar(200) not null,
    IdCategoria int not null,
    foreign key (IdCategoria) references ProdutoCategoria(Id)
);

create table ProdutoEstoque (
    Id int primary key identity(1,1),
    IdProduto int not null,
    Quantidade int not null,
    foreign key (IdProduto) references Produto(Id)
);

create table Cliente (
    Id int primary key identity(1,1),         
    PrimeiroNome varchar(100),                
    UltimoNome varchar(100)
);

insert into ProdutoCategoria (Nome) values 
('Roupas'),
('Eletrônicos'),
('Alimentos');

insert into Produto (Nome, IdCategoria) values 
('Camiseta Azul', 1),
('Calça Jeans', 1),
('Notebook Dell', 2),
('Arroz 5kg', 3);

insert into ProdutoEstoque (IdProduto, Quantidade) values 
(1, 50), 
(2, 30),  
(3, 10), 
(4, 100);

insert into Cliente (PrimeiroNome, UltimoNome) values 
('Carlos', 'Silva'),
('Maria', 'Souza'),
('João', 'Pereira');
