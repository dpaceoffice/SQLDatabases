--7. List the total number and the total sales ($) of every item in a given period of time (start
--date, end date) in AZ in the descending order of sales.


--8. List the ItemNbr, its title, and the total profit that made the biggest profit for AZ in 2018.
select inventory.itemnum, inventory.title, SUM(unitcost) AS Profit
FROM inventory, purchaseAZ, itembought 
WHERE inventory.itemnum = itembought.itemNbr AND itembought.purchasenbr = purchaseAZ.purchasenbr AND (purchase_date BETWEEN '01-JAN-2018' AND '31-DEC-2018') 
group by inventory.itemnum, inventory.title;

--9. Show the items for which the inventory is below the minimum level in AZ system.


--10. List the total sales in dollars made to each customer of GV in 2018.



--11. Show MaterialCode and MaterialName of the material(s) that GV purchased the most
--(measured by quantity) in the fourth quarter of 2018.

Select material.materialCode, material.materialName
FROM factory join searches on searches.factoryid = factory.factoryid
    join material on searches.materialcode = material.materialCode
    join purchaseline on purchaseline.materialCode = material.materialCode
    join purchaseGV on purchaseGV.purchaseNum = purchaseline.purchaseNum    
WHERE (paydate BETWEEN '01-OCT-2018' AND '31-DEC-2018') AND factory.factoryid = 1
        AND material.quantity = (SELECT MAX(material.quantity) 
                            FROM material, purchaseline, purchaseGV,searches, factory
                            WHERE purchaseline.materialCode = material.materialCode 
                                AND purchaseGV.purchaseNum = purchaseline.purchaseNum 
                                AND searches.materialcode = material.materialCode
                                AND searches.factoryid = factory.factoryid
                                AND (paydate BETWEEN '01-OCT-2018' AND '31-DEC-2018')
                                AND factory.factoryid = 1);

--12. Show the factory name that made the most total quantity of the product that was sold the
--most in 2018.

SELECT factory.factoryName, SUM(saleamount)
FROM factory join makes on factory.factoryid = makes.factoryid
    join product on product.productcode = makes.productcode
    join lineitem on lineitem.productcode = product.productcode
    join contract on lineitem.contractid = contract.contractid
WHERE (con_date BETWEEN '01-JAN-2018' AND '30-DEC-2018')
GROUP BY factory.factoryName;

SELECT SUM(quantity)
FROM product join lineitem on product.productcode = lineitem.productcode
    join contract on contract.contractid = lineitem.contractid
HAVING contract.saleamount = (SELECT MAX(saleamount)
                            FROM contract
                            WHERE con_date BETWEEN '01-JAN-2018' AND '30-DEC-2018')
ORDER BY contract.contractid;            
                
                            