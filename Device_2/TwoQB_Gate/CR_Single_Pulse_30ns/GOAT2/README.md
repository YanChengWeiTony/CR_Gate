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

after

    phip = -2.550;
     phac = 3.160;

     input0 = [ 0.3019794457
          0.2381669540
          -0.0064655899
          -0.0437354028
          -0.0253680599
          -0.0279629078
          -0.0204412726
          -0.0029795695
          0.0000439798
          0.0000409134
          -0.2967086795
          0.1315165681
          0.1481880287
          -0.0591087793
          0.0191135834
          -0.0048175919
          -0.0230849394
          0.0035748333
          -0.0000150565
          -0.0000518915
          0.0834753429
          0.0717400121
          -0.0489103814
          0.0450508574
          -0.0155053282
          0.0026479090
          0.0097268562
          -0.0354581295
          0.0000468541
          0.0000530438
          -0.0154141945
          0.0081496054
          0.0123554739
          -0.0224467179
          0.0054830742
          -0.0102143567
          -0.0152264805
          0.0147157735
          -0.0000401683
          0.0000303251
          1.1158573485
      phip
      phac
      ];
      
      infid = 4.12E-5
