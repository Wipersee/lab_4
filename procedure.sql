CREATE OR REPLACE procedure license_del(
    gamer_name  IN  VARCHAR2,
    game_name IN  VARCHAR2
)
IS
r_contact sales%ROWTYPE;
 BEGIN
   select * INTO r_contact FROM sales
   WHERE sales.name_of_gamer = gamer_name AND sales.name_of_game = game_name;
   
   delete r_contact
   EXCEPTION
    WHEN OTHERS THEN
    dbms_output.put_line('Sorry, this row does not exist !');
END license_del;
