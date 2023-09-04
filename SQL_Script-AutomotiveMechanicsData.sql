USE AutomotiveMechanics;

-- Inserir dados na tabela Customers
INSERT INTO Customers (fullName, email, address, CPF, phone)
VALUES
    ('João da Silva', 'joao@email.com', 'Rua A, 123', '12345678901', '(11) 1234-5678'),
    ('Maria Santos', 'maria@email.com', 'Avenida B, 456', '98765432101', '(11) 9876-5432');

-- Inserir dados na tabela Vehicles
INSERT INTO Vehicles (brand, model, manufactureYear, licensePlate, idCustomer)
VALUES
    ('Toyota', 'Corolla', 2019, 'ABC1234', 1),
    ('Ford', 'Focus', 2018, 'XYZ5678', 2);

-- Inserir dados na tabela Materials
INSERT INTO Materials (materialName, seriesNumber, materialPrice)
VALUES
    ('Brake Pads', 'BP1234', 45.99),
    ('Engine Oil', 'EO5678', 29.99);

-- Inserir dados na tabela Repairers
INSERT INTO Repairers (employeeName, branchName, CPF)
VALUES
    ('Carlos Silva', 'Main Branch', '11223344556'),
    ('Ana Rodrigues', 'Service Center', '22334455667');

-- Recuperar todos os clientes
SELECT * FROM Customers;

-- Recuperar todos os veículos da marca "Toyota"
SELECT * FROM Vehicles WHERE brand = 'Toyota';

-- Recuperar todas as ordens de serviço
SELECT * FROM ServiceOrders;

-- Recuperar veículos fabricados após 2015
SELECT * FROM Vehicles WHERE manufactureYear > 2015;

-- Recuperar ordens de serviço com um custo final superior a $100
SELECT * FROM ServiceOrders WHERE finalRepairCost > 100;

-- Recuperar o nome completo e o número de telefone dos clientes formatados
SELECT CONCAT(fullName, ': ', phone) AS 'Nome e Telefone' FROM Customers;

-- Calcular o custo médio de reparo por ordem de serviço
SELECT idOrder, finalRepairCost / idMaterial AS 'Custo Médio por Material' FROM ServiceOrders;

-- Recuperar veículos ordenados por marca em ordem alfabética crescente
SELECT * FROM Vehicles ORDER BY brand ASC;

-- Recuperar ordens de serviço ordenadas por custo final em ordem decrescente
SELECT * FROM ServiceOrders ORDER BY finalRepairCost DESC;

-- Recuperar marcas de veículos com mais de 2 veículos registrados
SELECT brand, COUNT(*) AS 'Quantidade' FROM Vehicles GROUP BY brand HAVING COUNT(*) > 2;

-- Recuperar todas as ordens de serviço com informações completas (cliente, veículo e reparador)
SELECT o.idOrder, c.fullName AS 'Cliente', v.brand AS 'Marca', v.model AS 'Modelo', r.employeeName AS 'Reparador'
FROM ServiceOrders o
JOIN Customers c ON o.idCustomer = c.idCustomer
JOIN Vehicles v ON o.idVehicle = v.idVehicle
JOIN Repairers r ON o.idRepairer = r.idRepairer;
