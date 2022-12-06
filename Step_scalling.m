load("Odpowiedz skokowa 1000.mat")
s = 0;
l = 0;

for i=1:500
    if(y(i)>50 && y(i) < 1000)
        l =  l+1
        i

        s(l) = y(i);
    end
end
s= s/1000;

old_s = s;
ypp = 34.12;
upp = 25;
uk = 40;


du = uk - upp;
Y_pp = ypp * ones(size(old_s));

s = (old_s - Y_pp) / du;

%stairs(s);
