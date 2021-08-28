# Descriptions:

### g: infidelity

### CR_Sgle_Pulse_Import: fully Numerical simulation, calculate only g, plot the results

### CR_no_plot_Import: fully Numerical simulation, calculate only g, do not plot the results

### Par_CR_Sgle_Pulse_Import: fully Numerical simulation, calculate  g's gradient, plot the results

### Par_no_plot_Import: fully Numerical simulation, calculate  g's gradient, do not plot the results


# Notes:
1. all stand on the undriven basis
2. gate time = 250 ns
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


initial:
    
    phip = -0.085;
    phac = 3.25;

    input0 = [     0.0937
    -0.0033
    0.0310
    0
    0

    -0.0053
    0
    0

    0.0006
    0.0005
    0.0070
    0
    0

    -0.0000
    0
    0

    0.7160
    phip
    phac
    ];
    
    infid = 1.3E-4

After:

    input0 = [         
    0.09650
    -0.00080
    0.02275
    0.00020
    -0.0027

    -0.0014
    0.0001
    -0.0010

    0.0001
    0.0018
    0.0035
    0.00075
    0.0083

    0.0001
    -0.0005
    -0.00065

    0.7040
    phip
    phac
    ];

    infid = 7.2E-5
