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
phip = 3.0735;
B = 0.0495;
phac = -0.2035;

t_CR = -0;

%% init - CR
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 10 + 5*2;
not_optimal_parms = 4;

x0_CR = zeros(tot_basis_num,1);

x0_CR = [ 
    0.2381
   -0.0442
    0.0135
    0.0010
   -0.0245
         0
   -0.0005
         0
         0
         0.
         
    0.0045
   -0.0040
   -0.0040
   -0.0005
         0
         
   -0.0035
    0.0085
    0.0080
   -0.0010
   -0.0015
];

myx0_CR = [x0_CR;phip;B;phac;t_CR];


p_g = zeros([tot_basis_num+not_optimal_parms,1]);

%% substitute into Numerical Simulation
[g] = Only_g_AC_plot_Import(myx0_CR)
% [g, p_g] = pg_g_AC_plot_Import(myx0)
end

