#!/bin/bash

set -e

rojo sourcemap default.project.json --output sourcemap.json --include-non-scripts
if [ ! -f ./globalTypes.d.lua ]; then
    curl -O -s https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/main/scripts/globalTypes.d.lua
fi

luau-lsp-rokit analyze \
    --definitions=globalTypes.d.lua \
    --base-luaurc=src/.luaurc \
    --sourcemap=sourcemap.json \
    --platform roblox \
    --flag:LuauSolverV2=True \
    src/ \
2>&1 | sed -e 's/ \[.*\](/(/; s|'"$PWD"'/||' 1>&2
