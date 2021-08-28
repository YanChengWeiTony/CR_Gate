# Descriptions:

### g: infidelity

### CR_Sgle_Pulse_Import: fully Numerical simulation, calculate only g, plot the results

### CR_no_plot_Import: fully Numerical simulation, calculate only g, do not plot the results

### Par_CR_Sgle_Pulse_Import: fully Numerical simulation, calculate  g's gradient, plot the results

### Par_no_plot_Import: fully Numerical simulation, calculate  g's gradient, do not plot the results


# Notes:
1. all stand on the undriven basis
2. gate time = 100 ns
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

# Results:
initiial:

    phip = -0.03;
    phac = 3.25;

    input0 = [    
        0.1729
       -0.0272
        0.1422
        0.0142
       -0.0029
        0.0171
        0.0286
        0.0011
       -0.9081
     phip
     phac
     ];
     
     Infid = 2.5E-2

After:

    phip = -0.08;
    phac = 3.13;

    input0 = [    
       0.2321288913
         0.0330609070
         0.0908052801
         0.0269281765
         0.0125051910
         0.0021729138
         -0.0098304581
         0.0215067376
         0.0463898558
         0.0002321704
         0.0003947453
         -0.0000164602
         -1.2159375896
     phip
     phac
     ];
     Infid = 3.4E-3
