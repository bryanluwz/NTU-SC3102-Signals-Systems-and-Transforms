%% Question 4
clear all;
close all;
clc;

%% Differential equation for RLC Circuit
syms s t;
syms L C R;

%% Find y(t) if x(t) = 0, y(0) = 1.5 for capacitor and i(0) = 2 for inductor
% y''(t) + (R/L)y'(t) + (1/LC)y(t) = 0 -- 1
% determine otuput voltage y(t)
% Convert 1 to Laplace domain with initial conditions
% s^2Y(s) + (R/L)sY(s) + (1/LC)Y(s) = 0 -- 2
% Y(s) = (s^2 + (R/L)s + (1/LC))^-1 -- 3
% Plot y(t)
Ys = (s^2 + (R/L)*s + (1/L*C))^-1;
yt = ilaplace(Ys);

fprintf("The output voltage y(t) is: \n");
pretty(yt);

figure;
t_values = linspace(0, 3, 100);

subplot(3, 1, 1);
yt1 = subs(yt, [L, C, R], [1, 1/6, 5]);
plot(t_values, subs(yt1, t, t_values));
title("R = 5 \Omega");
xlabel("t");
ylabel("y(t)");

fprintf("When R = 5\n")
fprintf("The value of y(t) at t = 0 is: %f\n", subs(yt1, t, 0));
fprintf("The value of y(t) at t = 3 is: %f\n", subs(yt1, t, 0));
fprintf("The value of y(t) at t = inf is: %f\n", limit(yt1, t, 0));
fprintf("\n");

subplot(3, 1, 2);
yt2 = subs(yt, [L, C, R], [1, 1/6, 1]);
plot(t_values, subs(yt2, t, t_values));
title("R = 1 \Omega");
xlabel("t");
ylabel("y(t)");

fprintf("When R = 1\n")
fprintf("The value of y(t) at t = 0 is: %f\n", subs(yt2, t, 0));
fprintf("The value of y(t) at t = 3 is: %f\n", subs(yt2, t, 0));
fprintf("The value of y(t) at t = inf is: %f\n", limit(yt2, t, 0));
fprintf("\n");

%% Now if x(t) = 10u(t) and y(0) = 0
% y''(t) + (R/L)y'(t) + (1/LC)y(t) = (1/LC)x(t) -- 4
% Y(s) = (s^2 + (R/L)s + (1/LC))^-1 * (1/LC) * (1/s) -- 5
% Y(s) = (s + (R/L) + (1/LC)s^-1) * (1/LC) * (1/s) -- 6
Ys = (s + (R/L) + (1/(L*C)*s^-1)) * (1/(L*C)) * (1/s);
yt = ilaplace(Ys);

fprintf("The output voltage y(t) is: \n");
pretty(yt);

subplot(3, 1, 3);
yt3 = subs(yt, [L, C, R], [1, 1/6, 1]);
plot(t_values, subs(yt3, t, t_values));
title("R = 1 \Omega, x(t) = 10u(t)");
xlabel("t");
ylabel("y(t)");

%% Final value theorem on yt3
final_value = limit(yt3, t, inf);
fprintf("The value of y(t) at t = 0 is: %f\n", final_value);

% Find how long it took to converge to 0.99 of f
t_values = linspace(0, 10, 100);
y_values = subs(yt3, t, t_values);
for i = 1:length(y_values)
	if y_values(i) >= 0.99*final_value
		fprintf("It took %f seconds to converge to 0.99 of f\n", t_values(i));
		break;
	end
end