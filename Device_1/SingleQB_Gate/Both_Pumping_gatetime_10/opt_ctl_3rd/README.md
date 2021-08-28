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
    gate time = 10 ns
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

    x0 = [   0.234336742338174
    -0.004284112787110
     0.033995367895655
     0.002294482994791
     0.011726503882330
    -0.000123977385499
    -0.000253844334880
    -0.000042893121186
     0.018918159394093
    -0.000745989627826
     0.020693243802697
     0.001321922324813
     0.012916913780513
     0.000118390490510
     0.000242185273711
     0.000039006491481
     0.002742134366729
     0.011538515417558
    -0.005131496610482
    -0.006643363560096
    -0.003575800156721
     0.000022123491584
     0.000207576036747
    -0.000013466828646
     0.004380189027305
     0.011058940731377
     0.001507637901675
    -0.009265387391256
    -0.006884195948199
    -0.000023313446065
    -0.000206050755933
     0.000011057017041
     0.000075217377103
     0.000758230554261]
     
     infid = 2.8E-5


after

    x0 = [        
     0.217338970291459
    -0.005709707472652
     0.047213196911602
     0.000147618743845
     0.108636058164520
    -0.001911107082751
    -0.012290673405265
    -0.004844988613327
    -0.022754562373669
     0.001034833428266
    -0.019196950899114
     0.000903620749746
     0.014884244858270
    -0.000377251009584
     0.039124777679784
     0.003376134457163
     0.098632055678208
    -0.001588437655784
    -0.011475438839174
    -0.001057989058982
    -0.012182095572871
    -0.006344570736109
    -0.022804757703088
    -0.006080589166157
    -0.000186592327352
     0.013130776397810
    -0.017428473479300
    -0.047591902215518
     0.010666005179694
    -0.016195801533302
     0.024146613054441
     0.040696335202903
     0.027376801953330
     0.023097352677324
     0.013615819588162
     0.012531764988935
    -0.020105431224972
     0.013309601396463
    -0.017097849578941
    -0.045039439708937
    -0.063389462746460
    -0.017563797022273
    -0.006764377646141
     0.046396707068379
     0.022511106238285
     0.006784640163296
     0.017792409928190
     0.015808021707524
     0.000644944102386
    -0.046030991867220];

    infid = 3.8E-6
