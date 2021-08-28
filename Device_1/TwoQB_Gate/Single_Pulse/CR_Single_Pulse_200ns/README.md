### Calculate_Required_CR_Parms_Sin_Coef: to calculate the theoretical paramters


### CR_Sgle_Pulse_ud_basis_thy: Assume perfect 3-level system, given Hamiltonian to evolve


### CR_Sgle_Pulse: fully Numerical simulation, calculate infiedlirt g


### Par_CR_Sgle_Pulse:  fully Numerical simulation, calculate infiedlirt  partial-g


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

        % phip (not optimize)
        % phac (not optimize)

5. initial:
    since we are at the undriven basis
    
        init = Identity
    
6. Fidelity:
    Suppose get U, and an ideal propagator U_I
    
        F = tr( U_I^{dagger} @ U )
