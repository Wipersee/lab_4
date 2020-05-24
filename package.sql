CREATE OR REPLACE PACKAGE 
    lab_4_proc_func 
AS 
    TYPE 
    sales_for_regions_type 
    IS RECORD 
    ( 
        name_of_region     VARCHAR2(256), 
        sales_amount DECIMAL(5,2) 
    ); 
    TYPE sales_for_regions_tab IS TABLE OF sales_for_regions_type; 
    PROCEDURE 
        license_del 
        ( 
            gamer_name  IN  VARCHAR2, 
            game_name IN  VARCHAR2 
        ); 
    FUNCTION 
       get_sales_for_regions_tf 
    ( 
        first_region regions.region_name%TYPE,  
        second_region regions.region_name%TYPE 
    ) 
    RETURN 
       sales_for_regions_tab 
    PIPELINED; 
END lab_4_proc_func;
/

CREATE OR REPLACE PACKAGE 
BODY 
lab_4_proc_func 
AS 
    procedure license_del( 
    gamer_name  VARCHAR2, 
    game_name VARCHAR2 
) 
    IS 
    r_contact sales%ROWTYPE; 
     BEGIN 
       select * INTO r_contact FROM sales 
       WHERE sales.name_of_gamer = gamer_name AND sales.name_of_game = game_name; 
       delete  FROM sales 
       WHERE sales.name_of_gamer = gamer_name AND sales.name_of_game = game_name; 
       EXCEPTION 
        WHEN OTHERS THEN 
        dbms_output.put_line('Sorry, this row does not exist !'); 
    END license_del; 
     
     
    FUNCTION get_sales_for_regions_tf  
        (first_region regions.region_name%TYPE,  
        second_region regions.region_name%TYPE)  
    RETURN sales_for_regions_tab PIPELINED AS 
    name_of_region    VARCHAR2(256); 
    sales_amount DECIMAL(5,2); 
    CURSOR 
        sales_cursor 
        IS 
        select region_name, sum(game.cost_num*sales.buy_period ) as summary_regions_sales from game 
        inner join sales using(name_of_game) 
        group by region_name 
        HAVING region_name = first_region OR region_name = second_region; 
    BEGIN 
FOR curr IN sales_cursor

            LOOP

                PIPE ROW (curr);

            END LOOP;
END get_sales_for_regions_tf; 
END lab_4_proc_func;


OPEN sales_cursor; 
    LOOP 
    FETCH sales_cursor 
    INTO name_of_region, sales_amount; 
    EXIT WHEN sales_cursor % NOTFOUND; 
        PIPE ROW( 
            sales_for_regions_type( 
                name_of_region, 
                sales_amount)); 
    END LOOP;  
