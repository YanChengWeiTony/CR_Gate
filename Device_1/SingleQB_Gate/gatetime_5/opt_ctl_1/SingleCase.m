function [ output_args ] = SingleCase( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL


%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 10 + 10 + 1;
not_optimal_parms = 0;

x0 = [
       0.488037407487497
  -0.026036243829591
   0.020233927090045
   0.008566308179749
   0.029693656468749
   0.017887338442208
   0.006478988586107
   0.012203729874473
   0.007861036373015
   0.014901108361499
   0.077529170379364
  -0.032994426851706
   0.006908668883916
   0.008954539243116
  -0.013743040616188
  -0.007708576840997
  -0.002330070258488
  -0.003311437965372
  -0.004738080562420
  -0.007365358581751
  -0.012824758671384];

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

