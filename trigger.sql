create or replace trigger sales_trigger
before update on game
FOR EACH ROW
declare
    is_game varchar2(256);
begin 
    select name_of_game into is_game from sales
     where sales.name_of_game = :old.name_of_game AND ROWNUM = 1;
    :new.cost_num := :old.cost_num;
    dbms_output.put_line('this game is sold,so can not chage cost');
    EXCEPTION
     WHEN OTHERS THEN
      :new.cost_num := :new.cost_num;
      dbms_output.put_line('you can change');
END;
