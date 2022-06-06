%% Limpiamos las variables
clear, clc, close all

%% Declaracion de las variables 

t = 0:0.0001:3;

reductora = 23;
p = 64.986;
K = 2652.28/reductora;



f1 = figure(1);
% Si aseguramos que tI*(Kp*tD1+p) > 1 sistema estable
Kp = 5;
tI = 1;
tD1 = 0.01;

% Funcion de transferencia
num = [p+K*Kp*tD1 K*Kp*tD1/tD1 K*Kp*tD1/(tD1*tI)];
den = [1 p+K*Kp*tD1 K*Kp*tD1/tD1 K*Kp*tD1/(tD1*tI)];

hold on;
u = ones(1, length(t));
plot(t,u, '--','LineWidth',1)


[y, x] = lsim(num, den, u, t);
plot(t,y, 'LineWidth',1.5);

tr = find(y >= 1);
tr = t(tr(1));
plot(tr,1, 'ok', 'LineWidth', 1.5)
text(tr, 0.95, 't_r')

ts_array = find((y>=0.98 & y <= 0.981) | (y<=1.02 & y >=1.019));
ts = t(ts_array(length(ts_array)));

plot(ts,0.98, 'ok', 'LineWidth', 1.5)
text(ts, 0.93, 't_s')

tMp = find(y == max(y));
tMp = t(tMp(1));
plot(tMp,max(y), 'ok', 'LineWidth', 1.5)
text(tMp, max(y)*0.95, 'M_p')

plot(t,u+0.02, 'k--','LineWidth',1)
plot(t,u-0.02, 'k--','LineWidth',1)

legend({'Respuesta ideal', 'Respuesta al sistema'})
title('Respuesta escalón')
saveas(f1, 'Sintonizacion/grafica.png')

%% Sintonización de los parámetros
% Vamos a utilizar los arrays que hemos implementado en el fichero
% Controlador D|PID

array_Kp = [20:0.5:21];
array_tI = [0:0.1: 5];
array_tD1 = [0: 0.01 :0.5];

figure(2)
hold on;
disp(sprintf('Kp, tI, tD1'))
for Kp = array_Kp
    for tI = array_tI
        for tD1 = array_tD1
            % Nos aseguramos que cumplen el criterio de estabilidad
            if tI*(Kp*tD1+p) > 1
                num = [p+K*Kp*tD1 K*Kp*tD1/tD1 K*Kp*tD1/(tD1*tI)];
                den = [1 p+K*Kp*tD1 K*Kp*tD1/tD1 K*Kp*tD1/(tD1*tI)];
                u = ones(1, length(t));           
                [y, x] = lsim(num, den, u, t);
                try 
                    tMp = find(y == max(y));
                    Mp = y(tMp);
                    tMp = t(tMp(1));
                    ts_array = find((y>=0.98 & y <= 0.981) | (y<=1.02 & y >=1.019));
                    yts = y(ts_array(length(ts_array)));
                    ts = t(ts_array(length(ts_array)));
                    tr = find(y >= 1);
                    ytr = y(tr(1));
                    tr = t(tr(1));
                    if Mp < 1.14 && Mp > 1.05
                        if ts < 0.45
                            if tr < 0.25
                                plot(t,y, 'LineWidth',1.5)
                                disp(sprintf('%f, %f, %f',Kp, tI, tD1))
                            end
                        end
                    end
                catch
                end
            end

        end
    end
end
xlabel('t[s]')
ylabel('y(t)')