# Descriptions:
1. This is to do the optimal control on the CR gate with 80ns gate time. I runs through 5 iterations. In each iteration I run GOAT algorithm to optimize the parameters, in order to decrease the infidelity. After each iteration, I add new parameters (initialized with 0) and start a new optimal-control iteration.

    Each iteration details  are in the folder "GRAPE0" ~ "GRAPE5".
    
2. I also scan through the parameters and check whether the GOAT can predict the real infidelity's gradients. Please see the folder "scan_dp".


# Notes:
1. all stand on the undriven basis
2. gate time = 80 ns
3. optimal variables: 
a. f-CR-x
b. f-CR-y
c. f-Active_cancellation - x
d. f-Active_cancellation - y

