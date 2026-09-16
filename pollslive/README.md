# PollsLive retrieval-quiz adapter

This directory is a dormant template. A repository created from `_L-template` renders normally and does not create, update, open, or close a PollsLive poll until the lesson deliberately opts in.

## Approval before activation

Do not create the complete `quiz.json` or add the generated presentation include until both the retrieval-quiz integration map and the three exact questions have explicit human approval in the lesson workflow record. Questions should ask students to interpret familiar evidence from the preceding lesson, such as a figure, table, or R output.

## Opt in an approved lesson

1. Copy `quiz.template.json` to `quiz.json` and replace every technical example with the approved lesson identity, date, questions, options, correct answers, explanations, evidence descriptions, alt text, and provenance.
2. Copy `config.template.json` to `config.json`. Keep the reviewed 40-character `_internal` client revision pinned unless a later reviewed revision is intentionally adopted.
3. Add every referenced image below `pollslive/assets/` and add a deterministic `R/render_pollslive_assets.R` that reproduces the evidence or verifies an intentionally byte-identical source asset.
4. Run `node pollslive/validate.mjs`, then run a credential-free offline render with `$env:POLLSLIVE_RENDER_MODE = "offline"` and `Rscript R/render_presentation.R`.
5. Add `{{< include ../pollslive/generated/active.qmd >}}` to `Presentation/presentation.qmd` only at the approved retrieval-block position.
6. Add the lesson repository to the selected repositories of the read-only lesson-reader GitHub App.
7. Commit and push `config.json`, `quiz.json`, all evidence assets, and their reproducible sources before the first synchronized render.
8. In a fresh terminal authenticated with `gh auth login`, set `$env:POLLSLIVE_RENDER_MODE = "sync"` and run `Rscript R/render_presentation.R`. The local renderer dispatches the trusted `_internal` workflow, verifies its receipt, and produces the HTML and static PDF locally.

The lesson workflow in `.github/workflows/pollslive.yml` validates inputs without credentials. PollsLive synchronization, registry maintenance, and scheduled activation remain in `_internal`; the API key never enters a lesson repository.

## Generated and private data

Do not edit or commit generated QMD, QR codes, receipts, metadata, caches, response data, poll IDs, PINs, host tokens, management URLs, or credentials. Poll identity and public URLs live in the protected `_internal` registry and in ignored local render output.

`quiz.template.json` is a technical example only. Its wording is not approved teaching content and it must never be synchronized as a real poll.

The static HTML/PDF solution text is copied from each question's `explanation` field. The generator does not invent a justification from the options or image; if no explanation is desired beyond the correct option, keep this field brief but explicit.
