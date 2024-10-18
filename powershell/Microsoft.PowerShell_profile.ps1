set-alias 7z "C:\Program Files\7-Zip\7z.exe"

# Changes prompt to dynamically change based on size.
# Stolen from stackoverflow...
function global:prompt {
    $dirSep = [IO.Path]::DirectorySeparatorChar
    $pathComponents = $PWD.Path.Split($dirSep)
    $displayPath = if ($pathComponents.Count -le 3) {
        $PWD.Path
    } else {
        # '...{0}{1}' -f $dirSep, ($pathComponents[-2, -1] -join $dirSep)
        '...{0}{1}' -f $dirSep, ($pathComponents[-1] -join $dirSep)
    }
    "PS {0}$('>' * ($nestedPromptLevel + 1)) " -f $displayPath
}
