%% Limpiamos las variables
clear, clc, close all

%% Declaracion de las variables 
syms s 
syms t

array_zeta = [0.3, 0.707, 1.0, 2.0];
p = 64.986;
K = 2652.28;

f1 = figure(1);
array_Kp = [0.5, 1, 5, 10];
hold on
for Kp = array_Kp
    % Funcion de trasnferencia
    Hp = Kp*K/(s^2+p*s+Kp*K);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hp * X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.3], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_P en H_P')
legend({'Kp = 0.5', 'Kp = 1', 'Kp = 5', 'Kp = 10'})
saveas(f1,'Capturas/ControladorP/Hp_Kp.png')


f2 = figure(2);
array_Kp = [0.5, 1, 5, 10];
hold on
for Kp = array_Kp
    % Funcion de trasnferencia
    Hep = s*(s+p)/(s^2+p*s+Kp*K);
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hep * X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.3], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p de H_{e,P}')
legend({'Kp = 0.5', 'Kp = 1', 'Kp = 5', 'Kp = 10'})
saveas(f2,'Capturas/ControladorP/HeP_Kp.png')