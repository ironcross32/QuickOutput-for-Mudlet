-- The quick_output table holds all of this package's functions and state.
quick_output = quick_output or {}
quick_output.timeout = 0.3 -- seconds allowed between the two presses of a double press
quick_output.last_press = quick_output.last_press or 0
quick_output.presses = quick_output.presses or 0
quick_output.old_line = quick_output.old_line or ""

-- Speaks text: announce() on Windows, TTS on other systems.
function quick_output.say(text)
    if type(text) ~= "string" then
        error("Expected string")
    end -- if
    if getOS() == "windows" then
        announce(text)
    else
        ttsQueue(text)
    end -- if
end -- func

-- Reads one of the 10 most recent lines of output. 1 is the newest, 10 the oldest.
-- Pressing the same key twice quickly copies that line to the clipboard.
function quick_output.get_line(number)
    local line = ""
    if number == 1 then
        moveCursorEnd()
        line = getCurrentLine()
        if line == "" then
            moveCursorUp()
            line = getCurrentLine()
        end -- if
    elseif number <= 10 then
        if moveCursor(0, getLastLineNumber() - number) then
            line = getCurrentLine()
        else
            line = "error getting line"
        end -- if
    end -- if
    -- Put the cursor back at the end so later echoes and triggers aren't affected.
    moveCursorEnd()
    if line == "" then line = "blank" end

    -- getEpoch() is wall-clock time. os.clock() measures CPU time, which made the
    -- double-press window unreliable.
    local now = getEpoch()
    if line == quick_output.old_line and now - quick_output.last_press <= quick_output.timeout then
        quick_output.presses = quick_output.presses + 1
    else
        quick_output.presses = 0
    end -- if
    quick_output.old_line = line
    quick_output.last_press = now

    if quick_output.presses >= 1 then
        quick_output.presses = 0
        if setClipboardText(line) then quick_output.say("copied") end
        return
    end -- if
    quick_output.say(line)
end -- func
