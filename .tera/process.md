## Gate

```sh
make check
```

- **Run it once, last**: after the change is finished, reviewed and rebased
  onto the default branch, and before it merges. *Why:* what the gate
  verifies is then exactly what merges. A gate run earlier proves a tree that
  no longer exists.
- **It is the only command that decides whether a change may merge, and CI's
  `check` job (`.github/workflows/ci.yml`) runs the same command.** *Why:*
  with one command, a session, a person and CI cannot disagree about what
  green means.
- **While you work, run `go test ./...` for what you changed, not the full
  gate.** *Why:* a red found early is cheap, and the gate is the slowest
  proof there is.
- **A red the change did not cause is named in the pull request, with how
  that was shown, and is not fixed in the same pull request.** *Why:* one
  pull request stays one item, and the unrelated red gets an owner instead of
  a drive-by fix nobody reviewed as one.

## Build and test

- **`make check` runs `go vet ./...` then `go test ./...`.** *Why:* the
  command that passes locally is then the command CI runs.
- **Every exported function has a table-driven test beside it.** *Why:* this
  repository's own rule (`CLAUDE.md`, `AGENTS.md`); a test that also passes
  on the old code proves nothing about the new code, so every change in
  behaviour comes with one that fails without it.
- **The package stays dependency-free: standard library only.** *Why:* this
  repository's own rule; a new dependency is a decision, not a default.
- **A flaky test is investigated, never re-run until it passes, and never
  fixed by loosening its assertion or raising a timeout.** *Why:* a retried
  flake hides a real race, and a widened assertion stops testing anything.

## Branches and pull requests

- **Branch from the up-to-date default branch, named
  `<type>/<short-description>`.** *Why:* a fresh base keeps the rebase small,
  and the name says what the branch is for.
- **One pull request per work item.** *Why:* a reviewer judges one change at a
  time, and reverting an item is one action.
- **The title is `<type>(<scope>): <change>`**, where `<type>` is one of
  `feat`, `fix`, `docs`, `test`, `refactor` or `chore` (Conventional Commits).
  *Why:* the history reads as a changelog, and the type tells a reviewer what
  kind of scrutiny the change needs.
- **The body follows `.github/pull_request_template.md`: what changed, why,
  and how it was verified**, with `Closes #<n>` when the item has an issue.
  *Why:* a reviewer needs those three things and nothing else, and the issue
  then closes on merge.
- **Rebase onto the default branch rather than merging it in.** *Why:* the
  branch's history stays a readable line of its own commits.

## Review and merge

- **The author reviews their own diff against the item's acceptance criteria
  before opening the pull request.** *Why:* the cheapest time to fix a
  problem is before anyone else has read it.
- **No approving review is required.** Branch protection on `main` requires
  only CI's `check` job (strict, enforced for admins); the sole code owner
  (`@efunneko` in `.github/CODEOWNERS`) cannot approve their own pull
  requests on GitHub. *Why:* this is what the repository's branch protection
  and CODEOWNERS already state; requiring a review nobody can give would
  just stall every pull request.
- **A person reviews any change to this profile, to the CI workflow, or to
  anything `## Rules` says to ask about.** *Why:* those changes alter how
  every later change is judged, so they are decisions, not edits.
- **The required check is CI's `check` job**, which runs `make check`.
  *Why:* a green check then means what a green gate means.
- **Merge by squash; the pull request title becomes the commit subject.**
  *Why:* per `CONTRIBUTING.md`; the default branch gets one commit per item,
  so `git bisect` and `git revert` work in whole items.
- **The author merges once the required check is green and self-review is
  done.** *Why:* a pull request that waits unmerged goes stale against its
  base.

## CI

- **CI runs `make check` on every pull request and every push to the default
  branch, in `.github/workflows/ci.yml`.** *Why:* the pull request's run
  proves the change, and the default branch's run proves the merge.
- **A session does not start, wait on or re-run the default branch's CI.**
  *Why:* that run belongs to what has already merged. Its red is fixed as its
  own item, not by whichever session happens to notice it.
- **A check is never disabled, skipped or marked optional to get a merge
  through.** *Why:* a check switched off once stays off, and nobody notices.

## Naming

- **Work Orders:** `<feature> [<item>]: <action>`, for example
  `tally [W1-C2]: count words`. Work outside a plan drops the address.
  *Why:* a plan's items stay findable by the feature's slug and the item's
  address.
- **Pull requests:** the title from `## Branches and pull requests`, with the
  item's address after the scope: `feat(tally): [W1-C2] count words`.
  *Why:* a pull request and the Work Order that produced it can be matched
  at a glance.
- **Cohorts:** a plan's cohort is `<feature> - <short description>`, and each
  wave's beneath it is `<feature> - wave <N> - <short description>`. *Why:*
  these are the labels the dev pipeline's orchestrators open, so the queue
  groups a train the way the plan does.

## Documents

- **Requirements in `docs/requirements/`, decisions in `docs/decisions/`,
  plans in `docs/plans/`, briefs in `docs/briefs/`, and notes in
  `docs/notes/`.** Each directory's `README.md` says what belongs there and
  how its files are named. *Why:* a session told where a kind of document
  lives reads it before acting, and never invents one that already exists.
- **A document is changed by pull request, like code.** *Why:* a requirement
  or a decision is reviewed with the same care as the code it governs.

## People

- **Decides:** the maintainer decides requirements and designs. They are the
  person `.github/CODEOWNERS` names (`@efunneko`). *Why:* one named person
  decides, so a design never waits on someone who was never asked.
- **Ratifies:** the maintainer ratifies a plan before its train starts, and
  ratifies its documents' status once the train is done. *Why:* a train runs
  only on a plan a person has accepted.
- **Out-of-band acts:** whatever a session cannot do, such as a release, a
  credential, a deployment or a physical device, is done by the maintainer
  and filed as off-tera work. *Why:* every act still has a record and an
  owner, even when no session can perform it.

## Rules

- **Never commit a secret**: no token, password or key in a file, a commit
  message or a pull request. *Why:* a pushed secret is published, and
  rotating it is the only remedy.
- **Never push to the default branch directly.** Every change goes through a
  pull request. *Why:* the gate and review only protect what goes through
  them.
- **Stage files by name, never with `git add -A` or `git add .`.** *Why:* a
  bulk add commits whatever else is in the tree.
- **Ask before anything destructive or hard to undo**: deleting a branch
  someone else uses, rewriting the default branch's history, or changing this
  profile or the CI workflow. *Why:* those cannot be taken back by the next
  commit.
