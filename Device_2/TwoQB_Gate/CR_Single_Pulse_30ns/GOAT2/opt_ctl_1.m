function [ output_args ] = opt_ctl_1( input_args )
%% Spec

%% init Parms
opt_parm_num = 10 + 10 + 10 + 10 + 1;
not_opt_num = 2;

phip = -2.550;
phac = 3.160;

input0 = [ 0.3021118269
     0.2382710639
     -0.0064507298
     -0.0437903879
     -0.0253855721
     -0.0279110076
     -0.0204636872
     -0.0030123006
     0
     0
     
     -0.2968100260
     0.1316321595
     0.1482268495
     -0.0591702248
     0.0191390293
     -0.0047976086
     -0.0231548569
     0.0035507687
     0
     0
     
     0.0833953017
     0.0718181333
     -0.0488844161
     0.0450655517
     -0.0155592756
     0.0026461934
     0.0097888725
     -0.0354386342
     0
     0
     
     -0.0154255635
     0.0080750029
     0.0123987471
     -0.0225606754
     0.0055535051
     -0.0102795527
     -0.0152193000
     0.0146557947
     0
     0
     
     1.1158431206
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