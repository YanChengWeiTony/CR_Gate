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

x0 = [      0.165435364244494
   0.000087844826526
  -0.000565193961167
  -0.000518137081411
  -0.000496947494008
  -0.000668562512593
  -0.000202760948348
  -0.002086192441791
   0.000092013434553
  -0.000146022001254
  
   0.009629974399457
  -0.004177015302430
   0.002376514220827
   0.001235543531227
   0.001860083787338
   0.001054614283577
   0.000378684605032
   0.002428171080370
   0.000054290870263
   0.000452781083504
   
  -0.002132845196774];

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

