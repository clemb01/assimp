project "zlib"
    kind "StaticLib"
	language "C"
	staticruntime "off"
    location "contrib/zlib"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"contrib/zlib/**.h",
		"contrib/zlib/**.c",
	}

    includedirs {
		"code",
        "include",
        "contrib",
        "contrib/zlib",
        "."
	}

    removefiles { "contrib/zlib/contrib/**" }

	defines {
        "_CRT_SECURE_NO_DEPRECATE",
        "_CRT_NONSTDC_NO_DEPRECATE",
        "NO_FSEEKO",
        "ASSIMP_BUILD_NO_M3D_EXPORTER",
        "ASSIMP_BUILD_NO_M3D_IMPORTER",
    }

    filter "system:windows"
		systemversion "latest"

		defines {
            "WIN32",
            "_WINDOWS",
			"WIN32_LEAN_AND_MEAN"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

		defines {
			"_DEBUG"
		}

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

		defines {
			"NDEBUG"
		}

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"

		defines {
			"NDEBUG"
		}


project "assimp"
    kind "SharedLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"code/AssetLib/**.h",
		"code/AssetLib/**.c",
		"code/AssetLib/**.cpp",
		"code/AssetLib/**.hpp",
		"code/CApi/**",
        "code/Common/AssertHandler.cpp",
        "code/Common/Assimp.cpp",
        "code/Common/Base64.cpp",
        "code/Common/BaseImporter.cpp",
        "code/Common/BaseProcess.h",
        "code/Common/BaseProcess.cpp",
        "code/Common/Bitmap.cpp",
        "code/Common/Compression.h",
        "code/Common/Compression.cpp",
        "code/Common/CreateAnimMesh.cpp",
        "code/Common/DefaultIOStream.cpp",
        "code/Common/DefaultIOSystem.cpp",
        "code/Common/DefaultLogger.cpp",
        "code/Common/DefaultProgressHandler.h",
        "code/Common/Exceptional.cpp",
        "code/Common/Exporter.cpp",
        "code/Common/FileLogStream.h",
        "code/Common/IFF.h",
        "code/Common/Importer.h",
        "code/Common/Importer.cpp",
        "code/Common/ImporterRegistry.cpp",
        "code/Common/IOSystem.cpp",
        "code/Common/material.cpp",
        "code/Common/Maybe.h",
        "code/Common/PolyTools.h",
        "code/Common/PostStepRegistry.cpp",
        "code/Common/RemoveComments.cpp",
        "code/Common/scene.cpp",
        "code/Common/SceneCombiner.cpp",
        "code/Common/ScenePreprocessor.cpp",
        "code/Common/ScenePreprocessor.h",
        "code/Common/ScenePrivate.h",
        "code/Common/SGSpatialSort.cpp",
        "code/Common/simd.cpp",
        "code/Common/simd.h",
        "code/Common/SkeletonMeshBuilder.cpp",
        "code/Common/SpatialSort.cpp",
        "code/Common/StandardShapes.cpp",
        "code/Common/StbCommon.h",
        "code/Common/StdOStreamLogStream.h",
        "code/Common/Subdivision.cpp",
        "code/Common/TargetAnimation.cpp",
        "code/Common/TargetAnimation.h",
        "code/Common/Version.cpp",
        "code/Common/VertexTriangleAdjacency.cpp",
        "code/Common/VertexTriangleAdjacency.h",
        "code/Common/Win32DebugLogStream.h",
        "code/Common/ZipArchiveIOSystem.cpp",
        "code/Material/**",
        "code/PostProcessing/**",
        "code/Pbrt/**",
        "code/include/**",
		"code/res/**.rc",
        "contrib/clipper/**.hpp",
        "contrib/clipper/**.cpp",
        "contrib/Open3DGC/**",
        "contrib/openddlparser/**.h",
        "contrib/openddlparser/**.cpp",
        "contrib/poly2tri/**.cpp",
        "contrib/poly2tri/**.cc",
        "contrib/poly2tri/**.h",
        "contrib/pugixml/**.hpp",
        "contrib/stb/**.h",
        "contrib/unzip/**",
        "contrib/zip/src/**",
	}

    removefiles { "code/AssetLib/IFC/IFCReaderGen_4.h", "code/AssetLib/IFC/IFCReaderGen_4.cpp" }

    includedirs {
		"code",
        "include",
        "contrib",
        "contrib/openddlparser/include",
        "contrib/pugixml/src",
        "contrib/rapidjson/include",
        "contrib/unzip",
        "contrib/zlib",
        "."
	}

	defines {
        "assimp_EXPORTS",
        "OPENDDLPARSER_BUILD",
        "_CRT_SECURE_NO_WARNINGS",
        "_SCL_SECURE_NO_WARNINGS",
        "RAPIDJSON_NOMEMBERITERATORCLASS",
        "RAPIDJSON_HAS_STDSTRING=1",
        "ASSIMP_IMPORTER_GLTF_USE_OPEN3DGC=1",
        "MINIZ_USE_UNALIGNED_LOADS_AND_STORES=0",
        "ASSIMP_BUILD_NO_C4D_IMPORTER",
        "ASSIMP_BUILD_DLL_EXPORT",
        "ASSIMP_BUILD_NO_M3D_IMPORTER",
        "ASSIMP_BUILD_NO_M3D_EXPORTER"
    }

    links {  
        "zlib"
    }

    filter "system:windows"
		systemversion "latest"

		defines {
            "WIN32",
            "_WINDOWS",
			"WIN32_LEAN_AND_MEAN"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

		defines {
			"_DEBUG"
		}

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

		defines {
			"NDEBUG"
		}

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"

		defines {
			"NDEBUG"
		}
