clear;
clc;
close all;
%% Lugar de raices
Km=2076.1202;
pm=42.0845;
reductora =  506.25;

num = [Km/reductora];
den = [1 pm 0];

f1 = figure(1);
rlocus(num, den)
saveas(f1,'Controlador/lugarderaices.png')
%% Analisis del motor
clear;clc;

kp_1 = csvread('Controlador/kp=1.dat');
kp_10 = csvread("Controlador/kp=10.dat");
kp_100 = csvread("Controlador/kp=100.dat");
kp_200 = csvread("Controlador/kp=200.dat");
kp_500 = csvread("Controlador/kp=500.dat");
kp_1000 = csvread("Controlador/kp=1000.dat");
kp_2000 = csvread("Controlador/kp=2000.dat");
kp_3000 = csvread("Controlador/kp=3000.dat");
kp_2000_90 = csvread("Controlador/kp=2000_-90.dat");
kp_2000_270 = csvread("Controlador/kp=2000_-270.dat");
kp_2000_360 = csvread("Controlador/kp=2000_360.dat");

% kp = 1
f2 = figure (2);
tiempo = kp_1(:,1);
pulsos = kp_1(:,2);
pos_final = kp_1(:,3);
angulo = kp_1(:,4);
error = kp_1(:,5);
voltage = kp_1(:,6);

subplot(3,1,1)
plot(tiempo, pulsos, 'r')
xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 1')

subplot(3,1,2)
plot(tiempo, voltage,'r')
xlabel('tiempo (ms)')
ylabel('voltage (V)')
axis([0 7000 0 12.5])

subplot(3,1,3)
plot(tiempo, pos_final, '-.b',tiempo, angulo, 'm')
xlabel('tiempo (ms)')
ylabel('angulo (rad)')
legend('R','angulo', 'Location','southeast')
axis([0 7000 0 1.7])

saveas(f2,'Controlador/kp=1.png')

% kp = 10
f3 = figure (3);
tiempo = kp_10(:,1);
pulsos = kp_10(:,2);
pos_final = kp_10(:,3);
angulo = kp_10(:,4);
error = kp_10(:,5);
voltage = kp_10(:,6);

subplot(3,1,1)
plot(tiempo, pulsos, 'r')
xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 10')

subplot(3,1,2)
plot(tiempo, voltage, 'r')
xlabel('tiempo (ms)')
ylabel('voltage (V)')
axis([0 7000 0 12.5])

subplot(3,1,3)
plot(tiempo, pos_final, '-.b',tiempo, angulo, 'm')
xlabel('tiempo (ms)')
ylabel('angulo (rad)')
legend('R','angulo', 'Location','southeast')
axis([0 7000 0 1.7])

saveas(f3,'Controlador/kp=10.png')

% kp = 100
f4 = figure (4);
tiempo = kp_100(:,1);
pulsos = kp_100(:,2);
pos_final = kp_100(:,3);
angulo = kp_100(:,4);
error = kp_100(:,5);
voltage = kp_100(:,6);

subplot(3,1,1)
plot(tiempo, pulsos, 'r')
xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 100')
axis([0 2000 0 max(pulsos)*(1+0.1)])

subplot(3,1,2)
plot(tiempo, voltage, 'r')
xlabel('tiempo (ms)')
ylabel('voltage (V)')
axis([0 2000 0 12.5])

subplot(3,1,3)
plot(tiempo, pos_final, '-.b',tiempo, angulo, 'm')
xlabel('tiempo (ms)')
ylabel('angulo (rad)')
legend('R','angulo', 'Location','southeast')
axis([0 2000 0 1.7])

saveas(f4,'Controlador/kp=100.png')

% kp = 200
f5 = figure (5);
tiempo = kp_200(:,1);
pulsos = kp_200(:,2);
pos_final = kp_200(:,3);
angulo = kp_200(:,4);
error = kp_200(:,5);
voltage = kp_200(:,6);

subplot(3,1,1)
plot(tiempo, pulsos, 'r')
xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 200')
axis([0 2000 0 max(pulsos)*(1+0.1)])

subplot(3,1,2)
plot(tiempo, voltage, 'r')
xlabel('tiempo (ms)')
ylabel('voltage (V)')
axis([0 2000 0 12.5])

subplot(3,1,3)
plot(tiempo, pos_final, '-.b',tiempo, angulo, 'm')
xlabel('tiempo (ms)')
ylabel('angulo (rad)')
legend('R','angulo', 'Location','southeast')
axis([0 2000 0 1.7])

saveas(f5,'Controlador/kp=200.png')

f25= figure(25);
pos_max_pulsos = find(pulsos == max(pulsos));
tiempo_pulsos_max = pos_max_pulsos(1);

M = pulsos(tiempo_pulsos_max) - pulsos(length(pulsos));

plot(tiempo, pulsos, 'r', [0 max(tiempo)],[pulsos(length(pulsos)) pulsos(length(pulsos))],'-.g', ...
    tiempo(tiempo_pulsos_max), pulsos(length(pulsos)), 'ko', ...
    tiempo(tiempo_pulsos_max), pulsos(tiempo_pulsos_max), 'ko', ...
    [tiempo(tiempo_pulsos_max) tiempo(tiempo_pulsos_max)],[pulsos(length(pulsos)) pulsos(tiempo_pulsos_max)], 'b')

text(tiempo(tiempo_pulsos_max),(pulsos(length(pulsos))+pulsos(tiempo_pulsos_max))/2,'\leftarrow M = '+string(M))

xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 200')
axis([tiempo(tiempo_pulsos_max)*(1-0.05) tiempo(tiempo_pulsos_max)*(1+0.05) max(pulsos)*(1-0.1) max(pulsos)*(1+0.1)])
saveas(f25,'Controlador/kp=200_zoom.png')

% kp = 500
f6 = figure (6);
tiempo = kp_500(:,1);
pulsos = kp_500(:,2);
pos_final = kp_500(:,3);
angulo = kp_500(:,4);
error = kp_500(:,5);
voltage = kp_500(:,6);


subplot(3,1,1)
plot(tiempo, pulsos, 'r', [0 max(tiempo)],[pulsos(length(pulsos)) pulsos(length(pulsos))],'-.g')
xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 500')
axis([0 2000 0 max(pulsos)*(1+0.1)])

subplot(3,1,2)
plot(tiempo, voltage, 'r')
xlabel('tiempo (ms)')
ylabel('voltage (V)')
axis([0 2000 0 12.5])

subplot(3,1,3)
plot(tiempo, pos_final, '-.b',tiempo, angulo, 'm')
xlabel('tiempo (ms)')
ylabel('angulo (rad)')
legend('R','angulo', 'Location','southeast')
axis([0 2000 0 1.7])
saveas(f6,'Controlador/kp=500.png')


f26= figure(26);
pos_max_pulsos = find(pulsos == max(pulsos));
tiempo_pulsos_max = pos_max_pulsos(1);

M = pulsos(tiempo_pulsos_max) - pulsos(length(pulsos));

plot(tiempo, pulsos, 'r', [0 max(tiempo)],[pulsos(length(pulsos)) pulsos(length(pulsos))],'-.g', ...
    tiempo(tiempo_pulsos_max), pulsos(length(pulsos)), 'ko', ...
    tiempo(tiempo_pulsos_max), pulsos(tiempo_pulsos_max), 'ko', ...
    [tiempo(tiempo_pulsos_max) tiempo(tiempo_pulsos_max)],[pulsos(length(pulsos)) pulsos(tiempo_pulsos_max)], 'b')

text(tiempo(tiempo_pulsos_max),(pulsos(length(pulsos))+pulsos(tiempo_pulsos_max))/2,'\leftarrow M = '+string(M))

xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 500')
axis([tiempo(tiempo_pulsos_max)*(1-0.05) tiempo(tiempo_pulsos_max)*(1+0.05) max(pulsos)*(1-0.1) max(pulsos)*(1+0.1)])
saveas(f26,'Controlador/kp=500_zoom.png')

% kp = 1000
f7 = figure (7);
tiempo = kp_1000(:,1);
pulsos = kp_1000(:,2);
pos_final = kp_1000(:,3);
angulo = kp_1000(:,4);
error = kp_1000(:,5);
voltage = kp_1000(:,6);

subplot(3,1,1)
plot(tiempo, pulsos, 'r', [0 max(tiempo)],[pulsos(length(pulsos)) pulsos(length(pulsos))],'-.g')
xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 1000')
axis([0 2000 0 max(pulsos)*(1+0.1)])

subplot(3,1,2)
plot(tiempo, voltage, 'r')
xlabel('tiempo (ms)')
ylabel('voltage (V)')
axis([0 2000 0 12.5])

subplot(3,1,3)
plot(tiempo, pos_final, '-.b',tiempo, angulo, 'm')
xlabel('tiempo (ms)')
ylabel('angulo (rad)')
legend('R','angulo', 'Location','southeast')
axis([0 2000 0 1.7])

saveas(f7,'Controlador/kp=1000.png')

f27= figure(27);
pos_max_pulsos = find(pulsos == max(pulsos));
tiempo_pulsos_max = pos_max_pulsos(1);

M = pulsos(tiempo_pulsos_max) - pulsos(length(pulsos));

plot(tiempo, pulsos, 'r', [0 max(tiempo)],[pulsos(length(pulsos)) pulsos(length(pulsos))],'-.g', ...
    tiempo(tiempo_pulsos_max), pulsos(length(pulsos)), 'ko', ...
    tiempo(tiempo_pulsos_max), pulsos(tiempo_pulsos_max), 'ko', ...
    [tiempo(tiempo_pulsos_max) tiempo(tiempo_pulsos_max)],[pulsos(length(pulsos)) pulsos(tiempo_pulsos_max)], 'b')

text(tiempo(tiempo_pulsos_max),(pulsos(length(pulsos))+pulsos(tiempo_pulsos_max))/2,'\leftarrow M = '+string(M))

xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 1000')
axis([tiempo(tiempo_pulsos_max)*(1-0.05) tiempo(tiempo_pulsos_max)*(1+0.05) max(pulsos)*(1-0.1) max(pulsos)*(1+0.1)])
saveas(f27,'Controlador/kp=1000_zoom.png')

% kp = 2000
f8 = figure (8);
tiempo = kp_2000(:,1);
pulsos = kp_2000(:,2);
pos_final = kp_2000(:,3);
angulo = kp_2000(:,4);
error = kp_2000(:,5);
voltage = kp_2000(:,6);

subplot(3,1,1)
plot(tiempo, pulsos, 'r', [0 max(tiempo)],[pulsos(length(pulsos)) pulsos(length(pulsos))],'-.g')
xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 2000')
axis([0 2000 0 max(pulsos)*(1+0.1)])

subplot(3,1,2)
plot(tiempo, voltage, 'r')
xlabel('tiempo (ms)')
ylabel('voltage')
axis([0 2000 0 12.5])

subplot(3,1,3)
plot(tiempo, pos_final, '-.b',tiempo, angulo, 'm')
xlabel('tiempo (ms)')
ylabel('angulo (rad)')
legend('R','angulo', 'Location','southeast')
axis([0 2000 0 1.7])

saveas(f8,'Controlador/kp=2000.png')

f28= figure(28);
pos_max_pulsos = find(pulsos == max(pulsos));
tiempo_pulsos_max = pos_max_pulsos(1);

M = pulsos(tiempo_pulsos_max) - pulsos(length(pulsos));

plot(tiempo, pulsos, 'r', [0 max(tiempo)],[pulsos(length(pulsos)) pulsos(length(pulsos))],'-.g', ...
    tiempo(tiempo_pulsos_max), pulsos(length(pulsos)), 'ko', ...
    tiempo(tiempo_pulsos_max), pulsos(tiempo_pulsos_max), 'ko', ...
    [tiempo(tiempo_pulsos_max) tiempo(tiempo_pulsos_max)],[pulsos(length(pulsos)) pulsos(tiempo_pulsos_max)], 'b')

text(tiempo(tiempo_pulsos_max),(pulsos(length(pulsos))+pulsos(tiempo_pulsos_max))/2,'\leftarrow M = '+string(M))

xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 2000')
axis([tiempo(tiempo_pulsos_max)*(1-0.05) tiempo(tiempo_pulsos_max)*(1+0.05) max(pulsos)*(1-0.1) max(pulsos)*(1+0.1)])
saveas(f28,'Controlador/kp=2000_zoom.png')

% kp = 3000
f9 = figure (9);
tiempo = kp_3000(:,1);
pulsos = kp_3000(:,2);
pos_final = kp_3000(:,3);
angulo = kp_3000(:,4);
error = kp_3000(:,5);
voltage = kp_1000(:,6);

subplot(3,1,1)
plot(tiempo, pulsos, 'r', [0 max(tiempo)],[pulsos(length(pulsos)) pulsos(length(pulsos))],'-.g')
xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 3000')
axis([0 2000 0 max(pulsos)*(1+0.1)])

subplot(3,1,2)
plot(tiempo, voltage, 'r')
xlabel('tiempo (ms)')
ylabel('voltage')
axis([0 2000 0 12.5])

subplot(3,1,3)
plot(tiempo, pos_final, '-.b',tiempo, angulo, 'm')
xlabel('tiempo (ms)')
ylabel('angulo (rad)')
legend('R','angulo', 'Location','southeast')
axis([0 2000 0 1.7])

saveas(f9,'Controlador/kp=3000.png')

f29= figure(29);
pos_max_pulsos = find(pulsos == max(pulsos));
tiempo_pulsos_max = pos_max_pulsos(1);

M = pulsos(tiempo_pulsos_max) - pulsos(length(pulsos));

plot(tiempo, pulsos, 'r', [0 max(tiempo)],[pulsos(length(pulsos)) pulsos(length(pulsos))],'-.g', ...
    tiempo(tiempo_pulsos_max), pulsos(length(pulsos)), 'ko', ...
    tiempo(tiempo_pulsos_max), pulsos(tiempo_pulsos_max), 'ko', ...
    [tiempo(tiempo_pulsos_max) tiempo(tiempo_pulsos_max)],[pulsos(length(pulsos)) pulsos(tiempo_pulsos_max)], 'b')

text(tiempo(tiempo_pulsos_max),(pulsos(length(pulsos))+pulsos(tiempo_pulsos_max))/2,'\leftarrow M = '+string(M))

xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 3000')
axis([tiempo(tiempo_pulsos_max)*(1-0.05) tiempo(tiempo_pulsos_max)*(1+0.05) max(pulsos)*(1-0.1) max(pulsos)*(1+0.1)])
saveas(f29,'Controlador/kp=3000_zoom.png')

% Representaciónd de todas las graficas tiempo-pulsos
f10 = figure(10);
plot( tiempo, kp_1(:,2), ...
    tiempo, kp_10(:,2), ...
    tiempo, kp_100(:,2), ...
    tiempo, kp_200(:,2), ...
    tiempo, kp_500(:,2), ...
    tiempo, kp_1000(:,2),...
    tiempo, kp_2000(:,2),...
    tiempo, kp_3000(:,2))

title('Respuesta del motor para diferentes Kp')

legend('kp = 1', ...
    'kp = 10', ...
    'kp = 100', ...
    'kp = 200', ...
    'kp = 500', ...
    'kp = 1000', ...
    'kp = 2000', ...
    'kp = 3000')

axis([0 5000 0 max(kp_3000(:,2))*(1+0.1)])

saveas(f10,'Controlador/respuesta_motor.png')


%% Ejecutando diferentes angulos para kp = 2000

% kp = 2000, Angulo = -PI/2
f12 = figure (12);
tiempo = kp_2000_90(:,1);
pulsos = kp_2000_90(:,2);
pos_final = kp_2000_90(:,3);
angulo = kp_2000_90(:,4);
error = kp_2000_90(:,5);
voltage = kp_2000_90(:,6);

subplot(3,1,1)
plot(tiempo, pulsos, 'r', [0 max(tiempo)],[pulsos(length(pulsos)) pulsos(length(pulsos))],'-.g')
xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 2000, ,ángulo = -\pi/2')
axis([0 2000 min(pulsos)*(1+0.1) 0])

subplot(3,1,2)
plot(tiempo, voltage, 'r')
xlabel('tiempo (ms)')
ylabel('voltage')
axis([0 2000 0 12.5])

subplot(3,1,3)
subplot(3,1,3)
plot(tiempo, pos_final, '-.b',tiempo, angulo, 'm')
xlabel('tiempo (ms)')
ylabel('angulo (rad)')
legend('R','angulo')
axis([0 2000 -1.7 0])

saveas(f12,'Controlador/kp=2000_-90.png')

% kp = 2000, Angulo = -3PI/2
f13 = figure (13);
tiempo = kp_2000_270(:,1);
pulsos = kp_2000_270(:,2);
pos_final = kp_2000_270(:,3);
angulo = kp_2000_270(:,4);
error = kp_2000_270(:,5);
voltage = kp_2000_270(:,6);

subplot(3,1,1)
plot(tiempo, pulsos, 'r', [0 max(tiempo)],[pulsos(length(pulsos)) pulsos(length(pulsos))],'-.g')
xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 2000, ,ángulo = -3\pi/2')
axis([0 5000 min(pulsos)*(1+0.1) 0])

subplot(3,1,2)
plot(tiempo, voltage, 'r')
xlabel('tiempo (ms)')
ylabel('voltage')
axis([0 5000 0 12.5])

subplot(3,1,3)
plot(tiempo, pos_final, '-.b',tiempo, angulo, 'm')
xlabel('tiempo (ms)')
ylabel('angulo (rad)')
legend('R','angulo')
axis([0 5000 -5 0])

saveas(f13,'Controlador/kp=2000_-270.png')

% kp = 2000, Angulo = 2PI
f14 = figure (14);
tiempo = kp_2000_360(:,1);
pulsos = kp_2000_360(:,2);
pos_final = kp_2000_360(:,3);
angulo = kp_2000_360(:,4);
error = kp_2000_360(:,5);
voltage = kp_2000_360(:,6);

subplot(3,1,1)
plot(tiempo, pulsos, 'r', [0 max(tiempo)],[pulsos(length(pulsos)) pulsos(length(pulsos))],'-.g')
xlabel('tiempo (ms)')
ylabel('pulsos')
title('kp = 2000, ,ángulo = 2\pi')
axis([0 7000 0 max(pulsos)*(1+0.1)])

subplot(3,1,2)
plot(tiempo, voltage, 'r')
xlabel('tiempo (ms)')
ylabel('voltage')
axis([0 7000 0 12.5])

subplot(3,1,3)
plot(tiempo, pos_final, '-.b',tiempo, angulo, 'm')
xlabel('tiempo (ms)')
ylabel('angulo (rad)')
legend('R','angulo', 'Location','southeast')
axis([0 7000 0 7])

saveas(f14,'Controlador/kp=2000_360.png')
close all;