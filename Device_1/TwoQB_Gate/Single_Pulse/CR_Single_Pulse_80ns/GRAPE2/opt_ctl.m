function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% init- Parms


opt_parm_num = 8 + 8 + 8 + 8 + 1;
not_opt_num = 2;

phip = -0.0080;
phac = 3.250;

input0 = [    
          0.323201993865724
   0.017278422707036
   0.063986101552894
  -0.002713124890800
   0.009528573747377
   0
   0
   0
   
  -0.015407749417072
   0.027764614343015
  -0.001191334210388
   0.006856084439486
  -0.000769784378530
  0
  0
  0
  
   0.006617378794606
  -0.007499547896133
  -0.026303930331765
   0.002984731596434
   0.041598059632323
   0
   0
   0
   
  -0.001382919974201
   0.000315205309761
   0.006498867294158
   0.002603192247994
  -0.005664176901062
  0
  0
  0
  
  -1.505781967970210
 phip
 phac
 ];




p_g = zeros([size(input0, 1),1]);


%% boundary

lb=[-2 * ones([1 opt_parm_num ]),phip, phac];
ub=[3 * ones([1 opt_parm_num ]),phip, phac];

%aeq, beq
aeq = zeros(opt_parm_num + not_opt_num);
for a=1:not_opt_num 
    aeq(opt_parm_num +a,opt_parm_num +a)=1;
end

beq = zeros([opt_parm_num + not_opt_num, 1]);

for a=1:not_opt_num
    beq(opt_parm_num+a)=input0(opt_parm_num+a);
end

%% Options
parpool('local')
options = optimoptions('fmincon','Display','iter-detailed','SpecifyObjectiveGradient',true,'Algorithm','sqp','OptimalityTolerance', 1e-10, 'UseParallel', true);

%% Run
% optimal
x = fmincon(@Par_no_plot_Import, input0,[],[],aeq,beq,lb,ub,[],options);
x(1:opt_parm_num)
x(opt_parm_num+1:end)
sprintf('%.10f\n', x(1:opt_parm_num))
sprintf('%.10f\n', x(opt_parm_num+1:end))

delete(gcp('nocreate'))

end

function [c, ceq] = nonlcon(x)
c = -1;
ceq = 0;
end