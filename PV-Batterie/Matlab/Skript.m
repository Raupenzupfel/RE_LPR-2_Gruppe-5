%% Skript: Laborversuch: Validierung eines Simulationsmodells f�r PV-Batteriesysteme
% Skript der Gruppe 5 SS23

tic
close all;
clear;
clc;

%% 1 Einlesen des Datensatzes

% Anpassung erforderlich: Dateipfad, in dem sich die Datei Datensatz.mat befindet (z. B. cd 'C:\Daten')
% cd 'C:\Daten'

% Import der Eingangsdaten
load Datensatz;


%% 2 Vorbereitungsaufgaben

%% 2.1 

Ppvs2l = min(Ppvs,Pl);

figure(1),
subplot(2, 2, 1)
plot(t,Ppvs/1000,t,Pl/1000,t,Ppvs2l/1000,'LineWidth',1.5);
grid on;
title('Sekunden Werte');
legend('P_{PVS}','P_L','P_{PVS2L}','Location','northeast');
xlim([datetime('18-Jul-2016 04:00:00') datetime('25-Jul-2016 03:59:59')]);
ylim([0,6]);
xlabel('Zeit');
ylabel('Leistung in kW');

intervall = 3600;

for i = intervall:intervall:604800
    t_m(i/intervall,1) = datetime(t(i));
    P_pvsm(i/intervall,1) = mean(Ppvs(i+1-intervall:i));
    P_lm(i/intervall,1) = mean(Pl(i+1-intervall:i));
    P_pvs2lm(i/intervall,1) = mean(Ppvs2l(i+1-intervall:i));
end

subplot(2,2,2)
plot(t_m,P_pvsm/1000,t_m,P_lm/1000,t_m,P_pvs2lm/1000,'LineWidth',1.5);
grid on;
title('Stunden Mittelwerte');
legend('P_{PVS}','P_L','P_{PVS2L}','Location','northeast');
xlim([datetime('18-Jul-2016 04:00:00') datetime('25-Jul-2016 03:59:59')]);
ylim([0,6]);
xlabel('Zeit');
ylabel('Leistung in kW');


%% 2.2

E_pvs = sum(Ppvs/1000)/3600;
E_l = sum(Pl/1000)/3600;
E_pvs2l = sum(Ppvs2l/1000)/3600;

%% 2.3

P_D = Ppvs - Pl;

subplot(2,2,3)
plot(t,P_D/1000,t,Pbs/1000,'LineWidth',1.5);
grid on;
title('Differenzleistung und Batterieleistung');
legend('P_{Diff.}','P_{BS}','Location','northeast');
xlim([datetime('19-Jul-2016 00:00:00') datetime('20-Jul-2016 00:00:00')]);
xlabel('Zeit');
ylabel('Leistung in kW');

%% 2.4

% cumsum gibt die kontinuierliche summe eines vektors an. 
% Also statt die gesammte Summe zu berechnen, werden mit cumsum auch alle zwischen Summen gespeichert.

E_PVS_Komm = cumsum(Ppvs/1000)/3600;

subplot(2,2,4)
area(t,E_PVS_Komm,'LineWidth',1.5);
grid on;
title('Kommulierte Einstrahlung');
legend('P_{PVS,Komm.}','Location','northeast');
xlim([datetime('18-Jul-2016 04:00:00') datetime('25-Jul-2016 03:59:59')]);
xlabel('Zeit');
ylabel('Energie in kWh');

%% 3 Simulation des PV-Batteriesystems

%% 3.1 Definition der Systemparameter

% Nutzbare Speicherkapazit�t in kWh
s.E_BAT=6.1; 
% Nominale AC-Leistungsaufnahme des Batteriewechselrichters in kW
s.P_AC2BAT_in=2.508; 
% Nominale AC-Leistungsabgabe des Batteriewechselrichters in kW
s.P_BAT2AC_out=2.499; 
% Mittlerer Umwandlungswirkungsgrad des Batteriewechselrichters im Ladebetrieb 
s.eta_ac2bat=0.9427;
% Mittlerer Umwandlungswirkungsgrad des Batteriewechselrichters im Entladebetrieb 
s.eta_bat2ac=0.9479;
% Mittlerer Umwandlungswirkungsgrad des Batteriespeichers 
s.eta_bat=0.927;
% Simulationszeitschrittweite in h
s.dt=1/3600; 

%% 3.2 Simulation des Betriebsverhaltens
% Differenzleistung in W
Pd=Ppvs-Pl;

% Aufruf des Simulationsmodells
[Pbssim,Pbatsim,soc]=simbat(s,Pd);

intervall2 = 1800;

for i = intervall2:intervall2:604800
    t_m2(i/intervall2,1) = datetime(t(i));
    P_BSm(i/intervall2,1) = mean(Pbs(i+1-intervall2:i));
    P_BSsimm(i/intervall2,1) = mean(Pbssim(i+1-intervall2:i));
    P_Batsimm(i/intervall2,1) = mean(Pbatsim(i+1-intervall2:i));
    soc_m(i/intervall2,1) = mean(soc(i+1-intervall2:i));
end

%% 4 Versuchsdurchf�hrung

%% 4.1 Vergleich der Leistungsfl�sse 

%% 4.1.1

figure(2),
subplot(2,1,1)
plot(t,Pbs/1000,t,Pbssim/1000,'LineWidth',1.5);
grid on;
title('Leistungsflüsse');
legend('P_{BS}','P_{BS,Sim.}','Location','northeast');
xlim([datetime('18-Jul-2016 04:00:00') datetime('25-Jul-2016 03:59:59')]);
xlabel('Zeit');
ylabel('Leistung in kW');

subplot(2,1,2)
plot(t_m2,P_BSm/1000,t_m2,P_BSsimm/1000,'LineWidth',1.5);
grid on;
title('Leistungsflüsse mittelwertbildung');
legend('P_{BS}','P_{BS,Sim.}','Location','northeast');
xlim([datetime('18-Jul-2016 04:00:00') datetime('25-Jul-2016 03:59:59')]);
xlabel('Zeit');
ylabel('Leistung in kW');

%% 4.1.2

figure(3),
scatter(Pbs/1000, Pbssim/1000,'filled','SizeData',1.5);
grid on;
title('Simulation Differenz');
xlabel('P_{BS} in kW');
ylabel('P_{BS,Sim} in kW');

%% 4.2 Vergleich der Energiesummen

%% 4.2.1

%% 4.2.2

toc