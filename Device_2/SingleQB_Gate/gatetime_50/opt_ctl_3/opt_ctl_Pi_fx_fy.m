function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 50;



%% init
tot_basis_num = 25 + 25 + 1;
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
   0
   0
   0
   0
   0
   0
   0
   0
   0
   0
   
      0
   0
   0
   0
   0
   0
   0
   0
   0
   0
   0.012643078204964
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

   
   0.001119996354902];

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