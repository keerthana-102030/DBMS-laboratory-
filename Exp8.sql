System-defined exception:
SET SERVEROUTPUT ON;
DECLARE
 c_id customers.id%type := 5;
 c_name customers.name%type;
 c_addr customers.address%type;
BEGIN
 SELECT name, address INTO c_name, c_addr FROM customers WHERE id = c_id;
 dbms_output.put_line('name: ' || c_name);
 dbms_output.put_line('address: ' || c_addr);
EXCEPTION
 WHEN no_data_found THEN
 dbms_output.put_line('no such customer!');
 WHEN others THEN
 dbms_output.put_line('error!');
END;
/
Output:
name: Hardik
address: Bhopal
PL/SQL procedure successfully completed.
User-defined exception:
DECLARE
 c_id customers.id%type := &cc_id;
 c_name customers.name%type;
 c_addr customers.address%type;
 ex_invalid_id EXCEPTION;
BEGIN
 IF c_id <= 0 THEN
 RAISE ex_invalid_id;
 ELSE
 SELECT name, address INTO c_name, c_addr FROM customers WHERE id = c_id;
 DBMS_OUTPUT.PUT_LINE('Name: ' || c_name);
 DBMS_OUTPUT.PUT_LINE('Address: ' || c_addr);
 END IF;
EXCEPTION
 WHEN ex_invalid_id THEN
 dbms_output.put_line('ID must be greater than zero!');
 WHEN no_data_found THEN
 dbms_output.put_line('No such customer!');
 WHEN others THEN
 dbms_output.put_line('Error!');
END;
/
Output:
Enter value for cc_id: -6
ID must be greater than zero!
PL/SQL procedure successfully completed.
