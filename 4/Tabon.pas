program Simpson;
uses crt;

var
   a, b, x, Delta: real;
   i, step, N:integer;
   y, y1, y2:real;
   Er, H:real;
   ch: char;
function f(x:real):real;
         begin
              //f := x*exp(x*x);
              f := 1/sqrt(1 + x*x*x*x);
         end;
function Simp(a,b:real; N:integer):real;
         var
            y, h, x:real;
            i:integer;
         begin
              h := (b-a)/N;
              y := 0;
              x := A;
              for i:=1 to ((N-2)div 2) + 1 do
                  begin
                       y := y + f(x) + 4*f(x+h) + f(x+2*h);
                       x := x + 2*h;
                  end;
              Simp := y*h/3;
         end;

begin
     ClrScr;
     writeln('Приближенное вычисление определенных интеграллов');
     writeln('------------------------------------------------');
     writeln('              Метод Симпсона');
                   writeln('с табулированием');
     writeln;
     write('Введите чётное число интервалов разбияния N: ');
     readln(N);
     write('Введите нижний предел интегрирования a : ');
     readln(a);
     write('Введите верхний предел интегрирования b: ');
     readln(b);
     write('Введите шаг Delta: ');
     readln(Delta);
     writeln(' Результат :');
     writeln('------------------------------------------------');
     writeln('!      x      !      y      !        Er        !');
     writeln('------------------------------------------------');
     Step := Round((b-a)/Delta) + 1;
     for  i := 1 to Step do
         begin
              x  := a + Delta*(i-1);
              y1 := Simp(a, x, N);
              y2 := Simp(a, x, 2*N);
              Er := (y2 - y1)/15;
              y  := y2 + Er;
              writeln(x:12:5, y:12:5, Er:12:5);
         end;
     writeln('Нажмите любую клавишу ...');
     ch := readkey;
end.