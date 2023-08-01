E_BS_Komm = cumsum(ts.Pbs)/1000/3600;
E_BSSim_Komm = cumsum(s.Pbssim)/1000/3600;

% Separate positive and negative power flows
positive_power = max(0, ts.Pbs);
negative_power = min(0, ts.Pbs);
positive_power_sim = max(0, s.Pbssim);
negative_power_sim = min(0, s.Pbssim);

% Cumulative positive and negative power flows
E_Positive_BS_Komm = cumsum(positive_power)/1000/3600;
E_Negative_BS_Komm = cumsum(negative_power)/1000/3600;
E_Positive_BSSim_Komm = cumsum(positive_power_sim)/1000/3600;
E_Negative_BSSim_Komm = cumsum(negative_power_sim)/1000/3600;

% Plot cumulative positive power flows
figure(1);
plot(ts.t, E_Positive_BS_Komm, ts.t, E_Positive_BSSim_Komm);
grid on;
title('Cumulative Positive Power Flows');
legend('E_{Positive_{BS}}', 'E_{Positive_{BS,Sim.}}', 'Location', 'northeast');
xlim([datetime('18-Jul-2016 04:00:00') datetime('25-Jul-2016 03:59:59')]);
xlabel('Time');
ylabel('Energy in kWh');

% Plot cumulative negative power flows
figure(2);
plot(ts.t, E_Negative_BS_Komm, ts.t, E_Negative_BSSim_Komm);
grid on;
title('Cumulative Negative Power Flows');
legend('E_{Negative_{BS}}', 'E_{Negative_{BS,Sim.}}', 'Location', 'northeast');
xlim([datetime('18-Jul-2016 04:00:00') datetime('25-Jul-2016 03:59:59')]);
xlabel('Time');
ylabel('Energy in kWh');
