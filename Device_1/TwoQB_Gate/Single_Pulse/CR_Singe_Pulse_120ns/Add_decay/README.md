### T1_T2_CR_Sgle_Pulse: fully Numerical simulation, calculate infiedlirt g
Consdier decoherence (T1, T2)

### single case: feed parameters into "T1_T2_CR_Sgle_Pulse.m"

### T1_T2_Import.m:
Do the same thing as "T1_T2_CR_Sgle_Pulse.m"

form :
    
    feed into (input0, state, {T}), 
        {T} = [T1_1, T1_2, T2_1, T2_2], # in unit of ns
        
    output = [ans_rho (column form) , g_rho]
    
    
    
# Notes:
1. all stand on the undriven basis
2. gate time = 120 ns
3. optimal variables: 
a. f-CR-x
b. f-CR-y
c. f-Active_cancellation - x
d. f-Active_cancellation - y

4. Fidelity:
    Suppose get  rho, and an ideal propagator rho_I
    
        F = ( tr( rho_I^{dagger} @ rho ) )^.5
The reason is to make connection with previous results (Use propagator)

5. Fidelity:
But the frequent definitions should be as follows. Suppose get  rho, and an ideal propagator rho_I

        F_rho = ( tr( rho_I^{dagger} @ rho ) )

