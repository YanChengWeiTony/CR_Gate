## FRAME -> omega = 32.1357 GHz = 1st qubit dressed state


### XI_plot_Import: fully Numerical simulation, calculate infiedlirt g


### Par_XI_plot_Import:  fully Numerical simulation, calculate infiedlirt  partial-g


# Notes:
1. all stand on the undriven basis
2.
    gate time = 15 ns
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

    x0 = [        0.0498
     0.000
    -0.00
    -0.000
    -0.000

     0.00070
    -0.00
     0.00
     0.00
     0.0
     
    -0.00008];
    infid = 3E-4

after:

    x0 = [          0.050808895416092
      -0.011393519232973
      -0.002798045204349
      -0.003519834118426
      -0.001534558050144
       0.001062448895586
       0.000047885905885
       0.000807412648166
      -0.000020514690528
       0.000715212698174
      -0.000058052979115];
      
      infid = 2...E-3
