input
  distanciaMax75(10.76);
  distanciaMax85(14.21);
  distanciaMax95(20.65);
  distanciaMax99(30.76);
  distanciaMax75MMA(14.00);
  distanciaMax85MMA(18.12);
  distanciaMax95MMA(26.78);
  distanciaMax99MMA(40.10);
  mma(false);
var
  mme9  : float;
  mme34 : float;
  mma20 : float;
  mma50 : float;
begin
  mme9 := mediaexp(9,close);
  mme34 := mediaexp(34,close);
  mma20 := media(20,close);
  mma50 := media(50,close);
if (mma = true) then
    begin
      plot(mma20 - mma50);
      if (distanciamax75MMA <> 0) then
        begin
          plot2(distanciamax75MMA);
          plot6( - distanciamax75MMA);
        end;
      if (distanciamax85MMA <> 0) then
        begin
          plot3(distanciamax85MMA);
          plot7( - distanciamax85MMA);
        end;
      if (distanciamax95MMA <> 0) then
        begin
          plot4(distanciamax95MMA);
          plot8( - distanciamax95MMA);
        end;
      if (distanciamax99MMA <> 0) then
        begin
          plot5(distanciamax99MMA);
          plot9( - distanciamax99MMA);
        end;
      if (ABS(mma20 - mma50) >= distanciamax75mma) then
        begin
          if (mma20 > mma50) then
            begin
              setplotcolor(1,rgb(255,128,128));
            end
          else if (mma20 < mma50) then
            begin
              setplotcolor(1,rgb(128,255,128));
            end;
        end;
      if (ABS(mma20 - mma50) >= distanciamax85mma) then
        begin
          if (mma20 > mma50) then
            begin
              setplotcolor(1,rgb(255,51,51));
            end
          else if (mma20 < mma50) then
            begin
              setplotcolor(1,rgb(77,255,77));
            end;
        end;
      if (ABS(mma20 - mma50) >= distanciamax95mma) then
        begin
          if (mma20 > mma50) then
            begin
              setplotcolor(1,rgb(153,0,0));
            end
          else if (mma20 < mma50) then
            begin
              setplotcolor(1,rgb(0,153,0));
            end;
        end;
      if (ABS(mma20 - mma50) >= distanciamax99mma) then
        begin
          if (mma20 > mma50) then
            begin
              setplotcolor(1,rgb(102,0,0));
            end
          else if (mma20 < mma50) then
            begin
              setplotcolor(1,rgb(0,77,0));
            end;
        end;
    end
else if (mma = FALSE) then
  begin
    plot(mme9 - mme34);
    if (distanciamax75 <> 0) then
      begin
        plot2(distanciamax75);
        plot6( - distanciamax75);
      end;
    if (distanciamax85 <> 0) then
      begin
        plot3(distanciamax85);
        plot7( - distanciamax85);
      end;
    if (distanciamax95 <> 0) then
      begin
        plot4(distanciamax95);
        plot8( - distanciamax95);
      end;
    if (distanciamax99 <> 0) then
      begin
        plot5(distanciamax99);
        plot9( - distanciamax99);
      end;
    if (ABS(mme9 - mme34) >= distanciamax75) then
      begin
        if (mme9 > mme34) then
          begin
            setplotcolor(1,rgb(128,255,128));
          end
        else if (mme9 < mme34) then
          begin
            setplotcolor(1,rgb(255,128,128));
          end;
      end;
    if (ABS(mme9 - mme34) >= distanciamax85) then
      begin
        if (mme9 > mme34) then
          begin
            setplotcolor(1,rgb(255,51,51));
          end
        else if (mme9 < mme34) then
          begin
            setplotcolor(1,rgb(77,255,77));
          end;
      end;
    if (ABS(mme9 - mme34) >= distanciamax95) then
      begin
        if (mme9 > mme34) then
          begin
            setplotcolor(1,rgb(153,0,0));
          end
        else if (mme9 < mme34) then
          begin
            setplotcolor(1,rgb(0,153,0));
          end;
      end;
    if (ABS(mme9 - mme34) >= distanciamax99) then
      begin
        if (mme9 > mme34) then
          begin
            setplotcolor(1,rgb(102,0,0));
          end
        else if (mme9 < mme34) then
          begin
            setplotcolor(1,rgb(0,77,0));
          end;
      end;
  end;
end;