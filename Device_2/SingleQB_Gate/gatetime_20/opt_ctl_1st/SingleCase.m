function [ output_args ] = SingleCase( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL


%% init

tot_basis_num = 10 + 10 + 1;
not_optimal_parms = 0;

x0 = [          0.072284764231151
  -0.142801481583020
   0.117814610622913
  -0.041788118709431
   0.051827394847182
   0.009638779636613
   0.023036031337497
  -0.034517072384328
   0.020816696817995
  -0.040980027173565
  -0.000887718940075
  -0.036543836645484
  -0.016691967265453
   0.021266271318362
  -0.013243355180525
  -0.038870409437662
   0.023515454441249
   0.005238347690061
   0.035785029135056
  -0.010498273811884
   0.013880176643804];

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

