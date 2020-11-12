
using RtMidi.LibRtMidi

apis = Vector{RtMidiApi}()
MAX_APIS = 7 # Only 6 apis are considered (exhaustive though)

for i in 1:MAX_APIS
    push!(apis, RtMidiApi(0))
end

api_count = rtmidi_get_compiled_api(apis, 7)

println("Found ($api_count) apis in your system :")
for i in apis
	if i == RtMidiApi(0)
		continue
	else
		println(unsafe_string(rtmidi_api_name(i))) # rtmidi_api_display_name is equally good
	end
end







