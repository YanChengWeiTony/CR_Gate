# Descriptions:

### g: infidelity

### CR_Sgle_Pulse_Import: fully Numerical simulation, calculate only g, plot the results

### CR_no_plot_Import: fully Numerical simulation, calculate only g, do not plot the results

### Par_CR_Sgle_Pulse_Import: fully Numerical simulation, calculate  g's gradient, plot the results

### Par_no_plot_Import: fully Numerical simulation, calculate  g's gradient, do not plot the results

# Notes:
1. all stand on the undriven basis
2. gate time = 200 ns
3. optimal variables: 
a. f-CR-x
b. f-CR-y
c. f-Active_cancellation - x
d. f-Active_cancellation - y

4. Spec
Input:

        % pn: fCR-x
        % qn: fCR-y
        % rn: fAC-x
        % sn: fAC-y
        % Z_phase_AC_ratio

        % phip (not optimize, hyperparameters)
        % phac (not optimize, hyperparameters)

5. initial:
    since we are at the undriven basis
    
        init = Identity
    
6. Fidelity:
    Suppose get U, and an ideal propagator U_I
    
        F = tr( U_I^{dagger} @ U )


# Results


initiial:

    phip = -0.08;
    phac = 3.25;

    input0 = [    0.1122413705
         0.0071575174
         0.0578585685
         -0.0068377108
         -0.0001851987
         0.0001619366
         0.0112828832
         -0.0000215959
         -0.0301702668
    phip
    phac
     ];
     
     infid = 1.03E-4

after
    phip = -0.08;
    phac = 3.25;

    input0 = [ 0.1122390310
         0.0071570071
         0.0578562449
         -0.0000000170
         -0.0000008238
         -0.0068382526
         -0.0000011051
         -0.0000001382
         -0.0001839031
         0.0001596841
         0.0112817910
         -0.0000016017
         0.0000001307
         -0.0000241139
         0.0000217107
         -0.0000045513
         -0.0301703902
    phip
    phac
     ];
     
     infid ~ 1.E-4

