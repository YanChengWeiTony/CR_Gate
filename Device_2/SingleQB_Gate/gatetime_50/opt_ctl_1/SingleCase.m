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
        0.048576290956512
  -0.047054513263236
   0.003220486710600
  -0.047491193505104
   0.001133453583609
   0.001299381822031
   0.005378760365193
   0.001945588003271
   0.003064519035172
   0.001224095125745
   0.029904244738989
   0.004420298199329
  -0.017603336758620
   0.008619495017244
  -0.009332308435341
  -0.000705249761862
  -0.004238351705696
  -0.002411476355766
  -0.000051354246362
  -0.000605478668867
   0.032756965015985];

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

