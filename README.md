# tally

[![ci](https://github.com/efunneko/gs-ci-claude-4b/actions/workflows/ci.yml/badge.svg)](https://github.com/efunneko/gs-ci-claude-4b/actions/workflows/ci.yml)

Counts words and lines. `make check` runs the gate, as CI does on every pull
request. See `CONTRIBUTING.md` for how changes land.

    go run ./cmd/tally < file.txt
