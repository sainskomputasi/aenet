# ænet
using aenet for ANN potentials in this case for elucidate non-stoichiometric FeS structure

The construction of a new ANN potential is accomplished by interpolation of structural energies in a refrence data set. The structure format used by aenet is explained in `reference_example.xsf`

To be useful for general atomistic simulations, ANN potentials have to be invariant with respect to rotation/translation of the structure and exchange of equivalent atoms. Hence, the atomic coordinates have to be represented in a basis that fulfills these conditions. The specification of basis setups (structural fingerprint setups) is topic of section **invariant-basis** in this file.

The transformation from Cartesian coordinates to invariant coordinates is the purpose of the tool `generate.x`, which iterates through a list of reference structures and transforms each structure’s coordinates using the method specified in the input file. The input file format for `generate.x` is discussed in section **generate**.

# invariant basis
Currently, **ænet** implements two descriptors for the local atomic environment: the Artrith-Urban-Ceder descriptor based on a Chebyshev expansion [2] and the invariant symmetry function basis by Behler and Parrinello [3,4]. The code is designed such that implementing further methods is straightforward.

# generate
Provided a principle input file and all required structural fingerprint setups, `generate.x` is run on the command line simply with

`$ generate.x generate.in > generate.out`

where `generate.in` is the principal input file, and the output will be written to `generate.out`. The code will generate a training set file that can be used for the training of ANN potentials.

The format and keywords of the principal input file are described in the following.

# keywords (sorted alphabetically)
All keywords are case insensitive and independent of the order. Blank lines and lines starting with `!`, `#`, or `%` are ignored.

`debug` (optional) Activate debugging mode; additional output will be generated.

`files` (required) Specifies number of and path to reference structures in the ænet XSF format. The first line following the keyword contains the number <NF> of structure files. Each of the `<NF>` following lines contains a file system path.
  
  `output` (optional) Defines the path to the training set file that is going to be generated. The default name is “refdata.train”. Note that the training set file is in a binary format and cannot be viewed by a text editor. Depending on the number of reference structures, the file can become very large (e.g., 1 GB).
  
  `setups` (required) Specifies paths to structural fingerprint basis function setup files. Each of the <NT> lines following the keyword contains the chemical symbol `<T_i>` and the path to the setup file for one species.
  
  `timing` (optional) Activate timing; additional output files will be created.
  
  `types` (required) Defines the number of atomic species, their names, and atomic energies. The first line after the keyword contains the number of different species `<NT>`; the following `<NT>` lines each contain the chemical symbol `<T_i>` and atomic energy `<E_atom-i>` of one species.
