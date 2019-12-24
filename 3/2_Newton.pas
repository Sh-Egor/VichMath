PROGRAM snau_newt;
uses crt;
     const
          n_max = 2;
     type
         TVec = array[1..n_max] of real;
         TMat = array[1..n_max,1..n_max] of real;
         
     procedure F(n:integer; x:Tvec; var y:TVec);
     begin
          y[1]:=sin(x[1]+x[2]) - 1.5*x[1]-0.2;
          y[2]:=sqr(x[1]) + sqr(x[2]) - 1;
     end;
     
     procedure G(n:integer; x:Tvec; var a:TMat);
     var
        det: real;
        i,j: integer;
     begin
          a[1,1]:=2*x[2]; a[1,2]:= -cos(x[1]+x[2]);
          a[2,1]:=-2*x[1]; a[2,2]:=cos(x[1]+x[2])-1.5;;
          det:=a[1,1]*a[2,2]-a[1,2]*a[2,1];
          for i:=1 to n do
              for j:=1 to n do
                  a[i,j]:=a[i,j]/det;
     end;
     
     procedure Newts(n:integer; var x:Tvec; eps: real; var k: integer);
     var
        i,j: integer;
        x0,y: TVec;
        a: TMat;
        cod: boolean;
     begin
          k:=0;
          repeat
                for i:=1 to n do
                    x0[i]:=x[i];
                F(n,x,y);
                G(n,x,a);
                for i:=1 to n do
                    for j:=1 to n do
                        x[i]:=x[i]-a[i,j]*y[j];
                cod:= true;
                for i:=1 to n do
                    if abs(x[i]-x0[i]) > eps then cod:=false;
                k:=k+1;
          until cod;
     end;
     
     var
        x:Tvec;
        n,k:integer;
        eps: real;
        ch: char;
     begin
          n:=n_max;
          eps:=0.001;
          //x[1]:=-0.8;
          x[1]:=0.6;
          //x[2]:=-0.6;
          x[2]:=0.8;
          Newts(n,x,eps,k);
          writeln('Решение сестемы: ');
          writeln('x[1]= ',x[1]);
          writeln('x[2]= ',x[2]);
          writeln('Число итераций: ',k);
          ch:=readkey;
     end.