quick_output = quick_output or {}

-- sysUninstall fires for every package and module, so only act on our own.
-- The keys are package items now, so Mudlet removes them itself.
function quick_output.onUninstall(_, name)
    if name ~= "@PKGNAME@" then return end
    -- Uninstalling never clears Lua globals, so drop the table ourselves.
    quick_output = nil
end -- func
