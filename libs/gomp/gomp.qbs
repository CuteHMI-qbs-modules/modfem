import qbs 1.0
import qbs.Probes
import qbs.FileInfo

/**
  GNU OpenMP library.
  */
Module {
	property bool found: libraryProbe.found && headerProbe.found

	property bool available: found

	property string libraryPath: libraryProbe.filePath

	property string includePath: headerProbe.path

	Properties {
		condition: qbs.targetOS.contains("linux") && found
		cpp.dynamicLibraries: ["gomp"]
	}

	Probes.PathProbe {
		id: libraryProbe

		names: ["libgomp"]
		nameSuffixes: [".so"]
		//<qbs-cutehmi.libs.gomp-1.workaround target="Linux_distributions" cause="stale">
		// Unless packages are upgraded deprecated features such as "pathPrefixes" have to be used.
		pathPrefixes: cpp.libraryPaths.concat(cpp.compilerLibraryPaths ? cpp.compilerLibraryPaths : [])
							.concat(cpp.systemRunPaths ? cpp.systemRunPaths : [])
							.concat(cpp.distributionLibraryPaths ? cpp.distributionLibraryPaths : [])
							.concat([cutehmi.dirs.externalLibDir])
		// Instead of:
		//	searchPaths: cpp.libraryPaths.concat(cpp.compilerLibraryPaths ? cpp.compilerLibraryPaths : [])
		//					.concat(cpp.systemRunPaths ? cpp.systemRunPaths : [])
		//					.concat(cpp.distributionLibraryPaths ? cpp.distributionLibraryPaths : [])
		//					.concat([cutehmi.dirs.externalLibDir])
		//</qbs-cutehmi.libs.gomp-1.workaround>
	}

	Probes.PathProbe {
		id: headerProbe

		names: ["omp.h"]
		//<qbs-cutehmi.libs.gomp-1.workaround target="Linux_distributions" cause="stale">
		// Unless packages are upgraded deprecated features such as "pathPrefixes" have to be used.
		pathPrefixes: cpp.includePaths.concat(cpp.compilerIncludePaths ? cpp.compilerIncludePaths : [])
							.concat(cpp.systemIncludePaths ? cpp.systemIncludePaths : [])
							.concat(cpp.distributionIncludePaths ? cpp.distributionIncludePaths : [])
							.concat([cutehmi.dirs.externalIncludeDir])
		// Instead of:
		//	searchPaths: cpp.includePaths.concat(cpp.compilerIncludePaths ? cpp.compilerIncludePaths : [])
		//					.concat(cpp.systemIncludePaths ? cpp.systemIncludePaths : [])
		//					.concat(cpp.distributionIncludePaths ? cpp.distributionIncludePaths : [])
		//					.concat([cutehmi.dirs.externalIncludeDir])
		//</qbs-cutehmi.libs.gomp-1.workaround>
	}

	Depends { name: "cpp" }

	Depends { name: "cutehmi.dirs" }
}

//(c)C: Copyright © 2019, Michał Policht <michal@policht.pl>. All rights reserved.
//(c)C: This file is a part of CuteHMI.
//(c)C: CuteHMI is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
//(c)C: CuteHMI is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
//(c)C: You should have received a copy of the GNU Lesser General Public License along with CuteHMI.  If not, see <https://www.gnu.org/licenses/>.