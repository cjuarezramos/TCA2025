% Ejercicio 1
G = tf(1,[1,5,9,5,0])
rlocus(G)
K = 1.91
T = feedback(G*K,1)
figure()
step(T)
disp('Polos de lazo cerrado')
roots(T.Denominator{1})

% Lugar de las raices de otro sistema
num = [1,2,4];
den = conv(conv(conv([1,0],[1,4]),[1,6]),[1,1.4,1])
G = tf(num,den)
rlocus(G)