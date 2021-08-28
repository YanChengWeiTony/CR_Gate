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

    phip = -0.090;
    phac = 3.13;

    input0 = [    
    0.2627882676
         0.0005075397
         0.0635590270
         0.0036570575
         0.0034383438
         0.0002723460
         -0.0303593837
         0.0240042195
         0.0021978360
         0.0074360992
         -0.0140902987
         -0.0099785260
         -0.0069238858
         0.0342873670
         0.0478807858
         0.0026482917
         -0.0151458247
         0.0078196815
         -0.0021791438
         -0.0000253015
         0.0001274030
         0.0007417006
         -0.0006642248
         -0.0042322084
         -1.3721474505
     phip
     phac
     ];
     
     Infid = 3E-4


After:

    phip = -0.090;
    phac = 3.13;

    input0 = [    
           0.2667227740
         0.0015766939
         0.0628411096
         0.0026545427
         -0.0048836012
         -0.0000483304
         -0.0299404237
         0.0316206248
         0.0028568920
         -0.0030375420
         -0.0130287819
         0.0051860688
         0.0024082959
         -0.0059280940
         -0.0067211950
         0.0338522841
         0.0429787143
         0.0046057440
         -0.0109991782
         0.0060465919
         0.0017893677
         0.0000066283
         0.0016084321
         0.0020415771
         -0.0007485553
         -0.0033182626
         -0.0000477608
         0.0009937508
         -1.3984919504
     phip
     phac
     ];
     
     
     Infid = 1.9E-4
