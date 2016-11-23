Configuring Project
-------------------

When opening the Visual Studio Solution, check Project->Properties->Reference Paths
for a reference path "...Extension-Biomass-Harvest\src\libs". If it is not there, add the
path to ensure the Solution builds correctly.

Visual Studio will mark references to the DLLs as unresolved until the solution is rebuilt
- when it is built, it will automatically download the required DLLs and put them in the
correct folder for you. To download the latest versions of the DLLs, simply delete the
files found in src/libs/ and then rebuild the Visual Studio solution.