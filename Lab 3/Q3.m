%% Question 3
close all;
clear all;
clc;

%% Shit
syms s t omega;

Hs = (s + 6) / (s ^ 2 + 5 * s + 6);

%% Plot the poles and zeros
figure;

subplot(2, 4, 1);
[N, D] = numden(Hs);
sys = tf(sym2poly(N), sym2poly(D));

pzmap(sys);
title('Hs Zeros and Poles Plot');

% All the real part of poles are negative, so it is stable

%% Find h(t) and the minimum value of t for |h(t)| <= 0.01
ht = ilaplace(Hs);
fprintf("h(t) = \n");
pretty(ht);

t_values = linspace(0, 10, 1000); % Adjust the time range as needed
h_values = subs(ht, t, t_values);

% Find the minimum value of t for |h(t)| <= 0.01
min_t = min(t_values(abs(h_values) <= 0.01));

% Plot h(t)
subplot(2, 4, 2);
plot(t_values, h_values);
title('Plot of h(t)');
xlabel('t');
ylabel('h(t)');

fprintf('Minimum value of t for |h(t)| <= 0.01: %f\n', min_t);

%% Now we have an input x(t)
xt = cos(omega * t) * heaviside(t);
Xs = laplace(xt);
Ys = Xs * Hs;
yt = ilaplace(Ys);

fprintf("y(t) = \n");
pretty(yt);

% Very omega 0, 1, 2, 3, and also calculate the gain and phase shift respectively
subplot(2, 4, 5);
yt0 = subs(yt, omega, 0);
plot(t_values, subs(yt0, t, t_values));
title('Plot of y(t) when \omega = 0');
xlabel('t');
ylabel('y(t)');

subplot(2, 4, 6);
yt1 = subs(yt, omega, 1);
plot(t_values, subs(yt1, t, t_values));
title('Plot of y(t) when \omega = 1');
xlabel('t');
ylabel('y(t)');

subplot(2, 4, 7);
yt2 = subs(yt, omega, 2);
plot(t_values, subs(yt2, t, t_values));
title('Plot of y(t) when \omega = 2');
xlabel('t');
ylabel('y(t)');

subplot(2, 4, 8);
yt3 = subs(yt, omega, 3);
plot(t_values, subs(yt3, t, t_values));
title('Plot of y(t) when \omega = 3');
xlabel('t');
ylabel('y(t)');

% Calculate the gain and phase shift, IDK le actually
fprintf('Gain when omega = 0: %f\n', abs(subs(yt0, t, 0)));
fprintf('Phase shift when omega = 0: %f\n', angle(subs(yt0, t, 0)));

fprintf('Gain when omega = 1: %f\n', abs(subs(yt1, t, 0)));
fprintf('Phase shift when omega = 1: %f\n', angle(subs(yt1, t, 0)));

fprintf('Gain when omega = 2: %f\n', abs(subs(yt2, t, 0)));
fprintf('Phase shift when omega = 2: %f\n', angle(subs(yt2, t, 0)));

fprintf('Gain when omega = 3: %f\n', abs(subs(yt3, t, 0)));
fprintf('Phase shift when omega = 3: %f\n', angle(subs(yt3, t, 0)));
