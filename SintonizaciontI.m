%% Limpiamos las variables
clear, clc, close all

%% Declaracion de las variables 

t = 0:0.0001:5;

reductora = 23;
p = 64.986;
K = 2652.28/reductora;


%%
Kp = 3;
array_tI = [0:0.01: 5];
tD1 = 0.001;

figure(1)
hold on
disp(sprintf('tI'))
for tI = array_tI
            % Nos aseguramos que cumplen el criterio de estabilidad
            if tI*(K*Kp*tD1+p) > 1
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
                    %if Mp < 1.14 && Mp > 1.05
                        if ts < 0.45
                            %if tr < 0.25                        
                                plot(t,y, 'LineWidth',1.5)
                                disp(sprintf('%f, %f',tI,Mp))
                            %end
                        %end
                    end
                catch
                end
            end
end




f2 = figure(2);
hold on;
array_tI = [0.1, 1];
for tI = array_tI
    num = [p+K*Kp*tD1 K*Kp*tD1/tD1 K*Kp*tD1/(tD1*tI)];
    den = [1 p+K*Kp*tD1 K*Kp*tD1/tD1 K*Kp*tD1/(tD1*tI)];
    u = ones(1, length(t));           
    [y, x] = lsim(num, den, u, t);
    plot(t,y, 'LineWidth',1.5)
end
xlabel('t[s]')
ylabel('y(t)')
plot(t,u+0.02, 'k--','LineWidth',1)
plot(t,u-0.02, 'k--','LineWidth',1)
plot([0.45 0.45], [0 1.2], 'k-.', 'LineWidth', 1)
plot([0.25 0.25], [0 1.2], 'k:', 'LineWidth', 1)

legend({'\tau_I = 0.1', '\tau_I = 1','M_p \leq 1.14', 'M_p \geq 1.05', 't_s \leq 0.45', 't_p \leq 0.25'},'Location','southeast')

title('Buscamos \tau_{I}, K_P = 3, \tau_{D1} = 0.001')
saveas(f2,'Sintonizacion/Valores_tI.png')