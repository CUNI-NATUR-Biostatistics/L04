# Workflow Templates

This folder contains fill-in templates for the stage-by-stage lesson lifecycle.

Use these files to keep implementation practical, reviewable, and historically traceable.

## How to use

1. Check `git branch --show-current`, `git status --short`, and
   `git log -1 --oneline` before editing.
2. Confirm that the branch belongs to the intended stage group and is based on
   the updated default branch after the previous pull request was merged.
3. Duplicate the relevant template from `Workflow/templates/`.
4. Save it in `Workflow/records/` with a date prefix, for example:
   - `2026-07-14-stage-0-scope.md`
   - `2026-07-15-stage-1-dataset.md`
   - `2026-07-18-stage-4-slides.md`
5. Add one short entry to `Workflow/STAGE_LOG.md` summarizing what changed,
   including the branch and pull request.
6. Link the record file in your PR description.

## Required branch and pull-request boundaries

| Pull request | Stages | Suggested branch | Start condition |
|---|---|---|---|
| Planning | 0-1 | `lesson/<week>-scope-data` | New branch from the default branch |
| Written materials | 2-3 | `lesson/<week>-skripta` | Planning PR merged; branch from updated default branch |
| Presentation | 4-5 | `lesson/<week>-presentation` | Written-materials PR merged; branch from updated default branch |

Do not continue from one group into the next on the same branch. Before opening
each pull request, check `git status --short` and `git diff --stat`; include only
the intended stage group, its workflow records, and generated outputs belonging
to sources changed in that group.

Open the pull request when the stage-group draft is ready, perform its human
review and revisions on that same branch/PR, and merge it before creating the
next stage branch. Assistants must still obtain user authorization before
creating or switching branches, pushing, or opening/merging pull requests.

Stage 6 release validation happens after the presentation PR is merged. It checks the exact public allowlist, privacy and assessment boundaries, provenance and reuse terms, repository visibility, licensing status, stable lesson routes, and the expected HUB refresh. If it finds a source problem, fix that on a separate release-fix branch and PR.

## Recommended sequence

1. `stage-0-scope.md`
2. `stage-1-dataset.md`
3. `stage-2-learning-materials.md`
4. `stage-4-slides.md` (includes the Stage 5 presentation review)
5. `stage-5-review-release.md` (post-merge Stage 6 release validation)

## Why this exists

- Keeps weekly lesson production consistent.
- Makes review faster (same structure every week).
- Preserves a clear history of decisions and revisions.
