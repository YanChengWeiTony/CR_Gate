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

    x0 = [        
     0.448642340769706
    -0.041801105757566
     0.095111569663819
    -0.000537241900847
     0.061876933495147
     0.008880069078134
     0.045998819610013
     0.005238603308661
     
     0.085436939058711
    -0.037695734672558
     0.075654256846498
    -0.001039655767173
     0.043830875967381
    -0.010267730170169
     0.020498557779434
    -0.005362088877805

    -0.016793758378067];

    infid = 6.05E-3


after

    x0 = [   0.402322422744022
    -0.151514014610101
     0.172196646807777
    -0.021766715880663
     0.096312452665149
     0.036633752880805
     0.062480679078133
     0.037290742093094
     0.025675656445547
     0.049365477046392
     0.026640086684050
     0.042053638551185
     0.095117380758235
    -0.155425567665795
     0.166852334104106
    -0.031805160864760
     0.148304894074888
    -0.024635981723020
     0.110785082738562
    -0.014863128631296
     0.058584369410460
    -0.022962273093171
     0.042653109515256
    -0.016709679314034
    -0.078169918788579]

    infid = 5.5E-3
