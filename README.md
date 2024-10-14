This repository contains example run files for several systems.

These systems include:
* Solvation free energies upon ligand perturbation of 1,4-disubstituted benzene derivatives
* Binding free energies upon ligand perturbation of p38 binders
* Protein folding free energies upon site saturation mutagenesis at T16 in protein G
* Protein folding free energies upon mutation (site chain only) in T4 lysozyme

Each system should eventually have scripts for several supported MD engines, including CHARMM and pyCHARMM.

Each of these systems contains a prep directory which contains all system specific information.

There is also a templates directory, with example files for setting up and running ALF. Note that some systems may use the newer nonlinear ALF, and some may use the older linearized ALF. You can tell the difference by the presence of the 'lmalf' key in the dictionary created by prep/alf_info.py. Without that key, you are using standard linearized ALF. Linearized ALF does not work well for more than 8-9 substituents.
