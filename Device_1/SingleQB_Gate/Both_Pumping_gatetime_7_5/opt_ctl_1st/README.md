## FRAME -> omega = 32.1357 GHz = 1st qubit dressed state


### XI_plot_Import: fully Numerical simulation, calculate infiedlirt g


### Par_XI_plot_Import:  fully Numerical simulation, calculate infiedlirt  partial-g


# Notes:
1. 
a. all stand on the undriven basis
b. 
omega1: control-qubit frequency
omega2: target-qubit frequency
omegap: the frequency of the frame I am standing

--------------------------------------------------------------------
p.omegap: the frequency of the frame I am standing
p.omega1: the driving-microeave frequency at the control qubit.

2.
gate time = 7.5 ns
    lev = 5
    
3. optimal variables: 
a. fx (freq initially matches 1st qubit dressed state)
b. fy (freq initially matches 1st qubit dressed state)
c. Detuneing
d. fx2 (freq initially matches 2md qubit dressed state)
e. fy2 (freq initially matches 2nd qubit dressed state)
f. Detuneing2
d. Detuneing offset
d. Detuneing offset2


4. Spec
Input:

        % an: fx
        % bn: fy
        % cn: Detuning
        % dn: fx_2 (target)
        % en: fy_2 (target)
        % fn: Detuning_2 (target)

        % phip (not optimize)
        % phac (not optimize)

5. initial:
    since we are at the undriven basis
    
        init = Identity
    
6. Fidelity:
    Suppose get U, and an ideal propagator U_I
    
        F = tr( U_I^{dagger} @ U )

init:

    x0 = [        
     0.272422739034554
    -0.005077702036888
     0.138095389333432
     0.006414221968443
     0.067955698048560
     0.025345673230313
    -0.002942616133615
     0.090249109511124
     0.006150417713614
     0.064110199249134
    -0.002538073570029
    -0.002947673082863
     0.009300953996740
    -0.000128892268046
    -0.003166349726838
    -0.014784460061093
    -0.007950280164445
     0.013237241152093
     0.002387335590829
    -0.003226387472605
    -0.000273313631593
     0.001851351287212];
     infid = 6E-5

After:

    ~ init
