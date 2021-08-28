function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% init Parms


opt_parm_num = 5 + 5 + 5 + 5 + 1;
not_opt_num = 2;

phip = -1.275;
phac = 3.200;

input0 = [    0.1556170158
-0.0228326477
-0.0010892410
0.0059608669
-0.0172586793
0.0347282361
0.0125499378
0.1459753508
-0.0147236914
-0.0657879927
0.0055331710
-0.0030026141
0.0128014190
0.0108706558
0.0084993805
0.0052469942
-0.0117703042
-0.0081398467
-0.0050387791
0.0376558436
0.9649181454
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