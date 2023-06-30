Ppvs2l = min(ts.Ppvs,ts.Pl);

figure(1),

plot(ts.t,ts.Ppvs/1000,ts.t,ts.Pl/1000,ts.t,Ppvs2l/1000,'LineWidth',1.5);
grid on;
title('Sekunden Werte');
legend('P_{PVS}','P_L','P_{PVS2L}','Location','northeast');
xlim([datetime('18-Jul-2016 04:00:00') datetime('25-Jul-2016 03:59:59')]);
ylim([0,6]);
xlabel('Zeit');
ylabel('Leistung in kW');

tm.intervall1 = 3600;

saveas(figure(1), 'plot.jpg');
