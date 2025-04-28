% Ejemplo con retroalimentacion de velocidad
% usar modelo de simulink E0422.slx
K = .4
Kh = 0.c
%sal  = sim("E0422_servo.slx");

FTLC = tf(20*K,[1,5,(4+20*K*Kh),20*K])
figure(1)
step(FTLC)

G1 = tf([20*Kh,20],[1,5,4,0])
figure(2)
rlocus(G1)
K = 0.156
FTLC = tf(20*K,[1,5,(4+20*K*Kh),20*K])
figure(1)
step(FTLC)

