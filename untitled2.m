clear all
close all
clc;


%% parameters 

% initial water level (m)
h0 = 2;

% grsvitiational acceleration (m/s^2)
g = 9.81;

% tank diameter (m)
D = 0.8;

% valve coefficient (kg/s/pa)
Cv = 1000;

%% solution
% solution coefficient (1/s)
lambda = 4 * Cv * g / D^2 / pi;

% time to half empty tank (s)
t_half = -log(0.5) / lambda;

% time (s)
Nt = 101;
t = linspace(0, 5*t_half, Nt);

% solution function
h = h0 * exp(-lambda*t);


h_ave = h0/t_half * (exp(-lambda*t_half) - 1)/-lambda;


%% Plotting

plot(t, h, '--k','LineWidth',2)
hold on
plot([0,t_half],[h_ave,h_ave], '-r', 'LineWidth',2)
plot([t_half,t_half],[0,h_ave], '-k')
xlabel('t [s]')
ylabel('h [s]')
