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
   0.918230583564554
   0.022578497590571
   0.067397236453380
   0.022731957831604
   0.080131714136031
   0.004943151205879
   0.005647993869435
   0.003765799357787
   0.004426451946771
   0.003011163038266
   0.458119425308606
  -0.052508244615065
   0.037490647321307
  -0.010287410512641
  -0.018741189774524
  -0.001681868510681
   0.000130560018137
  -0.001332915156158
  -0.000127170255501
  -0.001179526941735
  -0.107500723684774];

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

