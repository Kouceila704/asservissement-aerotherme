% Marges de gain et de phase
% Affichage graphique

figure(1);
plot(y(:,1), y(:,2), y(:,1), y(:,3));
grid on;
xlabel ('Temps en seconde'), ylabel ('Grandeur en Volts')
title('Sortie du système et consigne');

figure(2);
plot(u(:,1), u(:,2));
grid on;
xlabel ('Temps en seconde'), ylabel ('Grandeur en Volts')
title('Commande du système');

figure(3);
plot(ScopeData1(:,1), ScopeData1(:,1));
grid on;
xlabel ('Temps en seconde'), ylabel ('Grandeur en Volts')
title('Commande du système');

figure(4);
plot(ScopeData2(:,1), ScopeData2(:,2));
grid on;
xlabel ('Temps en seconde'), ylabel ('Grandeur en Volts')
title('Commande du système');



