function [ output_args ] = SingleCase( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL


%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 15 + 15 + 1;
not_optimal_parms = 0;

x0 = [      0.123800799753712
  -0.000009658086301
  -0.000417795850005
  -0.000008769176040
  -0.000018752874878
  -0.000005573423489
  -0.000008204552488
  -0.000004737024737
  -0.000017446687690
  -0.000005074571147
  -0.000065786674440
  -0.000016513395207
   0.000033002987707
   0.000006492858918
   0.000116727670238
   0.004687840870378
  -0.000178253868028
  -0.000063730663062
   0.000011431850711
   0.000034394733698
   0.000001114434695
   0.000020907571517
   0.000001576752773
   0.000029692508657
   0.000002514396797
   0.000077060361421
   0.000014343729287
  -0.000022602096047
  -0.000008368830270
  -0.000106994567845
  -0.000075404422661];

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

