function [ output_args ] = SingleCase( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL


%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 5 + 5 + 5 + 5 + 2;
not_optimal_parms = 0;

x0 = [        
   0.272422739034554
  -0.005077702036888
   0.138095389333432
   0.006414221968443
   0.067955698048560
   0.025345673230313
  -0.002942616133615
   0.090249109511124
   0.006150417713614
   0.064110199249134
  -0.002538073570029
  -0.002947673082863
   0.009300953996740
  -0.000128892268046
  -0.003166349726838
  -0.014784460061093
  -0.007950280164445
   0.013237241152093
   0.002387335590829
  -0.003226387472605
  -0.000273313631593
   0.001851351287212];

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

