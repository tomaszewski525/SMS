delete(instrfindall); % zamkniecie wszystkich polaczen szeregowych
clear all;
close all;
s = serialport('COM5', 115200, 'Parity', 'None'); % COM9 to jest port utworzony przez mikrokontroler
s.configureTerminator("LF");
fopen(s); % otwarcie kanalu komunikacyjnego

Tp = 0.01; % czas z jakim probkuje regulator
y = []; % wektor wyjsc obiektu
u = []; % wektor wejsc (sterowan) obiektu
while length(y)<500 % zbieramy 100 pomiarow
    txt = s.readline(); % odczytanie z portu szeregowego
    % txt powinien zawiera´c Y=%4d;U=%4d;
    % czyli np. Y=1234;U=3232;
    eval(char(txt')); % wykonajmy to co otrzymalismy

    y=[y;Y]; % powiekszamy wektor y o element Y
    u=[u;U]; % powiekszamy wektor u o element U
end
figure; plot((0:(length(y)-1))*Tp,y); 
title("PID wyjscie")
ylabel("y")% wyswietlamy y w czasie
figure; plot((0:(length(u)-1))*Tp,u); % wyswietlamy u w czasie\
title("PID sterowanie")
ylabel("u")

save("PID_Strojenie")