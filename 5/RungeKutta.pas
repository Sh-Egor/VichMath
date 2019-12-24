program RungeKutt4;
uses Crt;

const
     NMax = 3;
     Space = '                        ';
type
    Mas = array[1..NMax]of real;
var
   Y, Yo: mas;
   X, Xo, Xn, h, Eg:real;
   i, j, M:integer;
   ch: char;
procedure p(x:real; y:mas; var f: mas);
          begin
          f[1] := y[2];
          f[2] := y[3];
          f[3] := -y[2];
          //f[1] := y[1]/(x+1) - 0.5*(x +1)*(x + 1);
          end;

procedure Rgk(x, h:real; n: integer; var y:mas);
          var
             k1, k2, k3, k4, y1:mas;
             i:integer;
          begin
               p(x,y,k1);
               for i := 1 to n do
                   y1[i] := y[i] + h*k1[i]*0.5;
               p(x + h*0.5, y1, k2);
               for i := 1 to n do
                   y1[i] := y[i] + h*k2[i]*0.5;
               p(x + h*0.5, y1, k3);
               for i := 1 to n do
                   y1[i] := y[i] + h*k3[i];
               p(x + h, y1, k4);
               for i := 1 to n do
                   y[i] := y[i] + h/6*(k1[i]+2*k2[i]+2*k3[i] + k4[i]);
          end;
begin
     ClrScr;
     writeln(Space, 'Приближенное решение задачи Коши');
     writeln(Space, '--------------------------------');
     writeln(Space, '  Метод Рунге-Кутта 4 порядка');
     writeln(Space, '  ---------------------------');
     writeln;
     write('Введите начальное значение Xo: '); readln(Xo);
     write('Введите конец интервала Xn: '); readln(Xn);
     write('Введите шаг h: '); readln(h);
     writeln('Введите начальные условия: ');
     for i:= 1 to NMax do
         begin
              write(' Yo[',i,'] = ');
              readln(Yo[i]);
         end;
     M := Trunc((Xn - Xo)/h);
     X := Xo;
     for i:= 1 to Nmax do
         Y[i] := Yo[i];
     writeln;
     writeln('Результаты');
     for i:= 1 to NMax do
         repeat
              Rgk(X, h, NMax, Y);
              X := X + h;
              write(' X =', X:10:7);
              for j:=1 to NMax do
                  write(' Y[',j,'] = ',Y[j]:10:7);
              writeln;
         until(X >= Xn);
         writeln('Нажмите любую клавишу ...');
         ch := readkey;
end.