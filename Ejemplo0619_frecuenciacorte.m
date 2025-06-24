% Ejemplo 
T1 = tf(1,[1,1])
T2 = tf(1,[3,1])
t = 0:0.1:12;
y1 = step(T1,t);
y2 = step(T2,t);
plot(t,y1,t,y2)
legend('T1','T2')
xlabel('tiempo (s)')
ylabel('magnitud')

% frecuencia
figure(2)
bode(T1)
hold on
bode(T2)
legend('T1','T2')
