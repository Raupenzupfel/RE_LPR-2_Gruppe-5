E_PVS_Komm = cumsum(ts.Ppvs/1000)/3600;


plot(ts.t,E_PVS_Komm,'LineWidth',1.5);
grid on;
title('Kommulierte Einstrahlung');
legend('P_{PVS,Komm.}','Location','northeast');
xlim([datetime('18-Jul-2016 04:00:00') datetime('25-Jul-2016 03:59:59')]);
xlabel('Zeit');
ylabel('Energie in kWh');

saveas(figure(1), 'plot_vorbereitungsfrage4.jpg');

%%
E_PVS_Komm = cumsum(ts.Ppvs/1000)/3600;

plot(ts.t, ts.Ppvs/1000, 'LineWidth', 1.5);
hold on;
plot(ts.t, E_PVS_Komm, 'LineWidth', 1.5);
grid on;
title('Kumulierte Einstrahlung');
legend('P_{PVS}', 'P_{PVS,Komm.}', 'Location', 'northeast');
xlim([datetime('18-Jul-2016 04:00:00') datetime('25-Jul-2016 03:59:59')]);
xlabel('Zeit');
ylabel('Leistung in kW');

saveas(figure(1), 'plot_vorbereitungsfrage4.jpg');