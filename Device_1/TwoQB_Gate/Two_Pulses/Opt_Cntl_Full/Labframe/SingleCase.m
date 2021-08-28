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
% fCR0 = 0.198;
phip = 3.072;
B = 0.0505;
phac = -0.225;

t_CR = -0;

%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 5 + 2*2;
not_optimal_parms = 4;

x0 = zeros(tot_basis_num,1);

x0 = [ 
    0.2381
   -0.0445
    0.0135
    0.0000
   -0.0245

    0.006
   -0.002
    
   -0.006
    0.002
];

myx0 = [x0;phip;B;phac;t_CR];
p_g = zeros([tot_basis_num+not_optimal_parms,1]);

%% substitute into Numerical Simulation
% [g] = Only_g_AC_plot_Import(myx0)
% [g, p_g] = pg_g_AC_plot_Import(myx0)
[g] = LabFrame_Only_g_AC_plot_Import(myx0)
end

