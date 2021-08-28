function [ output_args ] = SingleCase( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL

%% Calculate gate total time
tgPi = 20;
GateTime = 160;

t_len = (GateTime - 2 * tgPi) /2;

%% Parms
fCR0 = 0.198;
phip = 3.105;
B = 0.0445;
phac = 0.047;

t_CR = 0;

%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 8 + 6;
not_optimal_parms = 4;

x0 = zeros(tot_basis_num,1);
qk_rk_basis_num = 3;
pk_basis_num = tot_basis_num - 2 * qk_rk_basis_num;

x0 = [    0.2359
   -0.0447
    0.0132
    0.0008
   -0.0251
    0.0005
   -0.0040
    0.0003
    0.0023
   -0.0133
    0.0015
   -0.0055
    0.0097
    0.0004];

myx0 = [x0;phip;B;phac;t_CR];
p_g = zeros([tot_basis_num+not_optimal_parms,1]);

%% substitute into Numerical Simulation
[g] = Only_g_Fully_Numerical_ActiveCancellation_Import(myx0)
% [g, p_g] = fully_Numerical_ActiveCancellation_Import(myx0)
end

