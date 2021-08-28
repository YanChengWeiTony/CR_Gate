function [ output_args ] = SingleCase( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL


%% init

tot_basis_num = 5 + 5 + 1;
not_optimal_parms = 0;

x0 = [        0.149307090111447
  -0.231904337383699
  -0.057514597950948
  -0.077703057463548
  -0.030972624210029
   0.010482929826623
  -0.006503700636657
  -0.001932891411668
   0.000402644282328
   0.005336268724892
  -0.003191483226930];

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

