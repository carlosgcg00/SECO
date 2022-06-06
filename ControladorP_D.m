%% Limpiamos las variables
clear, clc, close all

%% Declaracion de las variables 
syms s 
syms t

p = 64.986;
K = 2652.28;

f1 = figure(1);
tD = 0.001;
array_Kp = [0.5, 1, 5, 10];
hold on;
for Kp = array_Kp
    % Funcion de trasnferencia
    Hp_d = Kp*K/(s^2+(p+Kp*K*tD)*s+Kp*K);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hp_d* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.4], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p, \tau_D = 0.001 en H_{P-D}')
legend({'K_p = 0.5', 'K_p = 1', 'K_p = 5', 'K_p = 10'})
saveas(f1,'Capturas/ControladorP-D/Hp-D_kP.png')

f2 = figure(2);
tD = 0.001;
array_Kp = [0.5, 1, 5, 10];
hold on;
for Kp = array_Kp
    % Funcion de trasnferencia
    Hep_d = s*(s+p+Kp*K*tD)/(s^2+(p+Kp*K*tD)*s+Kp*K);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hep_d* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.4], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p, \tau_D = 0.001 de H_{e,P-D}')
legend({'K_p = 0.5', 'K_p = 1', 'K_p = 5', 'K_p = 10'})
saveas(f2,'Capturas/ControladorP-D/HeP-D_kP.png')


f3 = figure(3);
Kp = 1;
array_tD = [0.0001, 0.001, 0.01, 0.1];
hold on;
for tD = array_tD
    % Funcion de trasnferencia
    Hp_d = Kp*K/(s^2+(p+Kp*K*tD)*s+Kp*K);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hp_d* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.4], 'LineWidth',1.5)
end

xlabel('t[s]')
ylabel('y(t)')
title('Variando \tau_D, K_p = 1 en H_{P-D}')
legend({'\tau_D = 0.0001', '\tau_D = 0.001', '\tau_D = 0.01', '\tau_D = 0.1'})
saveas(f3,'Capturas/ControladorP-D/HP-D_tD.png')


f4 = figure(4);
Kp = 1;
array_tD = [0.0001, 0.001, 0.01, 0.1];
hold on;
for tD = array_tD
    % Funcion de trasnferencia
    Hp_d = s*(s+p+Kp*K*tD)/(s^2+(p+Kp*K*tD)*s+Kp*K);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hp_d* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.4], 'LineWidth',1.5)
end

xlabel('t[s]')
ylabel('y(t)')
title('Variando \tau_D, K_p = 1 de H_{e,P-D}')
legend({'\tau_D = 0.0001', '\tau_D = 0.001', '\tau_D = 0.01', '\tau_D = 0.1'})
saveas(f4,'Capturas/ControladorP-D/HeP-D_tD.png')

