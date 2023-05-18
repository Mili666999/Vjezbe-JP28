# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Mili\Documents\GitHub\Vjezbe-JP28\udrugaZaZastituZivotinja_DenisSimov.sql

drop database if exists udruga_za_zastitu_zivotinja;
create database udruga_za_zastitu_zivotinja;
use udruga_za_zastitu_zivotinja;

create table udruga(
	sifra int not null primary key auto_increment,
	naziv varchar(100) not null,
	kontakt varchar(50),
	adresa varchar(100),
	broj_racuna varchar(50)
);

create table osoba(
	sifra int not null primary key auto_increment,
	ime varchar(25) not null,
	prezime varchar(25) not null,
	iban varchar(50),
	broj_ugovora varchar(50)
);

create table sticenik(
	sifra int not null primary key auto_increment,
	ime varchar(20) not null,
	pasmina varchar(50),
	osoba int not null,
	dob int,
	spol char(1)
);

create table prostor(
	sifra int not null primary key auto_increment,
	velicina varchar(30),
	sticenik int,
	broj_prostora int
);

create table clan(
	osoba int not null,
	udruga int not null
);

alter table sticenik add foreign key (osoba) references osoba(sifra);
alter table prostor add foreign key (sticenik) references sticenik(sifra);
alter table clan add foreign key (osoba) references osoba(sifra);
alter table clan add foreign key (udruga) references udruga(sifra);

insert into osoba (sifra, ime, prezime, iban, broj_ugovora) values
(null, 'Denis', 'Simov', null, '2314/2023'),
(null, 'Mladen', 'Petrić', null, '5345/2023'),
(null, 'Iva', 'Majoli', null, '9732/2023');

insert into udruga (sifra, naziv, kontakt, adresa, broj_racuna) values
(null, 'Mali Ratnici', null, null, null),
(null, 'Šapica', null, null, null),
(null, 'Najbolji prijatelj', null, null, null);

insert into clan (osoba, udruga) values
(1,1),
(2,2),
(3,3);

insert into sticenik (sifra, ime, pasmina, osoba, dob, spol) values
(null, 'Lepi', 'Doberman', 1, 6, 'M'),
(null, 'Žućo', null, 2, 1, 'M'),
(null, 'Lenka', 'Retriver', 3, 10, 'Ž');

insert into prostor (sifra, velicina, sticenik, broj_prostora) values
(null, '2x2', 1, 10),
(null, '2.2x2', 2, null),
(null, '1.5x3', 3, 8);
