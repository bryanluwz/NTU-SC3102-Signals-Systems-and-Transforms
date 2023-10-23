%% Question 1A
clear all;
close all;
clc;
% Declare symbolic symbols t and s
syms t s pi;

% Declare some variables, and pi
a = sym(0.1);
b = sym(0.2);
k = sym(3);
w0 = sym(2);
phi = sym(0.1 * pi);

% Define the functions of Q1A
h1 = exp(-a * t) * cos(w0 * t + phi) * heaviside(t);
h2 = exp(-a * t) * sin(w0 * t + phi) * heaviside(t);
H3 = (k * s) / ((s + a) * (s - b));
h4 = exp(a * t) *  heaviside(t);

H1 = laplace(h1, t, s);
H2 = laplace(h2, t, s);
h3 = ilaplace(H3, s, t);
H4 = laplace(h4, t, s);

figure;

%% Get the Laplace Transforms or Inverse Laplace Transforms, and print the initial and final values
% 1A.a
fprintf('h1(t) = \n');
pretty(h1);
fprintf('H1(s) = \n');
pretty(H1);

h1 = subs(h1, pi, 3.14159265);
h1_0 = subs(h1, t, 0);
h1_inf = limit(h1, t, inf);

fprintf('Initial value of h1(t) = %f\n', double(h1_0));
fprintf('Final value of h1(t) = %f\n\n', double(h1_inf));

% 1A.b
fprintf('h2(t) = \n');
pretty(h2);
fprintf('H2(s) = \n');
pretty(H2);

h2 = subs(h2, pi, 3.14159265);
h2_0 = subs(h2, t, 0);
h2_inf = limit(h2, t, inf);

fprintf('Initial value of h2(t) = %f\n', double(h2_0));
fprintf('Final value of h2(t) = %f\n\n', double(h2_inf));

% 1A.c
fprintf('H3(s) = \n');
pretty(H3);
fprintf('h3(t) = \n');
pretty(h3);

h3 = subs(h3, pi, 3.14159265);
h3_0 = subs(h3, t, 0);
h3_inf = limit(h3, t, inf);

fprintf('Initial value of h3(t) = %f\n', double(h3_0));
fprintf('Final value of h3(t) = %f\n\n', double(h3_inf));

% 1A.d
fprintf('h4(t) = \n');
pretty(h4);
fprintf('H4(s) = \n');
pretty(H4);

h4 = subs(h4, pi, 3.14159265);
h4_0 = subs(h4, t, 0);
h4_inf = limit(h4, t, inf);

fprintf('Initial value of h4(t) = %f\n', double(h4_0));
fprintf('Final value of h4(t) = %f\n\n', double(h4_inf));

%% Plot the pole and zeroes for the 4 laplace functions
H1 = subs(H1, pi, 3.14159265);
H2 = subs(H2, pi, 3.14159265);
H3 = subs(H3, pi, 3.14159265);
H4 = subs(H4, pi, 3.14159265);

[N, D] = numden(H1);
sys = tf(sym2poly(N), sym2poly(D));

subplot(2, 2, 1);
pzmap(sys);
title('H1 Plot');

[N, D] = numden(H2);
sys = tf(sym2poly(N), sym2poly(D));

subplot(2, 2, 2);
pzmap(sys);
title('H2 Plot');

[N, D] = numden(H3);
sys = tf(sym2poly(N), sym2poly(D));

subplot(2, 2, 3);
pzmap(sys);
title('H3 Plot');

[N, D] = numden(H4);
sys = tf(sym2poly(N), sym2poly(D));

subplot(2, 2, 4);
pzmap(sys);
title('H4 Plot');

% For the system to be stable, all the poles must be in the left half of the s-plane, i.e. the real part of the poles must be negative