# Descriptions:

### g: infidelity

### CR_Sgle_Pulse_Import: fully Numerical simulation, calculate only g, plot the results

### CR_no_plot_Import: fully Numerical simulation, calculate only g, do not plot the results

### Par_CR_Sgle_Pulse_Import: fully Numerical simulation, calculate  g's gradient, plot the results

### Par_no_plot_Import: fully Numerical simulation, calculate  g's gradient, do not plot the results

# Notes:
1. all stand on the undriven basis
2. gate time = 200 ns
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

    phip = -0.08;
    phac = 3.25;

    input0 = [ 0.1122390310
         0.0071570071
         0.0578562449
         -0.0000000170
         -0.0000008238
         -0.0068382526
         -0.0000011051
         -0.0000001382
         -0.0001839031
         0.0001596841
         0.0112817910
         -0.0000016017
         0.0000001307
         -0.0000241139
         0.0000217107
         -0.0000045513
         -0.0301703902
    phip
    phac
     ];

    Infid = 1.0687e-04

after:

    phip = -0.082;
    phac = 3.25;

    input0 = [0.1291753398
         -0.0006223755
         0.0165879801
         -0.0002675895
         -0.0156162216
         -0.0099566093
         -0.0000975656
         -0.0003605620
         0.0010878742
         0.0016639256
         -0.0015931041
         -0.0048169384
         0.0066814525
         -0.0013640499
         0.0146301707
         0.0005770567
         0.0013410316
         -0.0011572207
         -0.0002633522
         -0.0008701013
         -0.2094618841
    phip
    phac
     ];

    Infid = 5.5931e-05
