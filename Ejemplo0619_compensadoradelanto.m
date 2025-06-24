% compensador en adelanto
G = tf(4,[1,2,0])
margin(G)
K = 10
G1 = K*G
margin(G1)

% Angulo de adelanto
phi = 38;

% alfa
alfa = (1-sind(phi))/(1+sind(phi))

figure;
bode(G1,8.5:0.1:9.5)

wc = 9
T = 1/(sqrt(alfa)*wc)
sz = 1/T
sp = 1/(T*alfa)
Gc = K*tf([1,sz],[1,sp])

FTLA = G*Gc
FTLC = feedback(FTLA,1)