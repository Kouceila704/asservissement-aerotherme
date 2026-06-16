% Asservissement d'un aerotherme - Synthese du correcteur (integrateur + PD)
% Systeme identifie : 1er ordre + retard pur

% --- Systeme (fonction de transfert identifiee) ---
G = tf(0.8 , [8.1 1]);      % gain statique 0.8 , constante de temps 8.1 s
G.IODelay = 1.7;            % retard pur de 1.7 s

% --- Cahier des charges ---
M_ph = 55;                 % marge de phase visee (degres)
tmax = 10;                 % temps du 1er maximum (s)
wc   = 3/tmax;             % pulsation de coupure visee (rad/s)

% --- Correcteur integrateur pur (annule l'erreur de position) ---
CorInt = tf(1 , [1 0]);

% --- Systeme avec integrateur (boucle ouverte) ---
sys = G * CorInt;

% --- Reglage du correcteur PD par la methode de la marge de phase ---
[mag,phase] = bode(sys,wc);
Td = tan(((M_ph-180 - phase)*pi)/180)/wc
Kp = 1/(mag*(sqrt(1+(Td*wc)^2)))

% --- Correcteur PD ---
CorPD = tf([Td 1] , 1)*Kp;

% --- Systeme corrige en boucle ouverte ---
sys1 = sys * CorPD;

% --- Traces ---
figure(1)
step(sys1)

figure(2)
nichols(G,sys, sys1)

figure(3)
bode(feedback(sys1 , 1))

figure(4)
step(feedback(sys1 , 1))
