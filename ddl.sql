DROP TABLE Skill;
DROP TABLE Position;
DROP TABLE Job;
DROP TABLE GICS;
DROP TABLE COURSE;
DROP TABLE SECTION;
DROP TABLE PERSON;
--TODO: Drop Table for AZ and GV
--TODO: Add constraints, Primary, and Foreign Keys to AZ and GV

CREATE TABLE GICS (
    INDUSTRY_ID NUMBER,
    INDUSTRY_TITLE VARCHAR(25),
    G_LEVEL NUMBER,
    G_DESC VARCHAR(100),
    PARENT_ID NUMBER,
    CONSTRAINT GicsPK PRIMARY KEY (INDUSTRY_ID, PARENT_ID)
);

CREATE TABLE COMPANY (
    COMPANY_ID NUMBER,
    ADDRESS_ID NUMBER,
    INDUSTRY_ID NUMBER,--forign, primary
    SUB_INDUSTRY_ID NUMBER,--forign, primary
    WEBSITE VARCHAR(20),
    CONSTRAINT CompanyPK PRIMARY KEY (COMPANY_ID, INDUSTRY_ID, SUB_INDUSTRY_ID),
    CONSTRAINT AddressFK FOREIGN KEY(ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID),
    CONSTRAINT IndustryFK FOREIGN KEY(INDUSTRY_ID) REFERENCES GICS(PARENT_ID),
    CONSTRAINT SubIndustryFK FOREIGN KEY(SUB_INDUSTRY_ID) REFERENCES GICS(INDUSTRY_ID)
);

CREATE TABLE ADDRESS (
    ADDRESS_ID NUMBER,
    COMPANY_ID NUMBER, 
    ZIP NUMBER(5),
    STREET VARCHAR(20),
    CITY VARCHAR(20),
    CONSTRAINT AddressPK PRIMARY KEY (ADDRESS_ID),
    CONSTRAINT CompanyFK FOREIGN KEY(COMPANY_ID) REFERENCES COMPANY(COMPANY_ID)
);

CREATE TABLE Skill(
	SKILL_CODE NUMBER,
	TITLE VARCHAR(20),
	S_DESC VARCHAR(25),
	S_LEVEL NUMBER(2),--advanced, beginner, medium
	CONSTRAINT SkillPK PRIMARY KEY (SKILL_CODE)
);

CREATE TABLE Position(
	POSITION_CODE NUMBER,
	TITLE VARCHAR(20),
	S_DESC VARCHAR(25),
	CONSTRAINT PositionPK PRIMARY KEY (POSITION_CODE)
);

CREATE TABLE Job(
	JOB_CODE NUMBER,
	POSITION_CODE NUMBER,
    COMPANY VARCHAR(20),
    CATEGORY_CODE NUMBER,
	EMPLOYEEMODE NUMBER(1),--full time or part time, multivalue boolean?
	SKILL_CODE NUMBER,
	PAY_TYPE NUMBER(1), -- Wage or Salary, multivalue boolean?
    PAY_RATE NUMBER, --derived, multivalue
	CONSTRAINT JobPK PRIMARY KEY (JOB_CODE),
    CONSTRAINT SkillFK FOREIGN KEY (SKILL_CODE) REFERENCES Skill(SKILL_CODE),
    CONSTRAINT PayRateFK FOREIGN KEY (PAY_RATE) REFERENCES PayRate(PAY_RATE)
);

CREATE TABLE PayRate(
    PAY_ID NUMBER,
    JOB_CODE NUMBER,
    HOURLY NUMBER,
    ANNUAL NUMBER,
    CONSTRAINT PayPK PRIMARY KEY(PAY_ID),
    CONSTRAINT JobFK FOREIGN KEY(JOB_CODE) REFERENCES Job(JOB_CODE)
);
-------------------------------------------------------------------------------
CREATE TABLE STORE(
    StoreID NUMBER,
    Address VARCHAR(20),
    ZipCode NUMBER,
    Phone NUMBER,
);

CREATE TABLE INVENTORY(
    ItemNum NUMBER,
    Title VARCHAR(20),
    Description VARCHAR(20),
    Quantity NUMBER,
    Unit NUMBER,
    AvgCost NUMBER,
    ShelfCode NUMBER,
    MinLevel NUMBER,
);

CREATE TABLE SALE(
    InvoiceNbr NUMBER,
    S_Date DATE,
    ItemNbr NUMBER,
    Quantity NUMBER,
    Price NUMBER,
    Note VARCHAR,
    MinLevel NUMBER,
);

CREATE TABLE PURCHASE(
    PuchaseNbr NUMBER,
    P_Date  DATE,
    ItemNbr NUMBER,
    Quantity NUMBER,
    UnitCost NUMBER,
    Note VARCHAR(20),
);
-----------------------------------------------------------------------
CREATE TABLE FACTORY(
    FactoryID NUMBER,
    FactoryName VARCHAR(50),
    Address VARCHAR(50),
    ZipCode NUMBER,
    Phone NUMBER,
    Manager VARCHAR(20),
);

CREATE TABLE MATERIAL(
    MaterialCode NUMBER,
    MaterialName VARCHAR(50),
    Quantity NUMBER,
    Unit NUMBER,
    MinLevel NUMBER,

);

CREATE TABLE PRODUCT(
    ProductCode NUMBER,
    ProductName VARCHAR(20),
    Description VARCHAR(50),
    Quantity NUMBER,
    Unit NUMBER,
    AvgCost NUMBER,

);

CREATE TABLE CONTRACT(
    ContractID NUMBER,
    CustomerID NUMBER,
    C_Date DATE,
    SaleAmount NUMBER,
    PaySchedule DATE,

);

CREATE TABLE LINEITEM(
    ContractID NUMBER,
    ProductCode NUMBER,
    Quantity NUMBER,

);

CREATE TABLE PURCHASE(
    PurchaseNum NUMBER,
    SupplierID NUMBER,
    SupplierOrderNum NUMBER,
    BookDate DATE,
    PayDate DATE,
    Note VARCHAR(20),
);

CREATE TABLE PURCHASELINE(
    PurchaseNum NUMBER,
    MaterialCode NUMBER,
    Quantity Number,

);

CREATE TABLE SUPPLIER(
    CompanyID NUMBER,
    Website VARCHAR(50),
    ContactEmail VARCHAR(50),
);

CREATE TABLE CUSTOMER(
    CompanyID NUMBER,
    ContactPerson VARCHAR(20),
    ContactEmail VARCHAR(50),

);

CREATE TABLE MAKES(
    FactoryID NUMBER,
    ProductCode NUMBER,
    Quantity NUMBER,

);