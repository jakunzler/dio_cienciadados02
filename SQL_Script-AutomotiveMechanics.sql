SHOW DATABASES;

DROP DATABASE IF EXISTS AutomotiveMechanics;

CREATE DATABASE AutomotiveMechanics;

USE AutomotiveMechanics;

CREATE TABLE Customers (
    idCustomer INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(45) NOT NULL,
    address VARCHAR(255),
    CPF CHAR(11) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT unique_cpf_customer UNIQUE (CPF),
    CONSTRAINT unique_email_customer UNIQUE (email)
);

ALTER TABLE Customers AUTO_INCREMENT = 1;

CREATE TABLE Vehicles (
    idVehicle INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    manufactureYear INT,
    licensePlate VARCHAR(10),
    idCustomer INT,
    FOREIGN KEY (idCustomer) REFERENCES Customers(idCustomer)
);

CREATE TABLE Materials (
    idMaterial INT AUTO_INCREMENT PRIMARY KEY,
    materialName VARCHAR(50) NOT NULL,
    seriesNumber VARCHAR(50) NOT NULL,
    materialPrice FLOAT,
    CONSTRAINT unique_series_number unique (seriesNumber)
);

CREATE TABLE Repairers (
    idRepairer INT AUTO_INCREMENT PRIMARY KEY,
    employeeName VARCHAR(255) NOT NULL,
    branchName VARCHAR(255) NOT NULL,
    CPF CHAR(11) NOT NULL,
    CONSTRAINT unique_cpf_repairer unique (CPF),
    CONSTRAINT unique_branch_repairer unique (branchName)
);

CREATE TABLE ServiceOrders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    receivedDate DATE NOT NULL,
    serviceDescription VARCHAR(255) NOT NULL,
    finalRepairCost FLOAT NOT NULL,
    idMaterial INT,
    idVehicle INT,
    idCustomer INT,
    idRepairer INT,
    FOREIGN KEY (idMaterial) REFERENCES Materials(idMaterial),
    FOREIGN KEY (idVehicle) REFERENCES Vehicles(idVehicle),
    FOREIGN KEY (idCustomer) REFERENCES Customers(idCustomer),
    FOREIGN KEY (idRepairer) REFERENCES Repairers(idRepairer)
);

CREATE TABLE Suppliers (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    companyName VARCHAR(255) NOT NULL ,
    tradeMark VARCHAR(255) NOT NULL,
    CNPJ VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier_company_name UNIQUE (companyName),
    CONSTRAINT unique_cnpj_supplier UNIQUE (CNPJ)
);

CREATE TABLE Stocks (
    idStock INT AUTO_INCREMENT PRIMARY KEY,
    idMaterial INT,
    quantity INT NOT NULL,
    price FLOAT NOT NULL,
    FOREIGN KEY (idMaterial) REFERENCES Materials(idMaterial)
);

create table ServiceOrdersRepairer(
	idServiceOrder int,
	idRepairer int,
	primary key (idServiceOrder, idRepairer),
	constraint fk_service_order foreign key (idServiceOrder) references serviceOrders(idOrder),
	constraint fk_repairer foreign key (idRepairer) references repairers(idRepairer)
);

create table StockedProduct(
	idStock int,
	idMaterial int,
	primary key (idStock, idMaterial),
	constraint fk_stock foreign key (idStock) references stocks(idStock),
	constraint fk_materials foreign key (idMaterial) references Materials(idMaterial)
);

create table productsSupplier(
	idProductsSupplier int,
	idProduct int,
	quantity int not null default 1,
	primary key (idProductsSupplier, idProduct),
	constraint fk_product_supplier_supplier foreign key (idProductsSupplier) references suppliers(idSupplier),
	constraint fk_product_supplier_product foreign key (idProduct) references materials(idMaterial)
);

SHOW TABLES;
