CREATE OR REPLACE TYPE
    sales_for_regions_type
IS OBJECT
(
    name_of_region     VARCHAR2(256),
    sales_amount DECIMAL(5,2)
);
/
CREATE TYPE sales_for_regions_tab IS TABLE OF sales_for_regions_type;
/
CREATE OR REPLACE FUNCTION get_sales_for_regions_tf (first_region regions.region_name%TYPE, second_region regions.region_name%TYPE) RETURN sales_for_regions_tab PIPELINED AS
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
END get_sales_for_regions_tf;
/
