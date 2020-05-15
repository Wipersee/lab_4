CREATE TABLE game (
    name_of_game  VARCHAR2(256) NOT NULL,
    cost_num          NUMBER(5, 2) NOT NULL,
    release_year  INTEGER NOT NULL
);

ALTER TABLE game ADD CONSTRAINT game_pk PRIMARY KEY ( name_of_game );

CREATE TABLE gamer (
    name_of_gamer        VARCHAR2(256) NOT NULL,
    buy_period               INTEGER,
    region_name  VARCHAR2(256) NOT NULL,
    name_of_game    VARCHAR2(256) NOT NULL
);

ALTER TABLE gamer ADD CONSTRAINT gamer_pk PRIMARY KEY ( region_name,
                                                        name_of_game );

CREATE TABLE regions (
    region_name VARCHAR2(256) NOT NULL
);

ALTER TABLE regions ADD CONSTRAINT regions_pk PRIMARY KEY ( region_name );


----SECTION FOR FOREIGN KEYS------
ALTER TABLE gamer
    ADD CONSTRAINT gamer_game_fk FOREIGN KEY ( name_of_game )
        REFERENCES game ( name_of_game );

ALTER TABLE gamer
    ADD CONSTRAINT gamer_regions_fk FOREIGN KEY ( region_name )
        REFERENCES regions ( region_name );
        
----SECTION FOR CONSTRAINTS-----
ALTER TABLE  gamer
ADD CONSTRAINT buy_period_check
  CHECK ( buy_period > 1);
 
ALTER TABLE gamer
ADD CONSTRAINT name_of_gamer_check
  CHECK (length(TRIM(name_of_gamer)) > 2);

ALTER TABLE  game
ADD CONSTRAINT release_year_check
  CHECK ( release_year > 1970);
