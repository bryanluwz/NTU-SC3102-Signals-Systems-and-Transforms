%% Question 1B
clear all;
close all;
clc;

%% Define functions and shit
syms t s pi;

h = exp(-2 * t) * heaviside(t);
x = 3 * cos(4 * pi * t) * heaviside(t);

%% Calculate y(t) = h(t) conv x(t), where Y(s) = X(s) H(s)
X = laplace(x, t, s);
H = laplace(h, t, s);
Y = X * H;
y = ilaplace(Y, s, t);

fprintf("y(t) = \n");
pretty(y);

%% Steady state gain of the signal, e.g. final value of y
Y = subs(Y, pi, 3.14159265);
% pi = sym('pi', 'real');
Y_final = subs(Y, s, 0);
fprintf("Steady state gain of signal = %f\n", double(Y_final));