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

x0 = [          0.246813719778258
  -0.000784472052602
   0.003575260526664
  -0.000284953068954
  -0.000246936329704
  -0.000225909820275
   0.000471474415648
   0.000063815263151
   0.001458549409550
   0.000048286870889
   0.020047921025880
  -0.003610515343245
   0.002305967829196
   0.001998753368182
   0.003289489330273
   0.000259853466679
   0.000257565233624
  -0.000042897138919
  -0.000841415204804
  -0.000032209320600
  -0.001892246637913];

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

