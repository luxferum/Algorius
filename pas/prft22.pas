INPUT

  DP(30.00);
  op1(1.00);
  op2(1.50);
  op3(2.00);
  op4(2.50);
  op5(3.00);
  op6(1.00);
  op7(1.50);
  op8(2.00);
  op9(2.50);
  op10(3.00);
VAR

  lPrice:float;
begin
lprice:=(close-opendaily(0))/DP;
  

 plot99(op5);setplotcolor(99,clred);
 plot98(op4);setplotcolor(98,clred);
 plot97(op3);setplotcolor(97,clred);
 plot96(op2);setplotcolor(96,clred);
 plot95(op1);setplotcolor(95,clred);
 plot(lprice);setplotcolor(1,clwhite);
 plot94(-op6);setplotcolor(94,clgreen);
 plot93(-op7);setplotcolor(93,clgreen);
 plot92(-op8);setplotcolor(92,clgreen);
 plot91(-op9);setplotcolor(91,clgreen);
 plot90(-op10);setplotcolor(90,clgreen);
 
if(lprice>op1) then
begin
plot2(op1);
setplottype(2,histogram);
setplotcolor(2,clred);
end;

end;