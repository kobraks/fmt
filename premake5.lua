project "fmt"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	staticruntime "off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/fmt/**.h",
		"src/format.cc",
		"src/os.cc",
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS",
	}

	includedirs
	{
		"include",
	}

	links
	{
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

        defines { "DEBUG" }

        links
        {
        }

    filter "configurations:Release"
        runtime "Release"
        optimize "On"
        symbols "Off"

        defines { "NDEBUG" }

        links
        {
        }

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"
        symbols "Off"

        defines { "NDEBUG" }

        links
        {
        }