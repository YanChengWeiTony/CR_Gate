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


    x0 = [   0.036523027930832
    -0.041528509132445
     0.019253284850645
    -0.048057904372137
     0.007977911798121
     0.004877200276076
     0.010576170551340
     0.003912776544203
     0.006937417491057
     0.002099925749871
     0.003210171324787
     0.000553406314921
     0.002516739944401
     0.000474788210087
     0.002119475466507
     0.006643078204964
     0.001352649037190
     0.008376352435688
     0.004440286166409
    -0.000498717242848
    -0.006340495707304
    -0.003359088557710
    -0.002518902596560
    -0.001235589048520
    -0.001024766945966
    -0.000743126095465
    -0.000356149211499
    -0.000153309654802
    -0.000277778518830
     0.000015146172741
     0.013119996354902]
     
     infid = 0.0496
