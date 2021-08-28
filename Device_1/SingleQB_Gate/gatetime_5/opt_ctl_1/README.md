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
    -0.003823486677334];

    infid = 1.54E-3

after

    x0 = [
         0.488037407487497
    -0.026036243829591
     0.020233927090045
     0.008566308179749
     0.029693656468749
     0.017887338442208
     0.006478988586107
     0.012203729874473
     0.007861036373015
     0.014901108361499
     0.077529170379364
    -0.032994426851706
     0.006908668883916
     0.008954539243116
    -0.013743040616188
    -0.007708576840997
    -0.002330070258488
    -0.003311437965372
    -0.004738080562420
    -0.007365358581751
    -0.012824758671384];

    infid = 6.22E-4
