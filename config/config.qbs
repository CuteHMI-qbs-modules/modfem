import qbs 1.0
import qbs.Probes
import qbs.FileInfo

/**
  ModFEM configuration.
  */
Module {
	PropertyOptions {
		name: "renumbering"
		description: "Whether to use renumbering."
	}
	property bool renumbering: true

	PropertyOptions {
		name: "internalRenumbering"
		description: "Whether to use internal renumbering."
	}
	property bool internalRenumbering: false

	PropertyOptions {
		name: "mixedApproximationMatrixStorage"
		description: "Mixed approximation matrix storage type."
		allowedValues: ["dofByDof", "fieldByField"]
	}
	property string mixedApproximationMatrixStorage: "dofByDof"

	PropertyOptions {
		name: "openMPLibrary"
		description: "OpenMP implementation to be used."
		allowedValues: ["gomp", "iomp5"]
	}
	property string openMPLibrary: "gomp"

	PropertyOptions {
		name: "acceleration"
		description: "Type of acceleration."
//		allowedValues: ["none", "openmp", "opencl"]
		allowedValues: ["none", "openmp"]
	}
	property string acceleration: "openmp"

	PropertyOptions {
		name: "mpi"
		description: "Whether to use MPI"
		allowedValues: [false]
	}
	property bool mpi: false

	PropertyOptions {
		name: "mm"
		description: "Mesh manipulation module."
//		allowedValues: ["prism", "prism_2", "mm_t4", "remesh"]
		allowedValues: ["prism", "mm_t4"]
	}
	property string mm: "mm_t4"
//	property string mm: "prism"

	PropertyOptions {
		name: "ap"
		description: "Aproximation module."
		allowedValues: ["std_lin"]
	}
	property string ap: "std_lin"

	PropertyOptions {
		name: "pd"
		description: "Problem module."
		allowedValues: ["heat", "ns_supg", "ns_supg_heat"]
	}
	property string pd: "ns_supg_heat"

	PropertyOptions {
		name: "mkbDirectSolver"
		description: "Direct solver module."
//		allowedValues: ["pardiso", "viennacl", "mumps", "superlu"]
		allowedValues: ["pardiso"]
	}
	property string mkbDirectSolver: "pardiso"

	/// @todo remove this option if ModFEM.2 apporach works (with pd).
	PropertyOptions {
		name: "problem"
		description: "Problem."
//		allowedValues: ["ModFEM.pd_heat.0", "ModFEM.ps_ns_supg_heat.0"]
		allowedValues: ["ModFEM.pd_heat.0"]
	}
	property string problem: "ModFEM.pd_heat.0"
}

//(c)C: Copyright © 2019, Michał Policht <michal@policht.pl>. All rights reserved.
//(c)C: This file is a part of CuteHMI.
//(c)C: CuteHMI is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
//(c)C: CuteHMI is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
//(c)C: You should have received a copy of the GNU Lesser General Public License along with CuteHMI.  If not, see <https://www.gnu.org/licenses/>.
