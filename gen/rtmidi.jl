using Clang
using CEnum

using Libdl

const RT_MIDI_LIB_INCLUDE = joinpath("/home/arhik/git_repos/rtmidi") |> normpath

const RT_MIDI_LIB_HEADERS = [
	"$RT_MIDI_LIB_INCLUDE/rtmidi_c.h",
       ]


function wrap()
    wc = init(; headers = RT_MIDI_LIB_HEADERS,
	  output_file = joinpath(@__DIR__, "librtmidilib_api.jl"),
	  common_file = joinpath(@__DIR__, "librtmidilib_common.jl"),
	  clang_includes = vcat(CLANG_INCLUDE),
	  clang_args = ["-I", joinpath(RT_MIDI_LIB_INCLUDE)],
	  header_wrapped = (root, current) -> root == current,
	  header_library = x -> "librtmidi",
	  clang_diagnostics = true,
	  )
    run(wc)
end


const librtmidi = "librtmidi"


if abspath(PROGRAM_FILE) == @__FILE__
    wrap()
else
    include("librtmidilib_common.jl")
    include("librtmidilib_api.jl")
end
