%% Limpiamos las variables
clear, clc, close all

%% Declaracion de las variables 
syms s 
syms t


p = 64.986;
K = 2652.28;


f1 = figure(1);
tD1 = 0.01;
tI = 1;
array_Kp = [0.5, 1, 5];
hold on;
for Kp = array_Kp
    % Funcion de transferencia
    P = s^2*(s+p) + K*Kp * tD1 * (s^2+s/tD1 + 1/(tD1 * tI));
    Hdpi_d = ( p*s^2 + K*Kp * tD1 * (s^2+s/tD1 + 1/(tD1 * tI)) )/ (P);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hdpi_d* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.3], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p, \tau_{D1} = 0.01, \tau_I = 1 de H_{D|PID}')
legend({'K_p = 0.5', 'K_p = 1', 'K_p = 5'})
saveas(f1,'Capturas/ControladorDPID/H_DPID_Kp.png')

f2 = figure(2);
tD1 = 0.01;
tI = 1;
array_Kp = [0.5, 1, 5];
hold on;
for Kp = array_Kp
    % Funcion de transferencia
    P = s^2*(s+p) + K*Kp * tD1 * (s^2+s/tD1 + 1/(tD1 * tI));
    Hedpi_d = s^3/ (P);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hedpi_d* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.3], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p, \tau_{D1} = 0.01, \tau_I = 1 de H_{e,D|PID}')
legend({'K_p = 0.5', 'K_p = 1', 'K_p = 5'})
saveas(f2,'Capturas/ControladorDPID/H_eD-PID_Kp.png')


f3 = figure(3);
tD1 = 0.01;
Kp = 1;
array_tI = [0.1, 1, 10];
hold on;
for tI = array_tI
    % Funcion de transferencia
    P = s^2*(s+p) + K*Kp * tD1 * (s^2+s/tD1 + 1/(tD1 * tI));
    Hdpi_d = ( p*s^2 + K*Kp * tD1 * (s^2+s/tD1 + 1/(tD1 * tI)) )/ (P);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hdpi_d* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.3], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando \tau_I, K_P = 1, \tau_{D1} = 0.01 de H_{D|PID}')
legend({'\tau_I= 0.1', '\tau_I = 1', '\tau_I = 10'})
saveas(f3,'Capturas/ControladorDPID/H_DPID_tI.png')

f4 = figure(4);
tD1 = 0.01;
Kp = 1;
array_tI = [0.1, 1, 10];
hold on;
for tI = array_tI
    % Funcion de transferencia
    P = s^2*(s+p) + K*Kp * tD1 * (s^2+s/tD1 + 1/(tD1 * tI));
    Hedpi_d = s^3/ (P);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hedpi_d* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.3], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando \tau_I, K_P = 1 \tau_{D1} = 0.01 de H_{e,D|PID}')
legend({'\tau_I= 0.1', '\tau_I = 1', '\tau_I = 10'})
saveas(f4,'Capturas/ControladorDPID/H_eD-PID_tI.png')


f5 = figure(5);
tI = 1;
Kp = 1;
array_tD = [0.0001, 0.001, 0.01, 0.1];
hold on;
for tD1 = array_tD
    % Funcion de transferencia
    P = s^2*(s+p) + K*Kp * tD1 * (s^2+s/tD1 + 1/(tD1 * tI));
    Hdpi_d = ( p*s^2 + K*Kp * tD1 * (s^2+s/tD1 + 1/(tD1 * tI)) )/ (P);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hdpi_d* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.3], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando \tau_{D1}, K_P = 1, \tau_I = 1 de H_{D|PID}')
legend({'\tau_{D1} = 0.0001', '\tau_{D1} = 0.001', '\tau_{D1} = 0.01', '\tau_{D1} = 0.1'})
saveas(f5,'Capturas/ControladorDPID/H_DPID_tD1.png')

f6 = figure(6);
tI = 1;
Kp = 1;
array_tD = [0.0001, 0.001, 0.01, 0.1];
hold on;
for tD1 = array_tD
    % Funcion de transferencia
    P = s^2*(s+p) + K*Kp * tD1 * (s^2+s/tD1 + 1/(tD1 * tI));
    Hedpi_d = s^3/ (P);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hedpi_d* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.3], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando \tau_{D1}, K_P = 1, \tau_I = 1 de H_{e,D|PID}')
legend({'\tau_{D1} = 0.0001', '\tau_{D1} = 0.001', '\tau_{D1} = 0.01', '\tau_{D1} = 0.1'})
saveas(f6,'Capturas/ControladorDPID/H_eD-PID_tD1.png')