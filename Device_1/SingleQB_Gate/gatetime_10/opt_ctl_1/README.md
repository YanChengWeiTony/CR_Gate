## FRAME -> omega = 32.1357 GHz = 1st qubit dressed state


### XI_plot_Import: fully Numerical simulation, calculate infiedlirt g


### Par_XI_plot_Import:  fully Numerical simulation, calculate infiedlirt  partial-g


# Notes:
1. all stand on the undriven basis
2.
    gate time = 10 ns
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


        x0 = [         0.247866969147072
        -0.000469306049120
         0.002034010379385
        -0.000735357922065
        -0.001344335532919
         0.019491815930495
        -0.003755696831165
         0.002037376828855
         0.002435966812921
         0.003522422508745
        -0.001772695347820];

        infid = 5.82E-5

after

        x= [   0.246813719778258
        -0.000784472052602
         0.003575260526664
        -0.000284953068954
        -0.000246936329704
        -0.000225909820275
         0.000471474415648
         0.000063815263151
         0.001458549409550
         0.000048286870889
         0.020047921025880
        -0.003610515343245
         0.002305967829196
         0.001998753368182
         0.003289489330273
         0.000259853466679
         0.000257565233624
        -0.000042897138919
        -0.000841415204804
        -0.000032209320600
        -0.001892246637913]

        infid = 5.63E-5
