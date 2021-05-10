DROP TABLE contractsale;

DROP TABLE purchaseinfo;

DROP TABLE lineitem;

DROP TABLE purchaseline;

DROP TABLE makes;

DROP TABLE searches;

DROP TABLE factory;

DROP TABLE material;

DROP TABLE product;

DROP TABLE contract;

DROP TABLE purchasegv;

DROP TABLE supplier;

DROP TABLE customer;

CREATE TABLE factory (
    factoryid    NUMBER,
    factoryname  VARCHAR(100),
    address      VARCHAR(100),
    zipcode      NUMBER(5),
    managername  VARCHAR(50),
    CONSTRAINT factor_pk PRIMARY KEY ( factoryid )
);

CREATE TABLE material (
    materialcode  NUMBER,
    materialname  VARCHAR(50),
    unit          NUMBER,
    minlevel      NUMBER,
    quantity      NUMBER,
    CONSTRAINT material_pk PRIMARY KEY ( materialcode )
);

CREATE TABLE product (
    productcode   NUMBER,
    productname   VARCHAR(100),
    descriptions  VARCHAR(100),
    avgcost       NUMBER,
    unit          NUMBER,
    minlevel      NUMBER,
    quantity      NUMBER,
    CONSTRAINT product_pk PRIMARY KEY ( productcode )
);

CREATE TABLE contract (
    contractid   NUMBER,
    saleamount   NUMBER,
    con_date     DATE,
    payschedule  DATE,
    CONSTRAINT contract_pk PRIMARY KEY ( contractid )
);

CREATE TABLE purchasegv (
    purchasenum       NUMBER,
    bookdate          DATE,
    paydate           DATE,
    note              VARCHAR(100),
    supplierordernum  NUMBER,
    CONSTRAINT purchase_pk PRIMARY KEY ( purchasenum )
);

CREATE TABLE supplier (
    companyid      NUMBER,
    website        VARCHAR(100),
    conctactemail  VARCHAR(100),
    CONSTRAINT supplier_pk PRIMARY KEY ( companyid )
);

CREATE TABLE customer (
    companyid      NUMBER,
    contactperson  VARCHAR(50),
    contactemail   VARCHAR(100),
    CONSTRAINT customer_pk PRIMARY KEY ( companyid )
);

--Relational

CREATE TABLE contractsale (
    contractid  NUMBER,
    customerid  NUMBER,
    CONSTRAINT contractsale_pk PRIMARY KEY ( contractid,
                                             customerid ),
    CONSTRAINT contractsale_fk FOREIGN KEY ( contractid )
        REFERENCES contract ( contractid ),
    CONSTRAINT contractsale_fk_2 FOREIGN KEY ( customerid )
        REFERENCES customer ( companyid )
);

CREATE TABLE purchaseinfo (
    purchasenum  NUMBER,
    supplierid   NUMBER,
    CONSTRAINT purchaseinfo_pk PRIMARY KEY ( purchasenum,
                                             supplierid ),
    CONSTRAINT purchaseinfo_fk FOREIGN KEY ( purchasenum )
        REFERENCES purchasegv ( purchasenum ),
    CONSTRAINT purchaseinfo_fk_2 FOREIGN KEY ( supplierid )
        REFERENCES supplier ( companyid )
);

CREATE TABLE lineitem (
    contractid   NUMBER,
    productcode  NUMBER,
    CONSTRAINT lineitem_pk PRIMARY KEY ( contractid,
                                         productcode ),
    CONSTRAINT lineitem_fk FOREIGN KEY ( contractid )
        REFERENCES contract ( contractid ),
    CONSTRAINT lineitem_fk_2 FOREIGN KEY ( productcode )
        REFERENCES product ( productcode )
);

CREATE TABLE purchaseline (
    purchasenum   NUMBER,
    materialcode  NUMBER,
    CONSTRAINT puchaseline_pk PRIMARY KEY ( purchasenum,
                                            materialcode ),
    CONSTRAINT puchaseline_fk FOREIGN KEY ( purchasenum )
        REFERENCES purchasegv ( purchasenum ),
    CONSTRAINT puchaseline_fk_2 FOREIGN KEY ( materialcode )
        REFERENCES material ( materialcode )
);

CREATE TABLE makes (
    factoryid    NUMBER,
    productcode  NUMBER,
    CONSTRAINT makes_pk PRIMARY KEY ( factoryid,
                                      productcode ),
    CONSTRAINT makes_fk FOREIGN KEY ( factoryid )
        REFERENCES factory ( factoryid ),
    CONSTRAINT makes_fk_2 FOREIGN KEY ( productcode )
        REFERENCES product ( productcode )
);

CREATE TABLE searches (
    factoryid     NUMBER,
    materialcode  NUMBER,
    CONSTRAINT searches_pk PRIMARY KEY ( factoryid,
                                         materialcode ),
    CONSTRAINT searches_fk FOREIGN KEY ( factoryid )
        REFERENCES factory ( factoryid ),
    CONSTRAINT searches_fk_2 FOREIGN KEY ( materialcode )
        REFERENCES material ( materialcode )
);