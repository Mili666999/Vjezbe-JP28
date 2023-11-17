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
    svecenik_posao int not null
);

create table svecenik_posao(
    svecenik int not null,
    posao int not null
);

# kreiranje veza

alter table svecenik_posao add foreign key (svecenik)
references svecenik (sifra);

alter table svecenik_posao add foreign key (posao)
references posao (sifra);

alter table svecenik add foreign key (nadredeni)
references svecenik (sifra);


# punjenje podacima

insert into svecenik (sifra,ime)
    values  (null,'fra Duje'),
            (null,'fra Šime');

insert into posao (sifra,opisPosla,svecenik_posao)
    values (null,'Košnja trave',1),
           (null,'Sadnja baŠČe',1);

insert into svecenik_posao (svecenik,posao)
    values (1,1),
           (1,1);
