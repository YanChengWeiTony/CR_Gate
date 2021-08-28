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

after:

    x0 = [
            0.478953109799293
    -0.008012245595477
     0.035695142549275
     0.002989574613742
     0.030133139002011
     0.001571811335648
     0.016784060372891
     0.002546311753315
     0.014231214260792
     0.000961385789097
     0.010356605961106
    -0.004873725397580
     0.005821918658847
    -0.005288533942334
     0.005374168283306
     0.072916032550247
    -0.005912797018001
     0.024328943703922
     0.003044155159207
     0.005080540951310
     0.000564063634130
     0.001118394393027
    -0.000755656605745
    -0.000557489490258
     0.000458291347592
    -0.001686015038923
    -0.000578968765697
     0.001518168783398
     0.000386556823550
     0.001048473714178
    -0.001726591850617];

    infid = 5.8E-4
