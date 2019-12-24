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
     writeln(Space, '������������ ������� ������ ����');
     writeln(Space, '--------------------------------');
     writeln(Space, '  ����� �����-����� 1 �������');
     writeln(Space, '  ---------------------------');
     writeln;
     write('������� ��������� �������� Xo: '); readln(Xo);
     write('������� ����� ��������� Xn: '); readln(Xn);
     write('������� ��� h: '); readln(h);
     writeln('������� ��������� �������: ');
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
     writeln('����������');
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
         writeln('������� ����� ������� ...');
         ch := readkey;
end.