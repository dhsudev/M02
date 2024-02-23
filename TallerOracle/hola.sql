select name,sex,scars,hair_color,feet_size,age,glasses from suspects where sex="Male" && scars = "Yes" && (hair_color="Brown"|| hair_color="Black") && feet_size="Large" && (age >= 50 && age <= 60) && glasses = "YES";
Kasper Good

select name,hair_color,eye_color,feet_size,tattoos,age from suspects where hair_color="red" and eye_color="blue" and feet_size="small" and tattoos ="YES" and (age >= 35 and age <=40);
Hilary Mayer

select name,sex,hair_color,glasses,scars,feet_size from suspects where hair_color="red" and sex="female" and glasses="YES" and scars="No" and feet_size="small";