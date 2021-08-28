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

x0 = [
          0.478953109799293
  -0.008012245595477
   0.035695142549275
   0.002989574613742
   0.030133139002011
   0.001571811335648
   0.016784060372891
   0.002546311753315
   0.014231214260792
   0.000961385789097
   0.010356605961106
  -0.004873725397580
   0.005821918658847
  -0.005288533942334
   0.005374168283306
   0
   0
   0
   0
   0
   
   0.072916032550247
  -0.005912797018001
   0.024328943703922
   0.003044155159207
   0.005080540951310
   0.000564063634130
   0.001118394393027
  -0.000755656605745
  -0.000557489490258
   0.000458291347592
  -0.001686015038923
  -0.000578968765697
   0.001518168783398
   0.000386556823550
   0.001048473714178
   0
   0
   0
   0
   0
   
  -0.001726591850617];

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

