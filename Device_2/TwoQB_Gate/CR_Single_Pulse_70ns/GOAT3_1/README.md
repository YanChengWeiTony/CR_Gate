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
     infid = 0.01

Final:

    input0 = [  0.1257070494
        -0.0170111915
        0.0109851050
        0.0034728042
        0.0098693142
        0.0068542264
        -0.0078929009
        0.0110670142
        -0.0078768478
        -0.0067238930
        0.0327974893
        -0.0110306845
        0.0011745657
        -0.0026364010
        -0.0093776033
        -0.0017439886
        0.0026000169
        0.0099277318
        -0.0070634286
        -0.0028481888
        0.0045534884
        0.0018874897
        0.0253096460
        0.0082726161
        0.0179462110
        0.0094083172
        -0.0120245474
        0.0078328566
        -0.0017220553
        -0.0067030914
        0.0024976809
        -0.0134627911
        0.0038897180
        -0.0025969045
        0.0276422610
        0.0038832521
        -0.0053836943
        -0.0005354827
        -0.0037636099
        -0.0039479459
        0.9755004985
    phip
    phac
    ];

    Infid ~ 1E-5
