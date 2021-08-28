# Descriptions:

### g: infidelity

### optimal_control_fx_fy_i: the i^th initial parameters to do the optimal control. I then only select few of them for the next optimal-control iteration.


### Only_g_fully_Numerical_ActiveCancellation_plot_Import: fully Numerical simulation, calculate  only g, plot the results

### Only_g_fully_Numerical_ActiveCancellation_plot_pop_Import: fully Numerical simulation, calculate  only g, plot the results and the state population.


### Only_g_fully_Numerical_ActiveCancellation_Import: fully Numerical simulation, calculate  only g, do not plot the results


### fully_Numerical_ActiveCancellation_plot_Import:: fully Numerical simulation, calculate  g's gradient, plot the results


### fully_Numerical_ActiveCancellation_Import: fully Numerical simulation, calculate  g's gradient, do not plot the results


# Notes:
1. gate time = 160 ns
2. optimal variables: 
a. f-CR-x
b. f-CR-y


3. Spec:
Input:

        % pn: fCR-x (both first and second pulse)
        % qn: fCR-y (first pulse)
        % rn: fAC-y (second pulse)

        % phip (not optimize, hyperparameters)
        % phac (not optimize, hyperparameters)
        $ B (not optimize, hyperparameters)


# Results

initial:

    x0 = [    0.2359
       -0.0447
        0.0132
        0.0008
       -0.0251
        0.0005
       -0.0040
        0.0003
       -0.0004
        0.0000
       -0.0012
        0.0000
        0.0023
       -0.0133
        0.0015
       -0.0055
        0.0097
        0.0004]; 
        
     infid = 2.4E-5

after:


    x0 = [ 0.2371
       -0.0447
        0.0136
        0.0006
       -0.0245
        0.0005
       -0.0025
        0.0017
       -0.0030
        0.0011
       -0.0001
        0.0005
        0.0020
       -0.0131
        0.0013
       -0.0058
        0.0096
        0.0003];
    
    infid = 1.67E-5
