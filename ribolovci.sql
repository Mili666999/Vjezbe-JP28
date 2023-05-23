# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Mili\Documents\GitHub\Vjezbe-JP28\ribolovci.sql

# kreiranje baze

drop database if exists ribolovci;
create database ribolovci;
use ribolovci;

# kreiranje tablica

create table ulov(
    sifra int not null primary key auto_increment,
    clan int not null,
    vrstaRibe int not null,
    tezina decimal(5,2),
    natjecanje int
);

create table clan(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib char(11) not null,
    kontakt varchar(150),
    dozvola int not null
);

create table dozvola(
    sifra int not null primary key auto_increment,
    trajanje datetime not null,
    cijena decimal(6,2)
);

create table vrstaRibe(
    sifra int not null primary key auto_increment,
    naziv varchar(100)
);

create table natjecanje(
    sifra int not null primary key auto_increment,
    brojNatjecatelja int,
    rezultat decimal(6,2),
    datumIVrijeme datetime,
    mjesto varchar(50),
    voda varchar(50)
);

# kreiranje veza

alter table ulov add foreign key (clan) references clan (sifra);
alter table ulov add foreign key (vrstaRibe) references vrstaRibe (sifra);
alter table ulov add foreign key (natjecanje) references natjecanje (sifra);
alter table clan add foreign key (dozvola) references dozvola (sifra);

# punjenje

# insert into smjer (sifra,naziv,cijena,
# upisnina,trajanje,verificiran) values
# (null,'PHP programiranje',850,73,130,false);

insert into vrstaRibe (sifra,naziv)
values (1,'šaran'),(2,'som'),(3,'smuđ');

insert into dozvola (sifra,trajanje,cijena)
values (1,2025-01-01,99.99),(2,2024-01-01,66.66),(3,2123,999.99);

insert into clan (ime,prezime,oib,kontakt,dozvola)
values  ('Pero',null,'123456789','pero@net.hr',1),
        ('Đuro','Đurić','456789123','091/234-5678',2),
        ('Marko',null,789123456,null,3);

insert into natjecanje (brojNatjecatelja,rezultat,datumIVrijeme,mjesto,voda)
values  (123,23.45,2023-05-01,'Osijek','Drava'),
        (456,98.89,2022-06-11,'Našice','Lapovac'),
        (321,55.55,2021-08-15,'Ilok','Dunav');

insert into ulov (clan,vrstaRibe,tezina,natjecanje)
values  (1,2,12,3),(2,3,23,1),(3,1,31,2);

# izmjena

update clan set kontakt='Strossmayerova 69' where sifra=3;
update clan set prezime='Perić' where sifra=1;
update clan set prezime='Marić' where sifra=3;

# brisanje

# delete from ulov where natjecanje=1;
# delete from natjecanje where sifra=1;
