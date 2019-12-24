program difur2pr;

uses Crt;

const
     NMax = 20;
     Space= '             ';

type
    Mas = array[1..NMax+1] of real;
    Mas1 = array[1..NMax] of real;

function F1(x:real):real;
         begin
              F1:=-2*x;
         end;
function F2(x:real):real;
         begin
              F2:=4;
         end;
function F(x:real):real;
         begin
              F:=0;
         end;
procedure progon(n: integer; A,C:mas1; D,B: mas; var X:mas);
var i, i1: integer;
mult: real;
      begin
           for i:=2 to n do
               begin
                    mult := A[i-1]/D[i-1];
                    D[i] := D[i] - mult*C[i-1];
                    B[i] := B[i] - mult*B[i-1];
               end;
           X[n] := B[n]/D[n];
           for i:=1 to N-1 do
               begin
                    i1:=N-i;
                    X[i1] := (B[i1] - C[i1]*X[i1+1])/D[i1];
               end;
      end;

var
   z0,z1,a1,v0,v1,b1,s,e,h:real;
   A,C:Mas1;
   X,D,B,Y:Mas;
   i:integer;
   ch:char;
   t,h1:real;
   n,n1:integer;

begin
     ClrScr;
     writeln(Space,'Введите параметры 1-го краевого условия C1,C2,C');
     readln(z0,z1,a1);
     writeln(Space,'Введите параметры 2-го краевого условия d1,d2,d');
     readln(v0,v1,b1);
     writeln(Space, 'Введите начало интервала s');
     readln(s);
     writeln(Space, 'Введите конец интервала e');
     readln(e);
     h := (e-s)/NMax;
     t := s;
     n := NMax;
     D[1] := z0*h-z1;
     C[1] := z1;
     B[1] := a1*h;
     h1 := h*h;
     for i:=2 to n do
         begin
              t := t + h;
              B[i] := F(t)*h1;
              A[i-1]:= 1 - 0.5*F1(t)*h;
              D[i] := F2(t)*h1-2;
              C[i] := 1 + 0.5*F1(t)*h;
         end;
     A[n] := -v1;
     D[n+1] := v0*h+v1;
     B[n+1] := b1*h;
     n1 := NMax + 1;
     progon(n1,A,C,D,B,Y);
     writeln('Результаты');
     X[1] := s;
     X[n1] := e;
     for i:=2 to n do
         X[i] := X[i-1] + h;
     for i:= 1 to n1 do
     //if (i mod 4 = 1) then
         begin
              write('X[',i,']= ', X[i]:6:3);
              writeln(' Y[',i,']= ', Y[i]:10:7);
         end;
     writeln('Нажмите любую кнопку');
     ch := readkey;
end.
     