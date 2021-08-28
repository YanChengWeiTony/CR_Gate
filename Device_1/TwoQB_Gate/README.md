# CR_Gate

## Description:

In the field of quantum-computing gate operation, Cross resonance (CR) gate is one of ways to implement 2-qubit gate. The code includes 

1. Numerical simulation of CR gates with experimental parameters [1]

2. Optimal control, in order to search for the best pulse shape [2]

## Task:
1. I do the optimal control for the echo-away scheme (see Two_Pulses)
2. I do the optimal control for the single-pulse scheme (see Single_Pulses)
3. I consider the decoherence of the device (see Decoherence)
 
## Some results:
1. Two-pulse scheme's pulse shape:
 <img src="https://github.com/YanChengWeiTony/CR_Gate/blob/main/Device_1/TwoQB_Gate/Two_Pulses/Opt_Cntl_Full/opt_cntl_2/SingleCase_1.jpg" width="600" height="400">

```
Infidelity: ~5.4E-5
```

2. Two-pulse scheme's pulse shape:
 <img src="https://github.com/YanChengWeiTony/CR_Gate/blob/main/Device_1/TwoQB_Gate/Single_Pulse/CR_Single_Pulse_100ns/GRAPE4/single_case.jpg" width="600" height="400">

```
Infidelity: ~ 1.9E-4
```

3. Infidelity v.s. Coherence time:
 <img src="https://github.com/YanChengWeiTony/CR_Gate/blob/main/Device_1/TwoQB_Gate/Decoherence/multiple_read_all.jpg" width="600" height="400">

## Usage
1. Requirements: MATLAB 2016 or above
2. Download the code by

	git clone https://github.com/YanChengWeiTony/CR_gate.git
	cd CR_gate


## Reference:

[1] Sarah Sheldon, Easwar Magesan, Jerry M. Chow, and Jay M. Gambetta. Procedure for systematically tuning up cross-talk in the cross-resonance gate. Phys. Rev. A, 93:060302, Jun 2016

[2] Susanna Kirchhoff, Torsten Keßler, Per J. Liebermann, Elie Ass´emat, Shai Machnes, Felix Motzoi,
and Frank K. Wilhelm. Optimized cross-resonance gate for coupled transmon systems. Phys. Rev.
A, 97:042348, Apr 2018.


