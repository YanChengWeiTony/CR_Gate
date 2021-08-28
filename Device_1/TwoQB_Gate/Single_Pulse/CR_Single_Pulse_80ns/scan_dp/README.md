# Descriptions:

### g: infidelity

### scan_pg: scan through the parameters to see whether the GOAT's calculated gradient matches the real gradient


### Par_no_plot_Import: fully Numerical simulation, calculate  g's gradient, do not plot the results

# Notes:
1. all stand on the undriven basis
2. gate time = 80 ns
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
