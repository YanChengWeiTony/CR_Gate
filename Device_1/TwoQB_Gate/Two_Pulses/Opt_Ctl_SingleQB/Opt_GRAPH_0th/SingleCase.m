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
phip = 3.060;
B = 0.0545;
phac = -0.047;

t_CR = -0;


%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 8 + 8 + 8 + 8 + 1 + 1;
not_optimal_parms = 4;

x0 = [    0.1238
   -0.0030
   -0.0004
    0.0000
   -0.0000
   0
   0
   0
   
    0.0047
   -0.0002
   -0.0001
    0.0000
   -0.0000
   0
   0
   0
   
   0.000
   0.000
  -0.0000
   0
   0
   0
   0
   0
   
   0.009
  -0.005
   0.002
  -0.005
   0
   0
   0
   0
   
   0.0000
   
  -0.0002];



myx0 = [x0;phip;B;phac;t_CR];
p_g = zeros([tot_basis_num+not_optimal_parms,1]);

%% substitute into Numerical Simulation
% [g] = Perf_XI_plot_Import(myx0)
% [g] = DRAG_XI_plot_Import(myx0)
[g] = XI_Import(myx0)
% [g, p_g] = par_XI_Import(myx0)

p_g(16)
end

