# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Mili\Documents\GitHub\Vjezbe-JP28\samostan.sql

#kreiranje baze
drop database if exists samostan;
create database samostan;
use samostan;

# kreiranje tablica
create table svecenik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    nadredeni int
);    

create table posao(
    sifra int not null primary key auto_increment,
    opisPosla varchar(150),
    zadatak int not null
);

create table zadatak(
    svecenik int,
    posao int
);

# kreiranje veza

alter table zadatak add foreign key (svecenik)
references svecenik (sifra);

alter table zadatak add foreign key (posao)
references posao (sifra);

alter table svecenik add foreign key (nadredeni)
references svecenik (sifra);


# punjenje podacima

insert into svecenik (sifra,ime)
    values (null,'fra Duje');

insert into posao (sifra,opisPosla,zadatak)
    values (null,'Košnja trave',1);

insert into zadatak (svecenik,posao)
    values (1,1);
