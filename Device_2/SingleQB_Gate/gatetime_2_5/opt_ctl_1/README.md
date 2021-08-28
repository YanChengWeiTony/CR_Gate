## FRAME -> omega = 32.1357 GHz = 1st qubit dressed state


### XI_plot_Import: fully Numerical simulation, calculate infiedlirt g


### Par_XI_plot_Import:  fully Numerical simulation, calculate infiedlirt  partial-g


# Notes:
1. all stand on the undriven basis
2.
gate time = 2.5 ns
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


    x0 = [   0.906943619498896
     0.024986942077964
     0.072397553760274
     0.013783124148627
     0.074825371670833
     0.459713438899086
    -0.041674326547576
     0.016699577634002
    -0.006790221960190
    -0.021992513068945
    -0.107237239866440]

    infid = 0.0687

after

    x0 = [   0.918230583564554
     0.022578497590571
     0.067397236453380
     0.022731957831604
     0.080131714136031
     0.004943151205879
     0.005647993869435
     0.003765799357787
     0.004426451946771
     0.003011163038266
     0.458119425308606
    -0.052508244615065
     0.037490647321307
    -0.010287410512641
    -0.018741189774524
    -0.001681868510681
     0.000130560018137
    -0.001332915156158
    -0.000127170255501
    -0.001179526941735
    -0.107500723684774]

    infid = 0.0666
