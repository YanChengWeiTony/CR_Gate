function [ output_args ] = SingleCase( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL


%% init

tot_basis_num = 15 + 15 + 1;
not_optimal_parms = 0;

x0 = [ 0.070415457156279
  -0.142373432430250
   0.116141326820623
  -0.041184307910945
   0.050491481039249
   0.009273259880977
   0.021887120434943
  -0.033467364408089
   0.022797410326149
  -0.039797451303542
  -0.000998886354329
   0.001184349479472
   0.000561425846489
   0.000747687397391
   0.000356853527314
   0.004404108491937
  -0.040767782379361
  -0.013568723562381
   0.020173444217889
  -0.011958190210241
  -0.038245705541513
   0.024580518253119
   0.004232720009826
   0.033867163919926
  -0.011761884378564
   0.000996802919148
  -0.001162769038273
  -0.000570763443509
  -0.000762702482984
  -0.000316313494594
   0.032671423993251];

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

