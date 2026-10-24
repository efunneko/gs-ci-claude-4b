# Contributing

- Branch from `main` as `<type>/<short-description>`, one pull request per change.
- Title pull requests `<type>(<scope>): <change>`, in Conventional Commit style.
- Run `make check` once, last — after the change is finished and before opening the pull request. It runs `go vet ./...` then `go test ./...`. CI's `check` job runs the same command and is required; a local green means CI will agree. While developing, `go test ./...` for just the changed package is fine; `make check` is the final proof before merging.
- A maintainer named in `.github/CODEOWNERS` approves every pull request.
- Pull requests are squash-merged; the pull request title is the commit subject.
