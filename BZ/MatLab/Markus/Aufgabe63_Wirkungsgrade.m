% Aufgabe 6.3 Wikrkungsgrade Plotten

clear;
close all;
clc;

%% Festlegungen

x2 = [0.00, 1.00, 5.00, 10.00, 15.00, 20.00, 25.00, 30.00, 35.00, 40.00, 43.00]; % Strom
y1 = [1.53, 1.17, 0.80, 0.66, 0.61, 0.56, 0.53, 0.48, 0.47, 0.43, 0.45]; % Gesamtwirkungsgrad bezogen auf den Brennwert
y2 = [1.810141026, 1.377658333, 0.943897872, 0.780430894, 0.71547749, 0.662982476, 0.622338104, 0.562264474, 0.555333333, 0.508553377, 0.526493711]; % Gesamtwirkungsgrad bezogen auf den Heizwert
y3 = [0, 0.176789077, 0.352606483, 0.381241101, 0.385982856, 0.384231348, 0.369739212, 0.340717613, 0.342491045, 0.31264232, 0.324681093]; % Stackwirkungsgrad bezogen auf den Brennwert
y4 = [0, 0.208611111, 0.41607565, 0.449864499, 0.45545977, 0.45339299, 0.436292271, 0.402046784, 0.404139434, 0.368917938, 0.38312369]; % Stackwirkungsgrad bezogen auf den Heizwert

%%  Plot erstellen
plot(x2, y1, 'r-', 'LineWidth', 1.5);
hold on;
plot(x2, y2, 'm-', 'LineWidth', 1.5);
plot(x2, y3, 'b-', 'LineWidth', 1.5);
plot(x2, y4, 'k-', 'LineWidth', 1.5);

% Fläche zwischen x1, y1 und x2, y2 ausfüllen
fill([x2, fliplr(x2)], [y1, fliplr(y2)], 'm', 'FaceAlpha', 0.3);
fill([x2, fliplr(x2)], [y3, fliplr(y4)], 'c', 'FaceAlpha', 0.3);

% Anpassung der Darstellung des Diagramms
xlabel('Verbraucherstrom I in A');
ylabel('Wirkungsgrad \eta');
legend('\eta_{Gesamt,Brennwert}', '\eta_{Gesamt,Heizwert}', '\eta_{Stack,Brennwert}', '\eta_{Stack,Heizwert}', 'Arbeitsbereich des BZ-Stacks','Arbeitsbereich des BZ-Systems', 'Location', 'best', 'Orientation', 'horizontal', 'NumColumns', 1);
title('Wirkunsgrade in bezug auf den Verbraucherstrom');
grid on;
fontsize(20,"points");
xlim([0 45]);
