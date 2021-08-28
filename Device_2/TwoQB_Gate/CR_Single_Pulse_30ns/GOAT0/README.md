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



    input0 = [   0.385
         0.215
         0.13
         -0.07
         0.02
         -0.09
         0.03
         0.24
         0.05
         -0.002
         0.068
         -0.015
         -0.024
         0.023
         0.017
         0.0055
         0.0054
         0.001
         -0.028
         0.035
         1.13
     phip
     phac
     ];
     Infid = 0.01
 
After:

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
