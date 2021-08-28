function [ output_args ] = opt_ctl_Pi_fx_fy( input_args )
%% Spec

%% init- Parms


opt_parm_num = 16 + 16 + 16 + 16 + 1;
not_opt_num = 2;

phip = -0.0080;
phac = 3.250;

input0 = [    
         0.3271115885
     0.0016772910
     0.0970589377
     -0.0025197755
     0.0290225919
     0.0014617083
     -0.0079121863
     0.0035780974
     -0.0282828334
     0.0057468626
     -0.0105817366
     -0.0032086759
     0
     0
     0
     0
     
     -0.0176438284
     -0.0121383124
     -0.0066353115
     0.0040384062
     0.0018886596
     -0.0095649307
     0.0027752804
     0.0102544752
     -0.0011913815
     0.0079499084
     0.0064662094
     -0.0097860533
     0
     0
     0
     0
     
     0.0057016253
     0.0050196380
     -0.0227895232
     0.0070855739
     0.0277955746
     0.0065802502
     0.0091333339
     -0.0016988244
     0.0022178408
     -0.0027141059
     0.0105105910
     -0.0022212710
     0
     0
     0
     0
     
     -0.0011388455
     0.0001352014
     0.0045962959
     -0.0000925717
     -0.0011124533
     -0.0023427377
     -0.0034534061
     0.0011551850
     -0.0002816614
     0.0045020375
     -0.0042822251
     -0.0062393631
     0
     0
     0
     0
     
     -1.5765427564

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