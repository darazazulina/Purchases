-- СОЗДАНИЕ ТАБЛИЦ --
CREATE TABLE Users(
  user_id INTEGER PRIMARY KEY AUTOINCREMENT,
  age INTEGER
);

CREATE TABLE Purchases(
  purchase_id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  item_id INTEGER NOT NULL,
  date DATE,
  FOREIGN KEY (user_id) REFERENCES Users (user_id)
  ON DELETE CASCADE,
  FOREIGN KEY (item_id) REFERENCES Items (item_id)
  ON DELETE CASCADE
);

CREATE TABLE Items(
  item_id INTEGER PRIMARY KEY AUTOINCREMENT,
  price double
);

-- ЗАПОЛНЕНИЕ ТАБЛИЦ ДАННЫМИ --

INSERT INTO Users(age)
VALUES (44), (55), (18), (24), (65);

INSERT INTO Items(price)
VALUES (215.0), (100.0), (25.0), (355.0), (50.0), (35.0), (270.0);

INSERT INTO Purchases(user_id, item_id, date)
VALUES
  (1, 6, "2024-01-15"), 
  (2, 1, "2024-01-03"), 
  (3, 6, "2024-02-10"), 
  (3, 2, "2024-02-26"), 
  (4, 3, "2024-03-20"), 
  (5, 4, "2024-04-07"), 
  (1, 6, "2024-04-19"), 
  (2, 1, "2024-04-03"), 
  (3, 6, "2024-05-18"), 
  (2, 2, "2024-07-26"), 
  (3, 3, "2024-08-23"), 
  (5, 4, "2024-08-07"), 
  (4, 6, "2024-09-16"), 
  (4, 1, "2024-10-05"), 
  (3, 6, "2024-10-13"), 
  (4, 2, "2024-11-28"), 
  (4, 3, "2024-12-21"), 
  (5, 4, "2024-12-08");

