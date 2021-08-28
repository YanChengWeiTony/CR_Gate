function [ out ] = Init_a0( t_len, tgPi, fCR0, phip, basis_num )
%% Spec

% an: fac
% bn: phase (sin)
% cn: phase (cos)

%% givem Parms
t_CR = 0;


%% Parms
p.t_len = t_len;
p.t_CR = t_CR;

p.fCR0 = fCR0;
p.phip = phip;
p.tgPi = tgPi;
p.tsigma = 5;

%% CR pulse
tnum = 5000;
t = linspace(t_CR-2 * t_len - 2 * tgPi, t_CR-1 * t_len - 2 * tgPi, tnum);
dt = (t_len) / (tnum - 1);
pulse = fCR_all(t,p);


%% Decompose-CR pulse
an = zeros([basis_num, 1]);

tstart = t_CR-2 * t_len - 2 * tgPi;
for idx=1:basis_num
    an(idx) = 2/t_len * sum( pulse .* sin(idx * pi / t_len * (t - tstart)) * dt , 2);
end


%% output
out = an;
end

function out = fCR_all(t, p)
%  CR Pumping Settings
t_len = p.t_len;
fCR0 = p.fCR0;
tsigma = p.tsigma;
tgPi = p.tgPi;

ts1 = -2 *tgPi - 2 * t_len + 3 * tsigma;
tf1 =  -2 *tgPi - 1 * t_len - 3 * tsigma;
ts2 = -1 *tgPi - 1 * t_len + 3 * tsigma;
tf2 = -1 *tgPi - 0 * t_len - 3 * tsigma;

% function of CR

fCR1 = fCR0 * ( exp(-(t - ts1).^2 / (2 * tsigma^2)) .* heaviside(-t + ts1) + ...
    (heaviside(t - ts1) - heaviside(t - tf1)) +  ...
    exp(-(t - tf1).^2 / (2 * tsigma^2)) .* heaviside(t - tf1));

fCR2 = -fCR0 * ( exp(-(t - ts2).^2 / (2 * tsigma^2)) .* heaviside(-t + ts2) + ...
    (heaviside(t - ts2) - heaviside(t - tf2)) +  ...
    exp(-(t - tf2).^2 / (2 * tsigma^2)) .* heaviside(t - tf2));

out = (fCR1 + fCR2);

end

function out = fCR_phase(t,p)
out = p.phip * ones(size(t));
end


