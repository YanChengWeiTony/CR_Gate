function [ output_args ] = SingleCase_1( input_args )
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

t_CR = -0;

%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 16 + 10;
not_optimal_parms = 4;

x0_CR = zeros(tot_basis_num,1);
qk_rk_basis_num = 5;
pk_basis_num = tot_basis_num - 2 * qk_rk_basis_num;

x0_CR = [ 
    0.2371
   -0.0445
    0.0135
    0.0010
   -0.0245
    0.0010
   -0.0016
   -0.0019
   -0.0045
    0.0036
   -0.0017
    0.0013
   -0.0013
    0.0011
   -0.0005
    0.0012
    0.0029
   -0.0131
    0.0014
    0.0001
    0.0000
   -0.0061
    0.0075
   -0.0000
   -0.0001
   0.0001
];

myx0_CR = [x0_CR;phip;B;phac;t_CR];
p_g = zeros([tot_basis_num+not_optimal_parms,1]);


%% substitute into Numerical Simulation
[g] = Only_g_AC_plot_Import(myx0_CR)
% [g, p_g] = pg_g_AC_plot_Import(myx0)
end

