primerorden = 0;
if primerorden
    alfa = 0.4;
    T = 1
    G = tf(alfa*[T,1],[alfa*T,1])
    w = 20;
    t=0.:0.001:10;
    x = 1*sin(w*t);
    y = lsim(G,x,t);
    plot(t,x,t,y)
    bode(G)
end

segundoorden = 0;
if segundoorden
    Z = [0,0.1,0.3,0.5,0.7,1,1.2];
    wn = 1;
    
    for i = 1:length(Z)
        z = Z(i);
        G = tf(wn^2,[1,2*z*wn,wn^2]);
        figure(1)
        hold on
        bode(G)
        grid on
        hold off
        %pause()
    end
end
sistminnomin = 0;
if sistminnomin 
% Sistemas de fase mìnima y no minima
T = 1;
T1 = 0.5;
G1 = tf([T1,1],[T,1])
figure(1)
bode(G1)
grid on
G2 = tf([-T1,1],[T,1])
figure(1)
hold on
bode(G2)

% Turbina hidraulica
Tw = 2
Gw=tf([-Tw 1],[0.5*Tw 1])
Tm = 10
Kd = 0
Gg=tf(1,[Tm,Kd])
R = 1

FTTD = 1/R*Gw*Gg
FTLC = feedback(FTTD,1)
step(FTLC)
end

% retraso de tiempo
retrasotiempo = 0;

if retrasotiempo
    Td = 0.5
    G = tf(1,[1,1])
    Gtd = tf(1,[1,1],'OutputDelay',Td)
    Gpd1 = tf([-Td/2,1],[Td/2,1])
    step(G)
    hold on
    step(Gtd)
    hold on
    step(Gpd1*G)
    Gpd2 = tf([Td/12,-T/2,1],[Td/12,T/2,1])
    hold on
    step(Gpd2*G)
end
ejemplobode = 0;
if ejemplobode% Ejemplos de Bode
G0 = tf([25],[1,4,25])
figure
bode(G0)
G1 = tf(9*[1,.2,1],[1,1.2,9,0])
figure
bode(G1)

G2 = tf([25],[4,25,0,0])
figure
bode(G2)
end

ejemplonyquist = 0;
if ejemplonyquist
    G = tf(1,[1,0])
    figure
    nyquist(G)
    T = 1
    K = 10
    G = tf(K,[T,1])
    figure(1)
    hold on
    nyquist(G)

    % sistemas de segundo orden
    wn = 2*pi
    z = 2
    G = tf(wn^2,[1,2*z*wn,wn^2])
    figure(1)
    hold on
    nyquist(G)

    
end

% F(s)
Fs = 1;
if Fs
    F = tf([1,1],[1,-1])
    pzmap(F)
    figure(3)
    hold on
    syms s
    f = (s+1)/(s-1)
    %w = -1:0.1:1;
    %sig = ones(length(w))*-2;
    sig = -2:0.1:0
    w = 1*ones(length(sig))
    realy = zeros(length(w));
    imagy = zeros(length(w));
    for i=1:length(w)
        y=subs(f,s,sig(i)+1i*w(i));
        realy(i) = double(real(y));
        imagy(i) = double(imag(y));
    end
    plot(realy,imagy)
    figure(3)
    
end