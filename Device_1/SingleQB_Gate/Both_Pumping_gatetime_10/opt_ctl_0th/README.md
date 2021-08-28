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
    gate time = 10 ns
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


after:

    x0 = [        
     0.234376092174390
    -0.004303594023349
     0.033999325594942
     0.002295696958236
     0.011647998628467
     0.019107039208961
    -0.000630435100758
     0.020691100081849
     0.001334082278386
     0.013010043693264
     0.002830216718094
     0.011547945236560
    -0.005096306701492
    -0.006645343865240
    -0.003521212496106
     0.004360199317350
     0.011078155344885
     0.001477238439613
    -0.009260760938002
    -0.006934358405450
    -0.000046457709664
     0.000755747297791];
     
     infid = 2.6E-5
