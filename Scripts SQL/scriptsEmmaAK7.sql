use BD_CIBCM;

Insert into Persona values('115825968','Paco','Mora','Torres','19980901','TRUE');
Insert into Persona values('118258695','Juana','Arce','Arias','19950901',0);
Insert into Persona values('114825968','Valeria','Villalobos','Porras','19980901','TRUE');
Insert into Persona values('113258695','Marcela','Matamoros','Arce','19950901',0);
Insert into Persona values('112825968','Luis','Hidalgo','Castillo','19980901','TRUE');
Insert into Persona values('111258695','Pedro','Gonzales','Baltodano','19950901',0);
Insert into Persona values('115525968','Joshua','Yglesias','Castro','19980901','TRUE');
Insert into Persona values('118268695','Isabel','Dalolio','Rodriguez','19950901',0);

Insert into Paciente values('118258695');
Insert into Paciente values('115825968');

Insert into Paciente values('114825968');
Insert into Paciente values('113258695');

Insert into Paciente values('112825968');
Insert into Paciente values('111258695');

Insert into Persona values('110000095','Fran','Chavez','Granados','19950901',0);
Insert into Persona values('114458968','Pedro','Mora','Torres','19980901','TRUE');
Insert into Persona values('118568695','Gloriana','Arce','Ballester','19950901',0);

Insert into Investigador values('110000095');
Insert into Investigador values('114458968');
Insert into Investigador values('118568695');


select pe.PrimerNombre, pe.Apellido1, pe.Apellido2, pe.Cedula
from paciente pa join persona pe
	on pa.Cedula = pe.Cedula;

select P.PrimerNombre, P.Apellido1, P.Apellido2,P.Cedula
From Investigador I JOIN Persona P
ON I.Cedula = P.Cedula;


Select D.Fecha,D.Enfermedad,D.NumDiagnostico,I.PrimerNombre,I.Apellido1
From (Parcial P Join Diagnostico D
	 ON (P.Cedula = D.Cedula AND P.NumDiagnostico = D.NumDiagnostico) Join
	 Persona I ON P.CedInvestigador = I.Cedula);

INSERT INTO InstrumentosClinicos VALUES('Consumo de tabaco');
INSERT INTO InstrumentosClinicos VALUES('Habitos alimenticios');
INSERT INTO InstrumentosClinicos VALUES('Uso de bronceadores');

INSERT INTO Lleno VALUES('112825968', 'Consumo de tabaco');
INSERT INTO Lleno VALUES('112825968', 'Habitos alimenticios');
INSERT INTO Lleno VALUES('112825968', 'Uso de bronceadores');
INSERT INTO Lleno VALUES('113258695', 'Uso de bronceadores');

DELETE FROM Lleno WHERE Cedula = '112825968'; 

SELECT Cedula, NombreInstrumentoClinico FROM Lleno WHERE Cedula='112825968';

SELECT i.Nombre, COUNT(l.Cedula) as 'Personas que han llenado el instrumento' 
FROM InstrumentosClinicos i LEFT JOIN Lleno l 
ON i.Nombre = l.NombreInstrumentoClinico 
GROUP BY i.Nombre;

SELECT p.PrimerNombre as 'Nombre', p.Apellido1 as 'Primer Apellido', p.Apellido2 as 'Segundo Apellido' 
FROM Persona p JOIN Lleno l 
ON p.Cedula = l.Cedula 
WHERE l.NombreInstrumentoClinico = 'Consumo de tabaco';

INSERT INTO Estudio VALUES('111111', 'Los monos piensan?', '2015-10-22');
INSERT INTO Estudio VALUES('222222', 'Sumas y restas para delfines', '2015-02-17');
INSERT INTO Estudio VALUES('333333', 'Red Bull para ratones', '2015-10-09');
INSERT INTO Estudio VALUES('444444', 'Supervivencia en la UCR', '2015-01-05');

INSERT INTO Realiza VALUES ('114458968', '222222');
INSERT INTO Realiza VALUES ('110000095', '222222');
INSERT INTO Realiza VALUES ('114458968', '444444');

SELECT e.CodigoEstudio, e.Descripcion, COUNT(r.Cedula) as 'Investigadores que realizan el estudio' 
FROM Estudio e LEFT JOIN Realiza r
ON e.CodigoEstudio = r.CodigoEstudio
GROUP BY e.CodigoEstudio, e.Descripcion

SELECT p.PrimerNombre as 'Nombre', p.Apellido1 as 'Primer Apellido', p.Apellido2 as 'Segundo Apellido' 
FROM Persona p JOIN Realiza r 
ON p.Cedula = r.Cedula 
WHERE r.CodigoEstudio = '222222';