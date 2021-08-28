## FRAME -> omega = 32.1357 GHz = 1st qubit dressed state


### XI_plot_Import: fully Numerical simulation, calculate infiedlirt g


### Par_XI_plot_Import:  fully Numerical simulation, calculate infiedlirt  partial-g


# Notes:
1. all stand on the undriven basis
2.
    gate time = 20 ns
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

    x0 = [      0.12350
    -0.00000
    -0.0004
    -0.00000
    -0.0000

     0.0048
    -0.000178
    -0.000064
     0.000011
     0.000034

    -0.0000];

    init = 0.03

after

    x0 = [        0.149307090111447
    -0.231904337383699
    -0.057514597950948
    -0.077703057463548
    -0.030972624210029
     0.010482929826623
    -0.006503700636657
    -0.001932891411668
     0.000402644282328
     0.005336268724892
    -0.003191483226930];

    infid = 0.025

