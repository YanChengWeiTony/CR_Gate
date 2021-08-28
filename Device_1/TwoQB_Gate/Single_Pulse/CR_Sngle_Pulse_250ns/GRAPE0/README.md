# Descriptions:

### g: infidelity

### CR_Sgle_Pulse_Import: fully Numerical simulation, calculate only g, plot the results

### CR_no_plot_Import: fully Numerical simulation, calculate only g, do not plot the results

### Par_CR_Sgle_Pulse_Import: fully Numerical simulation, calculate  g's gradient, plot the results

### Par_no_plot_Import: fully Numerical simulation, calculate  g's gradient, do not plot the results


# Notes:
1. all stand on the undriven basis
2. gate time = 250 ns
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


Iniitial:

    input0 = [    0.095
     0.00
     0.0
    -0.00
     0.003
     0.001
     0.00
     0.00
     1
     -0.08
      3.25
     ];
     
     infid = 3.6E-3
     
 final:
     
     phip = -0.08;
     phac = 3.250;
     
      0.0937
     -0.0033
      0.0310
     -0.0053
      0.0006
      0.0005
      0.0070
     -0.0000
      0.7160
    phip
    phac
    ]
    
    infid = 1.3E-4
