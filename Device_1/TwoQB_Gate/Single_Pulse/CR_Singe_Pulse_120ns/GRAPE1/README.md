# Descriptions:

### g: infidelity

### CR_Sgle_Pulse_Import: fully Numerical simulation, calculate only g, plot the results

### CR_no_plot_Import: fully Numerical simulation, calculate only g, do not plot the results

### Par_CR_Sgle_Pulse_Import: fully Numerical simulation, calculate  g's gradient, plot the results

### Par_no_plot_Import: fully Numerical simulation, calculate  g's gradient, do not plot the results

# Notes:
1. all stand on the undriven basis
2. gate time = 120 ns
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

    phip = -0.14;
    phac = 3.25;


    input0 = [    
        0.2496626289
         0.0301943289
         -0.0315089205
         0.0104565097
         -0.0002681097
         -0.0001613305
         0.0155500082
         0.0000700600
         -0.3252997382

    phip
    phac
    ];


    Infid = 1E-4


After:

    phip = -0.14;
    phac = 3.25;


    input0 = [    
    0.2519582458
         0.0062909909
         -0.0382409773
         0.0148021712
         -0.0021505745
         -0.0012494955
         0.0010327086
         -0.0045158534
         0.0114156369
         0.0002332443
         0.0008827301
         -0.0009176164
         -0.3461678315

    phip
    phac
    ];

    Infid = 3.7997e-05
