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
      0.165163660724137
     0.000292003738603
    -0.000359365513371
    -0.000149344168943
    -0.000706371692614

     0.007889968075156
    -0.003856608438452
     0.001877106789142
     0.000391853133527
     0.001877616499316
     
     0.
     0
     0
     0
     0
     
     0
     0
     0
     0
     0
     
    -0.001731993494416
    0.];

    infid = 1E-4

after

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
