import qbs

Module {
	Group {
		name: "mm_prism"

		condition: product.modfem.config.mm === "prism"

		files: [
			"include/modfem/mm_prism/mmh_prism.h",
			"src/modfem/mm_prism/mms_prism_datstr.c",
			"src/modfem/mm_prism/mms_prism_input_gradmesh.c",
			"src/modfem/mm_prism/mms_prism_intf.c",
			"src/modfem/mm_prism/mms_prism_io_dump.c",
			"src/modfem/mm_prism/mms_prism_ref.c",
			"src/modfem/mm_prism/mms_prism_util.c",
			"src/modfem/mm_prism/mms_util.c",
		]
	}

	Depends { name: "modfem.config" }
}
