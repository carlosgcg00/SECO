%% Limpiamos las variables
clear, clc, close all

%% Declaracion de las variables 

t = 0:0.001:1.5;

reductora = 23;
p = 64.986;
K = 2652.28/reductora;


% Si aseguramos que tI*(K*Kp*tD1+p) > 1 sistema estable
Kp = 3.4;
tI = 0.01;
tD1 = 0.01;

% Funcion de transferencia
num = [p+K*Kp*tD1 K*Kp*tD1/tD1 K*Kp*tD1/(tD1*tI)];
den = [1 p+K*Kp*tD1 K*Kp*tD1/tD1 K*Kp*tD1/(tD1*tI)];

nume = [1 0 0 0];

%% Análisis de la estabilidad
f1 = figure(1);
rlocus(num, den)
saveas(f1,'Estabilidad/NoEstableCerosyPolos.png')

%% Representación de las funciones
f2 = figure(2);
hold on;
u = ones(1, length(t));
plot(t,u, '--','LineWidth',1.5)
[y, x] = lsim(num, den, u, t);
plot(t,y, 'LineWidth',1.5);
[ye, x] = lsim(nume, den, u, t);
plot(t,ye, 'LineWidth',1.5);
xlabel('t[s]')
ylabel('y(t)')
legend({'Respuesta ideal', 'Respuesta al sistema', 'Error al sistema'})
title('Respuesta escalón')
saveas(f2,'Estabilidad/NoEstableEscalon.png')

f3 = figure(3);
hold on;
u = t;
plot(t,u, '--','LineWidth',1.5)
[y, x] = lsim(num, den, u, t);
plot(t,y, 'LineWidth',1.5);
[ye, x] = lsim(nume, den, u, t);
plot(t,ye, 'LineWidth',1.5);
xlabel('t[s]')
ylabel('y(t)')
legend({'Respuesta ideal', 'Respuesta al sistema', 'Error al sistema'})
title('Respuesta rampa')
saveas(f3,'Estabilidad/NoEstableRampa.png')


f4 = figure(4);
hold on;
u = t.^2;
plot(t,u, '--','LineWidth',1.5);
[y, x] = lsim(num, den, u, t);
plot(t,y, 'LineWidth',1.5);
[ye, x] = lsim(nume, den, u, t);
plot(t,ye, 'LineWidth',1.5);

xlabel('t[s]')
ylabel('y(t)')
xlabel('t[s]')
ylabel('y(t)')
legend({'Respuesta ideal', 'Respuesta al sistema', 'Error al sistema'})
title('Respuesta parábola')
saveas(f4,'Estabilidad/NoEstableParabola.png')

