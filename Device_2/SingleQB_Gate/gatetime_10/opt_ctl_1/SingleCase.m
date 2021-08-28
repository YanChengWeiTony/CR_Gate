function [ output_args ] = SingleCase( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL


%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 8 + 8 + 1;
not_optimal_parms = 0;

x0 = [         
   0.259464780559657
  -0.185480149059360
  -0.018117662681833
  -0.037295327033618
  -0.016782028916110
  -0.000963544597038
   0.000486223368799
   0.000121065511730
   0.012097773672297
  -0.049188286503367
  -0.019073722702074
  -0.030078606735698
  -0.007152720969654
   0.000878887676859
  -0.000288116126893
  -0.000241025741577
   0.010511478936885];

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

