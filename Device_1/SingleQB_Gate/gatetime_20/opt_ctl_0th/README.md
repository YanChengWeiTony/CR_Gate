## FRAME -> omega = 32.1357 GHz = 1st qubit dressed state


### XI_plot_Import: fully Numerical simulation, calculate infiedlirt g


### Par_XI_plot_Import:  fully Numerical simulation, calculate infiedlirt  partial-g


# Notes:
1. all stand on the undriven basis
2.
    gate time = 20 ns
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

    x0 = [    0.1238
       -0.0000
       -0.0004
        0.0000
       -0.0000
       zeros(10,1)
       
        0.0047
        0.0000
       -0.0001
        0.0000
       -0.0000
       zeros(10,1)
       
       -0.0000];


    Infid = 4.6E-5

after:

     0.123800799753712
    -0.000009658086301
    -0.000417795850005
    -0.000008769176040
    -0.000018752874878
    -0.000005573423489
    -0.000008204552488
    -0.000004737024737
    -0.000017446687690
    -0.000005074571147
    -0.000065786674440
    -0.000016513395207
     0.000033002987707
     0.000006492858918
     0.000116727670238
     0.004687840870378
    -0.000178253868028
    -0.000063730663062
     0.000011431850711
     0.000034394733698
     0.000001114434695
     0.000020907571517
     0.000001576752773
     0.000029692508657
     0.000002514396797
     0.000077060361421
     0.000014343729287
    -0.000022602096047
    -0.000008368830270
    -0.000106994567845
    -0.000075404422661

    Infid = 4.6E-5
