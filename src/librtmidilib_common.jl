# Automatically generated using Clang.jl


struct RtMidiWrapper
    ptr::Ptr{Cvoid}
    data::Ptr{Cvoid}
    ok::Bool
    msg::Cstring
end

const RtMidiPtr = Ptr{RtMidiWrapper}
const RtMidiInPtr = Ptr{RtMidiWrapper}
const RtMidiOutPtr = Ptr{RtMidiWrapper}

@cenum RtMidiApi::UInt32 begin
    RTMIDI_API_UNSPECIFIED = 0
    RTMIDI_API_MACOSX_CORE = 1
    RTMIDI_API_LINUX_ALSA = 2
    RTMIDI_API_UNIX_JACK = 3
    RTMIDI_API_WINDOWS_MM = 4
    RTMIDI_API_RTMIDI_DUMMY = 5
    RTMIDI_API_NUM = 6
end

@cenum RtMidiErrorType::UInt32 begin
    RTMIDI_ERROR_WARNING = 0
    RTMIDI_ERROR_DEBUG_WARNING = 1
    RTMIDI_ERROR_UNSPECIFIED = 2
    RTMIDI_ERROR_NO_DEVICES_FOUND = 3
    RTMIDI_ERROR_INVALID_DEVICE = 4
    RTMIDI_ERROR_MEMORY_ERROR = 5
    RTMIDI_ERROR_INVALID_PARAMETER = 6
    RTMIDI_ERROR_INVALID_USE = 7
    RTMIDI_ERROR_DRIVER_ERROR = 8
    RTMIDI_ERROR_SYSTEM_ERROR = 9
    RTMIDI_ERROR_THREAD_ERROR = 10
end


const RtMidiCCallback = Ptr{Cvoid}
