
-- inconsistent names/locations, missing contacts, extra spaces
INSERT INTO Stores (StoreName, Location, Contact) VALUES
                                                      ('MegaMart Potsdam', 'Potsdam', ' +49-331-123456 '),
                                                      ('megamart potsdam', '   Potsdam  ', NULL),
                                                      ('City Shop Berlin', 'Berlin', '030-888888'),
                                                      ('CityShop berlin', 'BERLIN', '030 888 888'),
                                                      ('Village Market', 'Potsdam-Babelsberg', '');


-- duplicates, inconsistent casing, abbreviated streets
INSERT INTO Vendors (VendorName, Address, ContactPerson) VALUES
                                                             ('Fresh Foods GmbH', 'Friedrichstraße 10, 14467 Potsdam', 'Anna Schmidt'),
                                                             ('Fresh Foods GmbH (alt)', 'Friedrichstr. 10, Potsdam', 'A. Schmidt'),
                                                             ('Tech & Gadgets AG', 'Alexanderplatz 3, 10178 Berlin', 'Markus Weber'),
                                                             ('Tech and Gadgets AG', 'Alexanderplatz 3 Berlin', 'M. Weber'),
                                                             ('BULK IMPORTS ltd.', 'Industrial Area, Warehouse 5', 'unknown');


-- duplicates, weird descriptions, missing vendor, bad spacing
INSERT INTO Products (Name, Price, Quantity, Description, VendorName) VALUES
                                                                          ('Organic Apple', 0.80, 500, 'fresh organic apples from local farms', 'Fresh Foods GmbH'),
                                                                          ('organic apple ', 0.75, 200, '  Fresh  ORGANIC  Apple,   crunchy & sweet!!! ', 'fresh foods gmbh'),
                                                                          ('Smartphone X100', 399.99, 50, 'Latest-gen smartphone, 128GB; great camera; 5g capable', 'Tech & Gadgets AG'),
                                                                          ('Smart Phone X-100', 389.00, 30, 'smart phone x100   with 128 gb storage and 5G', 'Tech and Gadgets AG'),
                                                                          ('USB-C Cable 1m', 5.99, 1000, 'usb c cable, 1 meter, fast charging', 'BULK IMPORTS ltd.'),
                                                                          ('USB-C cable 1 meter', 6.49, 800, 'USB C 1m cable - FAST CHARGE', 'Bulk Imports LTD.'), -- will violate FK unless you add this vendor
                                                                          ('Mystery Box', 9.99, 10, '???', NULL);


-- messy names, SSN format variations, missing AffiliateStore, odd salaries)
INSERT INTO Employees (SSN, Name, Gender, DoB, Position, Salary, AffiliateStore, SupervisorID) VALUES
                                                                                                   ('123-45-6789', '  Alice Müller ', 'F', '1990-05-10', 'Manager', 4500.00, 1, NULL),
                                                                                                   ('123456789', 'Bob  Schulz', 'M', '1985-11-20', 'cashier', 2000.0, 1, 1),
                                                                                                   ('987-65-4321', 'carol meier', 'F', '1992-03-15', 'Cashier', 0, 2, 1),
                                                                                                   ('555-55-5555', 'David   König', 'M', '2000-01-01', 'STUDENT worker', 1200.50, 2, 1),
                                                                                                   ('000-00-0000', 'Eve', 'O', '1998-07-07', NULL, NULL, NULL, NULL);


-- duplicates in meaning, not in PK; inconsistent product names
INSERT INTO StoreProducts (StoreID, ProductName) VALUES
                                                     (1, 'Organic Apple'),
                                                     (1, 'organic apple '),
                                                     (1, 'Smartphone X100'),
                                                     (2, 'Smart Phone X-100'),
                                                     (3, 'USB-C Cable 1m'),
                                                     (3, 'USB-C cable 1 meter'),
                                                     (4, 'Mystery Box');

