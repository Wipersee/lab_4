---FIRST OF ALL YOU NEED TO RUN populate.sql and then this file----

-----THIS IS THE CHECK FOR PROCEDURE (DBMS OUTPUT MUST BE ENABLE)------
    exec license_del('Wiperse','Minecraft');
    exec license_del('Wiperse','Call of Duty 4');
    exec license_del('JJJJJtest','Minecraft');
    exec license_del('Wiperse','Minecraft');
    
    
-----THIS IS THE CHECK FOR FUNCTION (DBMS OUTPUT MUST BE ENABLE)------
    select * from TABLE(get_sales_for_regions_tf('NA','EU'));
    

-----THIS IS THE CHECK FOR TRIGGER (DBMS OUTPUT MUST BE ENABLE)------
    update game 
    set cost_num = 12.21
    where name_of_game = 'Call of Duty 4';
