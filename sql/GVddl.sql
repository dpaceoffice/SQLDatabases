DROP TABLE contractsale; 
DROP TABLE  purchaseInfo;
DROP TABLE  lineitem;
DROP TABLE  puchaseline;
DROP TABLE  makes;
DROP TABLE  searches;
DROP TABLE  factory;
DROP TABLE  material;
DROP TABLE  product;
DROP TABLE  contract;
DROP TABLE  purchaseGV;
DROP TABLE  supplier;
DROP TABLE  customer;

CREATE TABLE factory (
    factoryid    NUMBER,
    factoryname  VARCHAR(100),
    address      VARCHAR(100),
    zipcode      NUMBER(5),
    managername  VARCHAR(50),
    
    CONSTRAINT factor_pk PRIMARY KEY ( factoryid )
);

CREATE TABLE material (
    materialCode  NUMBER,
    materialName  VARCHAR(50),
    unit          NUMBER,
    minlevel      NUMBER,
    quantity      NUMBER,
    
    CONSTRAINT material_pk PRIMARY KEY ( materialcode )
);

CREATE TABLE product(
    productCode     NUMBER,
    productName     VARCHAR(100),
    descriptions    VARCHAR(100),
    unit            NUMBER,
    minLevel        NUMBER,
    quantity        NUMBER,
    
    CONSTRAINT product_PK PRIMARY KEY (productCode)
);

CREATE TABLE contract(
    contractID  NUMBER,
    con_date    DATE,
    paySchedule Date,
    saleAmount  NUMBER,
    
    CONSTRAINT contract_PK PRIMARY KEY (contractID)
);

CREATE TABLE purchaseGV(
    purchaseNum         NUMBER,
    bookDate            DATE,
    payDate             DATE,
    note                VARCHAR(100),
    supplierOrderNum    NUMBER,
    
    CONSTRAINT purchase_PK PRIMARY KEY (purchaseNum)
);

CREATE TABLE supplier(
    companyID       NUMBER,
    website         VARCHAR(100),
    conctactEmail   VARCHAR(100),
    
    CONSTRAINT supplier_PK PRIMARY KEY (companyID)
);

CREATE TABLE customer(
    companyID       NUMBER,
    contactPerson   VARCHAR(50),
    contactEmail    VARCHAR(100),
    
    CONSTRAINT customer_PK PRIMARY KEY (companyID)
);

--Relational

CREATE TABLE contractsale(
    contractID  NUMBER,
    customerID  NUMBER,
    
    CONSTRAINT contractSale_PK PRIMARY KEY (contractID, customerID), 
    CONSTRAINT contractSale_FK FOREIGN KEY (contractID)
        REFERENCES contract (contractID),
    CONSTRAINT contractSale_FK_2 FOREIGN KEY(customerID)
        REFERENCES customer (companyID)
);

CREATE TABLE purchaseInfo(
    purchaseNum NUMBER,
    supplierID  NUMBER,
    
    CONSTRAINT purchaseInfo_PK PRIMARY KEY (purchaseNum, supplierID), 
    CONSTRAINT purchaseInfo_FK FOREIGN KEY (purchaseNum)
        REFERENCES purchaseGV (purchaseNum),
    CONSTRAINT purchaseInfo_FK_2 FOREIGN KEY(supplierID)
        REFERENCES supplier (companyID)
);

CREATE TABLE lineitem(
    contractID  NUMBER,
    productCode NUMBER,
    
    CONSTRAINT lineitem_PK PRIMARY KEY (contractID, productCode), 
    CONSTRAINT lineitem_FK FOREIGN KEY (contractID)
        REFERENCES contract (contractID),
    CONSTRAINT lineitem_FK_2 FOREIGN KEY(productCode)
        REFERENCES product (productCode)
);

CREATE TABLE puchaseline(
    purchaseNum     NUMBER,
    materialCode    NUMBER,
    
    CONSTRAINT puchaseline_PK PRIMARY KEY (purchaseNum, materialCode), 
    CONSTRAINT puchaseline_FK FOREIGN KEY (purchaseNum)
        REFERENCES purchaseGV (purchaseNum),
    CONSTRAINT puchaseline_FK_2 FOREIGN KEY(materialCode)
        REFERENCES material (materialCode)
);

CREATE TABLE makes (  
    factoryid   NUMBER,
    productcode NUMBER,
    
    CONSTRAINT makes_pk PRIMARY KEY ( factoryid,
                                           productcode ),
    CONSTRAINT makes_fk FOREIGN KEY ( factoryid )
        REFERENCES factory ( factoryid ),
    CONSTRAINT makes_fk_2 FOREIGN KEY ( productcode )
        REFERENCES product ( productcode )
);

CREATE TABLE searches (
    factoryid       NUMBER,
    materialCode    NUMBER,
    
    CONSTRAINT searches_PK PRIMARY KEY (factoryid, materialCode),
    CONSTRAINT searches_fk FOREIGN KEY ( factoryid )
        REFERENCES factory ( factoryid ),
    CONSTRAINT searches_fk_2 FOREIGN KEY (materialCode)
        REFERENCES material (materialCode)   
);