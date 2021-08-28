function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% init- Parms


opt_parm_num = 7 + 7 + 7 + 7 + 1;
not_opt_num = 2;


phip = -0.085;
 phac = 3.250;
 
input0 = [ 
    0.0965610021
     -0.0007228172
     0.0224055451
     0.0001462357
     -0.0026762560
     0
     0
     
     -0.0020132351
     0.0000230662
     -0.0011915325
     -0.0000290717
     -0.0000484381
     0
     0
     
     0.0001962645
     0.0014824645
     0.0033722341
     0.0007860691
     0.0080055673
     0
     0
    
     0.0001614626
     -0.0003993807
     -0.0006161951
     -0.0000297480
     -0.0002045512
     0
     0
    
     0.7037662177
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