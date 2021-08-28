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

    input0 = [    0.100
     0.0
     0.007
     0
     0
     
     -0.012
     0.025
     0.210
     0
     0

     0.0093
     0.0010
     0.005
     0
     0
     
     0.00
     -0.0065
     -0.002
     0
     0
     
     0.955
     phip
     phac
     ];
     infid = 2.23E-2

After:

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
     Infid = 3.33E-5
