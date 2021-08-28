function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% init- Parms


opt_parm_num = 5 + 5 + 5 + 5 + 1;
not_opt_num = 2;

phip = -0.14;
phac = 3.25;



input0 = [    
0.2519582458
     0.0062909909
     -0.0382409773
     0
     0
     
     0.0148021712
     -0.0021505745
     -0.0012494955
     0
     0
     
     0.0010327086
     -0.0045158534
     0.0114156369
     0
     0
     
     0.0002332443
     0.0008827301
     -0.0009176164
     0
     0
     
     -0.3461678315

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