function [ output_args ] = Calculate_Required_CR_Parms_Sin_Coef( input_args )
clear all;
%% only Single Pulse
global tL
tL = 200;
%% Parms

%omega,  J
omega1 = 2*pi * 5.114;
omega2 = 2*pi * 4.914;
alpha1 = 2*pi * 0.330;
alpha2 = 2*pi * 0.330;

J = 2*pi*0.0038;

% dress
detune12 = omega1 - omega2;
omega1_dress = omega1 + J^2 / detune12;
omega2_dress = omega2 - J^2 / detune12;

detuneDress12 = omega1_dress - omega2_dress;
omegap = omega2_dress;


% timeStart, timeMeasure, t_CR
t_measure = 000;
t_CR = -100;

%% Settings
t_I = -500;
t_F = 1000;
t_num = 6000;

%% Define Matrix + u,v,xi
I = eye(2);
X = [0, 1;1 0];
Y = [0, -1j; 1j, 0];
Z = [1, 0; 0, -1];

global II IZ ZI ZZ IY YI IX XI ZX ZY D0

II = kron(I, I);
IZ = kron(I, Z);
ZI = kron(Z, I);
ZZ = kron(Z, Z);
IY = kron(I, Y);
YI = kron(Y, I);
IX = kron(I, X);
XI = kron(X, I);
ZX = kron(Z, X);
ZY = kron(Z, Y);

D0 = - detuneDress12 / 2 * ZI;

u = J/detune12 * (-alpha2) / (detune12 - alpha2);
v = J/detune12 * (detune12) / (detune12 - alpha2);
xi = -J^2 * (alpha1 + alpha2) / 2 / (detuneDress12 - alpha1) / (detuneDress12 + alpha2);

%% Required fCR0, phac, fac
% fCR0
uEff = A(t_CR, xi, t_measure, v, u)
f = fCR0(uEff)
phiCR = phi0(t_CR, xi, t_measure, v, u)

% Active Cancellation
phac = phi0(t_CR, xi, t_measure, v, u) - phi1(t_CR, xi, t_measure, v, u) + pi
myB = B(t_CR, xi, t_measure, v, u)
fac = B(t_CR, xi, t_measure, v, u) * f;

%% Hm
t = linspace(t_I, t_F, t_num);

coefIX = zeros([1, t_num]);
coefZX = zeros([1, t_num]);
coefIY = zeros([1, t_num]);
coefZY = zeros([1, t_num]);

for a=1:t_num
    buf = Hm(t(a), phiCR, f, phac, fac, detuneDress12, u, v, xi, t_measure);
    coefIX(a) = real(trace(buf * IX)) / 4;
    coefZX(a) = real(trace(buf * ZX)) / 4;
    coefIY(a) = real(trace(buf * IY)) / 4;
    coefZY(a) = real(trace(buf * ZY)) / 4;
end


%% Plot

figure(3)
plot(t, coefIX, '--', 'Color', [0 0 0], 'linewidth',1); hold on
plot(t, coefZX, '-', 'Color', [0 0 0], 'linewidth',1); hold on
plot(t, coefIY, '--', 'Color', [1 0 0], 'linewidth',1); hold on
plot(t, coefZY, '-', 'Color', [1 0 0], 'linewidth',1); hold on

plot(t, u * f * ones([1, t_num]), '-.', 'Color', [1 .8 .8], 'linewidth',2); hold on
plot(t, -u * f * ones([1, t_num]), '-.', 'Color', [1 .8 .8], 'linewidth',2); hold on
plot(t, uEff * f * ones([1, t_num]), '-.', 'Color', [1 .8 .8], 'linewidth',2); hold on
plot(t, -uEff * f * ones([1, t_num]), '-.', 'Color', [1 .8 .8], 'linewidth',2); hold on

legend('IX', 'ZX', 'IY', 'ZY')
grid on
xlabel('time(ns)')


end

%% fCR0
function out = fCR0(uEff)
%  CR Pumping Settings
global tL

out = pi / 4 / ((2*tL/pi) * uEff);

end

%% Hm
function out = Hm(t, phi, f, phac, fac, detuneDress12, u, v, xi, t_measure)
global ZI ZZ IX ZX IY ZY II

% Dac
Dac = (detuneDress12^2 + f^2)^.5 - detuneDress12;

% Heff
Heff = Dac * ZI + xi * ZZ + f * (cos(phi) * (-v * IX - u * ZX) - sin(phi) * (-v * IY - u * ZY));

% Uud
Uud = cos(xi * (t - t_measure))*II - 1j*sin(xi * (t - t_measure))*ZZ;

% Hm
out = Uud' * Heff * Uud + fac * (cos(phac) * IX - sin(phac) * IY);

end

%% phi0, phi1, A, B
function out = phi0(t, xi, t_measure, v, u)
theta = 2*xi*(t - t_measure);
out = atan(v/(-u) * tan(theta));
end

function out = phi1(t, xi, t_measure, v, u)
theta = 2*xi*(t - t_measure);
out = atan(-u/(v) * tan(theta));
end

function out = A(t, xi, t_measure, v, u)
theta = 2*xi*(t - t_measure);
out = ((v * sin(theta))^2 + (u * cos(theta))^2)^.5;
end

function out = B(t, xi, t_measure, v, u)
theta = 2*xi*(t - t_measure);
out = ((u * sin(theta))^2 + (v * cos(theta))^2)^.5;
end