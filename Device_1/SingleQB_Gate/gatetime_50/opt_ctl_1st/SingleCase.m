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

x0 = [      0.050744185206130
  -0.011428132354739
  -0.002834623420687
  -0.003546559699648
  -0.001550170669503
  -0.000011205743018
  -0.000009343978085
  -0.000004930390298
  -0.000007062799748
  -0.000003653738654
   0.001126502488807
  -0.000643824266608
   0.000977691340111
   0.000045594763795
   0.000711914760018
   0.000001170274488
  -0.000008400298042
  -0.000004836448386
  -0.000005785746438
  -0.000004605928386
  -0.000515404067582];

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

