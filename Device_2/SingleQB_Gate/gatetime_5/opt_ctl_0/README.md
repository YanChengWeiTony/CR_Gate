## FRAME -> omega = 32.1357 GHz = 1st qubit dressed state


### XI_plot_Import: fully Numerical simulation, calculate infiedlirt g


### Par_XI_plot_Import:  fully Numerical simulation, calculate infiedlirt  partial-g


# Notes:
1. all stand on the undriven basis
2.
    gate time = 5 ns
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

    x0 = [         0.493
      -0.000
       0.02034010379385
      -0.000735357922065
      -0.001344335532919
       0.090491815930495
      -0.003755696831165
       0.002037376828855
       0.002435966812921
       0.003522422508745
       0.000072695347820];
       infid = 0.0118
   
after:
   
       x0 = [        
        0.477967839272965
       -0.010154228870746
        0.031335469526769
        0.004559060477659
        0.040952527607716
        0.095406939080113
        0.013144455947706
       -0.002686157498399
       -0.003159337070323
       -0.022982596021715
        0.002316311233458];
        
    infid = 0.0114
