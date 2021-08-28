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

    x0 = [         0.250866969147072
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

    infid = 0.007

After:

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
       
       infid = 0.005
