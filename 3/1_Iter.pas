PROGRAM itera2;
uses crt;
     const
          eps = 0.0001; //x0 = 0.15; y0 = -2;
                        x0 = -1; y0 = 0;
     var
        x,y:real;
        k:integer;
        ch:char;
     function f1(y:real):real;
              begin
                   //f1:=(1/3)*cos(y) + 0.3;
                   f1:=0.5*sin(y) - 1
              end;
     function f2(x:real):real;
              begin
                   //f2:=sin(x-0.6) - 1.6;
                   f2:= 1 - cos(x+0.5)
              end;
     procedure siter2(eps:real;var k:integer;var x:real; var y:real);
               var z1:real;
               var z2:real;
               var E:real;
               begin
                    k:=0;
                    z1:=f1(y);
                    z2:=f2(x);
                    E:= sqrt(sqr(z1-x)+sqr(z2-y));
                    while E>=eps do
                    begin
                         k:=k+1;
                         x:=z1;
                         y:=z2;
                         z1:=f1(y);
                         z2:=f2(x);
                         E:= sqrt(sqr(z1-x)+sqr(z2-y))
                    end;
               end;
     begin
     x:=x0;
     y:=y0;
     siter2(eps,k,x,y);
     writeln();
     writeln('Количество итераций = ',k:3);
     writeln('Приближенное значение x = ',x:12:8);
     writeln('Приближенное значение y = ',y:12:8);
     ch:=readkey;
     end.
