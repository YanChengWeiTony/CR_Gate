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
tot_basis_num = 12 + 6;
not_optimal_parms = 4;

x0 = zeros(tot_basis_num,1);
qk_rk_basis_num = 3;
pk_basis_num = tot_basis_num - 2 * qk_rk_basis_num;

x0 = [ 0.2371
   -0.0447
    0.0136
    0.0006
   -0.0245
    0.0005
   -0.0025
    0.0017
   -0.0030
    0.0011
   -0.0001
    0.0005
    0.0020
   -0.0131
    0.0013
   -0.0058
    0.0096
    0.0003];

myx0 = [x0;phip;B;phac;t_CR];
p_g = zeros([tot_basis_num+not_optimal_parms,1]);

%% substitute into Numerical Simulation
[g] = Only_g_Fully_Numerical_ActiveCancellation_plot_pop_Import(myx0)
% [g, p_g] = fully_Numerical_ActiveCancellation_Import(myx0)
end

