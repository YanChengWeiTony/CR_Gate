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
           0.036523027930832
  -0.041528509132445
   0.019253284850645
  -0.048057904372137
   0.007977911798121
   0.004877200276076
   0.010576170551340
   0.003912776544203
   0.006937417491057
   0.002099925749871
   0.003210171324787
   0.000553406314921
   0.002516739944401
   0.000474788210087
   0.002119475466507
   0.006643078204964
   0.001352649037190
   0.008376352435688
   0.004440286166409
  -0.000498717242848
  -0.006340495707304
  -0.003359088557710
  -0.002518902596560
  -0.001235589048520
  -0.001024766945966
  -0.000743126095465
  -0.000356149211499
  -0.000153309654802
  -0.000277778518830
   0.000015146172741
   0.013119996354902];

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

