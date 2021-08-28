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
    gate time = 5 ns
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
     0.424293557428625
     0.001245192895873
     0.181759190534945
     0.003601624105913
     0.080422421771377
     0.065777718955055
     0.002484934808394
     0.176357070554238
     0.005549555418004
     0.121368241611833
     0.006112790298511
    -0.016344727599159
    -0.011683091323423
     0.002678331385944
    -0.003592929712511
    -0.002898068408623
    -0.019145888103634
    -0.007907566627424
    -0.003861998450250
     0.000012382893126
     0.001870178732205
     0.005700392538694];
     
     infid = 4E-4

after:

    x0 = [        
     0.395871936216832
     0.013394078002133
     0.318933885835675
    -0.008380630647832
     0.098735570289965
    -0.061717645849806
    -0.042681625280610
    -0.016832366122909
    -0.060126986712767
    -0.013420730999954
     0.036318843671876
     0.027425068482224
     0.312968427697814
    -0.014013375726533
     0.142472675996302
     0.011160733893960
     0.001437805055800
    -0.035316476168740
    -0.048023716222715
    -0.033151183869382
     0.002268028431893
    -0.011799626818178
    -0.007300682881768
     0.004592988980650
     0.001129239430397
    -0.008479869347013
     0.001532751813274
    -0.002926071861575
     0.010457874591215
    -0.004358915349034
     0.009614471086801
    -0.024920102253776
    -0.009564021661765
    -0.008769514756996
    -0.001109010460589
    -0.003226341571186
    -0.003562696263581
    -0.005457356353011
    -0.010713637517900
    -0.001388058485396
     0.011649984593967
     0.022498158332122];
     
     infid = 3.89E-4
