% x1-Werte
x1 = [5.21, 6.27, 10.71, 16.27, 21.95, 27.23, 33.17, 38.73, 44.10, 50.80, 54.30];

% y1-Werte
y1 = [1.53, 1.17, 0.80, 0.66, 0.61, 0.56, 0.53, 0.48, 0.47, 0.43, 0.45];

% x2-Werte
x2 = [0.00, 1.00, 5.00, 10.00, 15.00, 20.00, 25.00, 30.00, 35.00, 40.00, 43.00];

% y2-Werte
y2 = [1.810141026, 1.377658333, 0.943897872, 0.780430894, 0.71547749, 0.662982476, 0.622338104, 0.562264474, 0.555333333, 0.508553377, 0.526493711];

% y3-Werte
y3 = [0, 0.176789077, 0.352606483, 0.381241101, 0.385982856, 0.384231348, 0.369739212, 0.340717613, 0.342491045, 0.31264232, 0.324681093];

% y4-Werte
y4 = [0, 0.208611111, 0.41607565, 0.449864499, 0.45545977, 0.45339299, 0.436292271, 0.402046784, 0.404139434, 0.368917938, 0.38312369];

% Plot erstellen
plot(x2, y1, 'r-', 'LineWidth', 1.5);
hold on;
plot(x2, y2, 'm-', 'LineWidth', 1.5);
plot(x2, y3, 'b-', 'LineWidth', 1.5);
plot(x2, y4, 'k-', 'LineWidth', 1.5);

% Fläche zwischen x1, y1 und x2, y2 ausfüllen
fill([x2, fliplr(x2)], [y1, fliplr(y2)], 'm', 'FaceAlpha', 0.3);
fill([x2, fliplr(x2)], [y3, fliplr(y4)], 'c', 'FaceAlpha', 0.3);

% Anpassung der Darstellung des Diagramms
xlabel('Strom in A');
ylabel('Wirkungsgrad \eta ');% Unicode-Zeichencode für Eta
legend('Gesamtwirkungsgrad bezogen auf den Brennwert', 'Gesamtwirkungsgrad bezogen auf den Heizwert', 'Stackwirkungsgrad bezogen auf den Brennwert', 'Stackwirkungsgrad bezogen auf den Heizwert', 'Wirkungsgrad-Arbeitsbereich des BZ-Stacks','Wirkungsgrad-Arbeitsbereich des BZ-Systems', 'Location', 'southoutside', 'Orientation', 'horizontal', 'NumColumns', 1);
title('Graph');
grid on
% Plot als JPEG speichern
saveas(gcf, 'plot3.jpg', 'jpeg');