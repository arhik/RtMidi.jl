module LibRtMidi
using Clang
using CEnum

using Libdl

const librtmidi = "librtmidi"

include(joinpath(@__DIR__, "librtmidilib_common.jl"))
include(joinpath(@__DIR__, "librtmidilib_api.jl"))

conflicts = ["eval", "include", "#eval", "#include", "#1#2"]

foreach(names(@__MODULE__, all=true)) do s
    if !(String(s) in conflicts)
        @eval export $s
    end
end

end