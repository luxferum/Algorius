//DP NO PREÇO
INPUT
  apenasHoje(TRUE);
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
  DoP1  : FLOAT;
  DoP2  : FLOAT;
  DoP3  : FLOAT;
  DoP4  : FLOAT;
  DoP5  : FLOAT;
  DoP6  : FLOAT;
  DoP7  : FLOAT;
  DoP8  : FLOAT;
  DoP9  : FLOAT;
  DoP10 : FLOAT;
begin
  if (apenasHoje = TRUE) then
    begin
      if (Date = CurrentDate) then
        begin
          plot11(opendaily(0));
          IF (OP1 = 0) THEN
            BEGIN
            END
          ELSE 
            BEGIN
              DOP1 := OP1 * DP;
              PLOT(DOP1 + OpenDaily(0));
            END;
          IF (OP2 = 0) THEN
            BEGIN
            END
          ELSE 
            BEGIN
              DOP2 := OP2 * DP;
              PLOT2(DOP2 + OpenDaily(0));
            END;
          IF (OP3 = 0) THEN
            BEGIN
            END
          ELSE 
            BEGIN
              DOP3 := OP3 * DP;
              PLOT3(DOP3 + OpenDaily(0));
            END;
          IF (OP4 = 0) THEN
            BEGIN
            END
          ELSE 
            BEGIN
              DOP4 := OP4 * DP;
              PLOT4(DOP4 + OpenDaily(0));
            END;
          IF (OP5 = 0) THEN
            BEGIN
            END
          ELSE 
            BEGIN
              DOP5 := OP5 * DP;
              PLOT5(DOP5 + OpenDaily(0));
            END;
          IF (OP6 = 0) THEN
            BEGIN
            END
          ELSE 
            BEGIN
              DOP6 := OP6 * ( - 1) * DP;
              PLOT6(DOP6 + OpenDaily(0));
            END;
          IF (OP7 = 0) THEN
            BEGIN
            END
          ELSE 
            BEGIN
              DOP7 := OP7 * ( - 1) * DP;
              PLOT7(DOP7 + OpenDaily(0));
            END;
          IF (OP8 = 0) THEN
            BEGIN
            END
          ELSE 
            BEGIN
              DOP8 := OP8 * ( - 1) * DP;
              PLOT8(DOP8 + OpenDaily(0));
            END;
          IF (OP9 = 0) THEN
            BEGIN
            END
          ELSE 
            BEGIN
              DOP9 := OP9 * ( - 1) * DP;
              PLOT9(DOP9 + OpenDaily(0));
            END;
          IF (OP10 = 0) THEN
            BEGIN
            END
          ELSE 
            BEGIN
              DOP10 := OP10 * ( - 1) * DP;
              PLOT10(DOP10 + OpenDaily(0));
            END;
        end;
    end
  else 
    begin
      plot11(opendaily(0));
      IF (OP1 = 0) THEN
        BEGIN
        END
      ELSE 
        BEGIN
          DOP1 := OP1 * DP;
          PLOT(DOP1 + OpenDaily(0));
        END;
      IF (OP2 = 0) THEN
        BEGIN
        END
      ELSE 
        BEGIN
          DOP2 := OP2 * DP;
          PLOT2(DOP2 + OpenDaily(0));
        END;
      IF (OP3 = 0) THEN
        BEGIN
        END
      ELSE 
        BEGIN
          DOP3 := OP3 * DP;
          PLOT3(DOP3 + OpenDaily(0));
        END;
      IF (OP4 = 0) THEN
        BEGIN
        END
      ELSE 
        BEGIN
          DOP4 := OP4 * DP;
          PLOT4(DOP4 + OpenDaily(0));
        END;
      IF (OP5 = 0) THEN
        BEGIN
        END
      ELSE 
        BEGIN
          DOP5 := OP5 * DP;
          PLOT5(DOP5 + OpenDaily(0));
        END;
      IF (OP6 = 0) THEN
        BEGIN
        END
      ELSE 
        BEGIN
          DOP6 := OP6 * ( - 1) * DP;
          PLOT6(DOP6 + OpenDaily(0));
        END;
      IF (OP7 = 0) THEN
        BEGIN
        END
      ELSE 
        BEGIN
          DOP7 := OP7 * ( - 1) * DP;
          PLOT7(DOP7 + OpenDaily(0));
        END;
      IF (OP8 = 0) THEN
        BEGIN
        END
      ELSE 
        BEGIN
          DOP8 := OP8 * ( - 1) * DP;
          PLOT8(DOP8 + OpenDaily(0));
        END;
      IF (OP9 = 0) THEN
        BEGIN
        END
      ELSE 
        BEGIN
          DOP9 := OP9 * ( - 1) * DP;
          PLOT9(DOP9 + OpenDaily(0));
        END;
      IF (OP10 = 0) THEN
        BEGIN
        END
      ELSE 
        BEGIN
          DOP10 := OP10 * ( - 1) * DP;
          PLOT10(DOP10 + OpenDaily(0));
        END;
    end;
end;


//DP FORA DO PREÇO

INPUT
  apenasHoje(TRUE);
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
  DoP1  : FLOAT;
  DoP2  : FLOAT;
  DoP3  : FLOAT;
  DoP4  : FLOAT;
  DoP5  : FLOAT;
  DoP6  : FLOAT;
  DoP7  : FLOAT;
  DoP8  : FLOAT;
  DoP9  : FLOAT;
  DoP10 : FLOAT;
begin
  Plot(0);//linha 0
  plot2((close-opendaily(0))/DP);//linha preço
  plot3(1.00);
  plot4(1.50);
  plot5(2.00);
  plot6(2.50);
  plot7(3.00);
  plot8(-1.00);
  plot9(-1.50);
  plot10(-2.00);
  plot11(-2.50);
  plot12(-3.00);

end;
//HTS BLACK AND SCHOLES
input
dt(8.90);

var
std1:float;
std2:float;
std3:float;
std4:float;
std5:float;
std6:float;

stdM1:float;
stdM2:float;
stdM3:float;
stdM4:float;
stdM5:float;
stdM6:float;

begin
IF (LASTBARONCHART=TRUE) THEN
BEGIN
std1:=OpenD(0)+dt;
std2:=OpenD(0)+2*dt;
std3:=OpenD(0)+3*dt;
std4:=OpenD(0)+4*dt;
std5:=OpenD(0)+5*dt;
std6:=OpenD(0)+6*dt;

stdM1:=OpenD(1)-dt;
stdM2:=OpenD(1)-2*dt;
stdM3:=OpenD(1)-3*dt;
stdM4:=OpenD(1)-4*dt;
stdM5:=OpenD(1)-5*dt;
stdM6:=OpenD(1)-6*dt; 



plot2(std1);
plot3(std2);
plot4(std3);
plot5(std4); 
plot6(std5);
plot7(std6);

plot8(stdM1);
plot9(stdM2);
plot10(stdM3);
plot11(stdM4);
plot12(stdM5);
plot13(stdM6);
END;
end;

//VEL MEDIA
{ www.ScApp.link }
Parametro
  Periodo(3);
  sdPeriodo(60);

var
  i    : Inteiro; {contagem}
  AS   : Real; {Average Speed = Velocidade Média}
  d    : Real; {distância : pontos}
  v    : Real; {velocidade : pontos/minuto}
  sumv : Real; {soma}
 

Inicio

  sumv := 0;

  Para i := 1 ate Periodo faca
    inicio
      d := Abs(Fechamento[i] - Fechamento[i - 1]) / MinPriceIncrement;
      v := d / GraphicOffset; {v = d/t} 
      sumv := sumv + v;
     
    fim;

  AS := sumv / Periodo;  
  Plot(AS); 

  Plot2(HarmonicMean(AS,sdPeriodo));
  


  //Plot3(stddevs(AS,sdPeriodo));
  //NoPlot(2);
  //NoPlot(3);

Fim;
//SHO
Parametro
  Periodo(14);

var
  cor1, cor2 : inteiro;
  C, Cy, Vt, Vy, At, A, T, Ti, Vp, Tp, SHO, signal : real;

Inicio

  C  := fechamento;  
  Cy := fechamento[1];  
  Vt := C - Cy;
  Vy := Vt[1];
  At := Vt - Vy;
  A  := Media(Periodo, At);  
  T  := 2 * 3.14159265 * (Sqrt(Abs(Vt / A)));

  Se (C > Cy) entao Ti := +T
  Senao Ti := -T;

  Vp := Media(Periodo, Ti);
  Tp := Media(Periodo, T);  
  SHO := (Vp / Tp) * 100;
  signal := Media(3, SHO);

  Se (SHO > 0) entao cor1 := clLime senao cor1 := clRed;
  Se (signal > signal[1]) entao cor2 := clLime senao cor2 := clRed;

  Plot(signal); SetPlotColor(1, cor1);  
  Plot2(SHO);
  Plot3(signal); SetPlotColor(3, cor2);

Fim;
//VWAP ZSCORE
//VWAP to Close Z-Score Distance
//Fábio Trevisan fevereiro 2020 trevisan.fabio@gmail.com
input
period(20);
var
vwap_z,vwma_i:float;
begin
  vwma_i:= summation(close * volume,period) / summation(volume,period);
  vwap_z:= (close - vwap(1)) / StdDevs(close - vwap(1),period);
  Plot(vwap_z);
end;