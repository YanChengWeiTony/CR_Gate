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

       x0 = [         
        0.259464780559657
       -0.185480149059360
       -0.018117662681833
       -0.037295327033618
       -0.016782028916110
       -0.000963544597038
        0.000486223368799
        0.000121065511730
        0.012097773672297
       -0.049188286503367
       -0.019073722702074
       -0.030078606735698
       -0.007152720969654
        0.000878887676859
       -0.000288116126893
       -0.000241025741577
        0.010511478936885];
        
    infid = 0.00528

after:

    x0 = [  0.259464793479567
    -0.185480537260762
    -0.018117852166441
    -0.037295637668210
    -0.016781498778712
    -0.000963845385437
     0.000486515500845
     0.000121042643405
     0.000000532219258
    -0.000000147304405
     0.000000297026505
    -0.000000046440769
     0.012099196340052
    -0.049187464587711
    -0.019074427540284
    -0.030078376510496
    -0.007153035178732
     0.000879069361189
    -0.000288171472948
    -0.000241092939288
    -0.000000349323721
     0.000000084275304
    -0.000000139332099
    -0.000000008220388
     0.010518480524679]
     
     infid = 0.00528
