function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% init Parms


opt_parm_num = 10 + 10 + 10 + 10 + 1;
not_opt_num = 2;

phip = -1.275;
phac = 3.200;

input0 = [  0.1592985166
     -0.0217239337
     -0.0043974797
     0.0094457968
     -0.0199670448
     0.0075738844
     -0.0014286422
     0.0017310696
     0
     0
     
     0.0331915945
     0.0144693195
     0.1389989938
     -0.0136429814
     -0.0677363756
     -0.0032480424
     -0.0093119729
     0.0007656463
     0
     0
     
     0.0044231151
     -0.0033641292
     0.0139444552
     0.0133372344
     0.0123947281
     0.0029271577
     -0.0056880969
     0.0019171759
     0
     0
     
     0.0072717907
     -0.0148792362
     -0.0088911147
     -0.0032271185
     0.0322817992
     0.0004337960
     -0.0097842585
     -0.0005724477
     0
     0
     
     0.9644899923
 phip
 phac
 ];




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