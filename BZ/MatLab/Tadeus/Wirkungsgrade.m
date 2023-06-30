% Näherungsrechnung für Carnot Wirkungsgrad und Thermodynamischen Wirkungsgrad
% Johannes Tadeus Ranisch
% Erstellt am 11.06.2023

%% Setup

tic

clear;
close all;
clc;

%% Festlegungen

T0(1:1501) = 273;
t_prozess = 0:1500 ;
T_prozess = t_prozess + T0;
T_U(1:1501) = T0 + 25;

d_G(1:101) = linspace(232.55,212,101);
d_G(102:1501) = linspace(212,125.3425,1400);
d_H(1:101) = 286;
d_H(102:1501) = 246;

ax.XTick = 0:100:1500 ;

%% Rechnung
figure(1),
plot(t_prozess,d_G,t_prozess,d_H,'LineWidth',1.5);
xticks(ax.XTick);
ylim([0 300]);
legend('\DeltaG°','\DeltaH°')
title('Enthalpien in Abhänigkeit der Temperatur');
xlabel('Temperatur in °C');
ylabel('Enthalpie in kJ/mol');
grid on;

Wirkungsgrad_Carnot = zeros(1501,1);
Wirkungsgrad_Gibbs_Helmholtz = zeros(1501,1);
for i = 1:1501
    Wirkungsgrad_Carnot(i,1) = abs(1- (T_U(i)/T_prozess(i)));
    Wirkungsgrad_Gibbs_Helmholtz(i,1) = d_G(i)/d_H(i);
end

figure(2),
plot(t_prozess,Wirkungsgrad_Carnot,t_prozess,Wirkungsgrad_Gibbs_Helmholtz,'LineWidth',1.5);
xticks(ax.XTick);
ylim([0 1]);
legend('\eta_{Carnot}','\eta_{Gibbs-Helmholtz}');
title('Wirkungsgrade in Abhänigkeit der Temperatur');
xlabel('Temperatur in °C');
ylabel('Wirkungagrad');
grid on;
toc