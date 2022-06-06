%% Limpiamos las variables
clear, clc, close all

%% Declaracion de las variables 
syms s 
syms t


p = 64.986;
K = 2652.28;


f1 = figure(1);
tD = 0.01;
tI = 0.1;
array_Kp = [0.5, 1, 5, 10];
hold on;
for Kp = array_Kp
    % Funcion de transferencia
    P = s^2*(s+p)+ K * Kp * tD* (s^2 + s/tD + 1/(tD*tI));
    Hpid = (K * Kp * tD * (s^2 + s/tD + 1/(tD*tI))) / (P);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hpid* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.6], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p, \tau_D = 0.01, \tau_I = 0.1 de H_{PID}')
legend({'K_p = 0.5', 'K_p = 1', 'K_p = 5', 'K_p = 10'})
saveas(f1,'Capturas/ControladorPID/H_PID_Kp.png')



f2 = figure(2);
tD = 0.01;
tI = 0.1;
array_Kp = [0.5, 1, 5, 10];
hold on;
for Kp = array_Kp
    % Funcion de transferencia
    P = s^2*(s+p)+ K * Kp * tD* (s^2 + s/tD + 1/(tD*tI));
    Hepid = (s^2*(s+p)) / (P);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hepid* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.6], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p, \tau_D = 0.01, \tau_I = 0.1 de H_{e,PID}')
legend({'K_p = 0.5', 'K_p = 1', 'K_p = 5', 'K_p = 10'})
saveas(f2,'Capturas/ControladorPID/H_ePID_Kp.png')

f3 = figure(3);
tD = 0.01;
Kp = 1;
array_tI = [0.1, 1, 10];
hold on;
for tI = array_tI
    % Funcion de transferencia
    P = s^2*(s+p)+ K * Kp * tD* (s^2 + s/tD + 1/(tD*tI));
    Hpid = (K * Kp * tD * (s^2 + s/tD + 1/(tD*tI))) / (P);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hpid* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.6], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando \tau_I, K_P = 1, \tau_D = 0.01 de H_{PID}')
legend({'\tau_I= 0.1', '\tau_I = 1', '\tau_I = 10'})
saveas(f3,'Capturas/ControladorPID/H_PID_tI.png')

f4 = figure(4);
tD = 0.01;
Kp = 1;
array_tI = [0.1, 1, 10];
hold on;
for tI = array_tI
    % Funcion de transferencia
    P = s^2*(s+p)+ K * Kp * tD* (s^2 + s/tD + 1/(tD*tI));
    Hepid = (s^2*(s+p)) / (P);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hepid* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.6], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando \tau_I, K_P = 1, \tau_D = 0.01 de H_{e,PID}')
legend({'\tau_I= 0.1', '\tau_I = 1', '\tau_I = 10'})
saveas(f4,'Capturas/ControladorPID/H_ePID_tI.png')


f5 = figure(5);
tI = 1;
Kp = 1;
array_tD = [0.0001, 0.001, 0.01];
hold on;
for tD = array_tD
    % Funcion de transferencia
    P = s^2*(s+p)+ K * Kp * tD* (s^2 + s/tD + 1/(tD*tI));
    Hpid = (K * Kp * tD * (s^2 + s/tD + 1/(tD*tI))) / (P);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hpid* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.6], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando \tau_D, \tau_I = 1, K_P = 1 de H_{PID}')
legend({'\tau_D = 0.0001', '\tau_D= 0.001', '\tau_D = 0.01'})
saveas(f5,'Capturas/ControladorPID/H_PID_tD.png')


f6 = figure(6);
tI = 1;
Kp = 1;
array_tD = [0.0001, 0.001, 0.01];
hold on;
for tD = array_tD
    % Funcion de transferencia
    P = s^2*(s+p)+ K * Kp * tD* (s^2 + s/tD + 1/(tD*tI));
    Hepid = (s^2*(s+p)) / (P);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hepid* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.6], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando \tau_D, \tau_I = 1, K_P = 1 de H_{e,PID}')
legend({'\tau_D = 0.0001', '\tau_D= 0.001', '\tau_D = 0.01'})
saveas(f6,'Capturas/ControladorPID/H_ePID_tD.png')