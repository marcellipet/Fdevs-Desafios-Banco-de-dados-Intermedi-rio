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

CREATE TABLE Cliente (
    Id int primary key identity(1,1),         
    PrimeiroNome varchar(100),                
    UltimoNome varchar(100)
);