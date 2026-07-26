# L04 regression and release audit

- Date: 2026-07-24
- Branch: `lesson/l04-coherence-polish`
- Point of comparison: human-approved 37-slide Stage 5 deck
- Guardrail: approval is evidence of a completed human gate, not evidence of
  perfection or superiority to earlier lessons. Audit L04 as critically as
  L01–L03; avoid source churn unless a concrete defect is found.

## Source and artifact findings

- The source keeps L04 bounded to sampling variability, standard errors, and
  confidence intervals. Hypothesis testing and p-values remain in L05.
- The callback starts from the L03 linear-model coefficient and does not
  reteach the fitting arc.
- The official GeyserTimes archive URL, prepared teaching data, and complete
  cleaning code are present in the written materials.
- On 2026-07-24 the official archive URL returned an anti-bot HTML challenge to
  a scripted download rather than gzip bytes. The written materials already
  document this case and give a first-party manual-download fallback; the
  prepared teaching dataset remains the stable classroom path.
- The National Park Service context and item-level photo links returned HTTP
  200. The slide retains the NPS/Jim Peaco credit and public-domain statement.
- Complete baseline PDF overviews (20 written-material pages and 37
  presentation states) showed no obvious clipping or encoding defects.
- Comparative review identified valuable patterns in earlier lessons that L04
  does not contain: L01's transparent construction of summaries/boxplots,
  L02's four-observation covariance build and graph-choice contrasts, and
  L03's candidate-line-to-residual/SSE derivation. Their absence is not
  automatically a defect in L04, and their value must not be lost when the
  earlier lessons are polished.
- The missing canonical `kvantil` glossary slug is being resolved in
  `slovnik`; the written source now uses it instead of retaining a TODO.
- `Exercises/cviceni.R` is a template placeholder, now explicitly marked
  deferred.

## Decision

The comparative pass did not justify a wholesale redesign, but it did identify
specific improvements. The written materials now explain why the GeyserTimes
archive is used despite the built-in `faithful` dataset and include a compact
95%/80%/50% repeated-interval comparison. The presentation now uses semantic
body highlights and selected coloured strips; its learning outcomes remain an
incremental highlighted bullet list rather than a panel grid. These changes do
not make L04 a gold standard for the other lessons.

## Validation required before merge

- [x] Fresh-session activation resolved to
  `D:/GITHUB/CUNI-NATUR-Biostatistics/L04`; after snapshot,
  `renv::status()` reported no issues.
- [x] Existing `Presentation/presentation.html` and `docs/index.html` have
  identical SHA-256 hashes.
- [x] The complete approved-deck overview and high-risk animation,
  interval-comparison, and scientific-writing slides were inspected during the
  comparative audit.
- [x] Reran the written-material and presentation wrappers after the final
  source changes; the presentation printed all 37 states.
- [x] Rechecked UTF-8, Quarto structure, unique chunk labels, links, glossary
  coverage, student-visible code, and source diffs.
- [x] Confirmed that `Presentation/presentation.html` and `docs/index.html`
  remain byte-identical.

## Human review decision

Approved by the human reviewer on 2026-07-25. The review accepts the focused
improvements above while retaining the 37-state uncertainty narrative.

The companion `slovnik` PR remains a shared release dependency, but the current
lesson source and rendered artifacts have passed their local validation.
