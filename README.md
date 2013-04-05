# LMC1112 - Metamaude: tool for CTMC simulation and verification using Maude and Approximate Probabilistic Model Checking

Project developed for Languages and Computational Models course (2011-2012), by
Daniele Bellavista. Metamaude is a tool, written in *maude*, for
*Continuous-Time Markov Chain* simulation and verification.

## Project Content

> Manual, relation and code comment are in Italian. If someone is interested in
> english translation, contact me.

The project documentation is splitted in Relation and Documentation.

The project relation includes theory concepts about maude meta-level and
PCTL/APMC, the description of CTMC and PCTL project and the comparison with
PRISM.
>	meta-maude.relazione/Bellavista-MetaMaude\_Relazione.pdf

Project manual contains the tool *how-to*
>	meta-maude.relazione/Bellavista-MetaMaude\_Manuale.pdf

Maude code is contained into *maude* directory and it's organized as follow:

* _CTMC.maude:_ CTMC syntax e simulation.
* _PCTL.maude:_ PCTL formulae syntax e verification.
* _CTMC-READERS\_WRITERS.maude:_ READERS\_WRITERS model.
* _CTMC-BSF.maude:_ Bromosulftaleine model test.
* _CTMC-MMCK.maude:_ code M/M/C/K system model.

The directory *prism* contains the PRISM code.
	
## Simulaton Example

Simulation of the *readers and writers* model with 30 initial token,
1000 simulation steps, getting an overview every 100 step and using as random
seed 213.

	 start maude
	 Maude> load CTMC.maude
	 Maude> load PCTL.maude
	 Maude> load CTMC-READERS_WRITERS.maude
	 Maude> set print attribute on .
	 Maude> red in CTMC-RW_SIMULATOR : simulate ( 30, 1000, 100, 213 ) .

## Verification Example

Verification of the *readers and writers* model with 30 initial token that
within 0.1 seconds, a write will be executed with a probability of 80% with
0.1 approximation, confidence 0.01, maximum depth 1000 and random seed 2353.

	 start maude
	 Maude> load CTMC.maude
	 Maude> load PCTL.maude
	 Maude> load CTMC-READERS_WRITERS.maude
	 Maude> set print attribute on .
	 Maude> red in CTMC-RW_VERIFIER : verify ( 30, P[0.8]( (TRUE)U[0.1](upTerm(< v( "write" , 1) >))), 0.1, 0.01, 1000, 2353) .

