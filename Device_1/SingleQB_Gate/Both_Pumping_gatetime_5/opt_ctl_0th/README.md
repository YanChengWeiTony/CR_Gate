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
    gate time = 5 ns
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
      0.484551142779369
    -0.001574857762013
     0.014498127183997
     0.002557109018952
     0.042360252870292
     
     0.081321048263000
    -0.002590179155787
    -0.001295538960501
     0.000211455583308
    -0.032404818283308

    0
    0
    0
    0
    0

    0
    0
    0
    0
    0

    0
    0];

    infid = 0.0017

after:

    x0 = [        
     0.424293557428625
     0.001245192895873
     0.181759190534945
     0.003601624105913
     0.080422421771377
     0.065777718955055
     0.002484934808394
     0.176357070554238
     0.005549555418004
     0.121368241611833
     0.006112790298511
    -0.016344727599159
    -0.011683091323423
     0.002678331385944
    -0.003592929712511
    -0.002898068408623
    -0.019145888103634
    -0.007907566627424
    -0.003861998450250
     0.000012382893126
     0.001870178732205
     0.005700392538694];
     
     infid = 4E-4
