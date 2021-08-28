function [ output_args ] = SingleCase( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL


%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 5 + 5 + 1;
not_optimal_parms = 0;

x0 = [        
   0.477967839272965
  -0.010154228870746
   0.031335469526769
   0.004559060477659
   0.040952527607716
   
   0.080406939080113
   0.013144455947706
  -0.002686157498399
  -0.003159337070323
  -0.022982596021715
  
   0.000];

%% process
myx0 = [x0];
p_g = zeros([tot_basis_num+not_optimal_parms,1]);

%% substitute into Numerical Simulation
% [g] = Perf_XI_plot_Import(myx0)
% [g] = DRAG_XI_plot_Import(myx0)
% [g] = XI_plot_Import(myx0)
[g] = XI_Import(myx0)
% [g, p_g] = par_XI_plot_Import(myx0)
% [g, p_g] = par_XI_Import(myx0)
end

