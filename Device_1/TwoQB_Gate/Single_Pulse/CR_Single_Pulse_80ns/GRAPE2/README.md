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

    phip = -0.0100;
    phac = 3.200;

    input0 = [    
              0.323201993865724
       0.017278422707036
       0.063986101552894
      -0.002713124890800
       0.009528573747377
       0
       0
       0
      -0.015407749417072
       0.027764614343015
      -0.001191334210388
       0.006856084439486
      -0.000769784378530
      0
      0
      0
       0.006617378794606
      -0.007499547896133
      -0.026303930331765
       0.002984731596434
       0.041598059632323
       0
       0
       0
      -0.001382919974201
       0.000315205309761
       0.006498867294158
       0.002603192247994
      -0.005664176901062
      0
      0
      0
      -1.505781967970210
     phip
     phac
     ];


    infid = 3E-3


after:

    phip = -0.0080;
    phac = 3.250;

    input0 = [    
             0.3299874306
         0.0006329981
         0.0703625951
         -0.0005297941
         0.0079728863
         0.0005088020
         -0.0346699015
         -0.0001166173
         -0.0078200873
         -0.0058749153
         0.0021906974
         -0.0060651781
         0.0019769393
         0.0020861388
         0.0046471270
         0.0044797356
         0.0050682058
         0.0028925404
         -0.0229574195
         0.0056137605
         0.0359417445
         0.0088595923
         0.0103463884
         -0.0026170544
         -0.0005553906
         -0.0001616413
         0.0041040764
         0.0004050032
         -0.0040250669
         -0.0044472470
         -0.0032121081
         0.0047595820
         -1.5405391728
     phip
     phac
     ];


    infid = 2.1E-3
