Program progonca4;
uses Crt;

const
     NMax = 5;
     Space = '              ';

type
    Mas = array[1..NMax] of real;
    Mas1 = array[1..NMax-1] of real;
    
var
   D,B,X:mas;
   A,C:mas1;
   i,j:integer;
   ch:char;
procedure progon(n: integer; A,C:mas1; D,B: mas; varX:mas);
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
begin
     ClrScr;
     writeln(Space, '���� ������� �������');
     writeln;
     writeln(Space, '������� �������� ������� ���������');
     for i:=1 to NMax do
         begin
              write('a[',i,i,']=D[',i,']= ');
              readln(D[i]);
         end;
     writeln(Space,'������� ������������ ������� �������������');
     for i:=1 to NMax-1 do
         begin
              write('a[',i,i,']=A[',i,']= ');
              readln(A[i]);
         end;
     writeln(Space,'������� ������������� ������� �������������');
     for i:=1 to NMax-1 do
         begin
              write('a[',i,i,']=C[',i,']= ');
              readln(C[i]);
         end;
     for i:= 1 to NMax do
         begin
              write('b[',i,']= ');
              readln(b[i]);
         end;
     Progon(NMax,A,C,D,B,X);
     writeln('������� �������');
     for i:=1 to NMax do
         writeln('X[',i,']= ', X[i]:10:7);
     writeln;
     writeln('������� ����� ������');
     ch := readkey;
end.