## FRAME -> omega = 32.1357 GHz = 1st qubit dressed state


### XI_plot_Import: fully Numerical simulation, calculate infiedlirt g


### Par_XI_plot_Import:  fully Numerical simulation, calculate infiedlirt  partial-g


# Notes:
1. all stand on the undriven basis
2.
gate time = 2.5 ns
    lev = 5
3. optimal variables: 
a. fx (freq matches 1st qubit dressed state)
b. fy (freq matches 1st qubit dressed state)
c. Detuneing (I set the basis number = 1, meaning it is a constant)

4. Spec
Input:

        % an: fx
        % bn: fy
        % cn: Detuning

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
     0.900
    -0.010154228870746
     0.031335469526769
     0.004559060477659
     0.040952527607716
     
     0.40
     0.013144455947706
    -0.002686157498399
    -0.003159337070323
    -0.022982596021715

     -0.040];
     
     infid = 0.0713


after

    x0 = [   0.906943619498896
     0.024986942077964
     0.072397553760274
     0.013783124148627
     0.074825371670833
     0.459713438899086
    -0.041674326547576
     0.016699577634002
    -0.006790221960190
    -0.021992513068945
    -0.107237239866440]

    infid = 0.0687
