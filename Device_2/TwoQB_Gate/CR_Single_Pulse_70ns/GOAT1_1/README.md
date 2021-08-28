# Results:

# Notes:
1. all stand on the undriven basis
2. gate time = 70 ns
    lev = 7
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


    infid = 9.7E-3


after: 

    input0 = [    0.1121376359
        -0.0037267860
        0.0114318291
        -0.0130403348
        0.0114835595
        0.0485266574
        -0.0013170136
        0.0024277601
        0.0005155379
        -0.0070422398
        -0.0003123844
        0.0074094738
        0.0222437202
        0.0090895841
        0.0253606076
        0.0040671950
        -0.0104522734
        -0.0037973259
        -0.0159036944
        0.0146877593
        0.9804102202
    phip
    phac
    ];


    infid = 2.47E-5
