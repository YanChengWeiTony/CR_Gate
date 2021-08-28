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

x0 = [         0.247866969147072
  -0.000469306049120
   0.002034010379385
  -0.000735357922065
  -0.001344335532919
   0.019491815930495
  -0.003755696831165
   0.002037376828855
   0.002435966812921
   0.003522422508745
  -0.001772695347820];

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

