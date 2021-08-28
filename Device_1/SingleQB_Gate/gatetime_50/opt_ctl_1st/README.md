## FRAME -> omega = 32.1357 GHz = 1st qubit dressed state


### XI_plot_Import: fully Numerical simulation, calculate infiedlirt g


### Par_XI_plot_Import:  fully Numerical simulation, calculate infiedlirt  partial-g


# Notes:
1. all stand on the undriven basis
2.
    gate time = 15 ns
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

    x0 = [          0.050808895416092
      -0.011393519232973
      -0.002798045204349
      -0.003519834118426
      -0.001534558050144
       0.001062448895586
       0.000047885905885
       0.000807412648166
      -0.000020514690528
       0.000715212698174
      -0.000058052979115];
      
      infid = 2.4E-4

after:

    x0 = [      0.050744185206130
    -0.011428132354739
    -0.002834623420687
    -0.003546559699648
    -0.001550170669503
    -0.000011205743018
    -0.000009343978085
    -0.000004930390298
    -0.000007062799748
    -0.000003653738654
     0.001126502488807
    -0.000643824266608
     0.000977691340111
     0.000045594763795
     0.000711914760018
     0.000001170274488
    -0.000008400298042
    -0.000004836448386
    -0.000005785746438
    -0.000004605928386
    -0.000515404067582];


    infid = 2.34E-6
