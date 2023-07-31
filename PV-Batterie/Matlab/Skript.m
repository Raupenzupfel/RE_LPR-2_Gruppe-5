%% Skript: Laborversuch: Validierung eines Simulationsmodells f�r PV-Batteriesysteme
% Skript der Gruppe 5 SS23

tic
close all;
clear;
clc;

%% 1 Einlesen des Datensatzes

% Anpassung erforderlich: Dateipfad, in dem sich die Datei Datensatz.mat befindet (z. B. cd 'C:\Daten')
% cd 'F:\Niels\UNI\6.Semester\Lab2\RE_LPR-2_Gruppe-5\PV-Batterie\Matlab'

% Import der Eingangsdaten
load DatensatzModified;


%% 2 Vorbereitungsaufgaben

%% 2.1 

Ppvs2l = min(ts.Ppvs,ts.Pl);

figure(1),
subplot(2, 2, 1)
plot(ts.t,ts.Ppvs/1000,ts.t,ts.Pl/1000,ts.t,Ppvs2l/1000,'LineWidth',1.5);
grid on;
title('Sekunden Werte');
legend('P_{PVS}','P_L','P_{PVS2L}','Location','northeast');
xlim([datetime('18-Jul-2016 04:00:00') datetime('25-Jul-2016 03:59:59')]);
ylim([0,6]);
xlabel('Zeit');
ylabel('Leistung in kW');

tm.intervall1 = 3600;

for i = tm.intervall1:tm.intervall1:604800
    tm.t(i/tm.intervall1,1) = datetime(ts.t(i));
    tm.P_pvs(i/tm.intervall1,1) = mean(ts.Ppvs(i+1-tm.intervall1:i));
    tm.P_l(i/tm.intervall1,1) = mean(ts.Pl(i+1-tm.intervall1:i));
    tm.P_pvs2l(i/tm.intervall1,1) = mean(Ppvs2l(i+1-tm.intervall1:i));
end
clear i tm.intervall1;

subplot(2,2,2)
plot(tm.t,tm.P_pvs/1000,tm.t,tm.P_l/1000,tm.t,tm.P_pvs2l/1000,'LineWidth',1.5);
grid on;
title('Stunden Mittelwerte');
legend('P_{PVS}','P_L','P_{PVS2L}','Location','northeast');
xlim([datetime('18-Jul-2016 04:00:00') datetime('25-Jul-2016 03:59:59')]);
ylim([0,6]);
xlabel('Zeit');
ylabel('Leistung in kW');


%% 2.2

E.E_pvs = sum(ts.Ppvs/1000)/3600;
E.E_l = sum(ts.Pl/1000)/3600;
E.E_pvs2l = sum(Ppvs2l/1000)/3600;

%% 2.3

P_D = ts.Ppvs - ts.Pl;

subplot(2,2,3)
plot(ts.t,P_D/1000,ts.t,ts.Pbs/1000,'LineWidth',1.5);
grid on;
title('Differenzleistung und Batterieleistung');
legend('P_{Diff.}','P_{BS}','Location','northeast');
xlim([datetime('19-Jul-2016 00:00:00') datetime('20-Jul-2016 00:00:00')]);
xlabel('Zeit');
ylabel('Leistung in kW');

%% 2.4

% cumsum gibt die kontinuierliche summe eines vektors an. 
% Also statt die gesammte Summe zu berechnen, werden mit cumsum auch alle zwischen Summen gespeichert.

E_PVS_Komm = cumsum(ts.Ppvs/1000)/3600;

subplot(2,2,4)
plot(ts.t,E_PVS_Komm,'LineWidth',1.5);
grid on;
title('Kummulierte Einstrahlung');
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
% Pd=Ppvs-Pl;
% Aufruf des Simulationsmodells
[s.Pbssim,s.Pbatsim,s.soc]=simbat(s,P_D);

tm.intervall2 = 1800;

for i = tm.intervall2:tm.intervall2:604800
    tm.t(i/tm.intervall2,1) = datetime(ts.t(i));
    tm.P_BS(i/tm.intervall2,1) = mean(ts.Pbs(i+1-tm.intervall2:i));
    tm.P_BSsim(i/tm.intervall2,1) = mean(s.Pbssim(i+1-tm.intervall2:i));
    tm.P_Batsim(i/tm.intervall2,1) = mean(s.Pbatsim(i+1-tm.intervall2:i));
    tm.soc(i/tm.intervall2,1) = mean(s.soc(i+1-tm.intervall2:i));
end

clear i tm.intervall2;

%% 4 Versuchsdurchf�hrung

%% 4.1 Vergleich der Leistungsfl�sse 

%% 4.1.1

figure(2),
%%subplot(2,1,1)
plot(ts.t,ts.Pbs/1000,ts.t,s.Pbssim/1000,'LineWidth',1.5);
grid on;
title('Leistungsflüsse');
legend('P_{BS}','P_{BS,Sim.}','Location','northeast');
xlim([datetime('24-Jul-2016 11:50:00') datetime('24-Jul-2016 12:00:00')]);
xlabel('Zeit');
ylabel('Leistung in kW');

%%subplot(2,1,2)
%%plot(tm.t,tm.P_BS/1000,tm.t,tm.P_BSsim/1000,'LineWidth',1.5);
%%grid on;
%%title('Leistungsflüsse Mittelwertbildung');
%%legend('P_{BS}','P_{BS,Sim.}','Location','northeast');
%%xlim([datetime('19-Jul-2016 11:30:00') datetime('19-Jul-2016 12:00:00')]);
%%xlabel('Zeit');
%%ylabel('Leistung in kW');

%% 4.1.2

figure(3),
scatter(ts.Pbs/1000, s.Pbssim/1000,'filled','SizeData',1.5);
grid on;
title('Simulation Differenz');
xlabel('P_{BS} in kW');
ylabel('P_{BS,Sim} in kW');

%% 4.2 Vergleich der Energiesummen

%% 4.2.1

E_BS_Komm = cumsum(ts.Pbs)/1000/3600;
E_BSSim_Komm = cumsum(s.Pbssim)/1000/3600;

figure(4);
plot(ts.t,E_BS_Komm,ts.t,E_BSSim_Komm);
grid on;
title('Kumulierte Leistungen');
legend('E_{BS}','E_{BS,Sim.}','Location','northeast');
xlim([datetime('18-Jul-2016 04:00:00') datetime('25-Jul-2016 03:59:59')]);
xlabel('Zeit');
ylabel('Energie in kWh');

%% 4.2.2

Ergebnisse.E_Bat_C.real = sum(max(0,ts.Pbat/1000)/3600);                 % Battery DC Charge         - E_DC2Bat
Ergebnisse.E_Bat_C.Sim = sum(max(0,s.Pbatsim/1000)/3600);           % Battery DC Charge Sim.
Ergebnisse.E_Bat_C.A = Ergebnisse.E_Bat_C.real - Ergebnisse.E_Bat_C.Sim;
Ergebnisse.E_Bat_C.R = Ergebnisse.E_Bat_C.A/Ergebnisse.E_Bat_C.real;

Ergebnisse.E_Bat_DC.real = sum(abs(min(0,ts.Pbat/1000)/3600));           % Battery DC Discharge      - E_Bat2DC
Ergebnisse.E_Bat_DC.Sim = sum(abs(min(0,s.Pbatsim/1000)/3600));     % Battery DC Discharge Sim.
Ergebnisse.E_Bat_DC.A = Ergebnisse.E_Bat_DC.real - Ergebnisse.E_Bat_DC.Sim ;
Ergebnisse.E_Bat_DC.R = Ergebnisse.E_Bat_DC.A / Ergebnisse.E_Bat_DC.real;

Ergebnisse.E_BS_C.real = sum(max(0,ts.Pbs)/1000/3600);                   % Battery AC Charge         - E_AC2BS
Ergebnisse.E_BS_C.Sim = sum(max(0,s.Pbssim)/1000/3600);             % Battery AC Charge Sim.
Ergebnisse.E_BS_C.A = Ergebnisse.E_BS_C.real - Ergebnisse.E_BS_C.Sim;
Ergebnisse.E_BS_C.R = Ergebnisse.E_BS_C.A / Ergebnisse.E_BS_C.real;

Ergebnisse.E_BS_DC.real = sum(abs(min(0,ts.Pbs)/1000/3600));             % Battery AC Discharge      - E_BS2AC
Ergebnisse.E_BS_DC.Sim = sum(abs(min(0,s.Pbssim)/1000/3600));       % Battery AC Discharge Sim.
Ergebnisse.E_BS_DC.A = Ergebnisse.E_BS_DC.real - Ergebnisse.E_BS_DC.Sim;
Ergebnisse.E_BS_DC.R = Ergebnisse.E_BS_DC.A / Ergebnisse.E_BS_DC.real;

Ergebnisse.Eta_AC2BAT.real = Ergebnisse.E_Bat_C.real / Ergebnisse.E_BS_C.real;
Ergebnisse.Eta_AC2BAT.Sim = Ergebnisse.E_Bat_C.Sim / Ergebnisse.E_BS_C.Sim;
Ergebnisse.Eta_AC2BAT.A = Ergebnisse.Eta_AC2BAT.real - Ergebnisse.Eta_AC2BAT.Sim;
Ergebnisse.Eta_AC2BAT.R = Ergebnisse.Eta_AC2BAT.A / Ergebnisse.Eta_AC2BAT.real;

Ergebnisse.Eta_BAT.real = Ergebnisse.E_Bat_DC.real / Ergebnisse.E_Bat_C.real;
Ergebnisse.Eta_BAT.Sim = Ergebnisse.E_Bat_DC.Sim / Ergebnisse.E_Bat_C.Sim;
Ergebnisse.Eta_BAT.A = Ergebnisse.Eta_BAT.real - Ergebnisse.Eta_BAT.Sim;
Ergebnisse.Eta_BAT.R = Ergebnisse.Eta_BAT.A / Ergebnisse.Eta_BAT.real;

Ergebnisse.Eta_BAT2AC.real = Ergebnisse.E_BS_DC.real / Ergebnisse.E_Bat_DC.real;
Ergebnisse.Eta_BAT2AC.Sim = Ergebnisse.E_BS_DC.Sim / Ergebnisse.E_Bat_DC.Sim;
Ergebnisse.Eta_BAT2AC.A = Ergebnisse.Eta_BAT2AC.real - Ergebnisse.Eta_BAT2AC.Sim;
Ergebnisse.Eta_BAT2AC.R = Ergebnisse.Eta_BAT2AC.A / Ergebnisse.Eta_BAT2AC.real;

Ergebnisse.Eta_AC.real = Ergebnisse.E_BS_DC.real / Ergebnisse.E_BS_C.real;
Ergebnisse.Eta_AC.Sim = Ergebnisse.E_BS_DC.Sim / Ergebnisse.E_BS_C.Sim;
Ergebnisse.Eta_AC.A = Ergebnisse.Eta_AC.real - Ergebnisse.Eta_AC.Sim;
Ergebnisse.Eta_AC.R = Ergebnisse.Eta_AC.A / Ergebnisse.Eta_AC.real;

% close all;

toc