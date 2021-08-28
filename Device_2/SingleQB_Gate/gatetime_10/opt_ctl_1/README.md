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

    x0 = [            0.260252242406322
      -0.185648429743335
      -0.017397087015559
      -0.036692913951070
      -0.017523691990159
       0.006677802146644
      -0.047339752611495
      -0.019646258424143
      -0.030920513394434
      -0.006467451005232
       0.003983603862513];
       
       infid = 0.00567
   
after:
   
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
