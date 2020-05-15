----INSERTING INTO GAMERS----
INSERT INTO gamer (name_of_gamer, mail_box) VALUES ('Wiperse', 'kesterera@gmail.com');
INSERT INTO gamer (name_of_gamer, mail_box) VALUES ('Din Lester', 'den_les@gmail.com');
INSERT INTO gamer (name_of_gamer, mail_box) VALUES ('Black House', 'black_house@gmail.com');

---INSERTRING INTO REGIONS-----
INSERT INTO regions (region_name) VALUES ('NA');
INSERT INTO regions (region_name) VALUES ('EU');
INSERT INTO regions (region_name) VALUES ('JP');


-----INSERTING INTO GAMES------
INSERT INTO game (name_of_game, cost_num, release_year) 
 VALUES ('Call of Duty 4', 14.57, 2007);
INSERT INTO game (name_of_game, cost_num, release_year) 
 VALUES ('Need for speed', 12.32, 2005);
INSERT INTO game (name_of_game, cost_num, release_year) 
 VALUES ('Minecraft', 5.21, 2009);
 
 ----INSERTING INTO SALES-----
INSERT INTO sales (name_of_gamer, buy_period, region_name, name_of_game) 
 VALUES ('Wiperse', 2, 'NA', 'Call of Duty 4');
INSERT INTO sales (name_of_gamer, buy_period, region_name, name_of_game) 
 VALUES ('Wiperse', 4, 'NA', 'Minecraft');
INSERT INTO sales (name_of_gamer, buy_period, region_name, name_of_game) 
 VALUES ('Din Lester', 2, 'EU', 'Call of Duty 4');
