function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 10;



%% init
tot_basis_num = 16 + 16 + 16 + 16 + 2;
not_optimal_parms = 0;

x0 = [        
   0.217338970291459
  -0.005709707472652
   0.047213196911602
   0.000147618743845
   0.108636058164520
  -0.001911107082751
  -0.012290673405265
  -0.004844988613327
  -0.022754562373669
   0.001034833428266
  -0.019196950899114
   0.000903620749746
   0
   0
   0
   0
   
   0.014884244858270
  -0.000377251009584
   0.039124777679784
   0.003376134457163
   0.098632055678208
  -0.001588437655784
  -0.011475438839174
  -0.001057989058982
  -0.012182095572871
  -0.006344570736109
  -0.022804757703088
  -0.006080589166157
  0
  0
  0
  0
  
  -0.000186592327352
   0.013130776397810
  -0.017428473479300
  -0.047591902215518
   0.010666005179694
  -0.016195801533302
   0.024146613054441
   0.040696335202903
   0.027376801953330
   0.023097352677324
   0.013615819588162
   0.012531764988935
   0
   0
   0
   0
   
  -0.020105431224972
   0.013309601396463
  -0.017097849578941
  -0.045039439708937
  -0.063389462746460
  -0.017563797022273
  -0.006764377646141
   0.046396707068379
   0.022511106238285
   0.006784640163296
   0.017792409928190
   0.015808021707524
   0
   0
   0
   0
   
   0.000644944102386
  -0.046030991867220];


%% process
myx0 = [x0];
p_g = zeros([tot_basis_num+not_optimal_parms,1]);


%% Run

lb=[-2 * ones([1 tot_basis_num])];
ub=[3 * ones([1 tot_basis_num])];

%aeq, beq
aeq = zeros(tot_basis_num+not_optimal_parms);
for a=1:not_optimal_parms
    aeq(tot_basis_num+a,tot_basis_num+a)=1;
end

beq = zeros([tot_basis_num+not_optimal_parms 1]);
for a=1:not_optimal_parms
    beq(tot_basis_num+a)=myx0(tot_basis_num+a);
end

% optimal
x = fmincon(@par_XI_Import, myx0,[],[],aeq,beq,lb,ub,[],options);
x(1:tot_basis_num)
x(tot_basis_num+1:end)

delete(gcp('nocreate'))
end

function [c, ceq] = nonlcon(x)
c = -1;
ceq = 0;
end