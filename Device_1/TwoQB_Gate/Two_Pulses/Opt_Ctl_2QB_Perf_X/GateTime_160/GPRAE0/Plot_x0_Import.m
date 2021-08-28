function [ output_args ] = Plot_x0_Import( x, t_len, tgPi)
%% Basis
tot_basis_num = size(x,1);


qk_rk_basis_num = 3;
pk_basis_num = tot_basis_num - 2 * qk_rk_basis_num;

%% x

% x = zeros(tot_basis_num,1);
% x = [
%         0.2420
%     0.0068
%     0.0809
%     0.0194
%     0.0242
%     0.0160
%     0.0153
%     0.0009
%    -0.0152
%    -0.0082
%    -0.0050
%     0.0029
%    -0.0020
%    -0.0005
%    -0.0121
%    -0.0045
%    -0.0021
%     0.0177
%    -0.0065
%    -0.0154
%     0.0135
%    -0.0267
%    -0.0644
%    -0.0617
%     0.0380
%    -0.0116];
% 



%% {p,q,r}
pn = x(1:pk_basis_num);
qn = x(pk_basis_num + 1: pk_basis_num + qk_rk_basis_num);
rn = x(pk_basis_num + qk_rk_basis_num + 1:end);


%% time settnigs
t_CR = 0;

t_I = t_CR-2 * t_len - 2 * tgPi - 20;
t_F = t_CR + 20;
t_num = 10000;


t = linspace(t_I, t_F, t_num);

%% pn
global fx0_ary fy0_ary
fx0_ary = myfx0(pn, t_len, tgPi, t_CR, t_num, t);
fy0_ary = myfy0(qn, rn, t_len, tgPi, t_CR, t_num, t);


%% parms
B = 0.0481;

p.t_CR = t_CR;
p.tgPi = tgPi;
p.t_len = t_len;
p.B = B;
p.t_I = t_I;
p.t_F = t_F;
p.t_num = t_num;


%% Plot

% Plot pumping, phase
figure(1)
plot(t, fx0_ary/(2*pi), 'green-', 'linewidth', 1); hold on
plot(t, fy0_ary/(2*pi), 'green-.', 'linewidth', 1); hold on
plot(t, fx(t, p)/(2*pi), 'blue-', 'linewidth', 1); hold on
plot(t, fAc_x(t, p)/(2*pi), 'Color', [0.3 0.1 0.1], 'linewidth', 1, 'linestyle', '-');
plot(t, fAc_y(t, p)/(2*pi), 'Color', [0.3 0.1 0.1], 'linewidth', 1, 'linestyle', '-.');
xlabel('time(ns)')
ylabel('Amp(GHz)')
grid on

end

%% CR pumping: fx0, fy0
function out = myfx0(pn, t_len, tgPi, t_CR, t_num, t)

basis_num = size(pn,1);

ts1 = t_CR -2 *tgPi - 2 * t_len;
tf1 =  t_CR-2 *tgPi - 1 * t_len;
ts2 = t_CR-1 *tgPi - 1 * t_len;
tf2 = t_CR-1 *tgPi - 0 * t_len;


Buf_p1 = heaviside(t - ts1) -  heaviside(t - tf1);
Buf_p2 =  -(heaviside(t - ts2) - heaviside(t - tf2));

out = zeros([1, t_num]);

for idx=1:basis_num
    out = out + pn(idx) * (sin(idx * pi / t_len * (t - ts1)) .* Buf_p1 + sin(idx * pi / t_len * (t - ts2)) .* Buf_p2);
end

end


function out = myfy0(qn, rn, t_len, tgPi, t_CR, t_num, t)

q_basis_num = size(qn,1);
r_basis_num = size(rn,1);

ts1 = t_CR -2 *tgPi - 2 * t_len;
tf1 =  t_CR-2 *tgPi - 1 * t_len;
ts2 = t_CR-1 *tgPi - 1 * t_len;
tf2 = t_CR-1 *tgPi - 0 * t_len;

Buf_q = heaviside(t - ts1) -  heaviside(t - tf1);
Buf_r =  - (heaviside(t - ts2) - heaviside(t - tf2));

out_q = zeros([1, t_num]);
for idx=1:q_basis_num
    out_q = out_q + qn(idx) * sin(idx * pi / t_len * (t - ts1)) .* Buf_q;
end

out_r = zeros([1, t_num]);
for idx=1:r_basis_num
    out_r = out_r + rn(idx) * sin(idx * pi / t_len * (t - ts2)) .* Buf_r;
end

out = out_q + out_r;
end

%% Pi Pulse Pumping
function out = fx(t, p)
% Pi pulse settings
tgPi = p.tgPi;
tsigmaPi = tgPi / 6; % assume 6 sigma = tg
f0Pi = pi^.5/2^.5 / tsigmaPi / 2;

tcPi1 = p.t_CR - p.t_len - 1.5 * p.tgPi;
tcPi2 = p.t_CR - 0.5 * p.tgPi;

% function of pi pulse
fxPi = f0Pi * (exp(-(t - tcPi1).^2 / (2 * tsigmaPi^2)) + exp(-(t - tcPi2).^2 / (2 * tsigmaPi^2)));
out = fxPi;
end

%% Active Cancellation Pumping

function out = fAc_x(t,p)
global fx0_ary
idx = 1 + round((p.t_num - 1) * (t - p.t_I) / (p.t_F - p.t_I));
out = p.B * fx0_ary(idx);
end

function out = fAc_y(t,p)
global fy0_ary
idx = 1 + round((p.t_num - 1) * (t - p.t_I) / (p.t_F - p.t_I));
out = p.B * fy0_ary(idx);
end
