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
   0.234376092174390
  -0.004303594023349
   0.033999325594942
   0.002295696958236
   0.011647998628467
   0.019107039208961
  -0.000630435100758
   0.020691100081849
   0.001334082278386
   0.013010043693264
   0.002830216718094
   0.011547945236560
  -0.005096306701492
  -0.006645343865240
  -0.003521212496106
   0.004360199317350
   0.011078155344885
   0.001477238439613
  -0.009260760938002
  -0.006934358405450
  -0.000046457709664
   0.000755747297791];

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

