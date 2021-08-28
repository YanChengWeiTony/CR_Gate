# Superconducting_qubit_CR_gate

## Description:

In the field of quantum-computing gate operation, Cross resonance (CR) gate is one of ways to implement 2-qubit gate in the superconducting devices. The code is to numerical simulation its dynamics. The work includes

1. Numerical simulation of CR gates with experimental parameters [1]

2. Optimal control, in order to search for the best pulse shape [2]


## Task:
1. I investigated two devices: One is with relatively weak interaction and have been implemented with real devices (Device_1) [1]; the other is with stronger interaction and was proposed in (Device_2) [2].

2. In each devices, I investigated both single-qubit and two-qubit gates, as well as the optimal control on them.

	a. In the device_1, for the two-qubit gate, I investigated two schemes: two-pulse (echo-away) and sinlge-pulse schemes.
    
	b. In the device_1, for the single-qubit fate, I investigated two schemes: only control one qubit and simultaneously control both qubits.


3. For device_1, I consider the decoherence process and try to see its effect on the device's fidelity.

 
## Folder Description:

1. Device 1: with relatively weak interaction and have been implemented with real devices [1]
2. Device 2: with stronger interaction and was proposed in [2].
3. estimate_cross_leak.m: To estimate the interaction strength and leakage versus different detunings. It generates estimate_cross_leak.jpg
4. Infid_time_system: Summarize the optimal-control results and plot with real-device results. It generates Infid_time_system.jpg

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



