    
INSERT INTO stores VALUES(1, 'Mem Street', 70075, '504-789-5648');
INSERT INTO stores VALUES(2, 'Ops Avenue', 65944, '546-798-4321');
INSERT INTO stores VALUES(3, '316 High Coutt', 99648, '999-555-4820' );
INSERT INTO stores VALUES(4, '666 Hell Lane', 11111, '666-333-9999');
commit;

INSERT INTO inventory VALUES(15,'Banana', 'It is yellow', 100, 5, 2, 10, 20 );    
INSERT INTO inventory VALUES(20, 'Hammoock', 'Resting on the go', 50, 1, 25, 20,45);
INSERT INTO inventory VALUES(54, 'Wii' , 'Play Nintendo games', '20', 1, 180, 40, 8);
INSERT INTO inventory VALUES(99, 'Batman''s Suit', 'Fight crimes', 1, 1, 1000, 1, 1 );
commit;

INSERT INTO sale VALUES(64,to_date('07/12/2019', 'dd/mm/yyyy'), 800, 'Sold Batman''s Suit', 8, 1);
INSERT INTO sale VALUES(1, to_date('03/11/2018', 'dd/mm/yyyy'), 100, 'Sold Wii',14, 80);
INSERT INTO sale VALUES(10,to_date('25/04/2020', 'dd/mm/yyyy'), 5, 'Sold Banana', 25, 100 );
INSERT INTO sale VALUES(45,to_date('01/01/2018', 'dd/mm/yyyy'), 50,'Sold Hammock',10, 20 );
commit;

INSERT INTO purchaseAZ VALUES(10, to_date('30/01/2018', 'dd/mm/yyyy'), 30 ,'Bought Hammock',2);
INSERT INTO purchaseAZ VALUES(56, to_date('04/08/2020', 'dd/mm/yyyy'), 360,'Bought Wii',2);
INSERT INTO purchaseAZ VALUES(87, to_date('01/02/2017', 'dd/mm/yyyy'), 900 ,'Bought Batman''s Suit' ,1);
INSERT INTO purchaseAZ VALUES(101, to_date('24/10/2021', 'dd/mm/yyyy'),10 ,'Bought Banana',20);
commit;

INSERT INTO customerAZ VALUES(11, 87, 'Marley');
INSERT INTO customerAZ VALUES(12, 10, 'Bruce wyane');
INSERT INTO customerAZ VALUES(13, 101, 'Curious George');
INSERT INTO customerAZ VALUES(14, 56, 'Josh');
commit;

INSERT INTO supplierAZ VALUES(80, 1, 'Drake');
INSERT INTO supplierAZ VALUES(81, 64, 'Thanos');
INSERT INTO supplierAZ VALUES(82, 45, 'Godzilla');
INSERT INTO supplierAZ VALUES(83, 10, 'Ras');
commit;

INSERT INTO stock VALUES(1,15);
INSERT INTO stock VALUES(1,20);
INSERT INTO stock VALUES(1,54);
INSERT INTO stock VALUES(2,54);
INSERT INTO stock VALUES(2,99);
INSERT INTO stock VALUES(3,99);
INSERT INTO stock VALUES(4,99);
INSERT INTO stock VALUES(4,54);
INSERT INTO stock VALUES(4,20);
INSERT INTO stock VALUES(4,15);
commit;

INSERT INTO itemsold VALUES(10,15);
INSERT INTO itemsold VALUES(45,20);
INSERT INTO itemsold VALUES(1,54);
INSERT INTO itemsold VALUES(64,99);
commit;

INSERT INTO itembought VALUES(101 ,15);
INSERT INTO itembought VALUES(56 ,54);
INSERT INTO itembought VALUES(87 ,99);
INSERT INTO itembought VALUES(10 ,20);
commit;
