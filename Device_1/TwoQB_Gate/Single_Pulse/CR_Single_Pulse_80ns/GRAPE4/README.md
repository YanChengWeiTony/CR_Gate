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
         0
         0
         0
         0
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
         0
         0
         0
         0
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
         0
         0
         0
         0
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
         0
         0
         0
         0
         -1.5765427564
     phip
     phac
     ];

    infid = 7.5E-4


after:

    phip = -0.0090;
    phac = 3.250;

    input0 = [    
             0.3378277291
         -0.0027228762
         0.0877501588
         -0.0004616112
         0.0282070661
         -0.0027143015
         0.0013221527
         -0.0041822191
         -0.0066468932
         -0.0019852861
         -0.0055294956
         0.0065093816
         -0.0059601619
         -0.0022757518
         -0.0124503695
         -0.0016369574
         -0.0038851538
         -0.0260714674
         0.0050439912
         -0.0114347122
         -0.0029925915
         0.0004855563
         -0.0018682174
         -0.0048379668
         0.0020007644
         0.0131401273
         -0.0056744673
         0.0019601693
         0.0038418431
         -0.0058077037
         0.0014767293
         -0.0065607522
         0.0072232559
         0.0044207866
         -0.0208551195
         0.0066991068
         0.0262506205
         0.0063705693
         0.0059842228
         -0.0014543473
         0.0025269968
         -0.0032605259
         0.0033209160
         -0.0001127069
         -0.0036312058
         0.0018398155
         -0.0040239389
         -0.0015817369
         -0.0008272003
         -0.0010241079
         0.0035896755
         -0.0009247664
         -0.0042569795
         -0.0002915958
         -0.0000385029
         0.0019041896
         0.0006777724
         -0.0001590397
         0.0003959157
         -0.0005152052
         -0.0000035453
         0.0039802803
         0.0020741384
         -0.0025903127
         -1.6032280874

     phip
     phac
     ];


    infid = 1.46E-4
