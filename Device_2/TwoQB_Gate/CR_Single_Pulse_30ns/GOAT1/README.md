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

    phip = -2.550;
    phac = 3.16;


     input0 = [  0.3171718387
          0.2291630903
          0.0124947328
          -0.0557981324
          0.0184781215
          -0.2826727892
          0.1207591918
          0.1610777642
          -0.0659108884
          0.0043199706
          0.0716708859
          0.0924578418
          -0.0239359815
          -0.0028450827
          0.0202183406
          -0.0060855763
          0.0105250499
          0.0003060791
          -0.0117062379
          0.0165241408
          1.1028431206
      phip
      phac
      ];

    Infid = 4.39E-4

After:

    phip = -2.550;
    phac = 3.160;

    input0 = [ 0.3021118269
         0.2382710639
         -0.0064507298
         -0.0437903879
         -0.0253855721
         -0.0279110076
         -0.0204636872
         -0.0030123006
         -0.2968100260
         0.1316321595
         0.1482268495
         -0.0591702248
         0.0191390293
         -0.0047976086
         -0.0231548569
         0.0035507687
         0.0833953017
         0.0718181333
         -0.0488844161
         0.0450655517
         -0.0155592756
         0.0026461934
         0.0097888725
         -0.0354386342
         -0.0154255635
         0.0080750029
         0.0123987471
         -0.0225606754
         0.0055535051
         -0.0102795527
         -0.0152193000
         0.0146557947
         1.1163620044
         
         1.1158431206
     phip
     phac
     ];
     
     Infid = 4.71E-5
