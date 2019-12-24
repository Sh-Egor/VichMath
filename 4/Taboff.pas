program Simpson;
uses crt;

var
   a, b:real;
   N:integer;
   y, y1, y2:real;
   Er, Error, H:real;
   ch: char;
function f(x:real):real;
         begin
              //f := x*exp(x*x);
              //f := 1/((11 + 5*x)*(11 + 5*x)*(11 + 5*x))
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
     writeln('������������ ���������� ������������ �����������');
     writeln('------------------------------------------------');
     writeln('              ����� ��������');
     writeln;
     write('������� ������ ������ �������������� a : ');
     readln(a);
     write('������� ������� ������ �������������� b: ');
     readln(b);
     write('������� ����������� Er: ');
     readln(Error);
     N:=2;
     repeat
           y1 := Simp(a, b, N);
           y2 := Simp(a, b, 2*N);
           Er := abs(y2-y1)/15;
           N  := N*2;
     until Er <= Error;
     y := y2 + Er;
     writeln('������������ �������� ��������� y = ', y:12:6);
     writeln('����� ���������� ��������� N = ', N);
     writeln('������� ����� ������� ...');
     ch := readkey;
end.