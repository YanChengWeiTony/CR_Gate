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

    x0 = [      0.1645
      -0.00000
      -0.00
      -0.0000
      -0.000

       0.0086
      -0.000
      -0.000
       0.0000
       0.0000
       
      -0.0000];
      
      Infid = 4.3E-5


after:

    x0 = [        0.165163660724137
     0.000292003738603
    -0.000359365513371
    -0.000149344168943
    -0.000706371692614
     0.009489968075156
    -0.003856608438452
     0.001877106789142
     0.000391853133527
     0.001877616499316
    -0.001731993494416];

    Infid = 3.65E-5

