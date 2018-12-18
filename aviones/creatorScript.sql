-- Author: Rojo Revenga, Miguel
-- Create Date: November 2017
-- Description: Database creation and population for flight trips management


drop table Embarque;
drop table Vuelo;
drop table Aeropuerto;
drop table Cliente;
drop table Aerolinea;


create table Aerolinea (
  alid char(10),
  nombre char(10),
  primary key (alid)
);

create table Cliente (
  cid char(10),
  nombre char(10),
  fdn date,
  tarjalid char(10),
  primary key (cid),
  foreign key (tarjalid) references Aerolinea (alid)
);

create table Aeropuerto (
  apid char(10),
  ciudad char(10),
  primary key (apid)
);

create table Vuelo (
  vid char(10),
  origen char(10),
  destino char(10),
  alid char(10),
  horas time,
  horall time,
  primary key (vid),
  foreign key (origen) references Aeropuerto (apid),
  foreign key (destino) references Aeropuerto (apid),
  foreign key (alid) references Aerolinea (alid)
);

create table Embarque (
  cid char(10),
  vid char(10),
  fecha date,
  primary key (cid,vid,fecha),
  foreign key (cid) references Cliente (cid),
  foreign key (vid) references Vuelo (vid)
);



insert into Aerolinea values ('01QA', 'Qantas');
insert into Aerolinea values ('02AL', 'Air Lingus');
insert into Aerolinea values ('03AC', 'Air China');
insert into Aerolinea values ('04AC', 'Air Canada');
insert into Aerolinea values ('05IB', 'Iberia');
insert into Aerolinea values ('06AF', 'Air France');
insert into Aerolinea values ('07AE', 'AirEuropa');
insert into Aerolinea values ('08AI', 'Air India');
insert into Aerolinea values ('09FI', 'Finnair');
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
insert into Cliente values ('user0', 'Davis', '1998-04-24', '01QA');
insert into Cliente values ('user1', 'King', '1977-04-12', '01QA');
insert into Cliente values ('user2', 'Green', '1991-04-12', '01QA');
insert into Cliente values ('user3', 'Martin', '1981-04-12', '02AL');
insert into Cliente values ('user4', 'Wright', '1978-04-12', '02AL');
insert into Cliente values ('user5', 'Davis', '1977-12-01', '03AC');
insert into Cliente values ('user6', 'Johnson', '1985-09-03', '04AC');
insert into Cliente values ('user7', 'Rodriguez', '1969-05-14', '05IB');
insert into Cliente values ('user8', 'Gonzalez', '1977-03-23', '05IB');
insert into Cliente values ('user9', 'Lewis', '1972-03-23', '05IB');
insert into Cliente values ('user10', 'Taylor', '1975-08-16', '06AF');
insert into Cliente values ('user11', 'Walker', '1974-11-06', '06AF');
insert into Cliente values ('user12', 'Anderson', '1995-06-11', '07AE');
insert into Cliente values ('user13', 'Clark', '1992-07-26', '08AI');
insert into Cliente values ('user14', 'Davis', '1975-08-10', '08AI');
insert into Cliente values ('user15', 'Edwards', '1977-04-29', '08AI');
insert into Cliente values ('user16', 'Gonzalez', '1982-10-09', '08AI');
insert into Cliente values ('user17', 'Harris', '1988-12-27', '08AI');
insert into Cliente values ('user18', 'Harris', '1997-04-19', '09FI');
insert into Cliente values ('user19', 'Edwards', '1969-08-23', '09FI');
insert into Cliente values ('user20', 'Charles', '1976-09-10', '09FI');
insert into Cliente values ('user21', 'García', '1993-10-20', '09FI');
insert into Cliente values ('user22', 'García', '1970-04-19', '09FI');
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
insert into Aeropuerto values ('ap01', 'Valladolid');
insert into Aeropuerto values ('ap02', 'Palencia');
insert into Aeropuerto values ('ap03', 'Burgos');
insert into Aeropuerto values ('ap04', 'León');
insert into Aeropuerto values ('ap05', 'Zamora');
insert into Aeropuerto values ('ap06', 'Salamanca');
insert into Aeropuerto values ('ap07', 'Segovia');
insert into Aeropuerto values ('ap08', 'Soria');
insert into Aeropuerto values ('ap09', 'Ávila');
insert into Aeropuerto values ('ap10', 'Madrid');
insert into Aeropuerto values ('ap11', 'Barcelona');
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
insert into Vuelo values ('v01', 'ap01', 'ap02', '01QA', '12:00:00', '15:00:00');
insert into Vuelo values ('v02', 'ap01', 'ap03', '01QA', '13:00:00', '16:00:00');
insert into Vuelo values ('v03', 'ap01', 'ap04', '02AL', '14:00:00', '17:00:00');
insert into Vuelo values ('v04', 'ap01', 'ap05', '02AL', '15:00:00', '18:00:00');
insert into Vuelo values ('v05', 'ap01', 'ap06', '03AC', '16:00:00', '19:00:00');
insert into Vuelo values ('v06', 'ap01', 'ap07', '03AC', '17:00:00', '20:00:00');
insert into Vuelo values ('v07', 'ap01', 'ap08', '07AE', '18:00:00', '21:00:00');
insert into Vuelo values ('v08', 'ap01', 'ap09', '07AE', '19:00:00', '22:00:00');
insert into Vuelo values ('v09', 'ap01', 'ap10', '07AE', '20:00:00', '23:00:00');
insert into Vuelo values ('v10', 'ap01', 'ap11', '07AE', '21:00:00', '23:00:00');
insert into Vuelo values ('v11', 'ap01', 'ap07', '03AC', '17:00:00', '20:00:00');
insert into Vuelo values ('v12', 'ap01', 'ap08', '07AE', '18:00:00', '21:00:00');
insert into Vuelo values ('v13', 'ap01', 'ap09', '07AE', '19:00:00', '22:00:00');
insert into Vuelo values ('v14', 'ap01', 'ap10', '07AE', '20:00:00', '23:00:00');
insert into Vuelo values ('v15', 'ap01', 'ap11', '07AE', '21:00:00', '23:00:00');
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
insert into Embarque values ('user1', 'v01', '2011-04-12');
insert into Embarque values ('user2', 'v01', '2011-04-12');
insert into Embarque values ('user3', 'v01', '2011-04-12');
insert into Embarque values ('user4', 'v01', '2011-04-12');
insert into Embarque values ('user20', 'v01', '2011-04-12');
insert into Embarque values ('user21', 'v01', '2011-04-12');
insert into Embarque values ('user22', 'v01', '2011-04-12');
insert into Embarque values ('user1', 'v02', '2011-04-13');
insert into Embarque values ('user2', 'v02', '2011-04-13');
insert into Embarque values ('user3', 'v02', '2011-04-13');
insert into Embarque values ('user4', 'v02', '2011-04-13');
insert into Embarque values ('user22', 'v02', '2011-04-13');
insert into Embarque values ('user21', 'v02', '2011-04-13');
insert into Embarque values ('user1', 'v03', '2011-04-14');
insert into Embarque values ('user6', 'v03', '2011-04-14');
insert into Embarque values ('user7', 'v03', '2011-04-14');
insert into Embarque values ('user22', 'v04', '2011-04-15');
insert into Embarque values ('user2', 'v04', '2011-04-15');
insert into Embarque values ('user2', 'v05', '2011-04-16');
insert into Embarque values ('user1', 'v05', '2011-04-16');
insert into Embarque values ('user4', 'v06', '2011-04-17');
insert into Embarque values ('user5', 'v06', '2011-04-17');
insert into Embarque values ('user6', 'v06', '2011-04-17');
insert into Embarque values ('user7', 'v06', '2011-04-17');
insert into Embarque values ('user8', 'v06', '2011-04-17');
insert into Embarque values ('user2', 'v07', '2011-04-18');
insert into Embarque values ('user4', 'v07', '2011-04-18');
insert into Embarque values ('user3', 'v07', '2011-04-18');
insert into Embarque values ('user1', 'v07', '2011-04-18');
insert into Embarque values ('user18', 'v08', '2011-04-19');
insert into Embarque values ('user22', 'v08', '2011-04-19');
