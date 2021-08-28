function [ output_args ] = SingleCase( input_args )
%% Spec
% fx_CR = sum_k a_k sin(w_k (t + tL))
% w_k = pi / tL
% phiCR = c0 + sum_k b_k sin(w'_k (t + tL)) + sum_k c_k cos(w'_k (t + tL))
% w'_k = pi / tL


%% init
%{p,s,q,r}
% resolution: 1E-3/2/pi GHz ~ 0.16 MHz
tot_basis_num = 8 + 8 + 8 + 8 + 2;
not_optimal_parms = 0;

x0 = [        
   0.234336742338174
  -0.004284112787110
   0.033995367895655
   0.002294482994791
   0.011726503882330
  -0.000123977385499
  -0.000253844334880
  -0.000042893121186
   0.018918159394093
  -0.000745989627826
   0.020693243802697
   0.001321922324813
   0.012916913780513
   0.000118390490510
   0.000242185273711
   0.000039006491481
   0.002742134366729
   0.011538515417558
  -0.005131496610482
  -0.006643363560096
  -0.003575800156721
   0.000022123491584
   0.000207576036747
  -0.000013466828646
   0.004380189027305
   0.011058940731377
   0.001507637901675
  -0.009265387391256
  -0.006884195948199
  -0.000023313446065
  -0.000206050755933
   0.000011057017041
   0.000075217377103
   0.000758230554261];

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

