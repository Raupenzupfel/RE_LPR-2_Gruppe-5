x = [5.21, 6.27, 10.71, 16.27, 21.95, 27.23, 33.17, 38.73, 44.10, 50.80, 54.30]; % x-Werte
y1 = [211.79, 247.98, 399.27, 575.96, 746.96, 889.06, 1030.59, 1153.77, 1274.49, 1400.56, 1506.83]; % y-Werte für Linie 1
y2 = [0.00, 37.55, 176.00, 332.00, 475.50, 608.00, 722.50, 825.00, 927.50, 1016.00, 1096.50]; % y-Werte für Linie 2

% Plotting der Linien
plot(x, y1, 'b-', x, y2, 'r-'); % Blaue Linie für y1, Rote Linie für y2

% Anpassung der Darstellung des Diagramms
xlabel('X-Achse'); % Beschriftung der x-Achse
ylabel('Y-Achse'); % Beschriftung der y-Achse
title('Linienplot'); % Titel des Diagramms
grid on; % Gitterlinien anzeigen
legend('P_Stack', 'P_Verbraucher'); % Legende hinzufügen

