% Plotten von den Leistungen, Spannungen, Strömen und Verbrauch füre aufgabe 6.3

close all;
clear;
clc;

%% Festlegungen

x = [0.00, 1.00, 5.00, 10.00, 15.00, 20.00, 25.00, 30.00, 35.00, 40.00, 43.00]; % Strom

y1 = [40.65, 39.55, 37.28, 35.40, 34.03, 32.65, 31.07, 29.79, 28.90, 27.57, 27.75]; % Stackspannung 2
y2 = [211.79, 247.98, 399.27, 575.96, 746.96, 889.06, 1030.59, 1153.77, 1274.49, 1400.56, 1506.83]; % Stackleistung 1
y3 = [0.00, 37.55, 176.00, 332.00, 475.50, 608.00, 722.50, 825.00, 927.50, 1016.00, 1096.50]; % Verbraucherleistung 1
y4 = [27.64, 27.65, 27.65, 27.65, 27.65, 27.65, 27.65, 27.18, 26.64, 25.99, 25.91]; % Batteriespannung 2
y5 = [0.97, 0.93, 0.91, 0.89, 0.88, 0.85, 0.84, 0.73, 0.41, 0.00, -0.10]; % Batteriestrom 3 
y6 = [39.00, 37.55, 35.20, 33.20, 31.70, 30.40, 28.90, 27.50, 26.50, 25.40, 25.50]; % Verbraucherspannung 2
y7 = [0.65, 1.00, 2.35, 4.10, 5.80, 7.45, 9.20, 11.40, 12.75, 15.30, 15.90]; % Wasserstoffverbrauch 3

%% Plot erstellen

figure(1),
plot(x,y2,x,y3,'Linewidth',2);
xlabel('Verbraucherstrom I in A');
ylabel('Leistung P in W');
title('Leistungen in Bezug auf den Verbraucherstrom');
legend('P_{Stack}','P_{Verbrauch}', 'Location', 'best');
grid on;
fontsize(20,"points");
xlim([0 45]);

figure(2),
plot(x,y1,x,y4,x,y6,'Linewidth',2);
xlabel('Verbraucherstrom I in A');
ylabel('Spannung U in V');
title('Spannungen in Bezug auf den Verbraucherstrom');
legend('U_{Stack}','U_{Batterie}','U_{Verbraucher}', 'Location', 'best');
grid on;
fontsize(20,"points");
xlim([0 45]);

figure(3),
plot(x,y5,'Linewidth',1.5);
xlabel('Verbraucherstrom I in A');
ylabel('Batteriestrom I_{Bat} in A');
title('Batteriestrom und Wasserstoffverbrauch in Bezug auf den Verbraucherstrom');
grid on;
xlim([0 45]);

yyaxis right;
plot(x,y7,'Linewidth',1.5);
ylabel("Wassertstoffverbrauch in l/min");
legend('I_{Bat}','H_2 Verbrauch', 'Location', 'best');
fontsize(20,"points");



% yyaxis left
% plot(  x, y2, 'r-', x, y3, 'g-'); % Linien für y1, y2 und y3 auf linker Achse
% ylabel('Leistung in W'); % Beschriftung der linken y-Achse
% grid on; % Gitterlinien anzeigen

% yyaxis right
% plot(x, y1,'b-', x, y4, 'm-', x, y5, 'c-', x, y6, 'y-', x, y7, 'k-'); % Linien für y4, y5, y6 und y7 auf rechter Achse
% ylabel('Spannung in V, Strom in A, Wasserstoffverbrauch in l/min'); % Beschriftung der rechten y-Achse

% % Anpassung der Darstellung des Diagramms
% xlabel('Verbraucherstrom in A'); % Beschriftung der x-Achse
% title('Messwerte im Bezug zum Verbraucherstrom'); % Titel des
% legend('Stackleistung', 'Verbraucherleistung', 'Stackspannung', 'Batteriespannung', 'Batteriestrom', 'Verbraucherspannung', 'Wasserstoffverbrauch', 'Location', 'southoutside', 'Orientation', 'horizontal', 'NumColumns', 2);
