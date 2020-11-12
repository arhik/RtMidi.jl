using RtMidi.LibRtMidi

dev_out = rtmidi_out_create_default()

rtmidi_open_port(dev_out, 0, "")

message_note_on = Vector{Cuchar}([144, 63, 30])

message_note_off = Vector{Cuchar}([128, 63, 40])

rtmidi_out_send_message(dev_out, message_note_on, 3)

sleep(1)

rtmidi_out_send_message(dev_out, message_note_off, 3)

sleep(2)

rtmidi_out_send_message(dev_out, message_note_on, 3)

sleep(1)

rtmidi_out_send_message(dev_out, message_note_off, 3)




#rtmidi_out_free(dev_out)
