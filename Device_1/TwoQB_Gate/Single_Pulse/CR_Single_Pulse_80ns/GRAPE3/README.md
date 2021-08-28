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
         0
         0
         0
         0
         -0.0078200873
         -0.0058749153
         0.0021906974
         -0.0060651781
         0.0019769393
         0.0020861388
         0.0046471270
         0.0044797356
         0
         0
         0
         0
         0.0050682058
         0.0028925404
         -0.0229574195
         0.0056137605
         0.0359417445
         0.0088595923
         0.0103463884
         -0.0026170544
         0
         0
         0
         0
         -0.0005553906
         -0.0001616413
         0.0041040764
         0.0004050032
         -0.0040250669
         -0.0044472470
         -0.0032121081
         0.0047595820
         0
         0
         0
         0
         -1.5405391728
     phip
     phac
     ];


    infid = 2.1E-3


after:

    phip = -0.0090;
    phac = 3.250;

    input0 = [    
             0.3271115885
         0.0016772910
         0.0970589377
         -0.0025197755
         0.0290225919
         0.0014617083
         -0.0079121863
         0.0035780974
         -0.0282828334
         0.0057468626
         -0.0105817366
         -0.0032086759
         -0.0176438284
         -0.0121383124
         -0.0066353115
         0.0040384062
         0.0018886596
         -0.0095649307
         0.0027752804
         0.0102544752
         -0.0011913815
         0.0079499084
         0.0064662094
         -0.0097860533
         0.0057016253
         0.0050196380
         -0.0227895232
         0.0070855739
         0.0277955746
         0.0065802502
         0.0091333339
         -0.0016988244
         0.0022178408
         -0.0027141059
         0.0105105910
         -0.0022212710
         -0.0011388455
         0.0001352014
         0.0045962959
         -0.0000925717
         -0.0011124533
         -0.0023427377
         -0.0034534061
         0.0011551850
         -0.0002816614
         0.0045020375
         -0.0042822251
         -0.0062393631
         -1.5765427564
     phip
     phac
     ];

    infid = 7.5E-4
