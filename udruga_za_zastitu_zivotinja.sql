# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Mili\Documents\GitHub\Vjezbe-JP28\udruga_za_zastitu_zivotinja.sql

# kreiranje baze
drop database if exists udrugazzz;
create database udrugazzz;
use udrugazzz;

# kreiranje tablica
create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50),
    oib varchar(11)
);

create table zivotinja(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    vrsta varchar(50) not null,
    osoba int 
);

create table prostor(
    sifra int not null primary key auto_increment,
    broj int not null,
    zivotinja int
);