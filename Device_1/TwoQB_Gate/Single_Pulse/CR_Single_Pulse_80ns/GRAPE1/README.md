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
6. Fidelity:
    Suppose get U, and an ideal propagator U_I
    
        F = tr( U_I^{dagger} @ U )

# Results
initiial:

    phip = -0.0100;
    phac = 3.200;

    input0 = [    
           0.301200964493891
      -0.003673133914819
       0.043895369902765
       0
       0
      -0.025204210062272
       0.047412635138857
       0.067466396753176
       0
       0
       0.012018779189277
       0.000199937810133
      -0.016599889167245
      0
      0
      -0.000884894301456
       0.000324576755660
       0.004201970517230
       0
       0
      -1.424812764946536
     phip
     phac
     ];

    infid = 9.5E-3

After:

    phip = -0.0100;
    phac = 3.200;

    input0 = [    
              0.323201993865724
       0.017278422707036
       0.063986101552894
      -0.002713124890800
       0.009528573747377
      -0.015407749417072
       0.027764614343015
      -0.001191334210388
       0.006856084439486
      -0.000769784378530
       0.006617378794606
      -0.007499547896133
      -0.026303930331765
       0.002984731596434
       0.041598059632323
      -0.001382919974201
       0.000315205309761
       0.006498867294158
       0.002603192247994
      -0.005664176901062
      -1.505781967970210
     phip
     phac
     ];


    infid = 3E-3
