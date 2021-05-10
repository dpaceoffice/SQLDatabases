DROP TABLE stock;
DROP TABLE itemsold;
DROP TABLE itembought;
DROP TABLE customerAZ;
DROP TABLE supplierAZ;
DROP TABLE stores;
DROP TABLE inventory;
DROP TABLE sale;
DROP TABLE purchaseAZ;

CREATE TABLE stores (
    storeid  NUMBER,
    address  VARCHAR(100),
    zipcode  NUMBER(5),
    phone    CHAR(12),
    
    CONSTRAINT store_pk PRIMARY KEY ( storeid )
);

CREATE TABLE inventory (
    itemnum       NUMBER,
    title         VARCHAR(100),
    descriptions  VARCHAR(100),
    quantity      NUMBER,
    unit          NUMBER,
    avgcost       NUMBER,
    shelfcode     NUMBER,
    minlevel      NUMBER,

    CONSTRAINT inventory_pk PRIMARY KEY ( itemnum )
);

CREATE TABLE sale (
    invoicenbr  NUMBER,
    sale_date   DATE,
    price       NUMBER,
    note        VARCHAR(100),
    minlevel    NUMBER,
    quantity     NUMBER,
    
    CONSTRAINT sale_pk PRIMARY KEY ( invoicenbr )
);

CREATE TABLE purchaseAZ (
    purchasenbr   NUMBER,
    purchase_date  DATE,
    unitcost      NUMBER,
    note          VARCHAR(100),
    quantity      NUMBER,
    
    CONSTRAINT purchaseAZ_pk PRIMARY KEY ( purchasenbr )
);

CREATE TABlE customerAZ(
    customerID      NUMBER,
    purchaseNbr      NUMBER,
    customerName    VARCHAR(100),
    
    CONSTRAINT customerAZ_PK PRIMARY KEY (customerID),
    CONSTRAINT customerAZ_FK FOREIGN KEY (purchaseNbr) REFERENCES purchaseAZ (purchasenbr)
);

CREATE TABlE supplierAZ(
    supplierID      NUMBER,
    invoiceNbr      NUMBER,
    customerName    VARCHAR(100),
    
    CONSTRAINT supplierAZ_PK PRIMARY KEY (supplierID),
    CONSTRAINT supplierAZ_FK FOREIGN KEY (invoiceNbr) REFERENCES sale (invoicenbr)
);
--Realationals

CREATE TABLE stock (
    storeid  NUMBER,
    itemnum  NUMBER,
    
    CONSTRAINT stocks_pk PRIMARY KEY ( storeid,
                                       itemnum ),
    CONSTRAINT stock_fk FOREIGN KEY ( storeid )
        REFERENCES stores ( storeid ),
    CONSTRAINT stock_fk_2 FOREIGN KEY ( itemnum )
        REFERENCES inventory ( itemnum )
);

CREATE TABLE itemsold (
    invoicenbr  NUMBER,
    itemnbr     NUMBER,
    
    CONSTRAINT itemsold_pk PRIMARY KEY ( invoicenbr,
                                         itemnbr ),
    CONSTRAINT itemsold_fk FOREIGN KEY ( invoicenbr )
        REFERENCES sale ( invoicenbr ),
    CONSTRAINT itemsold_fk_2 FOREIGN KEY ( itemnbr )
        REFERENCES inventory ( itemnum )
);

CREATE TABLE itembought (
    purchasenbr  NUMBER,
    itemnbr      NUMBER,
    
    CONSTRAINT itembought_pk PRIMARY KEY ( purchasenbr,
                                           itemnbr ),
    CONSTRAINT itembought_fk FOREIGN KEY ( purchasenbr )
        REFERENCES purchaseAZ ( purchasenbr ),
    CONSTRAINT itembought_fk_2 FOREIGN KEY ( itemnbr )
        REFERENCES inventory ( itemnum )
);