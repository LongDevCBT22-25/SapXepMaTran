uses crt;
var n,m,i,j:longint; 
    a:array[1..1000,1..1000] of longint; 
    f1,f2:text;
const fi='bai4.inp'; fo='bai4.out';
procedure input;
    begin
        assign(f1,fi); reset(f1);
        assign(f2,fo); rewrite(f2);
        readln(f1,m,n);
        for i:=1 to m do 
            for j:=1 to n do read(f1,a[i,j]);
    end;
procedure sort1;
var t:longint;
    begin
        for i:=1 to m-1 do
            for j:=i+1 to m do
                if a[i,i]>a[j,j] then
                    begin
                        t:=a[i,i];
                        a[i,i]:=a[j,j];
                        a[j,j]:=t;
                    end;
    end;
procedure sort2;
var x,d,t:longint;
    temp:array[1..1000] of longint;
    begin
        x:=2; 
        while x<n do
            begin
                j:=x; 
                i:=1; 
                d:=1;
                while (j<=n) and (i<=m) do
                    begin
                        temp[d]:=a[i,j];
                        inc(i);
                        inc(j);
                        inc(d);
                    end;
                dec(d);
                for i:=1 to d-1 do
                    for j:=i+1 to d do 
                        if temp[i]>temp[j] then
                            begin
                                t:=temp[i];
                                temp[i]:=temp[j];
                                temp[j]:=t;
                            end;
                d:=1; 
                i:=1; 
                j:=x;
                while (j<=n) and (i<=m) do
                    begin 
                        a[i,j]:=temp[d];
                        inc(i);
                        inc(j);
                        inc(d);
                    end;
                inc(x);
            end;
    end;    
procedure sort3;
var y,d,t:longint;
    temp:array[1..1000] of longint;
    begin
        y:=2; 
        while y<m do
            begin
                i:=y; 
                j:=1; 
                d:=1;
                while (j<=n) and (i<=m) do
                    begin
                        temp[d]:=a[i,j];
                        inc(i);
                        inc(j);
                        inc(d);
                    end;
                dec(d);
                for i:=1 to d-1 do
                    for j:=i+1 to d do 
                        if temp[i]>temp[j] then
                            begin
                                t:=temp[i];
                                temp[i]:=temp[j];
                                temp[j]:=t;
                            end;
                i:=y; 
                j:=1; 
                d:=1;
                while (j<=n) and (i<=m) do
                    begin 
                        a[i,j]:=temp[d];
                        inc(i);
                        inc(j);
                        inc(d);
                    end;
                inc(y);
            end;
    end;
procedure solve;
var x:integer;
    begin
        sort1;
        sort2;
        sort3;
        for i:=1 to m do
            begin
                for j:=1 to n do write(f2,a[i,j],' ');
                writeln(f2);
            end;
        close(f1); close(f2);
    end;
begin
    input;
    solve;
end.