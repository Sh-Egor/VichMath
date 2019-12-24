{Метод биекций или деления отрезка пополам}
PROGRAM POPOLAM;
uses crt;
     const
          eps = 0.0001; //a= -8; b = -6;
                        //a= -4; b = 0;
                        //a= 2; b = 4;
                        //a= 4; b = 6;
                        //a= 16; b = 18;
     var
        x:real; k:integer;
     function f(x:real):real;
              begin
              //x^5 - 15x^4 - 76x^3 +878x^2 -129x - 3916
                   f:=x*x*x*x*x - 15*x*x*x*x - 76*x*x*x + 878*x*x - 129*x - 3916;
                   //f:=x*x*x+5*x-4;
                   //f:=ln(x)/ln(10) - 7/(2*x+6);
                   //f:=(x-1)*(x-1) - sin(2*x);
              end;
     procedure bisect(a,b,eps:real; var k:integer; var x:real);
               var r,y:real;
               begin
                    k:=0;
                    x:=(a+b)*0.5;
                    y:=f(x);
                    r:=f(a);
                    while (y<>0) and (b-a>eps)do
                          begin
                               k:=k+1;
                               if r*y>0 then a:=x
                               else b:=x;
                               x:=(a+b)*0.5;
                               y:=f(x);
                          end
               end;
     begin
          bisect(a,b,eps,k,x);
          Writeln('Приближённое значение = ', x:12:8);
          Writeln('Количество итераций =',k:4);
     end.