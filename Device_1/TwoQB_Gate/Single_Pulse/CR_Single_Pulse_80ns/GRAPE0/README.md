# Descriptions:

### g: infidelity

### CR_Sgle_Pulse_Import: fully Numerical simulation, calculate only g, plot the results

### CR_no_plot_Import: fully Numerical simulation, calculate only g, do not plot the results

### Par_CR_Sgle_Pulse_Import: fully Numerical simulation, calculate  g's gradient, plot the results

### Par_no_plot_Import: fully Numerical simulation, calculate  g's gradient, do not plot the results

# Notes:
1. all stand on the undriven basis
2. gate time = 80 ns
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

    phip = -0.043;
    phac = 3.25;

    input0 = [    
    0.2129
    -0.0272
    0.1422
    0.0212
    0
    0
    -0.0045
    0.0171
    0.0286
    -0.0001
    0
    0
    -0.9381
    phip
    phac
    ];

    infid = 2.59E-2


after:

    phip = -0.043;
    phac = 3.25;

    input0 = [    
           0.301200964493891
      -0.003673133914819
       0.043895369902765
      -0.025204210062272
       0.047412635138857
       0.067466396753176
       0.012018779189277
       0.000199937810133
      -0.016599889167245
      -0.000884894301456
       0.000324576755660
       0.004201970517230
      -1.424812764946536
     phip
     phac
     ];
     
     infid = 1E-2
