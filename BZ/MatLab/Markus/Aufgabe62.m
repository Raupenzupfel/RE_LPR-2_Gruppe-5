% Plotten für Aufgabe 6.2

close all;
clear;
clc;

%% Festlegungen

x = [5.21, 6.27, 10.71, 16.27, 21.95, 27.23, 33.17, 38.73, 44.10, 50.80, 54.30]; % I-Stack
y1 = [211.79, 247.98, 399.27, 575.96, 746.96, 889.06, 1030.59, 1153.77, 1274.49, 1400.56, 1506.83]; % P-Stack
y2 = [0.00, 37.55, 176.00, 332.00, 475.50, 608.00, 722.50, 825.00, 927.50, 1016.00, 1096.50]; % P-Verbraucher
y3 = [40.65, 39.55, 37.28, 35.40, 34.03, 32.65, 31.07, 29.79, 28.90, 27.57, 27.75]; % Spannung
y4 = [0.65, 1.00, 2.35, 4.10, 5.80, 7.45, 9.20, 11.40, 12.75, 15.30, 15.90]; % H_2 Verbrauch

%% Plotting der Linien

figure(1),
plot(x, y1, 'b-', x, y2, 'r-','Linewidth',1.5); % Blaue Linie für y1, Rote Linie für y2
xlabel('I_{Stack} in A'); % Beschriftung der x-Achse
ylabel('Leistung P in W'); % Beschriftung der linken y-Achse
title('Leistungen bezogen auf den Stackstrom'); % Titel des Diagramms
grid on; % Gitterlinien anzeigen
legend('P_{Stack}', 'P_{Verbraucher}', 'Location', 'best');
fontsize(20,"points");
xlim([0 55]);

figure(2),
plot(x, y3,'Linewidth',1.5);
xlabel('I_{Stack} in A');
ylabel('Spannung U in V');
title('Spannung und Wasserstoffverbrauch über den Stackstrom')
grid on;
xlim([0 55]);

yyaxis right;
plot(x,y4,'Linewidth',1.5);
ylabel('H_2 Verbrauch in l/min')
legend('U_{Stack}', 'H_2 Verbrauch', 'Location', 'east');
fontsize(20,"points");

