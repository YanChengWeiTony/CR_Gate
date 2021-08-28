function [ output_args ] = SingleCase( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL


%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 12 + 12 + 1;
not_optimal_parms = 0;

x0 = [        
      0.402322422744022
  -0.151514014610101
   0.172196646807777
  -0.021766715880663
   0.096312452665149
   0.036633752880805
   0.062480679078133
   0.037290742093094
   0.025675656445547
   0.049365477046392
   0.026640086684050
   0.042053638551185
   0.095117380758235
  -0.155425567665795
   0.166852334104106
  -0.031805160864760
   0.148304894074888
  -0.024635981723020
   0.110785082738562
  -0.014863128631296
   0.058584369410460
  -0.022962273093171
   0.042653109515256
  -0.016709679314034
  -0.078169918788579];

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

