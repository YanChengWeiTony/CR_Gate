## FRAME -> omega = 32.1357 GHz = 1st qubit dressed state


### XI_plot_Import: fully Numerical simulation, calculate infiedlirt g


### Par_XI_plot_Import:  fully Numerical simulation, calculate infiedlirt  partial-g


# Notes:
1. 
a. all stand on the undriven basis
b. 
omega1: control-qubit frequency
omega2: target-qubit frequency
omegap: the frequency of the frame I am standing

--------------------------------------------------------------------
p.omegap: the frequency of the frame I am standing
p.omega1: the driving-microeave frequency at the control qubit.

2.
    gate time = 15 ns
    lev = 5
    
3. optimal variables: 
a. fx (freq initially matches 1st qubit dressed state)
b. fy (freq initially matches 1st qubit dressed state)
c. Detuneing
d. fx2 (freq initially matches 2md qubit dressed state)
e. fy2 (freq initially matches 2nd qubit dressed state)
f. Detuneing2
d. Detuneing offset
d. Detuneing offset2


4. Spec
Input:

        % an: fx
        % bn: fy
        % cn: Detuning
        % dn: fx_2 (target)
        % en: fy_2 (target)
        % fn: Detuning_2 (target)

        % phip (not optimize)
        % phac (not optimize)

5. initial:
    since we are at the undriven basis
    
        init = Identity
    
6. Fidelity:
    Suppose get U, and an ideal propagator U_I
    
        F = tr( U_I^{dagger} @ U )

init:

    x0 = [        
     0.166213166528276
    -0.023876105559822
    -0.001897922782440
    -0.007352634221017
    -0.002278587819688
     0.009149863009739
     0.000351334054652
     0.006330338678628
    -0.006273592827288
    -0.001560320487498
    -0.000201173418575
     0.011304042575717
     0.004332868437324
     0.025917572480242
    -0.005831212426446
     0.005043373898860
    -0.014655616425260
     0.002735074276162
     0.022485695067468
    -0.007781553823354
     0.001146868139358
    -0.000126389559877];

    infid = 1.5E-5


after

    x0 = [        
     0.167557057826457
    -0.029109441196752
    -0.000749690677018
    -0.012775401389902
    -0.007942723907204
    -0.004970642172337
    -0.002018964118786
    -0.001836706352859
    -0.002263418747145
    -0.001806118578116
     0.009466705262643
    -0.002893597622885
     0.006137658179468
    -0.010057930842493
    -0.008180783577852
    -0.001470085049442
     0.001806026968249
    -0.001366207655048
    -0.002069424500912
    -0.001852663215081
     0.002380081825541
     0.010457688361657
    -0.001158721131190
     0.042134668471479
     0.000564075237833
    -0.008884915194046
    -0.011824746926298
     0.009840584784791
    -0.003044171902287
     0.000791820296939
     0.006434463258239
    -0.025055711462082
    -0.003398661824394
     0.033836891201795
    -0.003543381718440
    -0.052449977040196
    -0.007083552836040
     0.014420874066013
    -0.003053399665836
    -0.000357384067109
     0.000127473124230
    -0.001683236358172];

    infid = 4.7E-7
