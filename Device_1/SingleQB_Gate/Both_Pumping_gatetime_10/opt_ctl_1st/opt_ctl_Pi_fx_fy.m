function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);


%% Calculate gate total time
tgPi = 10;



%% init
tot_basis_num = 8 + 8 + 8 + 8 + 2;
not_optimal_parms = 0;

x0 = [        
   0.234376092174390
  -0.004303594023349
   0.033999325594942
   0.002295696958236
   0.011647998628467
   0
   0
   0
   
   0.019107039208961
  -0.000630435100758
   0.020691100081849
   0.001334082278386
   0.013010043693264
   0
   0
   0
   
   0.002830216718094
   0.011547945236560
  -0.005096306701492
  -0.006645343865240
  -0.003521212496106
  0
  0
  0
  
   0.004360199317350
   0.011078155344885
   0.001477238439613
  -0.009260760938002
  -0.006934358405450
  0
  0
  0
  
  -0.000046457709664
   0.000755747297791];


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