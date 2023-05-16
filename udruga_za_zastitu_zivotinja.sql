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

# kreiranje veza
alter table prostor add foreign key (zivotinja)
references zivotinja (sifra);

alter table zivotinja add foreign key (osoba)
references osoba (sifra);

# dodavanje podataka u bazu
insert into osoba (sifra,ime,prezime,oib)
values (null,'Pero','Perić',123456789),
		(null,'Marko','Marić',456789123),
		(null,'Ivan','Ivić',789123456);

insert into zivotinja (sifra,ime,vrsta,osoba)
values (null,'Medo','pas',1),
		(null,'Micko','mačka',2),
		(null,'Garo','pas',1);

insert into prostor (sifra,broj,zivotinja)
values (null,1,1),
		(null,2,2),
		(null,5,3);
