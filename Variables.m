clear, clc, close all;

reductora = 23;
p = 64.986;
K = 2652.28/reductora;

Kp = 20;
tI = 1;
tD1 = 0.02;
T = 0.005;

tD2 = p/(K*Kp);
tD = tD1 + tD2;
Ki = Kp * T / tI
KD1 = Kp * tD1 / T
KD2 = Kp * tD2 / T
