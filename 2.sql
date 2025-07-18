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
('Eletr�nicos'),
('Alimentos');

insert into Produto (Nome, IdCategoria) values 
('Camiseta Azul', 1),
('Cal�a Jeans', 1),
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
('Jo�o', 'Pereira');


select 
    P.Nome as NomeProduto,
    C.Nome as Categoria,
    E.Quantidade as QuantidadeEstoque
from 
    Produto P
join 
    ProdutoCategoria C on P.IdCategoria = C.Id
join 
    ProdutoEstoque E on P.Id = E.IdProduto;

alter table Cliente
add 
    Titulo varchar(10),   
    MI varchar(1);  

insert into Cliente (Titulo, PrimeiroNome, MI, UltimoNome) values
('Sr.', 'Carlos', 'A', 'Silva'),
('Sra.', 'Maria', null, 'Souza'),
('Dr.', 'Jo�o', '', 'Pereira'),
('Sr.', 'Lucas', 'B', 'Mendes'),
('Sra.', 'Ana', 'C', 'Ferreira'),
('Sr.', 'Pedro', null, 'Alves');

select 
    Id,
    concat(
        case 
            when Titulo is null or LTRIM(RTRIM(Titulo)) = '' then ''
            else Titulo + ' '
        end,
        case 
            when PrimeiroNome is null or LTRIM(RTRIM(PrimeiroNome)) = '' then 'Desconhecido'
            else PrimeiroNome
        end,
        ' ',
        case 
            when MI is null or LTRIM(RTRIM(MI)) = '' then ''
            else MI + '. '
        end,
        case 
            when UltimoNome is null or LTRIM(RTRIM(UltimoNome)) = '' then 'Sobrenome'
            else UltimoNome
        end
    ) as NomeCompleto
from 
    Cliente;
