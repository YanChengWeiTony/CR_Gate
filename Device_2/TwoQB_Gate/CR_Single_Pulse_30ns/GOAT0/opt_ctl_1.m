function [ output_args ] = opt_ctl_1( input_args )
%% Spec

%% init Parms
opt_parm_num = 5 + 5 + 5 + 5 + 1;
not_opt_num = 2;


phip = -2.550;
phac = 3.16;



input0 = [   0.385
     0.215
     0.13
     -0.07
     0.02
     -0.09
     0.03
     0.24
     0.05
     -0.002
     0.068
     -0.015
     -0.024
     0.023
     0.017
     0.0055
     0.0054
     0.001
     -0.028
     0.035
     1.13
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