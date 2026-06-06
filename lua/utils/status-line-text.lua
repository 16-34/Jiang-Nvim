function ModeName()
    local modes = {
        n = "NORMAL",
        i = "INSERT",
        v = "VISUAL",
        V = "V-LINE",
        ["\22"] = "V-BLOCK",
        R = "REPLACE",
        c = "COMMAND",
        t = "TERMINAL"
    }
    return modes[vim.fn.mode()] or "UNKNOWN"
end

function FileFlags()
    if vim.bo.modified then
        return "[+]"
    end
    if vim.bo.readonly then
        return "[RO]"
    end
    return "[OK]"
end

function ProgressText()
    local cur = vim.fn.line(".")
    local total = vim.fn.line("$")
    if cur == 1 then
        return "TOP"
    elseif cur == total then
        return "BOT"
    end
    return string.format("%d%%", math.floor(cur / total * 100))
end

function FiletypeText()
    return vim.bo.filetype ~= "" and string.upper(vim.bo.filetype) or "TEXT"
end

function DiagnosticsCount()
    local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

    return "E " .. errors .. ", W " .. warnings
end

vim.opt.statusline = "%{v:lua.ModeName()}" .. --
    "  |  %{v:lua.FileFlags()}" ..            --
    "  |  %f" ..                              --
    "  |  %{v:lua.FiletypeText()}" ..         --
    "  |  %{v:lua.DiagnosticsCount()}" ..     --
    "  |  Ln %l, Col %c" ..                   --
    "  |  %{v:lua.ProgressText()}"
