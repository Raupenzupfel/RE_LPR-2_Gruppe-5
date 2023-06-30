
P_D = ts.Ppvs - ts.Pl;


plot(ts.t,P_D/1000,ts.t,ts.Pbs/1000,'LineWidth',1.5);
grid on;
title('Differenzleistung und Batterieleistung');
legend('P_{Diff.}','P_{BS}','Location','northeast');
xlim([datetime('19-Jul-2016 00:00:00') datetime('20-Jul-2016 00:00:00')]);
xlabel('Zeit');
ylabel('Leistung in kW');

saveas(figure(1), 'plot_vorbereitungsfrage3.jpg');