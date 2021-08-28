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
   0.448642340769706
  -0.041801105757566
   0.095111569663819
  -0.000537241900847
   0.061876933495147
   0.008880069078134
   0.045998819610013
   0.005238603308661
   
   0.085436939058711
  -0.037695734672558
   0.075654256846498
  -0.001039655767173
   0.043830875967381
  -0.010267730170169
   0.020498557779434
  -0.005362088877805
  
  -0.016793758378067];

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

