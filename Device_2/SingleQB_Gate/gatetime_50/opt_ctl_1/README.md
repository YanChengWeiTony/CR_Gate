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


after

    x0 = [         
    0.048576290956512
    -0.047054513263236
     0.003220486710600
    -0.047491193505104
     0.001133453583609
     0.001299381822031
     0.005378760365193
     0.001945588003271
     0.003064519035172
     0.001224095125745
     0.029904244738989
     0.004420298199329
    -0.017603336758620
     0.008619495017244
    -0.009332308435341
    -0.000705249761862
    -0.004238351705696
    -0.002411476355766
    -0.000051354246362
    -0.000605478668867
     0.032756965015985];
     
     infid  = 0.087
