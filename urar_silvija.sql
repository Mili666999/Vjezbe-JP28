# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Mili\Documents\GitHub\EdunovaJP28\urar_silvija.sql

# kreiranje baze
drop database if exists urar_silvija;
create database urar_silvija;
use urar_silvija;

# kreiranje tablica
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
	korisnik int,
	id int not null primary key auto_increment
);

create table serviser(
	ime varchar(50) not null,
	sifra int not null primary key
);

create table zahvat(
	sat int not null,
	serviser int,
	opis varchar(50) not null
);

create table servisni_list(
	korisnik int not null,
	sat int,
	serviser int not null,
	id int not null primary key auto_increment
);

# kreiranje veza
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

# unos podataka
insert into korisnik (ime,prezime,kontakt,obavijest,id)
values  ('Pero','Perić','pero@net.hr',null,null),
		('Marko','Marić','0912345678',true,null),
		('Ivan','Ivić','031123456',false,null);

insert into serviser (ime,sifra)
values  ('XXX',666),
		('YYY',999);

insert into sat (marka,vrsta,kvar,korisnik,id)
values	('Casio','ručni/digitalni','kasni',1,null),
		('Seiko','ručni/mehanički','žuri',1,null),
		(null,'vekerica','ne zvoni',3,null);

insert into zahvat (sat,serviser,opis)
values	(1,666,'promjena baterije'),
		(2,666,'čišćenje'),
		(3,999,'navijanje');

insert into servisni_list (korisnik,sat,serviser,id)
values	(1,2,666,null),
		(2,1,999,null),
		(3,3,999,null);
