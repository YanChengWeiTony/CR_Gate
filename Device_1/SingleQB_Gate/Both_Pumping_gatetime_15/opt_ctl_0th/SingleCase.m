function [ output_args ] = SingleCase( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL


%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 5 + 5 + 5 + 5 + 1;
not_optimal_parms = 0;

x0 = [        
   0.166213166528276
  -0.023876105559822
  -0.001897922782440
  -0.007352634221017
  -0.002278587819688
   0.009149863009739
   0.000351334054652
   0.006330338678628
  -0.006273592827288
  -0.001560320487498
  -0.000201173418575
   0.011304042575717
   0.004332868437324
   0.025917572480242
  -0.005831212426446
   0.005043373898860
  -0.014655616425260
   0.002735074276162
   0.022485695067468
  -0.007781553823354
   0.001146868139358
  -0.000126389559877];

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

