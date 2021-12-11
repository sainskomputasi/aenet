# ænet
using aenet for ANN potentials in this case for elucidate non-stoichiometric FeS structure

The construction of a new ANN potential is accomplished by interpolation of structural energies in a refrence data set. The structure format used by aenet is explained in reference_example.xsf 

To be useful for general atomistic simulations, ANN potentials have to be invariant with respect to rotation/translation of the structure and exchange of equivalent atoms. Hence, the atomic coordinates have to be represented in a basis that fulfills these conditions. The specification of basis setups (structural fingerprint setups) is topic of section **invariant-basis** in this file.

# invariant basis
Currently, **ænet** implements two descriptors for the local atomic environment: the Artrith-Urban-Ceder descriptor based on a Chebyshev expansion [2] and the invariant symmetry function basis by Behler and Parrinello [3,4]. The code is designed such that implementing further methods is straightforward.
