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
    0.484551142779369
  -0.001574857762013
   0.014498127183997
   0.002557109018952
   0.042360252870292
   0.081321048263000
  -0.002590179155787
  -0.001295538960501
   0.000211455583308
  -0.032404818283308
  -0.003823486677334];

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

