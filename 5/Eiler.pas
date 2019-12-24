program RungeKutt4;
uses Crt;

const
     NMax = 1;
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
          //f[1] := y[2];
          //f[2] := y[3];
          //f[3] := -y[2];
          f[1] := x + y[1]/x;
          end;

procedure Eyler(x, h:real; n: integer; var y:mas);
          var
             k1:mas;
             i:integer;
          begin
               p(x,y,k1);
               for i := 1 to n do
                   y[i] := y[i] + h*k1[i];
          end;
begin
     ClrScr;
     writeln(Space, 'Приближенное решение задачи Коши');
     writeln(Space, '--------------------------------');
     writeln(Space, '  Метод Рунге-Кутта 1 порядка');
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
     for i:= 1 to M do
         begin
              Eyler(X, h, NMax, Y);
              X := X + h;
              Eg := X*X-X;
              if(i mod 1000 = 0)then
                  begin
                   write(' X =', X:10:7);
                   for j:=1 to NMax do
                   write(' Y[',j,'] = ',Y[j]:10:7);
                   write(' | z =',Eg:10:7);
                   writeln;
         //until(X >= Xn);
                  end;
         end;
         writeln('Нажмите любую клавишу ...');
         ch := readkey;
end.