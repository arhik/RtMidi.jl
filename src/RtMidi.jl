module RtMidi

include("LibRtMidi.jl")
using Reexport
@reexport using .LibRtMidi

end # module
