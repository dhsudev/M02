declare 
	x integer;
BEGIN
	x:=1;
	while x<=10 LOOP
		DBMS_OUTPUT.put_line(x);
		x:=x+1;
	end loop;
end;
/
