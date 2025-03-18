#!/usr/bin/env bash
exec bazel run -- @io_bazel_rules_go//go/tools/gopackagesdriver "${@}" 2>> "$HOME/.local/state/nvim/lsp.log" | tee "$HOME/.local/state/nvim/gopackagesdriver_stdout.log"
