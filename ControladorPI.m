 %% Limpiamos las variables
clear, clc, close all

%% Declaracion de las variables 
syms s1
syms s 
syms t

p = 64.986;
K = 2652.28;



f1 = figure(1);
tI = 0.01;
array_Kp = [0.5, 1, 5];
hold on;
for Kp = array_Kp
    % Funcion de trasnferencia
    Hpi = Kp*K*(s+1/tI)/(s^2*(s+p)+ Kp*K*(s+1/tI));
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hpi* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.5], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p, \tau_I = 0.01 de H_{PI}')
legend({'K_p = 0.5', 'K_p = 1', 'K_p = 5'})
saveas(f1,'Capturas/ControladorPI/H_PI_kP_tI=0.01.png')

f2 = figure(2);
tI = 0.01;
array_Kp = [0.5, 1, 5];
hold on;
for Kp = array_Kp
    % Funcion de trasnferencia
    Hepi = s^2*(s+p)/(s^2*(s+p)+ Kp*K*(s+1/tI));
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hepi* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.5], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p, \tau_I = 0.01 de H_{e,PI}')
legend({'K_p = 0.5', 'K_p = 1', 'K_p = 5'})

saveas(f2,'Capturas/ControladorPI/H_ePI_kP_tI=0.01.png')

f3 = figure(3);
tI = 0.1;
array_Kp = [0.5, 1, 5];
hold on;
for Kp = array_Kp
    % Funcion de trasnferencia
    Hpi = Kp*K*(s+1/tI)/(s^2*(s+p)+ Kp*K*(s+1/tI));
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hpi* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.5], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p, \tau_I = 0.1 de H_{PI}')
legend({'K_p = 0.5', 'K_p = 1', 'K_p = 5'})
saveas(f3,'Capturas/ControladorPI/H_PI_kP_tI=0.1.png')

f4 = figure(4);
tI = 0.1;
array_Kp = [0.5, 1, 5];
hold on;
for Kp = array_Kp
    % Funcion de trasnferencia
    Hepi = s^2*(s+p)/(s^2*(s+p)+ Kp*K*(s+1/tI));
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hepi* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.5], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p, \tau_I = 0.1 de H_{e,PI}')
legend({'K_p = 0.5', 'K_p = 1', 'K_p = 5'})
saveas(f4,'Capturas/ControladorPI/H_PI_kP_tI=0.1.png')


f5 = figure(5);
tI = 1;
array_Kp = [0.5, 1, 5];
hold on;
for Kp = array_Kp
    % Funcion de trasnferencia
    Hpi = Kp*K*(s+1/tI)/(s^2*(s+p)+ Kp*K*(s+1/tI));
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hpi* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.5], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p, \tau_I = 1 de H_{PI}')
legend({'K_p = 0.5', 'K_p = 1', 'K_p = 5'})
saveas(f5,'Capturas/ControladorPI/H_PI_kP_tI=1.png')


f6 = figure(6);
tI = 1;
array_Kp = [0.5, 1, 5];
hold on;
for Kp = array_Kp
    % Funcion de trasnferencia
    Hepi = s^2*(s+p)/(s^2*(s+p)+ Kp*K*(s+1/tI));
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hepi* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.5], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p, \tau_I = 1 de H_{e,PI}')
legend({'K_p = 0.5', 'K_p = 1', 'K_p = 5'})

saveas(f6,'Capturas/ControladorPI/HePI_kP_tI=1.png')


f7 = figure(7);
tI = 10;
array_Kp = [0.5, 1, 5];
hold on;
for Kp = array_Kp
    % Funcion de trasnferencia
    Hpi = Kp*K*(s+1/tI)/(s^2*(s+p)+ Kp*K*(s+1/tI));
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hpi* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.5], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p, \tau_I = 10 de H_{PI}')
legend({'K_p = 0.5', 'K_p = 1', 'K_p = 5'})
saveas(f7,'Capturas/ControladorPI/H_PI_kP_tI=10.png')


f8 = figure(8);
tI = 10;
array_Kp = [0.5, 1, 5];
hold on;
for Kp = array_Kp
    % Funcion de trasnferencia
    Hepi = s^2*(s+p)/(s^2*(s+p)+ Kp*K*(s+1/tI));
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hepi* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.5], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando K_p, \tau_I = 10 de H_{e,PI}')

saveas(f8,'Capturas/ControladorPI_HePI_kP_tI=10.png')

f9 = figure(9);
Kp = 1;
array_tI = [0.1, 1];
hold on;
for tI = array_tI
    % Funcion de trasnferencia

    Hpi = Kp*K*(s+1/tI)/(s^2*(s+p)+ Kp*K*(s+1/tI));
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hpi* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.5], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando \tau_I, K_p = 1 de H_{PI}')
legend({'\tau_I= 0.1', '\tau_I = 1'})
saveas(f9,'Capturas/ControladorPI/H_PI_tI.png')


f10 = figure(10);
Kp = 1;
array_tI = [0.1, 1];
hold on;
for tI = array_tI
    % Funcion de trasnferencia

    Hepi = s^2*(s+p)/(s^2*(s+p)+ Kp*K*(s+1/tI));
    % Funcion de entrada
    X = 1/s;
    
    % Funcion de salida
    Y = Hepi* X;
    
    
    y = ilaplace(Y, s, t);
    fplot(t,y, [0 0.5], 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
title('Variando \tau_I, K_p = 1 de H_{e,PI}')
legend({'\tau_I = 0.01', '\tau_I = 1'})

saveas(f10, 'Capturas/ControladorPI/HePI_tI.png')

