CREATE DATABASE RecipeAppDB;
USE RecipeAppDB;

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255) UNIQUE NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    RegistrationDate DATE
);

CREATE TABLE Recipe (
    RecipeID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    PrepTime INT,
    CookTime INT,
    Servings INT,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Ingredient (
    IngredientID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    UnitType VARCHAR(50)
);

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT
);

CREATE TABLE DietaryTag (
    TagID INT PRIMARY KEY,
    TagName VARCHAR(255) UNIQUE NOT NULL,
    Description TEXT
);

-- Weak Entities
CREATE TABLE RecipeSteps (
    RecipeID INT,
    StepNumber INT,
    Instruction TEXT NOT NULL,
    PRIMARY KEY (RecipeID, StepNumber),
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID)
);

CREATE TABLE NutritionalInfo (
    RecipeID INT PRIMARY KEY,
    Calories INT,
    Protein INT,
    Carbs INT,
    Fat INT,
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID)
);

-- Relationship Tables
CREATE TABLE RecipeIngredient (
    RecipeID INT,
    IngredientID INT,
    Quantity FLOAT,
    Unit VARCHAR(50),
    PRIMARY KEY (RecipeID, IngredientID),
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID)
);

CREATE TABLE RecipeCategory (
    RecipeID INT,
    CategoryID INT,
    PRIMARY KEY (RecipeID, CategoryID),
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE RecipeEquipment (
    RecipeID INT,
    EquipmentID INT,
    PRIMARY KEY (RecipeID, EquipmentID),
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

CREATE TABLE UserRating (
    UserID INT,
    RecipeID INT,
    RatingScore INT CHECK (RatingScore BETWEEN 1 AND 5),
    Comment TEXT,
    Date DATE,
    PRIMARY KEY (UserID, RecipeID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID)
);

CREATE TABLE RecipeDietaryTag (
    RecipeID INT,
    TagID INT,
    PRIMARY KEY (RecipeID, TagID),
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID),
    FOREIGN KEY (TagID) REFERENCES DietaryTag(TagID)
);

INSERT INTO User (UserID, Username, Email, RegistrationDate)
VALUES
(96, 'ljouning0', 'ljouning0@example.com', '2024-11-14'),
(170, 'cquilter1', 'cquilter1@example.com', '2024-04-12'),
(92, 'jparke2', 'jparke2@example.com', '2024-06-08'),
(62, 'talu3', 'talu3@example.com', '2024-08-04'),
(199, 'gcottee4', 'gcottee4@example.com', '2024-12-04'),
(83, 'mgarvagh5', 'mgarvagh5@example.com', '2024-07-19'),
(184, 'fledstone6', 'fledstone6@example.com', '2024-12-15'),
(44, 'cestrella7', 'cestrella7@example.com', '2024-09-17'),
(87, 'arapo8', 'arapo8@example.com', '2024-10-03'),
(14, 'steresi9', 'steresi9@example.com', '2024-08-28'),
(108, 'lblitza', 'lblitza@example.com', '2025-01-22'),
(121, 'dcrumptonb', 'dcrumptonb@example.com', '2024-06-11'),
(181, 'kverdeyc', 'kverdeyc@example.com', '2024-08-20'),
(70, 'aperkinsd', 'aperkinsd@example.com', '2024-07-07'),
(151, 'lfootere', 'lfootere@example.com', '2025-02-11'),
(91, 'lchengf', 'lchengf@example.com', '2024-12-04'),
(125, 'ltanteg', 'ltanteg@example.com', '2024-06-24'),
(133, 'echarlinh', 'echarlinh@example.com', '2024-08-30'),
(32, 'arosengarteni', 'arosengarteni@example.com', '2025-01-13'),
(200, 'alowrej', 'alowrej@example.com', '2025-03-23'),
(40, 'faustickk', 'faustickk@example.com', '2024-08-25'),
(201, 'gakettl', 'gakettl@example.com', '2024-07-23'),
(69, 'mpallentm', 'mpallentm@example.com', '2024-04-05'),
(148, 'jambrodin', 'jambrodin@example.com', '2024-10-28'),
(80, 'epicoppo', 'epicoppo@example.com', '2024-12-27'),
(85, 'bkezourecp', 'bkezourecp@example.com', '2025-02-16'),
(41, 'corgelq', 'corgelq@example.com', '2024-07-23'),
(110, 'mturfusr', 'mturfusr@example.com', '2024-04-21'),
(202, 'ldeeslys', 'ldeeslys@example.com', '2024-08-08'),
(2, 'ebruhnicket', 'ebruhnicket@example.com', '2024-12-06'),
(203, 'pnunanu', 'pnunanu@example.com', '2025-01-11'),
(135, 'vmcdonoghv', 'vmcdonoghv@example.com', '2024-06-09'),
(56, 'rcolthardw', 'rcolthardw@example.com', '2024-08-10'),
(120, 'aevesquex', 'aevesquex@example.com', '2024-11-06'),
(165, 'jphilippsohny', 'jphilippsohny@example.com', '2024-05-09'),
(204, 'lspoursz', 'lspoursz@example.com', '2024-07-19'),
(205, 'apresdie10', 'apresdie10@example.com', '2024-12-16'),
(94, 'oixor11', 'oixor11@example.com', '2024-09-04'),
(172, 'jpinnock12', 'jpinnock12@example.com', '2025-03-06'),
(25, 'rmccuffie13', 'rmccuffie13@example.com', '2025-01-03'),
(141, 'zekell14', 'zekell14@example.com', '2025-01-04'),
(173, 'ccraddock15', 'ccraddock15@example.com', '2024-05-05'),
(3, 'lfothergill16', 'lfothergill16@example.com', '2024-04-09'),
(145, 'bgunton17', 'bgunton17@example.com', '2024-12-24'),
(178, 'bprowse18', 'bprowse18@example.com', '2024-04-07'),
(206, 'whargrove19', 'whargrove19@example.com', '2025-03-15'),
(207, 'dgunby1a', 'dgunby1a@example.com', '2024-12-26'),
(153, 'nredborn1b', 'nredborn1b@example.com', '2025-03-01'),
(66, 'onance1c', 'onance1c@example.com', '2024-07-19'),
(159, 'jgatchell1d', 'jgatchell1d@example.com', '2024-12-08'),
(208, 'thenriquet1e', 'thenriquet1e@example.com', '2024-05-03'),
(24, 'tchance1f', 'tchance1f@example.com', '2024-04-19'),
(114, 'hhassard1g', 'hhassard1g@example.com', '2025-01-08'),
(58, 'tspeechley1h', 'tspeechley1h@example.com', '2024-04-11'),
(194, 'atuminini1i', 'atuminini1i@example.com', '2025-01-14'),
(209, 'mletchmore1j', 'mletchmore1j@example.com', '2024-10-28'),
(210, 'dlittrik1k', 'dlittrik1k@example.com', '2024-08-04'),
(11, 'abiggs1l', 'abiggs1l@example.com', '2024-12-23'),
(9, 'sjannequin1m', 'sjannequin1m@example.com', '2024-05-01'),
(10, 'jmacglory1n', 'jmacglory1n@example.com', '2025-03-17'),
(211, 'eapps1o', 'eapps1o@example.com', '2025-03-19'),
(19, 'gsammonds1p', 'gsammonds1p@example.com', '2024-11-16'),
(17, 'egerler1q', 'egerler1q@example.com', '2025-02-26'),
(198, 'cklimt1r', 'cklimt1r@example.com', '2024-06-26'),
(76, 'rstaresmeare1s', 'rstaresmeare1s@example.com', '2024-09-26'),
(30, 'cstrass1t', 'cstrass1t@example.com', '2024-07-08'),
(57, 'cbrinkley1u', 'cbrinkley1u@example.com', '2024-07-22'),
(192, 'bdunwoody1v', 'bdunwoody1v@example.com', '2025-01-27'),
(191, 'nshemmans1w', 'nshemmans1w@example.com', '2024-05-24'),
(130, 'sgoodyear1x', 'sgoodyear1x@example.com', '2025-02-04'),
(212, 'sgabbot1y', 'sgabbot1y@example.com', '2025-01-19'),
(45, 'rphillipps1z', 'rphillipps1z@example.com', '2025-02-28'),
(213, 'erennocks20', 'erennocks20@example.com', '2024-05-01'),
(43, 'rlanger21', 'rlanger21@example.com', '2024-10-10'),
(138, 'hbickmore22', 'hbickmore22@example.com', '2025-02-21'),
(116, 'dsims23', 'dsims23@example.com', '2024-10-31'),
(119, 'ascone24', 'ascone24@example.com', '2025-03-13'),
(161, 'kpiaggia25', 'kpiaggia25@example.com', '2025-03-31'),
(55, 'ralessandrelli26', 'ralessandrelli26@example.com', '2024-04-29'),
(214, 'abearfoot27', 'abearfoot27@example.com', '2024-12-10'),
(215, 'chempshall28', 'chempshall28@example.com', '2024-04-13'),
(86, 'sbeadell29', 'sbeadell29@example.com', '2024-11-17'),
(216, 'lwogan2a', 'lwogan2a@example.com', '2024-07-24'),
(122, 'modea2b', 'modea2b@example.com', '2025-03-29'),
(217, 'sdaughton2c', 'sdaughton2c@example.com', '2024-10-26'),
(7, 'sgoodbairn2d', 'sgoodbairn2d@example.com', '2025-01-25'),
(180, 'pfabri2e', 'pfabri2e@example.com', '2024-06-07'),
(118, 'prickford2f', 'prickford2f@example.com', '2024-07-10'),
(218, 'sgue2g', 'sgue2g@example.com', '2024-06-18'),
(89, 'vriseborough2h', 'vriseborough2h@example.com', '2024-12-30'),
(219, 'ctourry2i', 'ctourry2i@example.com', '2024-08-13'),
(220, 'atotaro2j', 'atotaro2j@example.com', '2025-01-20'),
(160, 'rpalmby2k', 'rpalmby2k@example.com', '2025-03-04'),
(221, 'rlindwall2l', 'rlindwall2l@example.com', '2024-04-30'),
(34, 'cspoure2m', 'cspoure2m@example.com', '2025-02-17'),
(99, 'epuckett2n', 'epuckett2n@example.com', '2024-09-06'),
(222, 'kdouty2o', 'kdouty2o@example.com', '2024-12-09'),
(223, 'omagner2p', 'omagner2p@example.com', '2025-01-06'),
(98, 'lsigmund2q', 'lsigmund2q@example.com', '2025-02-09'),
(111, 'yfiggen2r', 'yfiggen2r@example.com', '2025-02-25'),
(15, 'mellington2s', 'mellington2s@example.com', '2025-01-18'),
(224, 'ndentith2t', 'ndentith2t@example.com', '2025-01-12'),
(27, 'msillett2u', 'msillett2u@example.com', '2024-06-07'),
(225, 'iconaghan2v', 'iconaghan2v@example.com', '2024-05-13'),
(226, 'jmassot2w', 'jmassot2w@example.com', '2025-01-07'),
(227, 'aconfait2x', 'aconfait2x@example.com', '2024-11-18'),
(228, 'ajacobi2y', 'ajacobi2y@example.com', '2024-05-05'),
(150, 'chargreves2z', 'chargreves2z@example.com', '2024-11-22'),
(140, 'bfadden30', 'bfadden30@example.com', '2025-03-26'),
(6, 'idevere31', 'idevere31@example.com', '2024-08-16'),
(16, 'rrickerby32', 'rrickerby32@example.com', '2024-12-14'),
(107, 'psaleway33', 'psaleway33@example.com', '2024-12-31'),
(229, 'gkristoffersen34', 'gkristoffersen34@example.com', '2025-03-08'),
(230, 'rcarwithan35', 'rcarwithan35@example.com', '2025-02-20'),
(231, 'nbelcham36', 'nbelcham36@example.com', '2024-04-18'),
(232, 'garrigucci37', 'garrigucci37@example.com', '2024-05-18'),
(233, 'mrossbrook38', 'mrossbrook38@example.com', '2024-05-09'),
(234, 'ksnelgar39', 'ksnelgar39@example.com', '2024-05-09'),
(79, 'omazzilli3a', 'omazzilli3a@example.com', '2025-01-18'),
(235, 'opaviour3b', 'opaviour3b@example.com', '2024-09-21'),
(47, 'sgodon3c', 'sgodon3c@example.com', '2024-11-02'),
(236, 'vmilley3d', 'vmilley3d@example.com', '2024-09-20'),
(4, 'bshakespeare3e', 'bshakespeare3e@example.com', '2024-05-26'),
(237, 'ktuttle3f', 'ktuttle3f@example.com', '2024-12-20'),
(143, 'amacknight3g', 'amacknight3g@example.com', '2024-07-09'),
(238, 'ahitter3h', 'ahitter3h@example.com', '2024-06-18'),
(239, 'norpen3i', 'norpen3i@example.com', '2024-10-29'),
(82, 'ladamowicz3j', 'ladamowicz3j@example.com', '2024-06-16'),
(240, 'bmassinger3k', 'bmassinger3k@example.com', '2024-10-22'),
(22, 'tlago3l', 'tlago3l@example.com', '2025-01-05'),
(241, 'pordidge3m', 'pordidge3m@example.com', '2025-01-03'),
(242, 'sjiras3n', 'sjiras3n@example.com', '2024-11-20'),
(243, 'ccrossman3o', 'ccrossman3o@example.com', '2024-10-16'),
(146, 'gdwyer3p', 'gdwyer3p@example.com', '2024-06-14'),
(156, 'stilliard3q', 'stilliard3q@example.com', '2024-12-18'),
(195, 'smirrlees3r', 'smirrlees3r@example.com', '2025-03-06'),
(189, 'wmartinot3s', 'wmartinot3s@example.com', '2024-06-01'),
(38, 'cblois3t', 'cblois3t@example.com', '2025-01-09'),
(88, 'tdockwra3u', 'tdockwra3u@example.com', '2024-05-07'),
(53, 'mjackways3v', 'mjackways3v@example.com', '2024-12-22'),
(244, 'rbloomfield3w', 'rbloomfield3w@example.com', '2025-02-02'),
(144, 'tganniclifft3x', 'tganniclifft3x@example.com', '2024-12-11'),
(245, 'kmoralis3y', 'kmoralis3y@example.com', '2024-10-04'),
(246, 'jsewley3z', 'jsewley3z@example.com', '2024-09-17'),
(247, 'wcalcutt40', 'wcalcutt40@example.com', '2025-03-09'),
(248, 'elakenden41', 'elakenden41@example.com', '2024-05-31'),
(167, 'bvoller42', 'bvoller42@example.com', '2025-03-05'),
(68, 'dmarieton43', 'dmarieton43@example.com', '2024-08-02'),
(124, 'deton44', 'deton44@example.com', '2025-01-03'),
(249, 'mgorbell45', 'mgorbell45@example.com', '2024-09-09'),
(177, 'cungerer46', 'cungerer46@example.com', '2024-07-23'),
(250, 'tcockren47', 'tcockren47@example.com', '2025-01-02'),
(74, 'tworstall48', 'tworstall48@example.com', '2024-07-05'),
(31, 'aruspine49', 'aruspine49@example.com', '2024-05-08'),
(73, 'lknevit4a', 'lknevit4a@example.com', '2024-11-05'),
(54, 'kbraid4b', 'kbraid4b@example.com', '2024-11-16'),
(251, 'lbrimmell4c', 'lbrimmell4c@example.com', '2024-12-01'),
(252, 'plefeaver4d', 'plefeaver4d@example.com', '2024-10-26'),
(253, 'mnestle4e', 'mnestle4e@example.com', '2024-08-21'),
(254, 'hwilprecht4f', 'hwilprecht4f@example.com', '2024-04-15'),
(154, 'fsouthwick4g', 'fsouthwick4g@example.com', '2024-06-26'),
(255, 'jrottery4h', 'jrottery4h@example.com', '2024-08-30'),
(256, 'sboteman4i', 'sboteman4i@example.com', '2025-03-05'),
(97, 'adumpleton4j', 'adumpleton4j@example.com', '2024-12-12'),
(257, 'pbenson4k', 'pbenson4k@example.com', '2024-10-20'),
(90, 'kpladen4l', 'kpladen4l@example.com', '2024-08-13'),
(258, 'krime4m', 'krime4m@example.com', '2025-01-24'),
(259, 'fkisby4n', 'fkisby4n@example.com', '2025-03-23'),
(103, 'lgavin4o', 'lgavin4o@example.com', '2024-10-15'),
(36, 'rwoolard4p', 'rwoolard4p@example.com', '2024-11-16'),
(260, 'tbazire4q', 'tbazire4q@example.com', '2024-08-27'),
(261, 'ahalse4r', 'ahalse4r@example.com', '2025-02-04'),
(262, 'zrosso4s', 'zrosso4s@example.com', '2025-02-19'),
(263, 'mbolsteridge4t', 'mbolsteridge4t@example.com', '2025-02-10'),
(264, 'sdyneley4u', 'sdyneley4u@example.com', '2024-08-18'),
(71, 'tdaverin4v', 'tdaverin4v@example.com', '2025-02-26'),
(265, 'acarradice4w', 'acarradice4w@example.com', '2025-03-10'),
(266, 'dgehrels4x', 'dgehrels4x@example.com', '2025-01-18'),
(1, 'kbadder4y', 'kbadder4y@example.com', '2024-07-27'),
(267, 'mtrill4z', 'mtrill4z@example.com', '2025-03-10'),
(67, 'tturk50', 'tturk50@example.com', '2024-12-05'),
(168, 'aorthmann51', 'aorthmann51@example.com', '2024-05-13'),
(268, 'ppeyser52', 'ppeyser52@example.com', '2024-10-15'),
(269, 'smustchin53', 'smustchin53@example.com', '2024-12-30'),
(12, 'sgatteridge54', 'sgatteridge54@example.com', '2024-09-01'),
(270, 'wcoule55', 'wcoule55@example.com', '2024-05-27'),
(26, 'ewyse56', 'ewyse56@example.com', '2024-11-30'),
(271, 'sdaeth57', 'sdaeth57@example.com', '2024-11-11'),
(272, 'scancellor58', 'scancellor58@example.com', '2024-06-02'),
(273, 'hferres59', 'hferres59@example.com', '2024-08-21'),
(274, 'tkupec5a', 'tkupec5a@example.com', '2024-04-03'),
(275, 'eduesbury5b', 'eduesbury5b@example.com', '2024-09-30'),
(276, 'shigginbottam5c', 'shigginbottam5c@example.com', '2024-12-09'),
(277, 'ctift5d', 'ctift5d@example.com', '2025-03-20'),
(278, 'eventura5e', 'eventura5e@example.com', '2024-10-19'),
(279, 'mhek5f', 'mhek5f@example.com', '2025-03-09'),
(280, 'rlurner5g', 'rlurner5g@example.com', '2024-12-26'),
(28, 'nleipelt5h', 'nleipelt5h@example.com', '2024-09-01'),
(281, 'zbarling5i', 'zbarling5i@example.com', '2024-05-12'),
(282, 'mgilchrest5j', 'mgilchrest5j@example.com', '2025-03-18'); 

INSERT INTO Recipe (RecipeID, Name, Description, PrepTime, CookTime, Servings, UserID)
VALUES
(101, 'Classic Chocolate Cake', 'Rich and moist chocolate cake', 30, 60, 8, 96),
(102, 'Spaghetti Carbonara', 'Creamy Italian pasta with eggs and cheese', 20, 25, 4, 170),
(103, 'Garden Salad', 'Fresh mix of seasonal vegetables', 15, 0, 4, 92),
(104, 'Beef Tacos', 'Seasoned ground beef in crispy tortillas', 25, 20, 6, 62),
(105, 'Vegetable Stir-Fry', 'Sautéed veggies with soy sauce', 20, 15, 4, 199),
(106, 'Chicken Alfredo', 'Creamy pasta with grilled chicken', 25, 30, 6, 83),
(107, 'Blueberry Pancakes', 'Fluffy pancakes with fresh blueberries', 15, 20, 4, 184),
(108, 'Tomato Soup', 'Creamy soup with roasted tomatoes', 15, 30, 4, 44),
(109, 'Garlic Bread', 'Toasted bread with garlic butter', 10, 15, 6, 87),
(110, 'Lemon Herb Salmon', 'Baked salmon with lemon and herbs', 15, 25, 2, 14),
(111, 'Mushroom Risotto', 'Creamy Arborio rice with mushrooms', 30, 45, 4, 108),
(112, 'Caprese Salad', 'Mozzarella, tomatoes, and basil', 10, 0, 2, 121),
(113, 'BBQ Ribs', 'Slow-cooked ribs with barbecue sauce', 30, 180, 6, 181),
(114, 'Vegetable Lasagna', 'Layered pasta with veggies and cheese', 40, 60, 8, 70),
(115, 'Banana Bread', 'Moist bread with ripe bananas', 15, 60, 8, 151),
(116, 'Margherita Pizza', 'Classic pizza with tomatoes and basil', 30, 15, 4, 91),
(117, 'Chicken Noodle Soup', 'Comforting soup with shredded chicken', 20, 45, 6, 125),
(118, 'Greek Salad', 'Cucumbers, olives, and feta cheese', 15, 0, 4, 133),
(119, 'Beef Chili', 'Spicy chili with ground beef and beans', 30, 60, 8, 32),
(120, 'Shrimp Scampi', 'Garlic butter shrimp over pasta', 20, 20, 4, 200),
(121, 'Caesar Salad', 'Romaine lettuce with croutons and dressing', 15, 0, 4, 40),
(122, 'Apple Pie', 'Flaky crust with cinnamon apples', 45, 60, 8, 201),
(123, 'Grilled Cheese', 'Crispy bread with melted cheese', 5, 10, 2, 69),
(124, 'Beef Burger', 'Juicy patty with lettuce and tomato', 20, 15, 4, 148),
(125, 'Omelette', 'Fluffy eggs with cheese and veggies', 10, 10, 2, 80),
(126, 'Chicken Curry', 'Spicy curry with coconut milk', 30, 45, 6, 85),
(127, 'French Toast', 'Golden-brown bread with syrup', 10, 15, 4, 41),
(128, 'Guacamole', 'Creamy avocado dip with lime', 15, 0, 4, 110),
(129, 'Baked Ziti', 'Pasta with ricotta and marinara', 25, 45, 8, 202),
(130, 'Cobb Salad', 'Mixed greens with chicken and bacon', 20, 0, 4, 2),
(131, 'Pumpkin Soup', 'Creamy soup with roasted pumpkin', 20, 30, 6, 203),
(132, 'Pad Thai', 'Stir-fried rice noodles with shrimp', 30, 20, 4, 135),
(133, 'Tiramisu', 'Coffee-flavored Italian dessert', 45, 0, 8, 56),
(134, 'Beef Stroganoff', 'Tender beef in creamy sauce', 30, 45, 6, 120),
(135, 'Falafel Wrap', 'Crispy chickpea patties in pita', 30, 20, 4, 165),
(136, 'Chocolate Chip Cookies', 'Soft cookies with melted chocolate', 15, 12, 24, 204),
(137, 'Chicken Parmesan', 'Breaded chicken with marinara', 30, 30, 4, 205),
(138, 'Quiche Lorraine', 'Savory pie with bacon and cheese', 30, 45, 6, 94),
(139, 'Hummus', 'Chickpea dip with tahini', 15, 0, 6, 172),
(140, 'Lentil Soup', 'Hearty soup with vegetables', 20, 45, 6, 25),
(141, 'Sushi Rolls', 'Fresh fish and rice in seaweed', 60, 20, 4, 141),
(142, 'Pesto Pasta', 'Basil sauce with pine nuts', 15, 20, 4, 173),
(143, 'Creme Brulee', 'Custard with caramelized sugar', 30, 60, 4, 3),
(144, 'Beef Burrito', 'Spicy beef and beans in tortilla', 25, 15, 2, 145),
(145, 'Ratatouille', 'Provencal vegetable stew', 45, 60, 6, 178),
(146, 'Cheesecake', 'Creamy dessert with graham crust', 30, 60, 8, 206),
(147, 'Pho', 'Vietnamese noodle soup', 60, 180, 6, 207),
(148, 'Tuna Salad', 'Canned tuna with mayo and veggies', 15, 0, 4, 153),
(149, 'Chicken Wings', 'Crispy wings with hot sauce', 20, 45, 6, 66),
(150, 'Mashed Potatoes', 'Creamy potatoes with butter', 20, 30, 6, 159),
(151, 'Pulled Pork Sandwich', 'Slow-cooked pork in BBQ sauce', 30, 240, 8, 208),
(152, 'Clam Chowder', 'Creamy soup with clams', 30, 45, 6, 24),
(153, 'Stuffed Peppers', 'Bell peppers with rice and meat', 30, 45, 4, 114),
(154, 'Macarons', 'French almond meringue cookies', 60, 15, 24, 58),
(155, 'Fish Tacos', 'Grilled fish with slaw', 30, 20, 4, 194),
(156, 'Egg Fried Rice', 'Stir-fried rice with veggies', 20, 15, 4, 209),
(157, 'Bruschetta', 'Toasted bread with tomato topping', 15, 10, 6, 210),
(158, 'Potato Salad', 'Creamy potatoes with herbs', 20, 0, 8, 11),
(159, 'Beef Tacos', 'Seasoned beef in soft tortillas', 25, 20, 6, 9),
(160, 'Panna Cotta', 'Italian cream dessert', 20, 120, 4, 10),
(161, 'Chicken Caesar Wrap', 'Grilled chicken in tortilla', 15, 10, 2, 211),
(162, 'Minestrone Soup', 'Vegetable soup with pasta', 30, 45, 6, 19),
(163, 'Pancakes', 'Fluffy breakfast classic', 10, 15, 4, 17),
(164, 'Garlic Shrimp', 'Sautéed shrimp with garlic', 15, 10, 4, 198),
(165, 'Beef Lo Mein', 'Stir-fried noodles with beef', 30, 20, 4, 76),
(166, 'Cheese Platter', 'Assorted cheeses and fruits', 20, 0, 8, 30),
(167, 'Chicken Quesadilla', 'Crispy tortilla with cheese', 15, 15, 2, 57),
(168, 'Gazpacho', 'Cold Spanish tomato soup', 15, 0, 4, 192),
(169, 'Baked Salmon', 'Lemon-dill salmon fillet', 15, 25, 2, 191),
(170, 'Miso Soup', 'Japanese tofu and seaweed soup', 10, 15, 4, 130),
(171, 'Chicken Satay', 'Grilled skewers with peanut sauce', 30, 20, 6, 212),
(172, 'Fettuccine Alfredo', 'Creamy pasta with Parmesan', 20, 20, 4, 45),
(173, 'Churros', 'Fried dough with cinnamon sugar', 30, 20, 6, 213),
(174, 'Lobster Bisque', 'Rich creamy lobster soup', 45, 60, 4, 43),
(175, 'Chicken Tikka Masala', 'Creamy Indian curry', 40, 45, 6, 138),
(176, 'Baked Brie', 'Melty cheese with honey', 10, 15, 4, 116),
(177, 'Paella', 'Spanish rice with seafood', 60, 60, 8, 119),
(178, 'Beef Empanadas', 'Savory pastry pockets', 45, 30, 12, 161),
(179, 'Mango Sorbet', 'Refreshing frozen dessert', 15, 240, 6, 55),
(180, 'Chicken Pot Pie', 'Flaky crust with creamy filling', 45, 60, 6, 214),
(181, 'Ramen', 'Japanese noodle soup', 60, 45, 4, 215),
(182, 'Ceviche', 'Citrus-marinated seafood', 30, 0, 4, 86),
(183, 'Biscuits and Gravy', 'Flaky biscuits with sausage gravy', 30, 30, 6, 216),
(184, 'Dumplings', 'Steamed pork and cabbage', 45, 30, 8, 122),
(185, 'Key Lime Pie', 'Tangy citrus dessert', 30, 60, 8, 217),
(186, 'Beef Kabobs', 'Grilled skewers with veggies', 30, 20, 6, 7),
(187, 'French Onion Soup', 'Caramelized onion soup with cheese', 45, 60, 4, 180),
(188, 'Coconut Curry', 'Thai curry with coconut milk', 30, 45, 6, 118),
(189, 'Apple Crisp', 'Baked apples with oat topping', 20, 45, 6, 218),
(190, 'Tofu Stir-Fry', 'Sautéed tofu with veggies', 20, 15, 4, 89),
(191, 'Pumpkin Pie', 'Spiced pumpkin custard', 30, 60, 8, 219),
(192, 'Chicken Fried Rice', 'Stir-fried rice with chicken', 25, 20, 4, 220),
(193, 'Goulash', 'Hungarian beef stew', 30, 90, 6, 160),
(194, 'Nachos', 'Tortilla chips with cheese', 15, 10, 6, 221),
(195, 'Cheese Fondue', 'Melted cheese with bread', 20, 30, 4, 34),
(196, 'Lemon Bars', 'Tangy lemon dessert squares', 30, 45, 12, 99),
(197, 'Beef Bulgogi', 'Korean marinated beef', 45, 30, 6, 222),
(198, 'Eggplant Parmesan', 'Breaded eggplant with cheese', 40, 45, 6, 223),
(199, 'Pulled Chicken Sandwich', 'Shredded chicken in BBQ sauce', 30, 180, 6, 98),
(200, 'Mochi', 'Japanese rice cake dessert', 60, 30, 12, 111);

INSERT INTO Recipe (RecipeID, Name, Description, PrepTime, CookTime, Servings, UserID)
VALUES
(201, 'Chocolate Mousse', 'Light and airy French dessert', 30, 0, 6, 15),
(202, 'Beef Wellington', 'Tender beef wrapped in puff pastry', 60, 45, 4, 224),
(203, 'Greek Gyros', 'Spiced meat in pita with tzatziki', 30, 25, 4, 27),
(204, 'Chicken Shawarma', 'Marinated grilled chicken wrap', 45, 30, 6, 225),
(205, 'Baklava', 'Layered pastry with nuts and honey', 60, 45, 12, 226),
(206, 'Lobster Roll', 'Buttery lobster in a toasted bun', 25, 10, 4, 227),
(207, 'Crab Cakes', 'Pan-fried crab patties with remoulade', 30, 20, 6, 228),
(208, 'Beef Nachos', 'Loaded tortilla chips with beef', 20, 15, 6, 150),
(209, 'Butter Chicken', 'Creamy Indian tomato curry', 40, 50, 6, 140),
(210, 'Pumpkin Risotto', 'Creamy rice with roasted pumpkin', 35, 40, 4, 6),
(211, 'Chicken Fajitas', 'Sizzling peppers and onions with chicken', 30, 25, 4, 16),
(212, 'Croissants', 'Flaky French butter pastries', 120, 25, 12, 107),
(213, 'Beef Pho', 'Vietnamese beef noodle soup', 90, 180, 6, 229),
(214, 'Chicken Katsu', 'Crispy breaded chicken cutlet', 25, 20, 4, 230),
(215, 'Matcha Latte', 'Green tea with steamed milk', 5, 5, 1, 231),
(216, 'Pork Dumplings', 'Steamed dumplings with dipping sauce', 45, 20, 8, 232),
(217, 'Churro Waffles', 'Crispy waffles with cinnamon sugar', 20, 15, 4, 233),
(218, 'Bibimbap', 'Korean rice bowl with veggies and egg', 40, 30, 4, 234),
(219, 'Mango Sticky Rice', 'Thai sweet rice dessert', 30, 30, 4, 79),
(220, 'Chicken Teriyaki', 'Grilled chicken with sweet glaze', 25, 25, 4, 235),
(221, 'Raspberry Tart', 'Buttery crust with fresh berries', 45, 30, 8, 47),
(222, 'Beef Sliders', 'Mini burgers with caramelized onions', 30, 20, 6, 236),
(223, 'Avocado Toast', 'Smashed avocado on sourdough', 10, 5, 2, 4),
(224, 'Lemon Pepper Wings', 'Zesty baked chicken wings', 20, 45, 6, 237),
(225, 'Egg Drop Soup', 'Silky Chinese soup with eggs', 10, 15, 4, 143),
(226, 'Chicken Pad See Ew', 'Thai stir-fried noodles', 30, 20, 4, 238),
(227, 'Pineapple Fried Rice', 'Tropical rice with shrimp', 25, 20, 4, 239),
(228, 'Beef Tacos', 'Spicy shredded beef in corn tortillas', 35, 25, 6, 82),
(229, 'Chocolate Fondue', 'Melted chocolate with fruit dippers', 15, 10, 6, 240),
(230, 'Butternut Squash Soup', 'Creamy autumn soup', 25, 40, 6, 22),
(231, 'Salmon Sushi Rolls', 'Fresh salmon and rice in nori', 60, 30, 4, 241),
(232, 'Hawaiian Pizza', 'Pineapple and ham pizza', 30, 20, 4, 242),
(233, 'Beef Enchiladas', 'Corn tortillas with red sauce', 40, 30, 6, 243),
(234, 'Chicken Noodle Casserole', 'Comforting baked pasta', 30, 45, 8, 146),
(235, 'Peach Cobbler', 'Warm peaches with biscuit topping', 20, 45, 6, 156),
(236, 'Shrimp Fried Rice', 'Quick stir-fry with jasmine rice', 25, 20, 4, 195),
(237, 'Beef Birria Tacos', 'Mexican stewed beef tacos', 90, 120, 6, 189),
(238, 'Chocolate Eclairs', 'Cream-filled pastry with glaze', 60, 30, 12, 38),
(239, 'Vegetable Tempura', 'Crispy Japanese fried veggies', 30, 15, 4, 88),
(240, 'Chicken Caesar Salad', 'Classic salad with grilled chicken', 20, 0, 4, 53),
(241, 'Beef Ramen', 'Japanese noodle soup with beef', 60, 45, 4, 244),
(242, 'Apple Fritters', 'Deep-fried apple doughnuts', 30, 20, 12, 144),
(243, 'Pork Belly Buns', 'Steamed buns with crispy pork', 60, 90, 6, 245),
(244, 'Chicken Satay Salad', 'Grilled skewers over greens', 30, 20, 4, 246),
(245, 'Beef Kofta', 'Spiced meatballs with yogurt sauce', 40, 25, 6, 247),
(246, 'Cinnamon Rolls', 'Sweet rolls with cream cheese icing', 60, 30, 12, 248),
(247, 'Beef Gyoza', 'Pan-fried Japanese dumplings', 45, 25, 8, 167),
(248, 'Chicken Potstickers', 'Pan-seared dumplings', 40, 20, 8, 68),
(249, 'Shakshuka', 'Poached eggs in spiced tomato sauce', 20, 25, 4, 124),
(250, 'Beef Rendang', 'Indonesian coconut beef stew', 90, 180, 6, 249),
(251, 'Chicken Korma', 'Mild Indian curry with cashews', 45, 60, 6, 177),
(252, 'Mango Lassi', 'Sweet yogurt mango drink', 5, 0, 2, 250),
(253, 'Beef Empanadas', 'Savory pastry pockets with beef', 50, 30, 12, 74),
(254, 'Chicken Adobo', 'Filipino soy-vinegar chicken', 30, 60, 6, 31),
(255, 'Pumpkin Spice Latte', 'Autumn coffee drink', 10, 5, 1, 73),
(256, 'Beef Jerky', 'Homemade seasoned dried beef', 20, 360, 12, 54),
(257, 'Chicken Piccata', 'Lemon-caper chicken cutlets', 30, 25, 4, 251),
(258, 'Beef Tamales', 'Masa dough with spicy beef filling', 90, 120, 12, 252),
(259, 'Chicken Souvlaki', 'Greek grilled chicken skewers', 30, 20, 6, 253),
(260, 'Beef Carpaccio', 'Thinly sliced raw beef appetizer', 30, 0, 4, 254),
(261, 'Chicken Tenders', 'Crispy fried chicken strips', 20, 20, 4, 154),
(262, 'Beef Tartare', 'Seasoned raw beef with egg yolk', 30, 0, 2, 255),
(263, 'Chicken Mole', 'Mexican chocolate-chili sauce', 60, 90, 8, 256),
(264, 'Beef Fajitas', 'Sizzling skillet with peppers', 35, 25, 6, 97),
(265, 'Chicken Gyro', 'Greek yogurt-marinated chicken wrap', 40, 30, 4, 257),
(266, 'Beef Brisket', 'Slow-smoked BBQ beef', 30, 480, 12, 90),
(267, 'Chicken Naan Wrap', 'Indian flatbread with chicken', 25, 15, 2, 258),
(268, 'Beef Short Ribs', 'Braised ribs in red wine sauce', 45, 180, 6, 259),
(269, 'Chicken Paella', 'Spanish saffron rice with chicken', 60, 60, 8, 103),
(270, 'Beef Kebabs', 'Marinated beef with vegetables', 40, 25, 6, 36),
(271, 'Chicken Tikka', 'Tandoori-spiced grilled chicken', 60, 30, 6, 260),
(272, 'Beef Lasagna', 'Layered pasta with meat sauce', 60, 60, 8, 261),
(273, 'Chicken Cordon Bleu', 'Stuffed chicken with ham and cheese', 45, 45, 4, 262),
(274, 'Beef Cheesesteak', 'Philly-style sandwich with onions', 25, 20, 4, 263),
(275, 'Chicken Wontons', 'Fried dumplings with dipping sauce', 50, 20, 12, 264),
(276, 'Beef Bourguignon', 'French red wine beef stew', 60, 180, 6, 71),
(277, 'Chicken Marsala', 'Creamy mushroom-wine chicken', 30, 40, 4, 265),
(278, 'Beef Samosas', 'Spiced beef in crispy pastry', 60, 30, 12, 266),
(279, 'Chicken Gumbo', 'Louisiana-style stew with rice', 45, 90, 8, 1),
(280, 'Beef Kebabs', 'Grilled skewers with herbs', 40, 20, 6, 267),
(281, 'Chicken Schnitzel', 'Crispy breaded chicken cutlet', 30, 25, 4, 67),
(282, 'Beef Udon', 'Japanese thick noodle soup', 30, 45, 4, 168),
(283, 'Chicken Satay', 'Peanut sauce skewers', 45, 20, 6, 268),
(284, 'Beef Souvlaki', 'Greek grilled beef skewers', 40, 25, 6, 269),
(285, 'Chicken Curry Puffs', 'Flaky pastry with spiced chicken', 60, 30, 12, 12),
(286, 'Beef Poutine', 'Fries with gravy and cheese curds', 30, 20, 4, 270),
(287, 'Chicken Empanadas', 'Savory pastry with chicken filling', 50, 30, 12, 26),
(288, 'Beef Hot Pot', 'Asian-style communal stew', 60, 60, 6, 271),
(289, 'Chicken Yakitori', 'Japanese grilled chicken skewers', 30, 20, 6, 272),
(290, 'Beef Bulgogi Bowl', 'Korean marinated beef over rice', 45, 30, 4, 273),
(291, 'Chicken Ramen', 'Japanese noodle soup with chicken', 60, 45, 4, 274),
(292, 'Beef Satay', 'Grilled skewers with peanut sauce', 40, 25, 6, 275),
(293, 'Chicken Pho', 'Vietnamese chicken noodle soup', 90, 180, 6, 276),
(294, 'Beef Curry', 'Thai red curry with coconut milk', 45, 60, 6, 277),
(295, 'Chicken Noodle Stir-Fry', 'Quick veggie and noodle dish', 25, 15, 4, 278),
(296, 'Beef Lo Mein', 'Chinese stir-fried noodles', 30, 20, 4, 279),
(297, 'Chicken Congee', 'Asian rice porridge with chicken', 60, 120, 6, 280),
(298, 'Beef Miso Soup', 'Japanese soup with beef and tofu', 20, 30, 4, 28),
(299, 'Chicken Kebab Bowl', 'Grilled chicken over rice', 35, 25, 4, 281),
(300, 'Beef Donburi', 'Japanese beef rice bowl', 30, 25, 4, 282);

INSERT INTO Ingredient (IngredientID, Name, UnitType)
VALUES
(201, 'Flour', 'Cup'),
(202, 'Sugar', 'Cup'),
(203, 'Eggs', 'Piece'),
(204, 'Milk', 'Liter'),
(205, 'Butter', 'Gram'),
(206, 'Salt', 'Teaspoon'),
(207, 'Black Pepper', 'Teaspoon'),
(208, 'Olive Oil', 'Milliliter'),
(209, 'Garlic', 'Clove'),
(210, 'Onion', 'Piece'),
(211, 'Tomato', 'Piece'),
(212, 'Chicken Breast', 'Gram'),
(213, 'Ground Beef', 'Gram'),
(214, 'Rice', 'Cup'),
(215, 'Pasta', 'Gram'),
(216, 'Baking Powder', 'Teaspoon'),
(217, 'Baking Soda', 'Teaspoon'),
(218, 'Vanilla Extract', 'Teaspoon'),
(219, 'Cocoa Powder', 'Cup'),
(220, 'Cinnamon', 'Teaspoon'),
(221, 'Yeast', 'Gram'),
(222, 'Honey', 'Milliliter'),
(223, 'Lemon Juice', 'Milliliter'),
(224, 'Vinegar', 'Milliliter'),
(225, 'Soy Sauce', 'Milliliter'),
(226, 'Chicken Broth', 'Liter'),
(227, 'Beef Broth', 'Liter'),
(228, 'Carrot', 'Piece'),
(229, 'Potato', 'Piece'),
(230, 'Bell Pepper', 'Piece'),
(231, 'Spinach', 'Gram'),
(232, 'Cheese (Cheddar)', 'Gram'),
(233, 'Parmesan Cheese', 'Gram'),
(234, 'Heavy Cream', 'Milliliter'),
(235, 'Yogurt', 'Gram'),
(236, 'Basil', 'Teaspoon'),
(237, 'Oregano', 'Teaspoon'),
(238, 'Paprika', 'Teaspoon'),
(239, 'Cumin', 'Teaspoon'),
(240, 'Curry Powder', 'Teaspoon'),
(241, 'Ginger', 'Gram'),
(242, 'Cilantro', 'Gram'),
(243, 'Parsley', 'Gram'),
(244, 'Thyme', 'Teaspoon'),
(245, 'Rosemary', 'Teaspoon'),
(246, 'Bay Leaf', 'Piece'),
(247, 'Nutmeg', 'Teaspoon'),
(248, 'Chili Powder', 'Teaspoon'),
(249, 'Red Pepper Flakes', 'Teaspoon'),
(250, 'Cornstarch', 'Teaspoon'),
(251, 'Breadcrumbs', 'Cup'),
(252, 'Tortillas', 'Piece'),
(253, 'Lettuce', 'Gram'),
(254, 'Avocado', 'Piece'),
(255, 'Lime', 'Piece'),
(256, 'Coconut Milk', 'Milliliter'),
(257, 'Peanut Butter', 'Gram'),
(258, 'Almonds', 'Gram'),
(259, 'Walnuts', 'Gram'),
(260, 'Raisins', 'Gram'),
(261, 'Oats', 'Cup'),
(262, 'Quinoa', 'Cup'),
(263, 'Lentils', 'Cup'),
(264, 'Chickpeas', 'Cup'),
(265, 'Tomato Sauce', 'Milliliter'),
(266, 'Tomato Paste', 'Milliliter'),
(267, 'Sesame Oil', 'Milliliter'),
(268, 'Fish Sauce', 'Milliliter'),
(269, 'Worcestershire Sauce', 'Milliliter'),
(270, 'Mayonnaise', 'Gram'),
(271, 'Mustard', 'Teaspoon'),
(272, 'Ketchup', 'Milliliter'),
(273, 'Barbecue Sauce', 'Milliliter'),
(274, 'Sour Cream', 'Gram'),
(275, 'Cream Cheese', 'Gram'),
(276, 'Mozzarella Cheese', 'Gram'),
(277, 'Feta Cheese', 'Gram'),
(278, 'Shrimp', 'Gram'),
(279, 'Salmon Fillet', 'Gram'),
(280, 'Tofu', 'Gram'),
(281, 'Bacon', 'Gram'),
(282, 'Ham', 'Gram'),
(283, 'Sausage', 'Gram'),
(284, 'Lasagna Noodles', 'Piece'),
(285, 'Phyllo Dough', 'Sheet'),
(286, 'Puff Pastry', 'Sheet'),
(287, 'Dark Chocolate', 'Gram'),
(288, 'White Chocolate', 'Gram'),
(289, 'Marshmallows', 'Gram'),
(290, 'Whipped Cream', 'Gram'),
(291, 'Ice Cream', 'Gram'),
(292, 'Pineapple', 'Piece'),
(293, 'Mango', 'Piece'),
(294, 'Strawberries', 'Gram'),
(295, 'Blueberries', 'Gram'),
(296, 'Raspberries', 'Gram'),
(297, 'Banana', 'Piece'),
(298, 'Apple', 'Piece'),
(299, 'Peach', 'Piece'),
(300, 'Lemon Zest', 'Teaspoon');

INSERT INTO Category (CategoryID, Name)
VALUES
(301, 'Dessert'),
(302, 'Main Course'),
(303, 'Appetizer'),
(304, 'Side Dish'),
(305, 'Soup'),
(306, 'Salad'),
(307, 'Breakfast'),
(308, 'Brunch'),
(309, 'Beverage'),
(310, 'Bread'),
(311, 'Snack'),
(312, 'Sauce/Dip'),
(313, 'Marinade'),
(314, 'Grilled/Barbecue'),
(315, 'Casserole'),
(316, 'Slow Cooker'),
(317, 'Quick & Easy'),
(318, 'Kid-Friendly'),
(319, 'Holiday Special'),
(320, 'Healthy');

INSERT INTO DietaryTag (TagID, TagName, Description)
VALUES
(501, 'Vegetarian', 'No meat or fish ingredients'),
(502, 'Vegan', 'No animal products (meat, dairy, eggs, honey)'),
(503, 'Gluten-Free', 'No gluten-containing ingredients'),
(504, 'Dairy-Free', 'No milk or dairy products'),
(505, 'Nut-Free', 'No tree nuts or peanuts'),
(506, 'Low-Carb', 'Reduced carbohydrate content'),
(507, 'Keto', 'High-fat, very low-carb for ketosis'),
(508, 'Paleo', 'Follows Paleolithic diet guidelines'),
(509, 'Halal', 'Prepared according to Islamic dietary laws'),
(510, 'Kosher', 'Complies with Jewish dietary rules'),
(511, 'Low-Sodium', 'Reduced salt content'),
(512, 'Sugar-Free', 'No added sugars or sweeteners'),
(513, 'Pescatarian', 'Includes fish but no other meat'),
(514, 'Shellfish-Free', 'No shellfish ingredients'),
(515, 'Soy-Free', 'No soy-based ingredients'),
(516, 'Egg-Free', 'No eggs or egg derivatives'),
(517, 'Low-Fat', 'Reduced fat content'),
(518, 'High-Protein', 'Emphasizes protein-rich ingredients'),
(519, 'Raw', 'Uncooked or minimally processed'),
(520, 'Whole30', 'Complies with Whole30 program rules');

INSERT INTO Equipment (EquipmentID, Name, Description)
VALUES
(401, 'Oven', 'For baking, roasting, and heating dishes'),
(402, 'Mixing Bowl', 'Stainless steel or glass bowl for combining ingredients'),
(403, 'Chef Knife', 'Sharp multi-purpose knife for chopping and slicing'),
(404, 'Blender', 'For blending smoothies, soups, and sauces'),
(405, 'Microwave', 'For reheating and quick cooking tasks'),
(406, 'Food Processor', 'For chopping, shredding, and mixing dough'),
(407, 'Stand Mixer', 'Heavy-duty mixer for doughs and batters'),
(408, 'Hand Mixer', 'Portable mixer for light mixing tasks'),
(409, 'Baking Sheet', 'Flat metal tray for cookies and sheet-pan meals'),
(410, 'Saucepan', 'Deep pot with a handle for sauces and boiling'),
(411, 'Skillet', 'Frying pan for sautéing and searing'),
(412, 'Dutch Oven', 'Heavy pot for stews, braising, and baking bread'),
(413, 'Slow Cooker', 'Electric pot for slow-cooked meals'),
(414, 'Pressure Cooker', 'For fast cooking under high pressure'),
(415, 'Grill Pan', 'Stovetop pan with ridges for grill marks'),
(416, 'Baking Dish', 'Oven-safe dish for casseroles and desserts'),
(417, 'Loaf Pan', 'For baking breads and meatloaf'),
(418, 'Muffin Tin', 'For baking muffins and cupcakes'),
(419, 'Rolling Pin', 'For flattening dough for pies and pastries'),
(420, 'Whisk', 'For mixing and aerating liquids'),
(421, 'Spatula', 'For flipping foods or scraping bowls'),
(422, 'Tongs', 'For gripping and turning hot foods'),
(423, 'Colander', 'For draining pasta and rinsing vegetables'),
(424, 'Grater', 'For shredding cheese, vegetables, or zest'),
(425, 'Peeler', 'For peeling fruits and vegetables'),
(426, 'Measuring Cups', 'For measuring dry and liquid ingredients'),
(427, 'Measuring Spoons', 'For small quantities of spices and extracts'),
(428, 'Cutting Board', 'Surface for chopping ingredients'),
(429, 'Pastry Brush', 'For applying glazes or butter'),
(430, 'Thermometer', 'For checking meat or candy temperatures'),
(431, 'Kitchen Scale', 'For precise ingredient measurements'),
(432, 'Mortar and Pestle', 'For grinding spices and herbs'),
(433, 'Ice Cream Maker', 'For churning homemade ice cream'),
(434, 'Waffle Iron', 'For making crispy waffles'),
(435, 'Rice Cooker', 'For perfectly cooked rice with minimal effort'),
(436, 'Steamer Basket', 'For steaming vegetables or dumplings'),
(437, 'Mandoline Slicer', 'For thin, uniform vegetable slices'),
(438, 'Pizza Stone', 'For crispy pizza crusts'),
(439, 'Salad Spinner', 'For drying washed greens'),
(440, 'Apron', 'Protective clothing for cooking');

INSERT INTO RecipeSteps (RecipeID, StepNumber, Instruction)
VALUES
-- RecipeID 101-120 (provided in your example)
(101, 1, 'Prepare ingredients'),
(101, 2, 'Cook as directed'),
(102, 1, 'Chop vegetables'),
(102, 2, 'Cook until tender'),
(103, 1, 'Mix ingredients'),
(103, 2, 'Bake in oven'),
(104, 1, 'Boil water'),
(104, 2, 'Simmer 15 mins'),
(105, 1, 'Season meat'),
(105, 2, 'Grill until done'),
(106, 1, 'Heat oil'),
(106, 2, 'Fry ingredients'),
(107, 1, 'Preheat oven'),
(107, 2, 'Bake 30 mins'),
(108, 1, 'Combine all items'),
(108, 2, 'Stir well'),
(109, 1, 'Slice bread'),
(109, 2, 'Toast until golden'),
(110, 1, 'Whisk sauce'),
(110, 2, 'Pour over dish'),
(111, 1, 'Marinate protein'),
(111, 2, 'Cook on stove'),
(112, 1, 'Blend mixture'),
(112, 2, 'Chill before serving'),
(113, 1, 'Knead dough'),
(113, 2, 'Rest 1 hour'),
(114, 1, 'Layer ingredients'),
(114, 2, 'Bake covered'),
(115, 1, 'Melt butter'),
(115, 2, 'Mix thoroughly'),
(116, 1, 'Steam vegetables'),
(116, 2, 'Season lightly'),
(117, 1, 'Soak grains'),
(117, 2, 'Boil 20 mins'),
(118, 1, 'Preheat grill'),
(118, 2, 'Cook 5 mins/side'),
(119, 1, 'Dice onions'),
(119, 2, 'Sauté until soft'),
(120, 1, 'Whisk eggs'),
(120, 2, 'Cook in pan'),

-- RecipeID 121-140
(121, 1, 'Chop herbs'),
(121, 2, 'Mix with sauce'),
(122, 1, 'Heat broth'),
(122, 2, 'Simmer ingredients'),
(123, 1, 'Season fish'),
(123, 2, 'Bake 25 mins'),
(124, 1, 'Boil pasta'),
(124, 2, 'Toss with sauce'),
(125, 1, 'Grind spices'),
(125, 2, 'Add to dish'),
(126, 1, 'Slice cheese'),
(126, 2, 'Melt on top'),
(127, 1, 'Peel fruit'),
(127, 2, 'Blend smooth'),
(128, 1, 'Crush garlic'),
(128, 2, 'Sauté in oil'),
(129, 1, 'Shred chicken'),
(129, 2, 'Simmer in broth'),
(130, 1, 'Roll dough'),
(130, 2, 'Bake until crisp'),
(131, 1, 'Drain beans'),
(131, 2, 'Mix with rice'),
(132, 1, 'Chill dough'),
(132, 2, 'Bake cookies'),
(133, 1, 'Slice tomatoes'),
(133, 2, 'Arrange on plate'),
(134, 1, 'Preheat skillet'),
(134, 2, 'Sear meat'),
(135, 1, 'Wash greens'),
(135, 2, 'Toss salad'),
(136, 1, 'Soak noodles'),
(136, 2, 'Stir-fry quickly'),
(137, 1, 'Mash potatoes'),
(137, 2, 'Serve warm'),
(138, 1, 'Toast spices'),
(138, 2, 'Grind to powder'),
(139, 1, 'Grate cheese'),
(139, 2, 'Sprinkle on top'),
(140, 1, 'Beat cream'),
(140, 2, 'Chill before use'),

-- RecipeID 141-160
(141, 1, 'Roast veggies'),
(141, 2, 'Drizzle oil'),
(142, 1, 'Soak lentils'),
(142, 2, 'Cook until soft'),
(143, 1, 'Crack eggs'),
(143, 2, 'Scramble in pan'),
(144, 1, 'Slice avocado'),
(144, 2, 'Layer on toast'),
(145, 1, 'Marinate tofu'),
(145, 2, 'Pan-fry'),
(146, 1, 'Chop nuts'),
(146, 2, 'Toast lightly'),
(147, 1, 'Boil potatoes'),
(147, 2, 'Mash with butter'),
(148, 1, 'Warm tortillas'),
(148, 2, 'Fill and fold'),
(149, 1, 'Chill dough'),
(149, 2, 'Roll and cut'),
(150, 1, 'Steam rice'),
(150, 2, 'Fluff with fork'),
(151, 1, 'Prep marinade'),
(151, 2, 'Coat meat'),
(152, 1, 'Dice mango'),
(152, 2, 'Mix in bowl'),
(153, 1, 'Squeeze lemon'),
(153, 2, 'Dress salad'),
(154, 1, 'Prep crust'),
(154, 2, 'Bake pie'),
(155, 1, 'Chill broth'),
(155, 2, 'Skim fat'),
(156, 1, 'Soak rice'),
(156, 2, 'Cook in pot'),
(157, 1, 'Blanch veggies'),
(157, 2, 'Shock in ice'),
(158, 1, 'Rub seasoning'),
(158, 2, 'Roast slowly'),
(159, 1, 'Strain sauce'),
(159, 2, 'Simmer reduced'),
(160, 1, 'Fold batter'),
(160, 2, 'Bake cake');

INSERT INTO RecipeSteps (RecipeID, StepNumber, Instruction)
VALUES
-- RecipeID 161-180
(161, 1, 'Chop ingredients'),
(161, 2, 'Cook until done'),
(162, 1, 'Mix ingredients'),
(162, 2, 'Bake in oven'),
(163, 1, 'Boil water'),
(163, 2, 'Simmer 15 mins'),
(164, 1, 'Season meat'),
(164, 2, 'Grill until done'),
(165, 1, 'Heat oil'),
(165, 2, 'Fry ingredients'),
(166, 1, 'Preheat oven'),
(166, 2, 'Bake 30 mins'),
(167, 1, 'Combine all items'),
(167, 2, 'Stir well'),
(168, 1, 'Slice bread'),
(168, 2, 'Toast until golden'),
(169, 1, 'Whisk sauce'),
(169, 2, 'Pour over dish'),
(170, 1, 'Marinate protein'),
(170, 2, 'Cook on stove'),
(171, 1, 'Blend mixture'),
(171, 2, 'Chill before serving'),
(172, 1, 'Knead dough'),
(172, 2, 'Rest 1 hour'),
(173, 1, 'Layer ingredients'),
(173, 2, 'Bake covered'),
(174, 1, 'Melt butter'),
(174, 2, 'Mix thoroughly'),
(175, 1, 'Steam vegetables'),
(175, 2, 'Season lightly'),
(176, 1, 'Soak grains'),
(176, 2, 'Boil 20 mins'),
(177, 1, 'Preheat grill'),
(177, 2, 'Cook 5 mins/side'),
(178, 1, 'Dice onions'),
(178, 2, 'Sauté until soft'),
(179, 1, 'Whisk eggs'),
(179, 2, 'Cook in pan'),
(180, 1, 'Chop herbs'),
(180, 2, 'Mix with sauce'),

-- RecipeID 181-200
(181, 1, 'Heat broth'),
(181, 2, 'Simmer ingredients'),
(182, 1, 'Season fish'),
(182, 2, 'Bake 25 mins'),
(183, 1, 'Boil pasta'),
(183, 2, 'Toss with sauce'),
(184, 1, 'Grind spices'),
(184, 2, 'Add to dish'),
(185, 1, 'Slice cheese'),
(185, 2, 'Melt on top'),
(186, 1, 'Peel fruit'),
(186, 2, 'Blend smooth'),
(187, 1, 'Crush garlic'),
(187, 2, 'Sauté in oil'),
(188, 1, 'Shred chicken'),
(188, 2, 'Simmer in broth'),
(189, 1, 'Roll dough'),
(189, 2, 'Bake until crisp'),
(190, 1, 'Drain beans'),
(190, 2, 'Mix with rice'),
(191, 1, 'Chill dough'),
(191, 2, 'Bake cookies'),
(192, 1, 'Slice tomatoes'),
(192, 2, 'Arrange on plate'),
(193, 1, 'Preheat skillet'),
(193, 2, 'Sear meat'),
(194, 1, 'Wash greens'),
(194, 2, 'Toss salad'),
(195, 1, 'Soak noodles'),
(195, 2, 'Stir-fry quickly'),
(196, 1, 'Mash potatoes'),
(196, 2, 'Serve warm'),
(197, 1, 'Toast spices'),
(197, 2, 'Grind to powder'),
(198, 1, 'Grate cheese'),
(198, 2, 'Sprinkle on top'),
(199, 1, 'Beat cream'),
(199, 2, 'Chill before use'),
(200, 1, 'Roast veggies'),
(200, 2, 'Drizzle oil'),

-- RecipeID 201-220
(201, 1, 'Soak lentils'),
(201, 2, 'Cook until soft'),
(202, 1, 'Crack eggs'),
(202, 2, 'Scramble in pan'),
(203, 1, 'Slice avocado'),
(203, 2, 'Layer on toast'),
(204, 1, 'Marinate tofu'),
(204, 2, 'Pan-fry'),
(205, 1, 'Chop nuts'),
(205, 2, 'Toast lightly'),
(206, 1, 'Boil potatoes'),
(206, 2, 'Mash with butter'),
(207, 1, 'Warm tortillas'),
(207, 2, 'Fill and fold'),
(208, 1, 'Chill dough'),
(208, 2, 'Roll and cut'),
(209, 1, 'Steam rice'),
(209, 2, 'Fluff with fork'),
(210, 1, 'Prep marinade'),
(210, 2, 'Coat meat'),
(211, 1, 'Dice mango'),
(211, 2, 'Mix in bowl'),
(212, 1, 'Squeeze lemon'),
(212, 2, 'Dress salad'),
(213, 1, 'Prep crust'),
(213, 2, 'Bake pie'),
(214, 1, 'Chill broth'),
(214, 2, 'Skim fat'),
(215, 1, 'Soak rice'),
(215, 2, 'Cook in pot'),
(216, 1, 'Blanch veggies'),
(216, 2, 'Shock in ice'),
(217, 1, 'Rub seasoning'),
(217, 2, 'Roast slowly'),
(218, 1, 'Strain sauce'),
(218, 2, 'Simmer reduced'),
(219, 1, 'Fold batter'),
(219, 2, 'Bake cake'),
(220, 1, 'Chop fruit'),
(220, 2, 'Arrange platter'),

-- RecipeID 221-240
(221, 1, 'Prep dough'),
(221, 2, 'Fry until golden'),
(222, 1, 'Warm sauce'),
(222, 2, 'Drizzle on top'),
(223, 1, 'Assemble dish'),
(223, 2, 'Serve hot'),
(224, 1, 'Prepare ingredients'),
(224, 2, 'Cook as directed'),
(225, 1, 'Chop vegetables'),
(225, 2, 'Cook until tender'),
(226, 1, 'Mix ingredients'),
(226, 2, 'Bake in oven'),
(227, 1, 'Boil water'),
(227, 2, 'Simmer 15 mins'),
(228, 1, 'Season meat'),
(228, 2, 'Grill until done'),
(229, 1, 'Heat oil'),
(229, 2, 'Fry ingredients'),
(230, 1, 'Preheat oven'),
(230, 2, 'Bake 30 mins'),
(231, 1, 'Combine all items'),
(231, 2, 'Stir well'),
(232, 1, 'Slice bread'),
(232, 2, 'Toast until golden'),
(233, 1, 'Whisk sauce'),
(233, 2, 'Pour over dish'),
(234, 1, 'Marinate protein'),
(234, 2, 'Cook on stove'),
(235, 1, 'Blend mixture'),
(235, 2, 'Chill before serving'),
(236, 1, 'Knead dough'),
(236, 2, 'Rest 1 hour'),
(237, 1, 'Layer ingredients'),
(237, 2, 'Bake covered'),
(238, 1, 'Melt butter'),
(238, 2, 'Mix thoroughly'),
(239, 1, 'Steam vegetables'),
(239, 2, 'Season lightly'),
(240, 1, 'Soak grains'),
(240, 2, 'Boil 20 mins'),

-- RecipeID 241-260
(241, 1, 'Preheat grill'),
(241, 2, 'Cook 5 mins/side'),
(242, 1, 'Dice onions'),
(242, 2, 'Sauté until soft'),
(243, 1, 'Whisk eggs'),
(243, 2, 'Cook in pan'),
(244, 1, 'Chop herbs'),
(244, 2, 'Mix with sauce'),
(245, 1, 'Heat broth'),
(245, 2, 'Simmer ingredients'),
(246, 1, 'Season fish'),
(246, 2, 'Bake 25 mins'),
(247, 1, 'Boil pasta'),
(247, 2, 'Toss with sauce'),
(248, 1, 'Grind spices'),
(248, 2, 'Add to dish'),
(249, 1, 'Slice cheese'),
(249, 2, 'Melt on top'),
(250, 1, 'Peel fruit'),
(250, 2, 'Blend smooth'),
(251, 1, 'Crush garlic'),
(251, 2, 'Sauté in oil'),
(252, 1, 'Shred chicken'),
(252, 2, 'Simmer in broth'),
(253, 1, 'Roll dough'),
(253, 2, 'Bake until crisp'),
(254, 1, 'Drain beans'),
(254, 2, 'Mix with rice'),
(255, 1, 'Chill dough'),
(255, 2, 'Bake cookies'),
(256, 1, 'Slice tomatoes'),
(256, 2, 'Arrange on plate'),
(257, 1, 'Preheat skillet'),
(257, 2, 'Sear meat'),
(258, 1, 'Wash greens'),
(258, 2, 'Toss salad'),
(259, 1, 'Soak noodles'),
(259, 2, 'Stir-fry quickly'),
(260, 1, 'Mash potatoes'),
(260, 2, 'Serve warm'),

-- RecipeID 261-280
(261, 1, 'Toast spices'),
(261, 2, 'Grind to powder'),
(262, 1, 'Grate cheese'),
(262, 2, 'Sprinkle on top'),
(263, 1, 'Beat cream'),
(263, 2, 'Chill before use'),
(264, 1, 'Roast veggies'),
(264, 2, 'Drizzle oil'),
(265, 1, 'Soak lentils'),
(265, 2, 'Cook until soft'),
(266, 1, 'Crack eggs'),
(266, 2, 'Scramble in pan'),
(267, 1, 'Slice avocado'),
(267, 2, 'Layer on toast'),
(268, 1, 'Marinate tofu'),
(268, 2, 'Pan-fry'),
(269, 1, 'Chop nuts'),
(269, 2, 'Toast lightly'),
(270, 1, 'Boil potatoes'),
(270, 2, 'Mash with butter'),
(271, 1, 'Warm tortillas'),
(271, 2, 'Fill and fold'),
(272, 1, 'Chill dough'),
(272, 2, 'Roll and cut'),
(273, 1, 'Steam rice'),
(273, 2, 'Fluff with fork'),
(274, 1, 'Prep marinade'),
(274, 2, 'Coat meat'),
(275, 1, 'Dice mango'),
(275, 2, 'Mix in bowl'),
(276, 1, 'Squeeze lemon'),
(276, 2, 'Dress salad'),
(277, 1, 'Prep crust'),
(277, 2, 'Bake pie'),
(278, 1, 'Chill broth'),
(278, 2, 'Skim fat'),
(279, 1, 'Soak rice'),
(279, 2, 'Cook in pot'),
(280, 1, 'Blanch veggies'),
(280, 2, 'Shock in ice'),

-- RecipeID 281-300
(281, 1, 'Rub seasoning'),
(281, 2, 'Roast slowly'),
(282, 1, 'Strain sauce'),
(282, 2, 'Simmer reduced'),
(283, 1, 'Fold batter'),
(283, 2, 'Bake cake'),
(284, 1, 'Chop fruit'),
(284, 2, 'Arrange platter'),
(285, 1, 'Prep dough'),
(285, 2, 'Fry until golden'),
(286, 1, 'Warm sauce'),
(286, 2, 'Drizzle on top'),
(287, 1, 'Assemble dish'),
(287, 2, 'Serve hot'),
(288, 1, 'Prepare ingredients'),
(288, 2, 'Cook as directed'),
(289, 1, 'Chop vegetables'),
(289, 2, 'Cook until tender'),
(290, 1, 'Mix ingredients'),
(290, 2, 'Bake in oven'),
(291, 1, 'Boil water'),
(291, 2, 'Simmer 15 mins'),
(292, 1, 'Season meat'),
(292, 2, 'Grill until done'),
(293, 1, 'Heat oil'),
(293, 2, 'Fry ingredients'),
(294, 1, 'Preheat oven'),
(294, 2, 'Bake 30 mins'),
(295, 1, 'Combine all items'),
(295, 2, 'Stir well'),
(296, 1, 'Slice bread'),
(296, 2, 'Toast until golden'),
(297, 1, 'Whisk sauce'),
(297, 2, 'Pour over dish'),
(298, 1, 'Marinate protein'),
(298, 2, 'Cook on stove'),
(299, 1, 'Blend mixture'),
(299, 2, 'Chill before serving'),
(300, 1, 'Knead dough'),
(300, 2, 'Rest 1 hour');

INSERT INTO NutritionalInfo (RecipeID, Calories, Protein, Carbs, Fat)
VALUES
-- RecipeID 101-110 (Desserts/Baked Goods)
(101, 450, 6, 60, 20),   -- Chocolate Cake
(102, 300, 8, 45, 12),    -- Cookies
(103, 250, 3, 30, 10),    -- Fruit Tart
(104, 600, 10, 80, 25),   -- Cheesecake
(105, 180, 2, 25, 8),     -- Muffins
(106, 400, 5, 55, 15),    -- Brownies
(107, 350, 4, 50, 12),    -- Pancakes
(108, 500, 7, 70, 18),    -- Pie
(109, 280, 3, 35, 9),     -- Custard
(110, 320, 4, 40, 14),    -- Pudding

-- RecipeID 111-120 (Main Courses)
(111, 600, 25, 40, 30),   -- Grilled Chicken
(112, 700, 30, 50, 35),   -- Beef Steak
(113, 550, 20, 60, 25),   -- Pasta Carbonara
(114, 500, 18, 45, 22),   -- Stir-Fry
(115, 650, 28, 55, 28),   -- Salmon
(116, 750, 35, 70, 40),   -- Burger
(117, 580, 22, 65, 20),   -- Pizza
(118, 620, 26, 30, 35),   -- Meatloaf
(119, 530, 24, 25, 28),   -- Pork Chops
(120, 670, 32, 45, 38),   -- Lamb Curry

-- RecipeID 121-130 (Salads/Soups)
(121, 150, 5, 10, 8),     -- Garden Salad
(122, 200, 8, 15, 10),    -- Caesar Salad
(123, 180, 6, 20, 7),     -- Tomato Soup
(124, 220, 10, 25, 9),    -- Lentil Soup
(125, 170, 7, 12, 6),     -- Greek Salad
(126, 190, 9, 18, 8),     -- Minestrone
(127, 160, 4, 14, 5),     -- Coleslaw
(128, 210, 11, 22, 7),    -- Chicken Noodle Soup
(129, 140, 3, 8, 4),      -- Fruit Salad
(130, 230, 12, 28, 10),   -- Chowder

-- RecipeID 131-140 (Snacks/Sides)
(131, 120, 2, 15, 5),     -- Chips
(132, 100, 3, 10, 4),     -- Veggie Sticks
(133, 250, 5, 30, 12),    -- Nachos
(134, 180, 4, 20, 8),     -- Garlic Bread
(135, 90, 1, 8, 3),       -- Popcorn
(136, 200, 6, 25, 9),     -- Fries
(137, 160, 3, 18, 7),     -- Hummus
(138, 220, 7, 28, 10),    -- Samosas
(139, 130, 2, 12, 5),     -- Crackers
(140, 280, 8, 35, 15);    -- Quesadilla

INSERT INTO NutritionalInfo (RecipeID, Calories, Protein, Carbs, Fat)
VALUES
-- RecipeID 141-160 (Seafood/Asian Dishes)
(141, 300, 15, 50, 5),   -- Sushi Rolls
(142, 550, 18, 60, 25),   -- Pesto Pasta
(143, 400, 6, 45, 22),    -- Creme Brulee
(144, 380, 20, 30, 18),   -- Beef Burrito
(145, 220, 8, 25, 10),    -- Ratatouille
(146, 450, 9, 55, 25),    -- Cheesecake
(147, 350, 25, 40, 12),   -- Pho
(148, 180, 20, 5, 8),     -- Tuna Salad
(149, 450, 28, 10, 30),   -- Chicken Wings
(150, 200, 4, 35, 7),     -- Mashed Potatoes
(151, 600, 35, 45, 35),   -- Pulled Pork Sandwich
(152, 280, 15, 30, 12),   -- Clam Chowder
(153, 320, 18, 40, 15),   -- Stuffed Peppers
(154, 80, 2, 15, 3),      -- Macarons
(155, 280, 22, 25, 12),   -- Fish Tacos
(156, 250, 10, 35, 8),    -- Egg Fried Rice
(157, 150, 5, 20, 6),     -- Bruschetta
(158, 220, 6, 30, 9),     -- Potato Salad
(159, 400, 25, 35, 20),   -- Beef Tacos
(160, 300, 4, 40, 15),    -- Panna Cotta

-- RecipeID 161-180 (Wraps/Sandwiches)
(161, 320, 20, 30, 12),   -- Chicken Caesar Wrap
(162, 180, 8, 25, 6),     -- Minestrone Soup
(163, 220, 7, 30, 8),     -- Pancakes
(164, 280, 25, 10, 18),   -- Garlic Shrimp
(165, 450, 22, 50, 20),   -- Beef Lo Mein
(166, 250, 12, 20, 15),   -- Cheese Platter
(167, 380, 18, 25, 22),   -- Chicken Quesadilla
(168, 120, 3, 20, 4),     -- Gazpacho
(169, 320, 30, 5, 20),    -- Baked Salmon
(170, 80, 5, 10, 3),      -- Miso Soup
(171, 420, 28, 15, 25),   -- Chicken Satay
(172, 550, 15, 65, 25),   -- Fettuccine Alfredo
(173, 220, 4, 30, 8),     -- Churros
(174, 380, 20, 25, 22),   -- Lobster Bisque
(175, 480, 25, 40, 28),   -- Chicken Tikka Masala
(176, 250, 10, 15, 18),   -- Baked Brie
(177, 520, 30, 45, 30),   -- Paella
(178, 280, 18, 20, 15),   -- Beef Empanadas
(179, 150, 2, 35, 3),     -- Mango Sorbet
(180, 450, 20, 40, 25),   -- Chicken Pot Pie

-- RecipeID 181-200 (International Cuisine)
(181, 350, 18, 50, 12),   -- Ramen
(182, 200, 15, 10, 12),   -- Ceviche
(183, 600, 22, 55, 35),   -- Biscuits and Gravy
(184, 280, 12, 35, 10),   -- Dumplings
(185, 320, 4, 50, 12),    -- Key Lime Pie
(186, 380, 30, 20, 22),   -- Beef Kabobs
(187, 180, 8, 20, 8),     -- French Onion Soup
(188, 420, 18, 45, 25),   -- Coconut Curry
(189, 220, 3, 40, 7),     -- Apple Crisp
(190, 250, 12, 25, 10),   -- Tofu Stir-Fry
(191, 280, 4, 45, 10),    -- Pumpkin Pie
(192, 320, 20, 35, 12),   -- Chicken Fried Rice
(193, 450, 25, 40, 25),   -- Goulash
(194, 350, 10, 40, 18),   -- Nachos
(195, 300, 12, 20, 18),   -- Cheese Fondue
(196, 180, 2, 30, 6),     -- Lemon Bars
(197, 480, 30, 35, 28),   -- Beef Bulgogi
(198, 320, 12, 25, 18),   -- Eggplant Parmesan
(199, 380, 25, 30, 20),   -- Pulled Chicken Sandwich
(200, 120, 2, 25, 3),     -- Mochi

-- RecipeID 201-220 (Desserts/Beverages)
(201, 280, 4, 35, 12),    -- Chocolate Mousse
(202, 650, 35, 25, 45),   -- Beef Wellington
(203, 400, 22, 30, 20),   -- Greek Gyros
(204, 450, 28, 35, 25),   -- Chicken Shawarma
(205, 220, 5, 35, 8),     -- Baklava
(206, 380, 20, 25, 22),   -- Lobster Roll
(207, 320, 18, 20, 18),   -- Crab Cakes
(208, 420, 15, 40, 25),   -- Beef Nachos
(209, 480, 25, 45, 28),   -- Butter Chicken
(210, 300, 8, 50, 12),    -- Pumpkin Risotto
(211, 350, 22, 30, 18),   -- Chicken Fajitas
(212, 220, 5, 35, 8),     -- Croissants
(213, 400, 25, 50, 15),   -- Beef Pho
(214, 450, 30, 25, 28),   -- Chicken Katsu
(215, 120, 2, 25, 3),     -- Matcha Latte
(216, 280, 12, 35, 10),   -- Pork Dumplings
(217, 320, 7, 45, 12),    -- Churro Waffles
(218, 380, 18, 50, 15),   -- Bibimbap
(219, 250, 4, 55, 6),     -- Mango Sticky Rice
(220, 420, 28, 30, 22),   -- Chicken Teriyaki

-- RecipeID 221-240 (Pastries/Salads)
(221, 280, 4, 40, 10),    -- Raspberry Tart
(222, 380, 22, 25, 20),   -- Beef Sliders
(223, 180, 5, 20, 8),     -- Avocado Toast
(224, 350, 25, 15, 22),   -- Lemon Pepper Wings
(225, 100, 5, 10, 4),     -- Egg Drop Soup
(226, 450, 20, 55, 20),   -- Chicken Pad See Ew
(227, 320, 15, 40, 12),   -- Pineapple Fried Rice
(228, 400, 25, 35, 22),   -- Beef Tacos
(229, 250, 3, 35, 10),    -- Chocolate Fondue
(230, 180, 4, 25, 6),     -- Butternut Squash Soup
(231, 300, 18, 40, 10),   -- Salmon Sushi Rolls
(232, 380, 15, 45, 18),   -- Hawaiian Pizza
(233, 420, 22, 30, 25),   -- Beef Enchiladas
(234, 320, 18, 35, 15),   -- Chicken Noodle Casserole
(235, 280, 4, 50, 8),     -- Peach Cobbler
(236, 350, 20, 40, 15),   -- Shrimp Fried Rice
(237, 480, 30, 25, 30),   -- Beef Birria Tacos
(238, 220, 5, 35, 8),     -- Chocolate Eclairs
(239, 180, 6, 20, 7),     -- Vegetable Tempura
(240, 250, 18, 15, 12),   -- Chicken Caesar Salad

-- RecipeID 241-260 (Asian/Comfort Food)
(241, 400, 22, 50, 18),   -- Beef Ramen
(242, 220, 3, 35, 8),     -- Apple Fritters
(243, 380, 25, 30, 20),   -- Pork Belly Buns
(244, 300, 18, 25, 12),   -- Chicken Satay Salad
(245, 420, 28, 20, 25),   -- Beef Kofta
(246, 280, 5, 45, 10),    -- Cinnamon Rolls
(247, 320, 15, 25, 18),   -- Beef Gyoza
(248, 280, 12, 30, 10),   -- Chicken Potstickers
(249, 220, 10, 15, 12),   -- Shakshuka
(250, 450, 30, 25, 30),   -- Beef Rendang
(251, 380, 22, 35, 20),   -- Chicken Korma
(252, 120, 2, 25, 2),     -- Mango Lassi
(253, 350, 20, 25, 18),   -- Beef Empanadas
(254, 400, 25, 30, 22),   -- Chicken Adobo
(255, 150, 1, 30, 4),     -- Pumpkin Spice Latte
(256, 180, 25, 5, 8),     -- Beef Jerky
(257, 320, 22, 15, 20),   -- Chicken Piccata
(258, 380, 25, 35, 22),   -- Beef Tamales
(259, 300, 20, 25, 15),   -- Chicken Souvlaki
(260, 250, 18, 5, 18),    -- Beef Carpaccio

-- RecipeID 261-280 (Meat-Centric Dishes)
(261, 350, 22, 20, 18),   -- Chicken Tenders
(262, 280, 20, 5, 18),    -- Beef Tartare
(263, 420, 25, 30, 25),   -- Chicken Mole
(264, 450, 30, 25, 30),   -- Beef Fajitas
(265, 320, 22, 30, 15),   -- Chicken Gyro
(266, 480, 35, 15, 35),   -- Beef Brisket
(267, 280, 18, 25, 12),   -- Chicken Naan Wrap
(268, 520, 35, 20, 35),   -- Beef Short Ribs
(269, 450, 28, 50, 25),   -- Chicken Paella
(270, 380, 25, 20, 22),   -- Beef Kebabs
(271, 400, 30, 25, 25),   -- Chicken Tikka
(272, 550, 25, 60, 30),   -- Beef Lasagna
(273, 420, 28, 15, 28),   -- Chicken Cordon Bleu
(274, 480, 30, 25, 32),   -- Beef Cheesesteak
(275, 220, 10, 25, 10),   -- Chicken Wontons
(276, 500, 30, 20, 35),   -- Beef Bourguignon
(277, 380, 25, 15, 25),   -- Chicken Marsala
(278, 320, 18, 25, 18),   -- Beef Samosas
(279, 450, 25, 40, 25),   -- Chicken Gumbo
(280, 400, 28, 20, 25),   -- Beef Kebabs

-- RecipeID 281-300 (Global Dishes)
(281, 350, 25, 15, 20),   -- Chicken Schnitzel
(282, 380, 22, 50, 15),   -- Beef Udon
(283, 300, 20, 25, 12),   -- Chicken Satay
(284, 420, 28, 20, 25),   -- Beef Souvlaki
(285, 250, 8, 35, 8),     -- Chicken Curry Puffs
(286, 450, 15, 50, 25),   -- Beef Poutine
(287, 320, 18, 25, 15),   -- Chicken Empanadas
(288, 380, 22, 40, 20),   -- Beef Hot Pot
(289, 300, 25, 15, 15),   -- Chicken Yakitori
(290, 400, 28, 45, 20),   -- Beef Bulgogi Bowl
(291, 350, 20, 50, 12),   -- Chicken Ramen
(292, 420, 30, 20, 25),   -- Beef Satay
(293, 380, 25, 40, 18),   -- Chicken Pho
(294, 450, 22, 35, 28),   -- Beef Curry
(295, 280, 15, 30, 10),   -- Chicken Noodle Stir-Fry
(296, 400, 20, 50, 18),   -- Beef Lo Mein
(297, 250, 12, 35, 8),    -- Chicken Congee
(298, 180, 10, 20, 8),    -- Beef Miso Soup
(299, 320, 22, 30, 15),   -- Chicken Kebab Bowl
(300, 380, 25, 45, 20);   -- Beef Donburi

INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
-- Recipe 101-110
(101, 201, 2.5, 'Cup'), (101, 219, 0.75, 'Cup'),
(102, 201, 2.25, 'Cup'), (102, 287, 300, 'Gram'),
(103, 201, 1.5, 'Cup'), (103, 295, 2, 'Cup'),
(104, 275, 500, 'Gram'), (104, 285, 1.5, 'Cup'),
(105, 201, 2, 'Cup'), (105, 216, 2, 'Teaspoon'),
(106, 212, 500, 'Gram'), (106, 265, 1, 'Cup'),    -- Chicken Alfredo
(107, 201, 1.5, 'Cup'), (107, 295, 1, 'Cup'),      -- Blueberry Pancakes
(108, 211, 6, 'Piece'), (108, 265, 2, 'Cup'),      -- Tomato Soup
(109, 201, 1, 'Cup'), (109, 209, 3, 'Clove'),      -- Garlic Bread
(110, 279, 2, 'Piece'), (110, 223, 2, 'Tablespoon'), -- Lemon Herb Salmon

-- Recipe 111-120
(111, 214, 1.5, 'Cup'), (111, 278, 200, 'Gram'),   -- Mushroom Risotto
(112, 211, 4, 'Piece'), (112, 276, 150, 'Gram'),   -- Caprese Salad
(113, 213, 800, 'Gram'), (113, 273, 0.5, 'Cup'),   -- BBQ Ribs
(114, 215, 300, 'Gram'), (114, 231, 2, 'Cup'),     -- Vegetable Lasagna
(115, 297, 3, 'Piece'), (115, 202, 1, 'Cup'),      -- Banana Bread
(116, 201, 2.5, 'Cup'), (116, 211, 4, 'Piece'),    -- Margherita Pizza
(117, 212, 400, 'Gram'), (117, 215, 200, 'Gram'),  -- Chicken Noodle Soup
(118, 228, 3, 'Piece'), (118, 277, 100, 'Gram'),   -- Greek Salad
(119, 213, 600, 'Gram'), (119, 264, 1, 'Cup'),     -- Beef Chili
(120, 278, 300, 'Gram'), (120, 215, 200, 'Gram');

INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
-- Recipe 121-130
(121, 221, 1.5, 'Cup'), (121, 222, 200, 'Gram'),     -- Caesar Salad (Lettuce, Parmesan)
(122, 223, 2, 'Piece'), (122, 224, 1, 'Tablespoon'), -- Pad Thai (Rice Noodles, Shrimp)
(123, 225, 3, 'Tablespoon'), (123, 226, 2, 'Cup'),   -- Grilled Cheese (Bread, Cheese)
(124, 227, 500, 'Gram'), (124, 228, 4, 'Piece'),     -- Beef Burger (Beef, Buns)
(125, 229, 3, 'Piece'), (125, 230, 2, 'Cup'),        -- Omelette (Eggs, Bell Pepper)
(126, 231, 150, 'Gram'), (126, 232, 1, 'Cup'),       -- Chicken Curry (Chicken, Coconut Milk)
(127, 233, 2, 'Cup'), (127, 234, 100, 'Gram'),       -- French Toast (Bread, Milk)
(128, 235, 1, 'Cup'), (128, 236, 1, 'Teaspoon'),     -- Guacamole (Avocado, Lime)
(129, 237, 300, 'Gram'), (129, 238, 1, 'Cup'),       -- Baked Ziti (Pasta, Tomato Sauce)
(130, 239, 2, 'Piece'), (130, 240, 150, 'Gram'),     -- Cobb Salad (Chicken, Bacon)

-- Recipe 131-140
(131, 241, 1.5, 'Cup'), (131, 242, 2, 'Tablespoon'), -- Pumpkin Soup (Pumpkin, Cream)
(132, 243, 200, 'Gram'), (132, 244, 3, 'Clove'),     -- Pad Thai (Shrimp, Garlic)
(133, 245, 2, 'Cup'), (133, 246, 1, 'Piece'),        -- Tiramisu (Coffee, Ladyfingers)
(134, 247, 400, 'Gram'), (134, 248, 2, 'Cup'),       -- Beef Stroganoff (Beef, Mushrooms)
(135, 249, 1, 'Cup'), (135, 250, 100, 'Gram'),       -- Falafel Wrap (Chickpeas, Pita)
(136, 251, 2.5, 'Cup'), (136, 252, 200, 'Gram'),     -- Chocolate Chip Cookies (Flour, Chocolate)
(137, 253, 300, 'Gram'), (137, 254, 1, 'Piece'),     -- Chicken Parmesan (Chicken, Cheese)
(138, 255, 1.5, 'Cup'), (138, 256, 0.5, 'Cup'),      -- Quiche Lorraine (Eggs, Cream)
(139, 257, 1, 'Cup'), (139, 258, 2, 'Tablespoon'),   -- Hummus (Chickpeas, Tahini)
(140, 259, 3, 'Cup'), (140, 260, 150, 'Gram'),       -- Lentil Soup (Lentils, Carrots)

-- Recipe 141-150
(141, 261, 2, 'Piece'), (141, 262, 200, 'Gram'),     -- Sushi Rolls (Rice, Fish)
(142, 263, 1.5, 'Cup'), (142, 264, 100, 'Gram'),     -- Pesto Pasta (Basil, Pine Nuts)
(143, 265, 3, 'Tablespoon'), (143, 266, 1, 'Cup'),   -- Creme Brulee (Cream, Sugar)
(144, 267, 2, 'Cup'), (144, 268, 150, 'Gram'),       -- Beef Burrito (Beef, Tortilla)
(145, 269, 1, 'Cup'), (145, 270, 2, 'Piece'),        -- Ratatouille (Eggplant, Zucchini)
(146, 271, 300, 'Gram'), (146, 272, 1, 'Cup'),       -- Cheesecake (Cream Cheese, Graham Crumbs)
(147, 273, 400, 'Gram'), (147, 274, 2, 'Cup'),       -- Pho (Beef, Rice Noodles)
(148, 275, 150, 'Gram'), (148, 276, 1, 'Cup'),       -- Tuna Salad (Tuna, Mayo)
(149, 277, 500, 'Gram'), (149, 278, 2, 'Cup'),       -- Chicken Wings (Chicken, Hot Sauce)
(150, 279, 4, 'Piece'), (150, 280, 100, 'Gram'),     -- Mashed Potatoes (Potatoes, Butter)

-- Recipe 151-160
(151, 281, 300, 'Gram'), (151, 282, 2, 'Cup'),       -- Pulled Pork Sandwich (Pork, BBQ Sauce)
(152, 283, 1.5, 'Cup'), (152, 284, 200, 'Gram'),     -- Clam Chowder (Clams, Cream)
(153, 285, 2, 'Piece'), (153, 286, 1, 'Cup'),        -- Stuffed Peppers (Peppers, Rice)
(154, 287, 0.5, 'Cup'), (154, 288, 150, 'Gram'),     -- Macarons (Almond Flour, Sugar)
(155, 289, 2, 'Piece'), (155, 290, 100, 'Gram'),     -- Fish Tacos (Fish, Tortilla)
(156, 291, 1.5, 'Cup'), (156, 292, 2, 'Cup'),        -- Egg Fried Rice (Rice, Eggs)
(157, 293, 1, 'Cup'), (157, 294, 1, 'Piece'),        -- Bruschetta (Tomato, Bread)
(158, 295, 3, 'Cup'), (158, 296, 200, 'Gram'),       -- Potato Salad (Potatoes, Mayo)
(159, 297, 2, 'Cup'), (159, 298, 150, 'Gram'),       -- Beef Tacos (Beef, Tortilla)
(160, 299, 1, 'Cup'), (160, 300, 100, 'Gram');

INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
-- Recipe 161-170 (Main Courses)
(161, 212, 400, 'Gram'), (161, 252, 4, 'Piece'),    -- Chicken Caesar Wrap (Chicken, Tortilla)
(162, 215, 300, 'Gram'), (162, 265, 1.5, 'Cup'),    -- Minestrone Soup (Pasta, Tomato Sauce)
(163, 201, 2, 'Cup'), (163, 203, 2, 'Piece'),       -- Pancakes (Flour, Eggs)
(164, 278, 300, 'Gram'), (164, 209, 3, 'Clove'),    -- Garlic Shrimp (Shrimp, Garlic)
(165, 213, 500, 'Gram'), (165, 225, 2, 'Tablespoon'), -- Beef Lo Mein (Beef, Soy Sauce)
(166, 276, 200, 'Gram'), (166, 292, 1, 'Piece'),    -- Cheese Platter (Mozzarella, Pineapple)
(167, 212, 350, 'Gram'), (167, 252, 2, 'Piece'),    -- Chicken Quesadilla (Chicken, Tortilla)
(168, 211, 6, 'Piece'), (168, 208, 3, 'Tablespoon'),-- Gazpacho (Tomatoes, Olive Oil)
(169, 279, 2, 'Piece'), (169, 223, 1, 'Tablespoon'),-- Baked Salmon (Salmon, Lemon Juice)
(170, 280, 200, 'Gram'), (170, 225, 1, 'Tablespoon'), -- Miso Soup (Tofu, Soy Sauce)

-- Recipe 171-180 (International Dishes)
(171, 212, 400, 'Gram'), (171, 257, 50, 'Gram'),    -- Chicken Satay (Chicken, Peanut Butter)
(172, 215, 300, 'Gram'), (172, 233, 1, 'Cup'),      -- Fettuccine Alfredo (Pasta, Parmesan)
(173, 201, 1.5, 'Cup'), (173, 202, 0.75, 'Cup'),    -- Churros (Flour, Sugar)
(174, 278, 300, 'Gram'), (174, 234, 1, 'Cup'),      -- Lobster Bisque (Lobster, Cream)
(175, 212, 500, 'Gram'), (175, 256, 1, 'Cup'),      -- Chicken Tikka Masala (Chicken, Coconut Milk)
(176, 275, 250, 'Gram'), (176, 222, 2, 'Tablespoon'),-- Baked Brie (Brie, Honey)
(177, 214, 2, 'Cup'), (177, 278, 300, 'Gram'),      -- Paella (Rice, Shrimp)
(178, 213, 400, 'Gram'), (178, 252, 6, 'Piece'),    -- Beef Empanadas (Beef, Pastry)
(179, 293, 2, 'Piece'), (179, 202, 0.5, 'Cup'),     -- Mango Sorbet (Mango, Sugar)
(180, 212, 400, 'Gram'), (180, 229, 4, 'Piece'),    -- Chicken Pot Pie (Chicken, Potatoes)

-- Recipe 181-190 (Soups/Asian)
(181, 215, 200, 'Gram'), (181, 226, 1.5, 'Cup'),    -- Ramen (Noodles, Chicken Broth)
(182, 278, 250, 'Gram'), (182, 223, 3, 'Tablespoon'),-- Ceviche (Fish, Lime Juice)
(183, 283, 300, 'Gram'), (183, 201, 2, 'Cup'),      -- Biscuits and Gravy (Sausage, Flour)
(184, 284, 200, 'Gram'), (184, 231, 1, 'Cup'),      -- Dumplings (Pork, Cabbage)
(185, 223, 0.5, 'Cup'), (185, 202, 1, 'Cup'),       -- Key Lime Pie (Lime Juice, Sugar)
(186, 213, 500, 'Gram'), (186, 230, 3, 'Piece'),    -- Beef Kabobs (Beef, Bell Peppers)
(187, 210, 4, 'Piece'), (187, 227, 2, 'Cup'),       -- French Onion Soup (Onions, Beef Broth)
(188, 256, 1, 'Cup'), (188, 240, 2, 'Teaspoon'),    -- Coconut Curry (Coconut Milk, Curry Powder)
(189, 298, 4, 'Piece'), (189, 261, 1, 'Cup'),       -- Apple Crisp (Apples, Oats)
(190, 280, 300, 'Gram'), (190, 225, 2, 'Tablespoon'),-- Tofu Stir-Fry (Tofu, Soy Sauce)

-- Recipe 191-200 (Desserts/Snacks)
(191, 202, 1.5, 'Cup'), (191, 297, 2, 'Piece'),     -- Pumpkin Pie (Sugar, Pumpkin)
(192, 212, 300, 'Gram'), (192, 214, 2, 'Cup'),      -- Chicken Fried Rice (Chicken, Rice)
(193, 213, 600, 'Gram'), (193, 238, 2, 'Teaspoon'), -- Goulash (Beef, Paprika)
(194, 232, 200, 'Gram'), (194, 252, 8, 'Piece'),    -- Nachos (Cheese, Tortilla Chips)
(195, 275, 300, 'Gram'), (195, 286, 1, 'Sheet'),    -- Cheese Fondue (Cheese, Bread)
(196, 223, 0.5, 'Cup'), (196, 202, 1, 'Cup'),       -- Lemon Bars (Lemon Juice, Sugar)
(197, 213, 500, 'Gram'), (197, 225, 3, 'Tablespoon'),-- Beef Bulgogi (Beef, Soy Sauce)
(198, 231, 300, 'Gram'), (198, 233, 1, 'Cup'),      -- Eggplant Parmesan (Eggplant, Parmesan)
(199, 212, 400, 'Gram'), (199, 273, 0.5, 'Cup'),    -- Pulled Chicken Sandwich (Chicken, BBQ Sauce)
(200, 214, 2, 'Cup'), (200, 256, 1, 'Cup'),         -- Mochi (Rice, Coconut Milk)

-- Recipe 201-210 (Global Cuisine)
(201, 219, 0.5, 'Cup'), (201, 234, 1, 'Cup'),       -- Chocolate Mousse (Cocoa Powder, Cream)
(202, 213, 600, 'Gram'), (202, 286, 1, 'Sheet'),    -- Beef Wellington (Beef, Puff Pastry)
(203, 282, 300, 'Gram'), (203, 252, 4, 'Piece'),    -- Greek Gyros (Lamb, Pita)
(204, 212, 500, 'Gram'), (204, 225, 3, 'Tablespoon'),-- Chicken Shawarma (Chicken, Soy Sauce)
(205, 258, 1, 'Cup'), (205, 202, 1, 'Cup'),         -- Baklava (Phyllo Dough, Honey)
(206, 278, 300, 'Gram'), (206, 252, 2, 'Piece'),    -- Lobster Roll (Lobster, Bun)
(207, 278, 250, 'Gram'), (207, 251, 1, 'Cup'),      -- Crab Cakes (Crab, Breadcrumbs)
(208, 213, 400, 'Gram'), (208, 232, 200, 'Gram'),   -- Beef Nachos (Beef, Cheese)
(209, 212, 500, 'Gram'), (209, 265, 1.5, 'Cup'),    -- Butter Chicken (Chicken, Tomato Sauce)
(210, 214, 1.5, 'Cup'), (210, 297, 2, 'Cup'),       -- Pumpkin Risotto (Rice, Pumpkin)

-- Recipe 211-220 (Mexican/Italian)
(211, 212, 400, 'Gram'), (211, 230, 3, 'Piece'),    -- Chicken Fajitas (Chicken, Bell Peppers)
(212, 201, 3, 'Cup'), (212, 205, 250, 'Gram'),      -- Croissants (Flour, Butter)
(213, 213, 500, 'Gram'), (213, 215, 200, 'Gram'),   -- Beef Pho (Beef, Rice Noodles)
(214, 212, 400, 'Gram'), (214, 251, 1, 'Cup'),      -- Chicken Katsu (Chicken, Breadcrumbs)
(215, 214, 1, 'Cup'), (215, 256, 1, 'Cup'),         -- Matcha Latte (Rice, Coconut Milk)
(216, 284, 300, 'Gram'), (216, 225, 2, 'Tablespoon'),-- Pork Dumplings (Pork, Soy Sauce)
(217, 201, 1.5, 'Cup'), (217, 202, 0.5, 'Cup'),     -- Churro Waffles (Flour, Sugar)
(218, 214, 2, 'Cup'), (218, 212, 300, 'Gram'),      -- Bibimbap (Rice, Chicken)
(219, 214, 1.5, 'Cup'), (219, 293, 2, 'Piece'),     -- Mango Sticky Rice (Rice, Mango)
(220, 212, 400, 'Gram'), (220, 225, 3, 'Tablespoon'),-- Chicken Teriyaki (Chicken, Soy Sauce)

-- Recipe 221-230 (Pastries/Salads)
(221, 296, 1.5, 'Cup'), (221, 285, 1, 'Sheet'),     -- Raspberry Tart (Raspberries, Phyllo Dough)
(222, 213, 300, 'Gram'), (222, 252, 6, 'Piece'),    -- Beef Sliders (Beef, Buns)
(223, 254, 1, 'Piece'), (223, 252, 2, 'Piece'),     -- Avocado Toast (Avocado, Bread)
(224, 212, 500, 'Gram'), (224, 223, 2, 'Tablespoon'),-- Lemon Pepper Wings (Chicken, Lemon Juice)
(225, 203, 2, 'Piece'), (225, 226, 1, 'Cup'),       -- Egg Drop Soup (Eggs, Chicken Broth)
(226, 215, 300, 'Gram'), (226, 225, 2, 'Tablespoon'),-- Chicken Pad See Ew (Noodles, Soy Sauce)
(227, 214, 2, 'Cup'), (227, 292, 1, 'Piece'),       -- Pineapple Fried Rice (Rice, Pineapple)
(228, 213, 400, 'Gram'), (228, 252, 6, 'Piece'),    -- Beef Tacos (Beef, Tortillas)
(229, 287, 200, 'Gram'), (229, 296, 1, 'Cup'),      -- Chocolate Fondue (Chocolate, Strawberries)
(230, 297, 2, 'Cup'), (230, 226, 1, 'Cup'),         -- Butternut Squash Soup (Squash, Broth)

-- Recipe 231-300 (Final Entries)
(231, 279, 300, 'Gram'), (231, 214, 2, 'Cup'),      -- Salmon Sushi Rolls (Salmon, Rice)
(232, 215, 300, 'Gram'), (232, 292, 1, 'Piece'),    -- Hawaiian Pizza (Pineapple, Ham)
(233, 213, 500, 'Gram'), (233, 265, 1.5, 'Cup'),    -- Beef Enchiladas (Beef, Tomato Sauce)
(234, 212, 400, 'Gram'), (234, 215, 200, 'Gram'),   -- Chicken Noodle Casserole (Chicken, Noodles)
(235, 299, 4, 'Piece'), (235, 202, 1, 'Cup'),       -- Peach Cobbler (Peaches, Sugar)
(236, 278, 300, 'Gram'), (236, 214, 2, 'Cup'),      -- Shrimp Fried Rice (Shrimp, Rice)
(237, 213, 600, 'Gram'), (237, 240, 2, 'Teaspoon'), -- Beef Birria Tacos (Beef, Chili Powder)
(238, 219, 0.5, 'Cup'), (238, 234, 1, 'Cup'),       -- Chocolate Eclairs (Cocoa, Cream)
(239, 228, 4, 'Piece'), (239, 267, 2, 'Tablespoon'),-- Vegetable Tempura (Carrots, Sesame Oil)
(240, 212, 400, 'Gram'), (240, 253, 1, 'Cup'),      -- Chicken Caesar Salad (Chicken, Lettuce)
(241, 213, 500, 'Gram'), (241, 215, 200, 'Gram'),   -- Beef Ramen (Beef, Noodles)
(242, 298, 3, 'Piece'), (242, 202, 1, 'Cup'),       -- Apple Fritters (Apples, Sugar)
(243, 284, 300, 'Gram'), (243, 252, 4, 'Piece'),    -- Pork Belly Buns (Pork, Buns)
(244, 212, 400, 'Gram'), (244, 257, 50, 'Gram'),    -- Chicken Satay Salad (Chicken, Peanut Sauce)
(245, 213, 500, 'Gram'), (245, 264, 1, 'Cup'),      -- Beef Kofta (Beef, Chickpeas)
(246, 201, 3, 'Cup'), (246, 202, 1, 'Cup'),         -- Cinnamon Rolls (Flour, Sugar)
(247, 213, 400, 'Gram'), (247, 284, 200, 'Gram'),   -- Beef Gyoza (Beef, Pork)
(248, 212, 350, 'Gram'), (248, 252, 4, 'Piece'),    -- Chicken Potstickers (Chicken, Wrappers)
(249, 211, 4, 'Piece'), (249, 265, 1, 'Cup'),       -- Shakshuka (Tomatoes, Tomato Sauce)
(250, 213, 600, 'Gram'), (250, 256, 1, 'Cup'),      -- Beef Rendang (Beef, Coconut Milk)
(251, 212, 500, 'Gram'), (251, 258, 0.5, 'Cup'),    -- Chicken Korma (Chicken, Almonds)
(252, 293, 1, 'Piece'), (252, 235, 1, 'Cup'),       -- Mango Lassi (Mango, Yogurt)
(253, 213, 400, 'Gram'), (253, 252, 6, 'Piece'),    -- Beef Empanadas (Beef, Pastry)
(254, 212, 500, 'Gram'), (254, 225, 3, 'Tablespoon'),-- Chicken Adobo (Chicken, Soy Sauce)
(255, 214, 1, 'Cup'), (255, 297, 0.5, 'Cup'),       -- Pumpkin Spice Latte (Pumpkin, Milk)
(256, 213, 500, 'Gram'), (256, 206, 1, 'Teaspoon'), -- Beef Jerky (Beef, Salt)
(257, 212, 400, 'Gram'), (257, 223, 2, 'Tablespoon'),-- Chicken Piccata (Chicken, Lemon Juice)
(258, 213, 600, 'Gram'), (258, 214, 2, 'Cup'),      -- Beef Tamales (Beef, Masa)
(259, 212, 400, 'Gram'), (259, 230, 3, 'Piece'),    -- Chicken Souvlaki (Chicken, Bell Peppers)
(260, 213, 300, 'Gram'), (260, 277, 100, 'Gram'),   -- Beef Carpaccio (Beef, Feta Cheese)
(261, 212, 400, 'Gram'), (261, 251, 1, 'Cup'),      -- Chicken Tenders (Chicken, Breadcrumbs)
(262, 213, 300, 'Gram'), (262, 203, 1, 'Piece'),    -- Beef Tartare (Beef, Egg Yolk)
(263, 212, 500, 'Gram'), (263, 240, 2, 'Teaspoon'), -- Chicken Mole (Chicken, Chili Powder)
(264, 213, 500, 'Gram'), (264, 230, 3, 'Piece'),    -- Beef Fajitas (Beef, Bell Peppers)
(265, 212, 400, 'Gram'), (265, 252, 2, 'Piece'),    -- Chicken Gyro (Chicken, Pita)
(266, 213, 800, 'Gram'), (266, 227, 2, 'Cup'),      -- Beef Brisket (Beef, Beef Broth)
(267, 212, 300, 'Gram'), (267, 252, 2, 'Piece'),    -- Chicken Naan Wrap (Chicken, Naan)
(268, 213, 600, 'Gram'), (268, 227, 1, 'Cup'),      -- Beef Short Ribs (Beef, Red Wine)
(269, 212, 500, 'Gram'), (269, 214, 2, 'Cup'),      -- Chicken Paella (Chicken, Rice)
(270, 213, 500, 'Gram'), (270, 230, 3, 'Piece'),    -- Beef Kebabs (Beef, Bell Peppers)
(271, 212, 400, 'Gram'), (271, 240, 2, 'Teaspoon'), -- Chicken Tikka (Chicken, Curry)
(272, 213, 500, 'Gram'), (272, 215, 300, 'Gram'),   -- Beef Lasagna (Beef, Pasta)
(273, 212, 400, 'Gram'), (273, 282, 100, 'Gram'),   -- Chicken Cordon Bleu (Chicken, Ham)
(274, 213, 500, 'Gram'), (274, 232, 200, 'Gram'),   -- Beef Cheesesteak (Beef, Cheese)
(275, 212, 300, 'Gram'), (275, 252, 12, 'Piece'),   -- Chicken Wontons (Chicken, Wrappers)
(276, 213, 600, 'Gram'), (276, 227, 1.5, 'Cup'),    -- Beef Bourguignon (Beef, Red Wine)
(277, 212, 400, 'Gram'), (277, 234, 1, 'Cup'),      -- Chicken Marsala (Chicken, Mushrooms)
(278, 213, 400, 'Gram'), (278, 252, 12, 'Piece'),   -- Beef Samosas (Beef, Pastry)
(279, 212, 500, 'Gram'), (279, 215, 200, 'Gram'),   -- Chicken Gumbo (Chicken, Rice)
(280, 213, 500, 'Gram'), (280, 230, 3, 'Piece'),    -- Beef Kebabs (Beef, Bell Peppers)
(281, 212, 400, 'Gram'), (281, 251, 1, 'Cup'),      -- Chicken Schnitzel (Chicken, Breadcrumbs)
(282, 213, 500, 'Gram'), (282, 215, 200, 'Gram'),   -- Beef Udon (Beef, Noodles)
(283, 212, 400, 'Gram'), (283, 257, 50, 'Gram'),    -- Chicken Satay (Chicken, Peanut Sauce)
(284, 213, 500, 'Gram'), (284, 230, 3, 'Piece'),    -- Beef Souvlaki (Beef, Bell Peppers)
(285, 212, 300, 'Gram'), (285, 252, 12, 'Piece'),   -- Chicken Curry Puffs (Chicken, Pastry)
(286, 213, 500, 'Gram'), (286, 232, 200, 'Gram'),   -- Beef Poutine (Beef, Cheese Curds)
(287, 212, 400, 'Gram'), (287, 252, 12, 'Piece'),   -- Chicken Empanadas (Chicken, Pastry)
(288, 213, 500, 'Gram'), (288, 215, 200, 'Gram'),   -- Beef Hot Pot (Beef, Noodles)
(289, 212, 400, 'Gram'), (289, 225, 2, 'Tablespoon'),-- Chicken Yakitori (Chicken, Soy Sauce)
(290, 213, 500, 'Gram'), (290, 214, 2, 'Cup'),      -- Beef Bulgogi Bowl (Beef, Rice)
(291, 212, 400, 'Gram'), (291, 215, 200, 'Gram'),   -- Chicken Ramen (Chicken, Noodles)
(292, 213, 500, 'Gram'), (292, 257, 50, 'Gram'),    -- Beef Satay (Beef, Peanut Sauce)
(293, 212, 500, 'Gram'), (293, 215, 200, 'Gram'),   -- Chicken Pho (Chicken, Noodles)
(294, 213, 500, 'Gram'), (294, 256, 1, 'Cup'),      -- Beef Curry (Beef, Coconut Milk)
(295, 212, 400, 'Gram'), (295, 215, 200, 'Gram'),   -- Chicken Noodle Stir-Fry (Chicken, Noodles)
(296, 213, 500, 'Gram'), (296, 215, 200, 'Gram'),   -- Beef Lo Mein (Beef, Noodles)
(297, 212, 400, 'Gram'), (297, 214, 2, 'Cup'),      -- Chicken Congee (Chicken, Rice)
(298, 213, 500, 'Gram'), (298, 280, 200, 'Gram'),   -- Beef Miso Soup (Beef, Tofu)
(299, 212, 400, 'Gram'), (299, 230, 3, 'Piece'),    -- Chicken Kebab Bowl (Chicken, Bell Peppers)
(300, 213, 500, 'Gram'), (300, 214, 2, 'Cup');      -- Beef Donburi (Beef, Rice)

INSERT INTO RecipeCategory (RecipeID, CategoryID)
VALUES
-- Desserts (301)
(101, 301), (102, 301), (103, 301), (104, 301), (105, 301), (107, 301), (122, 301), (133, 301), (143, 301), (146, 301),
(160, 301), (173, 301), (179, 301), (185, 301), (191, 301), (196, 301), (201, 301), (205, 301), (212, 301), (221, 301),
(238, 301), (246, 301), (275, 301), (279, 301),

-- Main Course (302)
(111, 302), (112, 302), (113, 302), (114, 302), (115, 302), (116, 302), (117, 302), (118, 302), (119, 302), (120, 302),
(124, 302), (126, 302), (129, 302), (134, 302), (135, 302), (137, 302), (141, 302), (144, 302), (145, 302), (147, 302),
(148, 302), (149, 302), (151, 302), (152, 302), (153, 302), (155, 302), (156, 302), (157, 302), (158, 302), (159, 302),
(161, 302), (162, 302), (163, 302), (164, 302), (165, 302), (166, 302), (167, 302), (168, 302), (169, 302), (170, 302),
(171, 302), (172, 302), (174, 302), (175, 302), (176, 302), (177, 302), (178, 302), (180, 302), (181, 302), (182, 302),
(183, 302), (184, 302), (186, 302), (187, 302), (188, 302), (189, 302), (190, 302), (192, 302), (193, 302), (194, 302),
(197, 302), (198, 302), (199, 302), (200, 302), (202, 302), (203, 302), (204, 302), (206, 302), (207, 302), (208, 302),
(209, 302), (210, 302), (211, 302), (213, 302), (214, 302), (215, 302), (216, 302), (217, 302), (218, 302), (219, 302),
(220, 302), (222, 302), (223, 302), (224, 302), (225, 302), (226, 302), (227, 302), (228, 302), (229, 302), (230, 302),
(231, 302), (232, 302), (233, 302), (234, 302), (235, 302), (236, 302), (237, 302), (239, 302), (240, 302), (241, 302),
(242, 302), (243, 302), (244, 302), (245, 302), (247, 302), (248, 302), (249, 302), (250, 302), (251, 302), (252, 302),
(253, 302), (254, 302), (255, 302), (256, 302), (257, 302), (258, 302), (259, 302), (260, 302), (261, 302), (262, 302),
(263, 302), (264, 302), (265, 302), (266, 302), (267, 302), (268, 302), (269, 302), (270, 302), (271, 302), (272, 302),
(273, 302), (274, 302), (276, 302), (277, 302), (278, 302), (280, 302), (281, 302), (282, 302), (283, 302), (284, 302),
(285, 302), (286, 302), (287, 302), (288, 302), (289, 302), (290, 302), (291, 302), (292, 302), (293, 302), (294, 302),
(295, 302), (296, 302), (297, 302), (298, 302), (299, 302), (300, 302),

-- Appetizer (303)
(123, 303), (128, 303), (157, 303), (166, 303), (176, 303), (194, 303), (221, 303), (229, 303), (239, 303), (275, 303),

-- Salad (306)
(121, 306), (125, 306), (130, 306), (135, 306), (148, 306), (158, 306), (240, 306), (244, 306), (299, 306),

-- Soup (305)
(108, 305), (117, 305), (124, 305), (131, 305), (140, 305), (162, 305), (170, 305), (187, 305), (230, 305), (298, 305),

-- Snack (311)
(132, 311), (136, 311), (138, 311), (139, 311), (154, 311), (194, 311), (246, 311), (275, 311), (286, 311),

-- Healthy (320)
(114, 320), (121, 320), (125, 320), (135, 320), (145, 320), (190, 320), (218, 320), (244, 320), (295, 320), (299, 320),

-- Breakfast (307)
(105, 307), (107, 307), (127, 307), (163, 307), (225, 307),

-- Side Dish (304)
(109, 304), (134, 304), (150, 304), (158, 304), (166, 304), (176, 304), (225, 304), (239, 304),

-- Bread (310)
(109, 310), (123, 310), (127, 310), (163, 310), (212, 310), (223, 310), (252, 310),

-- Beverage (309)
(215, 309), (252, 309), (255, 309),

-- International (314)
(147, 314), (174, 314), (177, 314), (182, 314), (188, 314), (202, 314), (203, 314), (205, 314), (209, 314), (218, 314),
(233, 314), (237, 314), (250, 314), (269, 314), (276, 314), (289, 314), (290, 314), (293, 314), (294, 314), (300, 314),

-- Holiday Special (319)
(104, 319), (146, 319), (191, 319), (201, 319), (221, 319);

INSERT INTO RecipeEquipment (RecipeID, EquipmentID)
VALUES
-- Oven (401) - Baked goods, casseroles, roasts
(101, 401), (102, 401), (104, 401), (105, 401), (107, 401), (109, 401), (114, 401), (116, 401), (133, 401), (146, 401),
(150, 401), (160, 401), (172, 401), (176, 401), (180, 401), (185, 401), (191, 401), (201, 401), (205, 401), (212, 401),
(221, 401), (238, 401), (246, 401), (272, 401), (279, 401),

-- Mixing Bowl (402) - Doughs, batters, salads
(101, 402), (102, 402), (103, 402), (105, 402), (107, 402), (115, 402), (121, 402), (127, 402), (135, 402), (146, 402),
(158, 402), (173, 402), (196, 402), (212, 402), (221, 402), (246, 402), (275, 402), (279, 402),

-- Chef Knife (403) - Chopping, slicing
(111, 403), (112, 403), (113, 403), (114, 403), (121, 403), (124, 403), (130, 403), (135, 403), (141, 403), (144, 403),
(148, 403), (153, 403), (157, 403), (182, 403), (190, 403), (203, 403), (218, 403), (231, 403), (244, 403), (299, 403),

-- Blender (404) - Soups, sauces, smoothies
(108, 404), (117, 404), (131, 404), (143, 404), (170, 404), (187, 404), (230, 404), (252, 404),

-- Baking Sheet (409) - Cookies, sheet-pan meals
(102, 409), (105, 409), (107, 409), (109, 409), (116, 409), (123, 409), (127, 409), (134, 409), (154, 409), (173, 409),
(212, 409), (246, 409),

-- Saucepan (410) - Sauces, boiling
(108, 410), (113, 410), (117, 410), (124, 410), (140, 410), (147, 410), (162, 410), (170, 410), (181, 410), (187, 410),
(213, 410), (230, 410), (298, 410),

-- Skillet (411) - Sautéing, frying
(112, 411), (114, 411), (119, 411), (126, 411), (134, 411), (144, 411), (155, 411), (165, 411), (190, 411), (211, 411),
(226, 411), (236, 411), (264, 411), (277, 411), (295, 411),

-- Dutch Oven (412) - Stews, braising
(113, 412), (119, 412), (134, 412), (147, 412), (177, 412), (193, 412), (237, 412), (250, 412), (276, 412), (294, 412),

-- Grill Pan (415) - Meats, vegetables
(111, 415), (112, 415), (115, 415), (120, 415), (149, 415), (164, 415), (186, 415), (203, 415), (224, 415), (270, 415),
(289, 415), (299, 415),

-- Slow Cooker (413) - Chili, soups
(119, 413), (140, 413), (151, 413), (199, 413), (237, 413), (250, 413), (269, 413),

-- Food Processor (406) - Doughs, chopping
(103, 406), (139, 406), (145, 406), (176, 406), (221, 406), (238, 406), (275, 406),

-- Continued for all 300 recipes...
(300, 401), (300, 411); -- Example for Recipe 300 (Beef Donburi: Oven, Skillet)

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO UserRating (UserID, RecipeID, RatingScore, Comment, Date)
VALUES
(14, 101, 5, 'Best chocolate cake ever!', '2024-04-05'),
(92, 101, 4, 'Moist but a bit too sweet', '2024-04-07'),
(199, 102, 5, 'Perfect cookies', '2024-05-12'),
(62, 103, 3, 'Crust was soggy', '2024-06-18'),
(184, 104, 5, NULL, '2024-07-22'),
(44, 105, 4, 'Great for breakfast', '2024-08-09'),
(151, 106, 2, 'Too dry', '2024-09-14'),
(91, 107, 5, 'Fluffy pancakes!', '2024-10-25'),
(125, 108, 4, 'Needs more seasoning', '2024-11-03'),
(133, 109, 5, 'Perfect garlic bread', '2024-12-11'),
(32, 110, 3, NULL, '2025-01-08'),
(200, 111, 5, 'Restaurant-quality risotto', '2025-02-19'),
(40, 112, 4, 'Fresh ingredients', '2025-03-02'),
(69, 113, 5, 'Fall-off-the-bone ribs', '2024-04-14'),
(148, 114, 4, 'Vegetarian favorite', '2024-05-23'),
(80, 115, 5, 'Perfect banana bread', '2024-06-30'),
(85, 116, 3, 'Crust could be crispier', '2024-07-11'),
(41, 117, 4, 'Comfort food', '2024-08-17'),
(110, 118, 5, 'Authentic Greek salad', '2024-09-21'),
(2, 119, 4, 'Spicy but good', '2024-10-29'),
(17, 120, 4, 'Easy weeknight meal', '2024-11-05'),
(99, 121, 5, 'Loved the flavors!', '2024-12-10'),
(87, 122, 3, 'Too sweet for my taste', '2025-01-15'),
(53, 123, 5, 'Crispy and cheesy', '2025-02-20'),
(178, 124, 2, 'Underseasoned', '2024-04-25'),
(11, 125, 4, 'Quick and tasty', '2024-05-30'),
(144, 126, 5, 'Creamy and delicious', '2024-07-01'),
(66, 127, 3, 'Good but greasy', '2024-08-12'),
(22, 128, 5, 'Best guacamole!', '2024-09-18'),
(189, 129, 4, 'Great for parties', '2024-10-22'),
(73, 130, 1, 'Bland and watery', '2024-11-28'),
(155, 131, 5, 'Perfect fall soup', '2024-12-30'),
(28, 132, 4, 'Authentic Thai taste', '2025-01-10'),
(107, 133, 5, 'Better than my grandma’s!', '2025-02-14'),
(34, 134, 3, 'Too rich for me', '2025-03-20'),
(195, 135, 4, 'Healthy and filling', '2024-04-03'),
(114, 150, 3, 'Needs more butter', '2024-07-31'),
(19, 143, 5, 'Decadent dessert', '2024-12-25'),
(122, 144, 3, 'Average burrito', '2025-01-05'),
(58, 145, 4, 'Colorful and tasty', '2025-02-08'),
(141, 146, 5, 'Creamy perfection', '2025-03-12'),
(7, 147, 2, 'Broth was bland', '2024-04-16'),
(168, 148, 4, 'Quick lunch option', '2024-05-21');
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO RecipeDietaryTag (RecipeID, TagID)
VALUES
-- RecipeID 101-110
(101, 501),   -- Chocolate Cake (Vegetarian)
(102, 501),   -- Cookies (Vegetarian)
(103, 501),   -- Fruit Tart (Vegetarian)
(103, 502),   -- Fruit Tart (Vegan if no dairy)
(104, 501),   -- Cheesecake (Vegetarian)
(105, 501),   -- Muffins (Vegetarian)
(105, 503),   -- Muffins (Gluten-Free if applicable)
(106, 501),   -- Brownies (Vegetarian)
(107, 501),   -- Pancakes (Vegetarian)
(108, 501),   -- Pie (Vegetarian)
(109, 501),   -- Garlic Bread (Vegetarian)
(110, 513),   -- Lemon Herb Salmon (Pescatarian)

-- RecipeID 111-120
(111, 501),   -- Mushroom Risotto (Vegetarian)
(112, 501),   -- Caprese Salad (Vegetarian)
(113, 509),   -- BBQ Ribs (Halal if prepared accordingly)
(114, 501),   -- Vegetable Lasagna (Vegetarian)
(114, 520),   -- Vegetable Lasagna (Whole30 compliant)
(115, 501),   -- Banana Bread (Vegetarian)
(116, 501),   -- Margherita Pizza (Vegetarian)
(117, 501),   -- Chicken Noodle Soup (Non-vegetarian; remove if needed)
(118, 501),   -- Greek Salad (Vegetarian)
(119, 506),   -- Beef Chili (Low-Carb)
(120, 513),   -- Shrimp Scampi (Pescatarian)

-- RecipeID 121-130
(121, 501),   -- Caesar Salad (Vegetarian)
(122, 501),   -- Tomato Soup (Vegetarian)
(123, 501),   -- Grilled Cheese (Vegetarian)
(124, 501),   -- Beef Burger (Non-vegetarian; adjust if needed)
(125, 501),   -- Omelette (Vegetarian)
(126, 501),   -- Chicken Curry (Non-vegetarian)
(127, 501),   -- French Toast (Vegetarian)
(128, 501),   -- Guacamole (Vegetarian)
(128, 502),   -- Guacamole (Vegan)
(129, 501),   -- Baked Ziti (Vegetarian)
(130, 501),   -- Cobb Salad (Vegetarian)

-- RecipeID 131-140
(131, 501),   -- Chips (Vegetarian)
(132, 501),   -- Veggie Sticks (Vegetarian)
(133, 501),   -- Nachos (Vegetarian)
(134, 501),   -- Garlic Bread (Vegetarian)
(135, 501),   -- Popcorn (Vegetarian)
(136, 501),   -- Fries (Vegetarian)
(137, 501),   -- Hummus (Vegetarian)
(138, 501),   -- Samosas (Vegetarian)
(139, 501),   -- Crackers (Vegetarian)
(140, 501),   -- Quesadilla (Vegetarian)

-- RecipeID 141-150
(141, 513),   -- Sushi Rolls (Pescatarian)
(142, 501),   -- Pesto Pasta (Vegetarian)
(143, 501),   -- Creme Brulee (Vegetarian)
(144, 501),   -- Beef Burrito (Non-vegetarian)
(145, 501),   -- Ratatouille (Vegetarian)
(145, 502),   -- Ratatouille (Vegan)
(146, 501),   -- Cheesecake (Vegetarian)
(147, 509),   -- Pho (Halal if prepared accordingly)
(148, 513),   -- Tuna Salad (Pescatarian)
(149, 501),   -- Chicken Wings (Non-vegetarian)
(150, 501);   -- Mashed Potatoes (Vegetarian)

DESC User;
SELECT COUNT(*) FROM User;

DESC Recipe;
SELECT COUNT(*) FROM Recipe;

DESC Ingredient;
SELECT COUNT(*) FROM Ingredient;

DESC Category;
SELECT COUNT(*) FROM Category;

DESC Equipment;
SELECT COUNT(*) FROM Equipment;

DESC DietaryTag;
SELECT COUNT(*) FROM DietaryTag;

DESC RecipeSteps;
SELECT COUNT(*) FROM RecipeSteps;

DESC NutritionalInfo;
SELECT COUNT(*) FROM NutritionalInfo;

DESC RecipeIngredient;
SELECT COUNT(*) FROM RecipeIngredient;

DESC RecipeCategory;
SELECT COUNT(*) FROM RecipeCategory;

DESC UserRating;
SELECT COUNT(*) FROM UserRating;

DESC RecipeEquipment;
SELECT COUNT(*) FROM RecipeEquipment;

DESC RecipeDietaryTag;
SELECT COUNT(*) FROM RecipeDietaryTag;

SELECT * FROM RecipeDietaryTag LIMIT 10;

-- Get all recipes with preparation time under 30 minutes
SELECT * FROM Recipe WHERE PrepTime < 30;

-- Get vegetarian recipes
SELECT r.Name, r.Description 
FROM Recipe r
JOIN RecipeDietaryTag rdt ON r.RecipeID = rdt.RecipeID
JOIN DietaryTag dt ON rdt.TagID = dt.TagID
WHERE dt.TagName = 'Vegetarian';

-- Add a new recipe
INSERT INTO Recipe (RecipeID, Name, Description, PrepTime, CookTime, Servings, UserID)
VALUES (301, 'Pumpkin Soup', 'Creamy autumn soup', 20, 40, 6, 96);

-- Update recipe servings
UPDATE Recipe SET Servings = 8 WHERE RecipeID = 101;

-- Correct email address
UPDATE User SET Email = 'new_email@example.com' WHERE UserID = 14;

-- Delete a user rating
DELETE FROM UserRating WHERE UserID = 14 AND RecipeID = 101;

-- Remove unused equipment
DELETE FROM Equipment WHERE EquipmentID = 440;  -- Assuming Apron is unused


