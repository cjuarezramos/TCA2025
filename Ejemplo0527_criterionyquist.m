% Criterio de estabilidad de Nyquist
% Ejemplo 7-14
K = 100;
T1 = 1;
T2 = 10;
GH = tf(K,conv([T1,1],[T2,1]))
figure
nyquist(GH)

% Ejemplo 7-15
K = 10;
T1 = 1;
T2 = 2;
GH = tf(K,conv([1,0],conv([T1,1],[T2,1])))
figure
nyquist(GH)

% Ejemplo 7-16
K = 1;
T1 = 2;
T2 = 1;
GH = tf(K*[T2,1],conv([1,0,0],[T1,1]))
figure
nyquist(GH)