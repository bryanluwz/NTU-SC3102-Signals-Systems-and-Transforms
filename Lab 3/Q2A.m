%% Question 2
close all;
clear all;
clc;

%% Intialise stuff and shit
syms s a;

Hs = (s + 1) / (s + a);

omega = logspace(-2, 2, 100);
Hjw = subs(Hs, s, 1i * omega);

%% Plot and shit
% H(s)
Hs = subs(Hs, a, 0.1);
real_s = linspace(-5, 5, 100);
imag_s = linspace(-5, 5, 100);
[S_real, S_imag] = meshgrid(real_s, imag_s);

Hs_values = subs(Hs, s, S_real + 1i * S_imag);

figure;
subplot(2, 1, 1);
mesh(S_real, S_imag, abs(Hs_values));
title('Surface Plot of H(s)')
xlabel('Real(s)')
ylabel('Imag(s)')
zlabel('|H(s)|')

% H(jw), wah what is this error dimensions need to agree
Hjw = subs(Hjw, a, 0.1);
Hjw_values = subs(Hjw, s, S_real + 1i * S_imag);

subplot(2, 1, 2);
mesh(S_real, S_imag, abs(Hjw_values));
title('Surface Plot of H(jw)')
xlabel('Real(s)')
ylabel('Imag(s)')
zlabel('|H(s)|')