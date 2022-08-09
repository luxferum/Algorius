{ www.ScApp.link }
var
t : Real;
i,p : Inteiro;

Inicio

Se (Date <> Date[1]) entao i := CurrentBar;

p := (CurrentBar - i) + 1;
t := Summation(Trades, p) / p;


Plot(Trades);

Se (Trades >= t) entao 
Plot2(t) 
Senao 
Plot2(Trades);


Plot3(t);

Fim;