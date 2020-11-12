using RtMidi.LibRtMidi

dev_in = rtmidi_in_create_default()

rtmidi_open_port(dev_in, 1, "")

message_note_on = Vector{Cuchar}([144, 63, 30])

# message_note_off = Vector{Cuchar}([128, 63, 40])

messageSize = Vector{Cuint}(undef, 1)

# rtmidi_in_get_message(dev_in, message_note_on, messageSize)

a = unsafe_string(rtmidi_get_port_name(dev_in, 1))
print(a)

# Testing callback function working


# function midiInCallback(deltaT, messageIn, messageSize, userData)::Cvoid
#     # global deltaTime, message_note_off, message_note_on
#     # deltaTime = deltaT
#     # # message_note_on = messageIn
#     # @info deltaT
#     # for i in 0:messageSize - 1
#     #     println!(messageIn[i])
#     # end
    # global deltaTime
#     # deltaTime = deltaT
#     # println("$(deltaT)")
#     # return Cvoid
#     # @info deltaT
#     # deltaTime = deltaT
# end

# callbackPtr = @cfunction(midiInCallback, Cvoid, (Cdouble, Ptr{UInt8}, Csize_t, Ptr{Cvoid}))

# rtmidi_in_set_callback(dev_in, callbackPtr, Ptr{Cvoid}())

sleep(4)

rtmidi_in_get_message(dev_in, message_note_on, messageSize )

print(message_note_on)
print(messageSize)
sleep(2)

rtmidi_out_free(dev_in)
