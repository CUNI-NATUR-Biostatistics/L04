# Stages 2-3 - Learning Materials and Human Review

## Metadata

- Week: L04
- Date: 2026-07-21
- Author: Ondřej Mottl (with Codex)
- Reviewer: Ondřej Mottl

## Git checkpoint

- Stage group: Stages 2-3 written materials
- Branch: `lesson/l04-skripta`
- Base branch and commit: `main` at `eaf8fc1` (`Select Old Faithful 2024 for the L04 uncertainty lesson (#2)`)
- Stages 0-1 PR merged: [x]
- Branch created from updated default branch: [x]
- `git status --short` reviewed before editing: [x]
- Written-materials PR: Not opened

## Inspiration consulted

- Relevant source(s) from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: ModernDive; Modern Statistics with R; genomicsclass / PH525x.
- Which structural or explanatory pattern is being borrowed: Begin with one observed regression, then use repeated samples to make estimate variability visible before naming standard error and confidence intervals.
- How that pattern is being adapted to Czech, beginner, model-first teaching: Keep the familiar `lm(y ~ x)` and its slope as the anchor, use simple visible base R, and distinguish observed Old Faithful data from a teaching resampling demonstration.
- What from the source is intentionally not being reused: Tidyverse-first student workflows, formal hypothesis testing, p-values, and bootstrap formalism. Equations are included only after the concrete visual explanation and follow the required concrete-to-general progression.

## Stage 2A - Structural draft

- Section order complete: [x]
- First visual/table included: [x]
- First interpretation prompt included: [x]
- Misconception checkpoint included: [x]
- Bridge to next concept included: [x]

### Structural draft notes

- Opening biological question: How can one observed set of eruptions tell us about the underlying relationship between eruption duration and subsequent waiting time?
- First data moment: A small table of observed eruptions followed by a scatterplot and a prompt to describe the relationship before fitting the model.
- Where the model-based framing first appears: The known one-predictor linear model is revisited immediately after students interpret the raw-data plot; the new question is whether another sample would yield the same slope.

## Stage 2B - Development pass

- Major concept blocks have visual anchors: [x]
- Interpretation prompts expanded: [x]
- Explanatory payoff text improved: [x]
- Transitions revised for self-study readability: [x]
- Glossary markup checked where relevant: [x]

### Development pass notes

- Which concept block improved most: The move from one fitted slope to variability among slopes now proceeds through three monthly models and 100 fictional GeyserWatch reports before introducing technical terminology.
- Which visual or comparison became the main anchor: Fifteen report-level data-and-model panels lead into a histogram of 100 slopes; the same horizontal scale connects that distribution to the full-data estimate and one standard error, followed by a second histogram that recalls quantiles and a direct comparison of four confidence levels.
- Where the lesson still feels thin: The historical and inferential reason for the 95% convention remains deliberately deferred to the next lesson; this lesson only establishes that the level is conventional and controls interval width.

## Quality check notes

- What improved most: The lesson now uses a concrete story and visible fitted models before naming sampling variability, standard error, and confidence intervals. It also shows where `Estimate` and `Std. Error` appear in `summary()` and gives scientific-reporting examples.
- What remains weak: The `linearni-model` glossary slug is temporarily left unwrapped because the current canonical helper matches it together with `zobecneny-linearni-model`, producing an empty tooltip; `kvantil` is used as plain text with the required TODO because that slug is absent from `pojmy.yaml`.
- What needs reviewer focus: Human review is complete; any further changes belong to PR review or a later stage.
- Validation: HTML and PDF rendered successfully after the fifth development pass; all 20 current PDF pages were rendered to PNG and visually inspected. The advanced archive code remains legible across page breaks, the optional boxes render gray-olive, all observation points are gray, model lines are brand purple, and equation and interval figures are readable. The advanced archive pipeline was also run against the live official archive and reproduced 117 prepared rows. The existing theme still emits non-blocking 404 warnings for bare Google Fonts endpoints during HTML embedding.

## Stage 3 - Human review gate

- Lesson-vision review completed: [x]
- Glossary-coverage review completed: [x]
- Human review completed: [x]
- Credible findings resolved: [x]
- HTML/PDF rendered and checked: [x]
- Reviewer decision: Approved after five review batches; Phase 3 is complete.

### First human-review batch

- Added a foldable, optional block directly to `skripta.qmd` that downloads the official GeyserTimes archive, identifies usable primary records, derives waiting time, saves the lesson copy, and clearly marks the advanced details as non-essential.
- Moved lesson data, models, coefficient summaries, resampling objects, and plot data out of the setup chunk and beside their first teaching use.
- Replaced `výběr` at the opening with `soubor pozorování` and `data`; introduced `výběr` later as the formal statistical term.
- Rebuilt the repeated-data narrative around Pepa in June, Mařenka in July, Karel in August, and 100 fictional GeyserWatch reports of 40 eruptions.
- Added monthly coefficient output, 15 report-level data-and-model panels, explicit standard-error reading from `summary()`, aligned uncertainty visuals, and scientific-reporting examples.
- Kept the teaching fiction explicitly separate from the actual volunteer provenance and stated the limitations of resampling the recorded rows.

### Second human-review batch

- Replaced the opening question and learning outcomes with the reviewer-provided wording.
- Expressed eruption duration and waiting time in minutes, documented the unit choice, removed one clearly isolated observation from each month in the reproducible preparation code, and reduced the lesson dataset to 117 rows (39 per month).
- Kept the complete advanced archive-download and wrangling code visible in PDF and foldable in HTML; folded the June subset construction in HTML while leaving it visible in PDF.
- Removed standard errors from the early monthly comparison and clarified that the three researchers use the same fitting procedure but obtain three distinct fitted models.
- Boxed the resampling caveat as optional teaching context and displayed the full `summary(mod_gejzir)` output before teaching students where to read `Estimate` and `Std. Error`.
- Expanded standard error through a worked table and concrete-to-general equations, then combined the slope histogram with the full-data estimate and one-standard-error marker on one readable axis.
- Rebuilt the confidence-interval section from a quantile recap through 80%, 90%, 95%, and 99% intervals, explicit model equations, interpretation cautions, the scientific-reporting form, and the status of 95% as a scientific convention.

### Third human-review batch

- Added concise NPS context about Old Faithful and connected its imperfect regularity directly to the prediction question; removed the redundant paragraph defending common time units.
- Kept the complete preparation script inside the semantic optional-data section, made it foldable in HTML and visible across PDF pages, and rewrote the advanced workflow with `dplyr`, `readr`, and `lubridate`. This is an explicit reviewer-requested exception for advanced optional code; the core student workflow remains base R.
- Made the June subset code foldable in HTML and visible in PDF, removed the out-of-place provenance reminder from the monthly story, and moved the monthly coefficient table after the three-panel figure.
- Added a simple histogram immediately after the 100 GeyserWatch reports, before introducing standard error.
- Reordered the `summary()` explanation from the familiar formula, residuals, and `Estimate`/`coef()` output to the new `Std. Error` column.
- Rebuilt both equation sequences to begin with quantities written in ordinary Czech, then substitute all observed values, and introduce compact mathematical symbols only at the end.
- Removed process-oriented wording about how R calculates the interval and replaced it with a direct word-first and concrete-to-general calculation.
- Corrected the repeated-sampling interpretation: 95% refers to the long-run proportion of intervals covering the underlying slope, not to 95 of 100 fitted slopes lying inside one interval. Clarified that lowering the confidence level narrows the interval by accepting lower coverage, not by adding precision to the data.

### Fourth human-review batch

- Established **Doplňující** as the gray-olive visual language for non-essential technical content, using a short introductory box before long foldable code and a collapsible whole box for short self-contained code. The canonical `_brand` source was updated on the separate branch `style/doplnujici-callout`.
- Renamed the prepared response variable from `waiting` to `cekani_min` throughout the saved teaching data, model formulas, tables, figures, and `summary()` explanation; the raw archive pipeline retains `waiting` only as an intermediate before the explicit rename.
- Aligned figures with brand semantics: observations are gray, primary fitted models are indigo, distributions use amethyst, and the canonical orange `#F3A712` is reserved for highlighted estimates, interval centres, and boundaries.
- Added English lookup names and Czech alternatives at first use for sample, sampling variability, slope estimate, standard error, residual, residual sum of squares, residual standard error, confidence interval, critical value, margin of error, and confidence level.
- Rebuilt the standard-error derivation term by term: each quantity now proceeds from ordinary words to the five observed numbers, its numerical result, the abstract formula, and an explanation of every symbol before the next quantity begins.
- Rebuilt the confidence-interval calculation with the same progression for the half-width, lower limit, upper limit, and complete interval; fine-grained steps remain visible in the lesson but are excluded from the document table of contents.

### Fifth human-review batch

- Removed authoring-process language that described the prescribed equation-building sequence rather than the statistical content, and audited the remaining manuscript for similar instruction leakage.
- Used **reziduální směrodatná odchylka** consistently in its heading, word equation, symbol explanation, and standard-error formula.
- Replaced the informal formula label “rozprostření délek erupcí” with the precise **součet čtverců odchylek délek erupcí** while retaining a plain-language explanation of what the quantity measures.
- Introduced degrees of freedom only as the name of the technical adjustment $n-2$ and explicitly deferred its derivation to a later lesson.
- Replaced “mez” in the main beginner-facing explanation with **hranice intervalu**, while retaining “meze intervalu” and English *confidence limits* as lookup alternatives.
- Explained the immediate role of the critical value and explicitly deferred its derivation from confidence level and degrees of freedom.

## Decision

- [x] Written materials are review-ready
- [x] Diff contains only Stages 2-3 sources, records, and corresponding outputs
- [x] Written-materials content approved for pull request
- [ ] Written-materials PR ready to merge
- Notes: Stages 2-3 content and human review are complete. The written-materials pull request has not yet been opened, so the stage group is not ready to merge and Phase 4 must not begin until that pull request is merged.
