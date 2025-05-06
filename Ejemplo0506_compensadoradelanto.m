% Ejemplo de compensador serie
% G = (2s+1)/s(s+1)(s+2)
% Mp = 30% y ts = 3s
numG = [2,1];
denG = conv([1,0],conv([1,1],[1,2]));
G = tf(numG,denG)
% Verificar si solo basta con ganancia
rlocus(G)

% Polos dominantes
ts = 3
Mp = 0.3
sig = 4/ts
wd = -sig/log(Mp)*pi
pd = -sig+wd*1i

% No basta solo con ganancia
% Agregamos compensador en Adelanto
% Deficiencia de ángulo
syms s
g = (2*s+1)/(s*(s+1)*(s+2))
% evaluación g(pd)
g_pd = subs(g,s,pd)
angulo_g_pd = angle(g_pd)
angulo_g_pd = double(angulo_g_pd) % radianes
angulo_g_pd = angulo_g_pd*180/pi % grados

% Deficiencia de ángulo
phi = 180 - angulo_g_pd

% Calculo de cero y polo del compensador
sz = 0.1;
angulo_s_sp = double(angle(pd+sz))*180/pi - phi
sp = sig+wd/tand(angulo_s_sp)
gc = (s+sz)/(s+sp)
angulo_gc_pd = double(angle(subs(gc,s,pd)))*180/pi
Gc = tf([1,sz],[1,sp])

% Calculo de cero y polo del compensador
% sp = 0.5;
% angulo_s_sz = double(angle(pd+sp))*180/pi + phi
% sz = sig+wd/tand(angulo_s_sz)
% gc = (s+sz)/(s+sp)
% angulo_gc_pd = double(angle(subs(gc,s,pd)))*180/pi
% sz = 3.6325
% sp = 3.7312
% angulo_gc_pd = double(angle(subs(gc,s,pd)))*180/pi
% Gc = tf([1,sz],[1,sp])

FTLA = Gc*G
figure()
rlocus(FTLA)

K = 8
FTLC = feedback(FTLA*K,1)
figure()
step(FTLC)
stepinfo(FTLC)

% Nueva iteración
sig = 1.5 
wd = 3.5
pd = -sig + wd*1i

% No basta solo con ganancia
% Agregamos compensador en Adelanto
% Deficiencia de ángulo
syms s
g = (2*s+1)/(s*(s+1)*(s+2))
% evaluación g(pd)
g_pd = subs(g,s,pd)
angulo_g_pd = angle(g_pd)
angulo_g_pd = double(angulo_g_pd) % radianes
angulo_g_pd = angulo_g_pd*180/pi % grados

% Deficiencia de ángulo
phi = 180 - angulo_g_pd

% Calculo de cero y polo del compensador
sz = 3;
angulo_s_sp = double(angle(pd+sz))*180/pi - phi
sp = sig+wd/tand(angulo_s_sp)
gc = (s+sz)/(s+sp)
angulo_gc_pd = double(angle(subs(gc,s,pd)))*180/pi
Gc = tf([1,sz],[1,sp])

FTLA = G * Gc
figure()
rlocus(FTLA)

K = 11
FTLC = feedback(FTLA*K,1)
figure()
step(FTLC)
stepinfo(FTLC)