# c:\xampp\mysql\bin\mysql -uroot < C:\Users\Mili\Documents\GitHub\EdunovaJP28\urar_silvija.sql

drop database if exists urar_silvija;
create database urar_silvija;
use urar_silvija;
create table korisnik(
	ime varchar(50),
	prezime varchar(50),
	kontakt varchar(150) not null,
	obavijest boolean,
	id int not null primary key auto_increment
);

create table sat(
	marka varchar(50),
	vrsta varchar(50),
	kvar varchar(50) not null,
	korisnik int not null,
	id int not null primary key auto_increment
);

create table serviser(
	ime varchar(50) not null,
	sifra int not null primary key
);

create table zahvat(
	sat int not null,
	serviser int not null
);

create table servisni_list(
	korisnik int not null,
	sat int not null,
	serviser int not null,
	id int not null primary key auto_increment
);

alter table zahvat add foreign key (sat)
references sat (id);

alter table zahvat add foreign key (serviser)
references serviser (sifra);

alter table sat add foreign key (korisnik)
references korisnik(id);

alter table servisni_list add foreign key (korisnik)
references korisnik(id);

alter table servisni_list add foreign key (sat)
references sat (id);

alter table servisni_list add foreign key (serviser)
references serviser (sifra);