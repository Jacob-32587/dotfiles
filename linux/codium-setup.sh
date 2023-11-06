#!/bin/bash
. ./functions.sh

backup_and_create_ln "$HOME/.dotfiles/.vscode" "$HOME/.config/VSCodium"

codium --force --install-extension TheNuProjectContributors.vscode-nushell-lang-1.7.1.vsix &
codium --force --install-extension abusaidm.html-snippets &
codium --force --install-extension antfu.browse-lite &
codium --force --install-extension antfu.vite &
codium --force --install-extension BeardedBear.beardedtheme &
codium --force --install-extension bungcip.better-toml &
codium --force --install-extension donjayamanne.githistory &
codium --force --install-extension ecmel.vscode-html-css &
codium --force --install-extension equinusocio.vsc-material-theme-icons &
codium --force --install-extension James-Yu.latex-workshop &
codium --force --install-extension mads-hartmann.bash-ide-vscode &
codium --force --install-extension ms-vscode.powershell &
codium --force --install-extension ms-vscode.vscode-typescript-tslint-plugin &
codium --force --install-extension nopeslide.vscode-drawio-plugin-rtl &
codium --force --install-extension oderwat.indent-rainbow &
codium --force --install-extension paragdiwan.gitpatch &
codium --force --install-extension phil294.git-log--graph &
codium --force --install-extension pomdtr.excalidraw-editor &
codium --force --install-extension rust-lang.rust-analyzer &
codium --force --install-extension streetsidesoftware.code-spell-checker &
codium --force --install-extension Sudhan.neondark-theme &
codium --force --install-extension tomoki1207.pdf &
codium --force --install-extension vadimcn.vscode-lldb &
codium --force --install-extension Vue.volar &
codium --force --install-extension xabikos.JavaScriptSnippets &
codium --force --install-extension yoavbls.pretty-ts-errors &

wait
