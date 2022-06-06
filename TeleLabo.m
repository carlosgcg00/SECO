%% Limpiamos las variables
clear, clc, close all

%% Declaracion de las variables 

t = 0:0.0001:5;
% Variables del motor
reductora = 23;
p = 64.986;
K = 2652.28/reductora;


Kp = 10.5;
tI = 1;
tD1 = 0.01;

% Funcion de transferencia
f1 = figure(1);
hold on;
num = [p+K*Kp*tD1 K*Kp*tD1/tD1 K*Kp*tD1/(tD1*tI)];
den = [1 p+K*Kp*tD1 K*Kp*tD1/tD1 K*Kp*tD1/(tD1*tI)];
u = ones(1, length(t));
[y, x] = lsim(num, den, u, t);
plot(t,y, '--','LineWidth',1.5);

tl = csvread('TeleLabo/10.5-1-MOTOR3POS.dat');
plot(tl(:,1),tl(:,2), 'LineWidth',1.5);
plot(t,u+0.02, 'k--','LineWidth',1)
plot(t,u-0.02, 'k--','LineWidth',1)
plot([0.45 0.45], [0 1.2], 'k-.', 'LineWidth', 1)
plot([0.25 0.25], [0 1.2], 'k:', 'LineWidth', 1)

xlabel('t[s]')
ylabel('y(t)')
legend({'ideal','real',  'M_p \geq 1.05', 't_s \leq 0.45', 't_p \leq 0.25'}, 'Location','southeast')
title('K_p = 10.5, \tau_I = 1, \tau_{D1} = 0.01')
axis([0 2 0 1.5])
saveas(f1,'TeleLabo/Kp =10.5-tI=1.png')

Kp = 4.5;
tI = 1.2;
tD1 = 0.04;

% Funcion de transferencia
f2 = figure(2);
hold on;
num = [p+K*Kp*tD1 K*Kp*tD1/tD1 K*Kp*tD1/(tD1*tI)];
den = [1 p+K*Kp*tD1 K*Kp*tD1/tD1 K*Kp*tD1/(tD1*tI)];
u = ones(1, length(t));
[y, x] = lsim(num, den, u, t);
plot(t,y, '--','LineWidth',1.5);

tl = csvread('TeleLabo/4.5-1.2-MOTOR3POS.dat');
plot(tl(:,1),tl(:,2), 'LineWidth',1.5);

xlabel('t[s]')
ylabel('y(t)')
legend({'ideal','real'}, 'Location','southeast')
title('K_p = 4.5, \tau_I = 1.2, \tau_{D1} = 0.04')
axis([0 5 0 1.8])
saveas(f2,'TeleLabo/Kp =4.5-tI=1.2.png')