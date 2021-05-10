
insert into factory values(1, 'GV', '123 BOP Lane', 12345, 'Obby');
insert into factory values(2, 'WOOP', '456 WOOP Way', 56482, 'Woopy');
insert into factory values(3, 'BOOP', '789 BOOP Court', 32975, 'Boopie');
commit;  
 
insert into product values(1, 'Batarang', 'Batshape ninjastar', 150, 3, 20, 30);
insert into product values(2, 'Statue of Liberty','FREEDOM!!!', 1500, 1, 10, 2 );
insert into product values(3, 'Ironman Suit', 'Smart and Rich', 2000, 1, 11, 1);
insert into product values(4, 'Robotic Dog', 'Better than a real dog', 200, 1, 36, 10);
insert into product values(5, 'Razer Laptop', 'Gaming on the go', 500, 1 , 5, 5);
insert into product values(6, 'Lambo' ,'A very fast car', 2000,1, 87, 50);
insert into product values(7, 'Pillow Pet', 'Animal shape pillow', 50, 2, 54 ,300);
insert into product values(8, 'Yoga Ball', 'A round elsatic balll fill with air', 100, 1, 41, 46);
commit;

insert into contract values(11, 2250, to_date('18/06/2020', 'dd/mm/yyyy'), to_date('25/07/2020', 'dd/mm/yyyy'));
insert into contract values(12, 1500, to_date('16/07/2018', 'dd/mm/yyyy'), to_date('05/08/2018', 'dd/mm/yyyy'));
insert into contract values(13, 2000, to_date('01/08/2019', 'dd/mm/yyyy'), to_date('01/09/2019', 'dd/mm/yyyy'));
insert into contract values(14, 1000, to_date('30/09/2018', 'dd/mm/yyyy'), to_date('15/10/2018', 'dd/mm/yyyy'));
insert into contract values(15, 1500, to_date('11/10/2018', 'dd/mm/yyyy'), to_date('23/11/2018', 'dd/mm/yyyy'));
insert into contract values(16, 4000, to_date('09/11/2019', 'dd/mm/yyyy'), to_date('17/12/2019', 'dd/mm/yyyy'));
insert into contract values(17, 5000, to_date('23/12/2018', 'dd/mm/yyyy'), to_date('30/12/2018', 'dd/mm/yyyy'));
insert into contract values(18, 4000, to_date('27/05/2021', 'dd/mm/yyyy'), to_date('10/06/2021', 'dd/mm/yyyy'));
commit;

insert into makes values(1,1);
insert into makes values(1,2);
insert into makes values(2,3);
insert into makes values(2,4);
insert into makes values(2,5);
insert into makes values(3,6);
insert into makes values(3,7);
insert into makes values(3,8);
commit;

insert into lineitem values(11,1);
insert into lineitem values(12,2);
insert into lineitem values(13,3);
insert into lineitem values(14,4);
insert into lineitem values(15,5);
insert into lineitem values(16,6);
insert into lineitem values(17,7);
insert into lineitem values(18,8);
commit;

insert into material values (1, 'Iron' , 4 , 8  , 100);
insert into material values (2, 'Lead' , 10 , 45 , 50);
insert into material values (3, 'Vibranium', 50 , 64  , 1000);
insert into material values (4, 'Potassium' , 51 , 10 , 25);
insert into material values (5, 'Copper', 35 , 18  , 521);
insert into material values (6, 'Gold', 99 , 5  , 800);
commit;

insert into purchaseGV values (1, to_date('23/06/2018', 'dd/mm/yyyy'), to_date('30/08/2018', 'dd/mm/yyyy'), 'Bought Gold', 5);
insert into purchaseGV values (2, to_date('15/05/2018', 'dd/mm/yyyy'), to_date('09/11/2018', 'dd/mm/yyyy'), 'Bought Vibranium', 6);
insert into purchaseGV values (3, to_date('24/09/2018', 'dd/mm/yyyy'), to_date('30/10/2018', 'dd/mm/yyyy'), 'Bought Potassium', 7);
insert into purchaseGV values (4, to_date('19/07/2018', 'dd/mm/yyyy'), to_date('29/01/2019', 'dd/mm/yyyy'), 'Bought Iron', 8);
insert into purchaseGV values (5, to_date('09/08/2018', 'dd/mm/yyyy'), to_date('01/02/2019', 'dd/mm/yyyy'), 'Bought Lead', 9);
insert into purchaseGV values (6, to_date('30/11/2018', 'dd/mm/yyyy'), to_date('30/12/2018', 'dd/mm/yyyy'), 'Bought Copper', 10);
commit;

insert into searches values (1,1);
insert into searches values (1,2);
insert into searches values (1,3);
insert into searches values (1,4);
insert into searches values (1,5);
insert into searches values (1,6);
commit;

insert into purchaseline values (1, 6);
insert into purchaseline values (2, 3);
insert into purchaseline values (3, 4);
insert into purchaseline values (4, 1);
insert into purchaseline values (5, 2);
insert into purchaseline values (6, 5);
commit;