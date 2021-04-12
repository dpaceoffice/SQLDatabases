-- TODO: Fill the inserts, need about 3 to 4 inserts per table
INSERT INTO gics VALUES
INSERT INTO gics VALUES
INSERT INTO gics VALUES
INSERT INTO gics VALUES

commit;

INSERT INTO person VALUES
INSERT INTO person VALUES
INSERT INTO person VALUES
INSERT INTO person VALUES

commit;

INSERT INTO company VALUES
INSERT INTO company VALUES
INSERT INTO company VALUES
INSERT INTO company VALUES

commit;

INSERT INTO address VALUES
INSERT INTO address VALUES
INSERT INTO address VALUES
INSERT INTO address VALUES

commit;

INSERT INTO position VALUES
INSERT INTO position VALUES
INSERT INTO position VALUES
INSERT INTO position VALUES

commit;

INSERT INTO payrate VALUES
INSERT INTO payrate VALUES
INSERT INTO payrate VALUES
INSERT INTO payrate VALUES

commit;

INSERT INTO job VALUES
INSERT INTO job VALUES
INSERT INTO job VALUES
INSERT INTO job VALUES

commit;

INSERT INTO skil VALUES
INSERT INTO skil VALUES
INSERT INTO skil VALUES
INSERT INTO skil VALUES

commit;

INSERT INTO requirement VALUES
INSERT INTO requirement VALUES
INSERT INTO requirement VALUES
INSERT INTO requirement VALUES

commit;

INSERT INTO course VALUES
INSERT INTO course VALUES
INSERT INTO course VALUES
INSERT INTO course VALUES

commit;

INSERT INTO section VALUES
INSERT INTO section VALUES
INSERT INTO section VALUES
INSERT INTO section VALUES

commit;

---------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO store VALUES (1, '608 Joe Mama', 70072, '504-988-4742');
INSERT INTO store VALUES (2, '897 Maydu Street', 70078, '504-988-8975');
INSERT INTO store VALUES (3, '625 Lema Avenue', 70052, '504-988-6563');
INSERT INTO store VALUES (4, '879 Ligma Court', 70089, '504-988-3465');

commit;

INSERT INTO stocks VALUES (1,23);
INSERT INTO stocks VALUES (2,26);
INSERT INTO stocks VALUES (3,65);
INSERT INTO stocks VALUES (4,81);

commit;

INSERT INTO inventory VALUES (23, 'Milk', 'White', 30, 1, 15, 13, 10 );
INSERT INTO inventory VALUES (26, 'Egg', 'Brown Oval',50, 12, 10, 8, 4);
INSERT INTO inventory VALUES (65, 'Banana','Yellow', 20, 5, 7, 6, 8);
INSERT INTO inventory VALUES (81, 'Salmon', 'Orange', 34, 1, 20, 25, 15);

commit;

INSERT INTO sale VALUES (45, to_date('07/12/2010', 'dd/mm/yyyy'), 23, 30, 14,'Expire early', 10);
INSERT INTO sale VALUES (46, to_date('25/04/2020', 'dd/mm/yyyy'), 26, 50, 11,'Commonly in dozen', 4);
INSERT INTO sale VALUES (47, to_date('16/03/2021', 'dd/mm/yyyy'), 65, 20, 6,'Green is not spoil', 8);
INSERT INTO sale VALUES (48, to_date('30/10/2019', 'dd/mm/yyyy'), 81, 34, 21,'4 inches long', 15);

commit;

INSERT INTO purchaseaz VALUES (100, to_date('12/12/2010', 'dd/mm/yyyy'), 23, 1, 16, 'One that last longer');
INSERT INTO purchaseaz VALUES (101, to_date('30/04/2020', 'dd/mm/yyyy'), 26, 2, 13, 'Need 2 dozen');
INSERT INTO purchaseaz VALUES (102, to_date('23/03/2021', 'dd/mm/yyyy'), 65, 1, 8, 'Green mean it last longer');
INSERT INTO purchaseaz VALUES (103, to_date('03/11/2019', 'dd/mm/yyyy'), 81, 5, 23, 'Get the longest one');

commit;
----------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO factory VALUES (50, 'Stellar', '548 Dweb Street', 77205,'504-987-8864', 'Carl');
INSERT INTO factory VALUES (51, 'Telsa', '21 Jump Street', 52003,'654-886-7913', 'Braken');
INSERT INTO factory VALUES (52, 'Nikola', '420 Beethoven Avenue', 70056, '231-504-5048', 'Niko');
INSERT INTO factory VALUES (53, 'Orbis', '62 Orcale Lane', 65002, '563-989-4223', 'Eden');

commit;

INSERT INTO searches VALUES (50,123);
INSERT INTO searches VALUES (51,156);
INSERT INTO searches VALUES (52,236);
INSERT INTO searches VALUES (53,300);

commit;

INSERT INTO material VALUES (123, 'Iron', 100, 5, 10);
INSERT INTO material VALUES (156, 'Copper', 30, 6, 12);
INSERT INTO material VALUES (236, 'Uranium', 25, 3, 25);
INSERT INTO material VALUES (300, 'Vibranium', 15, 1, 20;

commit;
 
INSERT INTO product VALUES (10, 'Fridge', 'Freeze food', 20, 1, 100);
INSERT INTO product VALUES (11, 'Wire', 'Electrical wiring', 100, 5, 25);
INSERT INTO product VALUES (12, 'Reactor', 'Alternative energy', 5, 1, 2000);
INSERT INTO product VALUES (13, 'Shield', 'Denfense and offense', 3, 1, 1500);

commit;

INSERT INTO contract VALUES (654, 456,to_date('12/08/2010', 'dd/mm/yyyy'),200,to_date('30/12/2010', 'dd/mm/yyyy'));
INSERT INTO contract VALUES (253, 352,to_date('11/12/2015', 'dd/mm/yyyy'),100,to_date('05/03/2016', 'dd/mm/yyyy'));
INSERT INTO contract VALUES (879, 421,to_date('05/26/2019', 'dd/mm/yyyy'),1800,to_date('01/01/2020', 'dd/mm/yyyy'));
INSERT INTO contract VALUES (666, 777,to_date('09/09/2021', 'dd/mm/yyyy'),1250,to_date('12/12/2021', 'dd/mm/yyyy'));

commit;

INSERT INTO lineitem VALUES (654, 10, 20);
INSERT INTO lineitem VALUES (253,11, 100);
INSERT INTO lineitem VALUES (879,12, 5);
INSERT INTO lineitem VALUES (666,13, 3);

commit;

INSERT INTO purhcase VALUES (101, 999, 90, to_date('12/12/2010', 'dd/mm/yyyy'), to_date('12/12/2010', 'dd/mm/yyyy'), 'Notw');
INSERT INTO purhcase VALUES (103, 111, 65, to_date('12/12/2010', 'dd/mm/yyyy'), to_date('12/12/2010', 'dd/mm/yyyy'), '');
INSERT INTO purhcase VALUES (105, 333, 33, to_date('12/12/2010', 'dd/mm/yyyy'), to_date('12/12/2010', 'dd/mm/yyyy'), '');
INSERT INTO purhcase VALUES (110, 555, 77, to_date('12/12/2010', 'dd/mm/yyyy'), to_date('12/12/2010', 'dd/mm/yyyy'), '');

commit;

INSERT INTO purhcaseline VALUES (101, 123, 100);
INSERT INTO purhcaseline VALUES (103, 156, 30);
INSERT INTO purhcaseline VALUES (105, 236, 25);
INSERT INTO purhcaseline VALUES (110, 300, 15);

commit;

INSERT INTO supplier VALUES (999, 'www.Buber.com', 'buber@gmail.com');
INSERT INTO supplier VALUES (111, 'www.Wubber.om', 'wubbersupport@yahoo.com');
INSERT INTO supplier VALUES (333, 'www.NASE.org', 'nasenotnasa@hotmail.com');
INSERT INTO supplier VALUES (555, 'www.Owo.net', 'uwuowo@gmail.com');

commit;

INSERT INTO customer VALUES (456, 'Marley', 'marley123@gmail.com');
INSERT INTO customer VALUES (352, 'Eldiana', 'eldia522@gmail.com');
INSERT INTO customer VALUES (421, 'Galio', 'galioLol@yahoo.com');
INSERT INTO customer VALUES (777, 'Jesus', 'itsjesus69@heaven.com');

commit;

INSERT INTO makes VALUES (50, 10, 20);
INSERT INTO makes VALUES (51, 11, 100);
INSERT INTO makes VALUES (52, 12, 5);
INSERT INTO makes VALUES (53, 13, 3);

commit;