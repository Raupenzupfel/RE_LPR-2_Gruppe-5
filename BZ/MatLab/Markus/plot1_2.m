x = [5.21, 6.27, 10.71, 16.27, 21.95, 27.23, 33.17, 38.73, 44.10, 50.80, 54.30]; % x-Werte
y1 = [211.79, 247.98, 399.27, 575.96, 746.96, 889.06, 1030.59, 1153.77, 1274.49, 1400.56, 1506.83]; % y-Werte für Linie 1
y2 = [0.00, 37.55, 176.00, 332.00, 475.50, 608.00, 722.50, 825.00, 927.50, 1016.00, 1096.50]; % y-Werte für Linie 2
y3 = [40.65, 39.55, 37.28, 35.40, 34.03, 32.65, 31.07, 29.79, 28.90, 27.57, 27.75];
y4 = [0.65, 1.00, 2.35, 4.10, 5.80, 7.45, 9.20, 11.40, 12.75, 15.30, 15.90];

% Plotting der Linien
plot(x, y1, 'b-', x, y2, 'r-'); % Blaue Linie für y1, Rote Linie für y2

% Anpassung der Darstellung des Diagramms
xlabel('I_{Stack} in Ampere'); % Beschriftung der x-Achse
ylabel('Leistung in Watt'); % Beschriftung der linken y-Achse
title('Messwerte bezogen auf den Stackstrom'); % Titel des Diagramms
grid on; % Gitterlinien anzeigen
legend('P_{Stack}', 'P_{Verbraucher}'); % Legende hinzufügen

% Hinzufügen der sekundären Achse für y3 und y4
yyaxis right; % Wechsel zur rechten y-Achse
plot(x, y3, 'k-', x, y4, 'm-'); % Gelbe Linie für y3, Magenta Linie für y4
ylabel('Spannung in Volt und H2 Verbrauch in l/min'); % Beschriftung der rechten y-Achse

% Aktualisierung der Legende
legend('P_{Stack}', 'P_{Verbraucher}', 'U_{Stack}', 'H2 Verbrauch', 'Location', 'southoutside', 'Orientation', 'horizontal', 'NumColumns', 2); % Legende aktualisieren

print('plot1.jpg', '-djpeg'); %speichern
