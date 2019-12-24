program loeficpolin;

uses Crt;

type line = array[1..6] of real;
var a,ak:array[1..6] of line;
q:line;
p:array[0..6] of real;
i,j,k,n,m:integer;

procedure mult;

var t:line;
    begin
    for i:= 1 to m do
        begin
             for j:=1 to m do
             begin
                  t[j]:=0;
                  for n:=1 to m do
                  t[j]:=t[j]+ak[i][n]*a[n][j]
                  end;
                  ak[i]:=t;
        end;
    end;
    
function trace: real;
var
    tr:real;
    begin
         tr:=0;
         for i:=1 to m do
         tr:=tr+ak[i][i];
         trace := tr;
    end;
    
begin
     writeln('Программа построения характеристического полинома квадратной матрицы');
     write('Введите размер матрицы m: ');
     readln(m);
     writeln('Введите матрицу: ');
     for i:=1 to m do
         for j:=1 to m do
         begin
         read(a[i][j]);
         if j=i then
             ak[i][j]:=1
         else
             ak[i][j]:=0;
         end;
     readln;
     
     writeln('Матрица: ');
     for i:=1 to m do
     begin
          for j:=1 to m do
              write(a[i][j]:10:4);
          writeln;
     end;
     
     for k:=1 to m do
     begin
          mult;
          q[k]:=trace;
     end;
     
     p[0]:=1;
     for k:=1 to m do
     begin
          p[k]:=0;
          for n:=1 to k do
              p[k]:=p[k]+p[pred(n)]*q[succ(k-n)];
          p[k]:=-p[k]/k;
     end;
     
     writeln('Имеет характеристичекий полином с коэффициентами: ');
     for k:=0 to m do
         write(p[k]:12:4);
     writeln
end.