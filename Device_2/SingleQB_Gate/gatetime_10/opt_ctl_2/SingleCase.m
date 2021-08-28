function [ output_args ] = SingleCase( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL


%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 12 + 12 + 1;
not_optimal_parms = 0;

x0 = [         
     0.259464793479567
  -0.185480537260762
  -0.018117852166441
  -0.037295637668210
  -0.016781498778712
  -0.000963845385437
   0.000486515500845
   0.000121042643405
   0.000000532219258
  -0.000000147304405
   0.000000297026505
  -0.000000046440769
   0.012099196340052
  -0.049187464587711
  -0.019074427540284
  -0.030078376510496
  -0.007153035178732
   0.000879069361189
  -0.000288171472948
  -0.000241092939288
  -0.000000349323721
   0.000000084275304
  -0.000000139332099
  -0.000000008220388
   0.010518480524679];

%% process
myx0 = [x0];
p_g = zeros([tot_basis_num+not_optimal_parms,1]);

%% substitute into Numerical Simulation
% [g] = Perf_XI_plot_Import(myx0)
% [g] = DRAG_XI_plot_Import(myx0)
[g] = XI_plot_Import(myx0)
% [g] = XI_Import(myx0)
% [g, p_g] = par_XI_plot_Import(myx0)
% [g, p_g] = par_XI_Import(myx0)
end

