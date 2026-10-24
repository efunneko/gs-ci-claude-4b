# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [0.2.0] - 2026-10-24

### Added
- `tally` command-line tool that counts words, lines, and characters from stdin (`feat(cli): add the tally command`)
- `tally` package with word counting (`test(tally): count words`) and line counting (`feat(tally): count lines`)

### Changed
- CI gate runs `go vet ./...` in addition to `go test ./...` (`ci(check): run go vet in the gate`)

### Documentation
- README updated with usage instructions and CI badge (`docs(readme): show how to run the command`, `docs(readme): show the CI badge`)
- Repository onboarded to tera work engine with harness kit (`chore(tera): onboard the repository`, `chore(tera): install the claude-code harness kit`)
