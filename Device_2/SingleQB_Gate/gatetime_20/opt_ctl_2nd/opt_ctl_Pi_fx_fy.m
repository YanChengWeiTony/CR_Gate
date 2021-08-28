function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 20;



%% init

tot_basis_num = 15 + 15 + 1;
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
  0
  0
  0
  0
  0
  
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
  0
  0
  0
  0
  0
  
   0.013880176643804];


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