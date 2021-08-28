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

after:

    phip = -0.15;
    phac = 3.13;

    input0 = [    
       0.2624761965
         -0.0047094214
         0.0403017521
         0.0092030547
         0.0009983266
         0.0170954210
         0.0120578362
         0.0228959057
         -0.0033510824
         -0.0153492585
         -0.0124202177
         0.0341171450
         0.0506862635
         -0.0072800040
         0.0066513991
         0.0017980346
         -0.0005378460
         -0.0006315383
         0.0001499301
         -0.0040137248
         -1.3304003795
     phip
     phac
     ];

    infid: 8E-4



after (another case)

    phip = -0.15;
    phac = 3.25;

    input0 = [    
    0.2591131521
         0.0025397954
         0.0452920686
         0.0063548267
         -0.0034944722
         0.0338065538
         0.0082315521
         0.0135018340
         -0.0227959066
         0.0027248586
         -0.0069882050
         0.0153757696
         0.0365015274
         0.0046193799
         0.0028551501
         0.0011244139
         -0.0015282401
         -0.0037626632
         -0.0001777842
         -0.0014650966
         -1.3202409078
     phip
     phac
     ];


    8E-4
