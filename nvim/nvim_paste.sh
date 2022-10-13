#!/bin/sh

#check for Win32yank.exe exicutable

if command -v win32yank.exe >/dev/null 2>/dev/null; then
        # the --lf option pastes data unix style. Which is what we almost always want.
        win32yank.exe -o --lf
else
        # Else rely on powershell being installed and available
        powershell.exe Get-Clipboard | tr -d '\r' | sed -z '$ s/\n$//'
fi
