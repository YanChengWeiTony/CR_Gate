function [ output_args ] = SingleCase( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL


%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 5 + 5 + 5 + 5 + 2;
not_optimal_parms = 0;

x0 = [        
   0.424293557428625
   0.001245192895873
   0.181759190534945
   0.003601624105913
   0.080422421771377
   0.065777718955055
   0.002484934808394
   0.176357070554238
   0.005549555418004
   0.121368241611833
   0.006112790298511
  -0.016344727599159
  -0.011683091323423
   0.002678331385944
  -0.003592929712511
  -0.002898068408623
  -0.019145888103634
  -0.007907566627424
  -0.003861998450250
   0.000012382893126
   0.001870178732205
   0.005700392538694];

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

