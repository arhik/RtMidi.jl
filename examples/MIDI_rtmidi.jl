using RtMidi.LibRtMidi

dev_out = rtmidi_out_create_default()

rtmidi_open_port(dev_out, 0, "")

using MIDI

midifile = readMIDIFile("/home/arhik/Music/Ludovico Einaudi - Nuvole Bianche.mid")

bpm = BPM(midifile)

tickUnitTime = ms_per_tick(midifile)

notes = getnotes(midifile)

currentPos = Int128(0)

function sendNoteOn(note)
    global currentPos
    sleep(tickUnitTime*(note.position - currentPos)/1000)
    currentPos = note.position
    message_note_on = Vector{Cuchar}([144, note.pitch, note.velocity])  
    rtmidi_out_send_message(dev_out, message_note_on, 3)
end

function sendNoteOff(note)
    sleep(tickUnitTime*(note.duration)/1000)
    message_note_off = Vector{Cuchar}([128, note.pitch, note.velocity])
    rtmidi_out_send_message(dev_out, message_note_off, 3)
end


# This function is not a good solution because of 'async'
# Using @sync appropriately is not possible in the lexical scope of this function.
function playNote(note)
    sendNoteOn(note)
    @async sendNoteOff(note)
end

function playsong() 
	@sync for i in notes
	    sendNoteOn(i)
	    @async sendNoteOff(i)
	end
end

playsong()


rtmidi_out_free(dev_out)

