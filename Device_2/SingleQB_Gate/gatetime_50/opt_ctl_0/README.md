## FRAME -> omega = 32.1357 GHz = 1st qubit dressed state


### XI_plot_Import: fully Numerical simulation, calculate infiedlirt g


### Par_XI_plot_Import:  fully Numerical simulation, calculate infiedlirt  partial-g


# Notes:
1. all stand on the undriven basis
2.
    gate time = 50 ns
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
    0.044
    0
    0
    0
    0

    -0.00
    0
    0
    0
    0

    0.001];

    infid = 0.19

after

    x0 = [         
       0.057592206318028
    -0.062953886307167
    -0.019230907666128
    -0.045803673175414
    -0.010695009242930
     0.003569974664089
     0.014814869843744
    -0.001325329069378
     0.000083688376055
     0.000154459976258
     0.009097585011596];
     
     infid = 0.12
