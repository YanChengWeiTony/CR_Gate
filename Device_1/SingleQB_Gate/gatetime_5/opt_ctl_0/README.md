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

    x0 = [         0.507866969147072
    -0.000469306049120
     0.002034010379385
    -0.000735357922065
    -0.001344335532919

     0.080491815930495
    -0.003755696831165
     0.002037376828855
     0.002435966812921
     0.003522422508745
     
    -0.00072695347820];

    infid = 2.5E-3


after:

    x0 = [
      0.484551142779369
    -0.001574857762013
     0.014498127183997
     0.002557109018952
     0.042360252870292
     0.081321048263000
    -0.002590179155787
    -0.001295538960501
     0.000211455583308
    -0.032404818283308
    -0.003823486677334];

    infid = 1.54E-3
