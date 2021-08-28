# Description:

### g: infidelity

### CR_Sgle_Pulse_Import: fully Numerical simulation, calculate infiedelity g, plot the result

### CR_no_plot_Import: fully Numerical simulation, calculate infiedelity g, but do not plot the result


### Par_CR_Sgle_Pulse_import:  fully Numerical simulation, calculate  partial-g

### Par_no_plot_import:  fully Numerical simulation, calculate  partial-g, but do not plot the result


# Notes:
1. all stand on the undriven basis
2. 
gate time = 70 ns
lev = 4
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

        % phip (not optimize)
        % phac (not optimize)

5. initial:
    since we are at the undriven basis
    
        init = Identity
    
6. Fidelity:
    Suppose get U, and an ideal propagator U_I
    
        F = tr( U_I^{dagger} @ U )

# Results:

init:

    phip = -1.28;
    phac = 3.20;

    input0 = [    0.1556170158
    -0.0228326477
    -0.0010892410
    0.0059608669
    -0.0172586793
    0.0347282361
    0.0125499378
    0.1459753508
    -0.0147236914
    -0.0657879927
    0.0055331710
    -0.0030026141
    0.0128014190
    0.0108706558
    0.0084993805
    0.0052469942
    -0.0117703042
    -0.0081398467
    -0.0050387791
    0.0376558436
    0.9649181454
     phip
     phac
     ];
     Infid = 2.60E-5

fiinal:

    phip = -1.275;
    phac = 3.200;

    input0 = [  0.1592985166
         -0.0217239337
         -0.0043974797
         0.0094457968
         -0.0199670448
         0.0075738844
         -0.0014286422
         0.0017310696
         0.0331915945
         0.0144693195
         0.1389989938
         -0.0136429814
         -0.0677363756
         -0.0032480424
         -0.0093119729
         0.0007656463
         0.0044231151
         -0.0033641292
         0.0139444552
         0.0133372344
         0.0123947281
         0.0029271577
         -0.0056880969
         0.0019171759
         0.0072717907
         -0.0148792362
         -0.0088911147
         -0.0032271185
         0.0322817992
         0.0004337960
         -0.0097842585
         -0.0005724477
         0.9644899923
     phip
     phac
     ];
    infid = 4E-6
