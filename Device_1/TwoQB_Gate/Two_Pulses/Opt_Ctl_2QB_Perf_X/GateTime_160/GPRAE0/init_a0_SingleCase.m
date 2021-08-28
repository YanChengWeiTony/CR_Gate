function [ output_args ] = init_a0_SingleCase( input_args )
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
phip = 3.09;
B = 0.0325;
phac = 0.0823;

t_CR = 0;

%% init
%{p,s,q,r}
tot_basis_num = 40 + 6;
not_optimal_parms = 4;

x0 = zeros(tot_basis_num,1);
qk_rk_basis_num = 3;
pk_basis_num = tot_basis_num - 2 * qk_rk_basis_num;


x0 = [Init_a0( t_len, tgPi, fCR0, phip, 40 );zeros(6,1)];
% Plot_x0_Import([x0;zeros(6,1)], t_len, tgPi);

myx0 = [x0;phip;B;phac;t_CR];
p_g = zeros([tot_basis_num+not_optimal_parms,1]);

%% substitute into Numerical Simulation
[g] = Only_g_Fully_Numerical_ActiveCancellation_Import(myx0)
% [g, p_g] = fully_Numerical_ActiveCancellation_Import(myx0)
end

