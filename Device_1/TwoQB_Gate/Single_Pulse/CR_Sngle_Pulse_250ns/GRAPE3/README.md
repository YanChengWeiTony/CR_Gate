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

initiial:

    phip = -0.0850;
    phac = 3.25;
     
    input0 = [ 
        0.0965610021
         -0.0007228172
         0.0224055451
         0.0001462357
         -0.0026762560
         -0.0020132351
         0.0000230662
         -0.0011915325
         -0.0000290717
         -0.0000484381
         0.0001962645
         0.0014824645
         0.0033722341
         0.0007860691
         0.0080055673
         0.0001614626
         -0.0003993807
         -0.0006161951
         -0.0000297480
         -0.0002045512
         0.7037662177
    phip
    phac
     ];

    Infid = 6.9444e-05

After ~ Initial
