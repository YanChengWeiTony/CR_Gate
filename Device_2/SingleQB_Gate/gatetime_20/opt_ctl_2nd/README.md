## FRAME -> omega = 32.1357 GHz = 1st qubit dressed state


### XI_plot_Import: fully Numerical simulation, calculate infiedlirt g


### Par_XI_plot_Import:  fully Numerical simulation, calculate infiedlirt  partial-g


# Notes:
1. all stand on the undriven basis
2.
    gate time = 20 ns
    lev = 5
3. optimal variables: 
a. fx (freq matches 1st qubit dressed state)
b. fy (freq matches 1st qubit dressed state)
c. Detuneing (I set the basis number = 1, meaning it is a constant)

4. Spec
Input:

        % an: fx
        % bn: fy
        % cn: Detuning

        % phip (not optimize)
        % phac (not optimize)

5. initial:
    since we are at the undriven basis
    
        init = Identity
    
6. Fidelity:
    Suppose get U, and an ideal propagator U_I
    
        F = tr( U_I^{dagger} @ U )

init:

    x0 = [   0.072284764231151
    -0.142801481583020
     0.117814610622913
    -0.041788118709431
     0.051827394847182
     0.009638779636613
     0.023036031337497
    -0.034517072384328
     0.020816696817995
    -0.040980027173565
    -0.000887718940075
    -0.036543836645484
    -0.016691967265453
     0.021266271318362
    -0.013243355180525
    -0.038870409437662
     0.023515454441249
     0.005238347690061
     0.035785029135056
    -0.010498273811884
     0.013880176643804]
     
     infid = 7E-3

after:

    x0 = [ 0.070415457156279
      -0.142373432430250
       0.116141326820623
      -0.041184307910945
       0.050491481039249
       0.009273259880977
       0.021887120434943
      -0.033467364408089
       0.022797410326149
      -0.039797451303542
      -0.000998886354329
       0.001184349479472
       0.000561425846489
       0.000747687397391
       0.000356853527314
       0.004404108491937
      -0.040767782379361
      -0.013568723562381
       0.020173444217889
      -0.011958190210241
      -0.038245705541513
       0.024580518253119
       0.004232720009826
       0.033867163919926
      -0.011761884378564
       0.000996802919148
      -0.001162769038273
      -0.000570763443509
      -0.000762702482984
      -0.000316313494594
       0.032671423993251];

    infid = 0.0679
