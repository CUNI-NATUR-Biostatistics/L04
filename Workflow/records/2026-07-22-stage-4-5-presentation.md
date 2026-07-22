# Stages 4-5 - Slide Storyboard, Build, and Human Review

## Metadata

- Week: L04
- Date: 2026-07-22
- Author: Ondřej Mottl (with Codex)
- Reviewer: Ondřej Mottl

## Git checkpoint

- Stage group: Stages 4-5 presentation
- Branch: `lesson/l04-presentation`
- Base branch and commit: `main` at `884a47b` (`Build L04 learning materials around estimation uncertainty (#3)`)
- Stages 2-3 PR merged: [x]
- Branch created from updated default branch: [x]
- `git status --short` reviewed before editing: [x]
- Presentation PR: Not opened

## Inspiration consulted

- Relevant source(s) from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: ModernDive; Modern Statistics with R; genomicsclass / PH525x.
- Visual or data-storytelling pattern worth borrowing: Use repeated samples to make changing estimates visible, connect each fitted slope to an accumulating distribution, and introduce confidence intervals through repeated-interval reasoning rather than a definition-first sequence.
- How the pattern is being adapted to this course's slide rules: Keep Old Faithful and the familiar one-predictor model as the anchor; link each GeyserWatch scatterplot and fitted line directly to the same slope being added to a slowly filling histogram; use prediction, partner discussion, output reading, interval ranking, and interpretation tasks throughout.
- What from the source is intentionally not being reused: Tidyverse-first student workflows, formal hypothesis testing, p-values, bootstrap terminology as a learning goal, and long mathematical derivations in the main deck.

## Storyboard by concept block

### Block 1 - One observed relationship

- Prompt: Does eruption duration help us estimate the wait to the next eruption, and would another observer obtain the same fitted line?
- Evidence reveal: Full Old Faithful scatterplot followed by Pepa's June observations and fitted line.
- Interpretation: The slope describes Pepa's observations, not an immutable value independent of the data.
- Bridge/caveat: Another set of observations may produce another estimate.

### Block 2 - Different observations, different slopes

- Prompt: Predict how Mařenka's and Karel's fitted lines will compare with Pepa's.
- Evidence reveal: Three monthly datasets and fitted lines, followed by a linked GeyserWatch animation.
- Interpretation: Each animation frame shows one 40-eruption report, its fitted slope, and that same slope entering an accumulating histogram.
- Bridge/caveat: The reports reuse rows from the observed dataset; the animation visualizes possible estimate variability but does not create new observations or identify a true population slope.

### Block 3 - Effect size and precision

- Prompt: Find the two numbers in `summary()` that answer “how large is the relationship?” and “how precisely is it estimated?”
- Evidence reveal: `Estimate`, `Std. Error`, and the filled histogram connected to the full-data estimate and one standard error.
- Interpretation: Estimate and precision answer different questions and retain the units of the slope.
- Bridge/caveat: Estimate plus one standard error is a scale of uncertainty, not yet a confidence interval.

### Block 4 - From uncertainty to a confidence interval

- Prompt: Rank 80%, 90%, 95%, and 99% intervals by width before revealing them.
- Evidence reveal: Progressive interval construction and direct comparison of four confidence levels.
- Interpretation: Higher requested long-run coverage requires a wider interval around the same estimate.
- Bridge/caveat: A narrower interval is more precise only when intervals use the same confidence level.

### Block 5 - What 95% means

- Prompt: Conceptual MCQ asking what the 95% refers to, followed by partner convincing.
- Evidence reveal: Repeated-interval interpretation and a wrong-versus-better contrast.
- Interpretation: The 95% describes the long-run success of the interval-producing procedure, not the proportion of observations and not a post-data probability for this one interval.
- Bridge/caveat: Formal evaluation of specific parameter claims remains for the following lesson.

### Block 6 - Return to Old Faithful

- Prompt: Write one scientific sentence containing the biological relationship, estimate, precision, interval, and units.
- Evidence reveal: Model sentence and the volunteer-sampling limitation.
- Interpretation: The conclusion combines effect size and uncertainty without turning the fitted relationship into a universal law.
- Bridge/caveat: The next lesson asks how data can be used to evaluate a specific claim about a model parameter.

## Interaction plan

1. Opening prediction: would another observer obtain the same line?
2. Whole-data noticing task.
3. Monthly-line prediction and partner discussion.
4. Predict the shape of 100 slopes before the GeyserWatch animation.
5. `summary()` output scavenger hunt.
6. Effect-versus-precision classification.
7. Confidence-level width ranking.
8. Central 95% misconception MCQ with partner convincing.
9. Peer review of a one-sentence scientific interpretation.

Mentimeter is reserved for the opening prediction and the central 95% misconception check. Both prompts retain a visible no-vote fallback. The remaining interactions use partner or small-group discussion so the lecture does not become a sequence of polls.

## Visual workflow checks

- Text-light slides (no dense walls): [x]
- Staged reveal via fragments/incremental: [x]
- Figures generated locally near slide blocks: [x]
- Immediate interpretation after key visuals: [x]
- Interaction cadence present: [x]
- Animated multi-value sequence paired with a static final frame: [x]

## Slide-role rhythm

- Main interaction slide form used: Minimal prompt, graph-plus-prompt, and one high-weight voting-card MCQ.
- Main evidence reveal form used: Recurring Old Faithful scatterplot, linked scatterplot-to-histogram GIF, and static interval comparisons.
- Main interpretation form used: Graph-plus-takeaway and “co už víme / co ještě nevíme” contrasts.
- Where the bridge to the next concept happens: Each major result closes with a concrete unanswered question; the final bridge defers formal claim evaluation to the following lesson.

## Risks and fixes

- Visual rhythm risk: One hundred repeated reports could become a decorative animation or move too quickly to read.
- Content pacing risk: The long standard-error and confidence-interval derivations in the written materials could crowd out interaction.
- Planned fix: Keep the current report, fitted line, slope label, histogram scale, and colour mapping fixed across animation frames; move the same slope visibly into the accumulating histogram; follow with a static final frame. Compress derivations to conceptual visuals in the main deck and retain detailed calculations in the written materials.

## Stage 5 - Human review gate

- Lesson-vision review completed: [x]
- Human review completed: [ ]
- Credible findings resolved: [x]
- Presentation rendered and checked: [x]
- Reviewer decision: Pending human review of the first coherent deck.

## First coherent deck validation

- Built 35 slides with nine planned active-learning moments and a visible no-vote fallback for both voting prompts.
- Rendered `Presentation/presentation.html`, `Presentation/presentation.pdf`, and the matching `docs/index.html` with `R/render_presentation.R`.
- Visually inspected all 35 rendered PDF pages, the first and final animation states, and an intermediate GIF frame.
- Confirmed the linked animation contains 124 frames at 1600 x 800 pixels: 100 reports plus opening and closing pauses. Each report uses the same highlighted slope in the scatterplot and accumulating histogram.
- Confirmed the static final frame immediately follows the GIF, so the explanation remains usable when animation playback is unavailable.
- Confirmed `Presentation/presentation.html` and `docs/index.html` have identical SHA-256 hashes.
- Confirmed `Presentation/presentation.qmd` is UTF-8 without BOM or replacement characters.
- Render warnings remain non-blocking: inherited SCSS variable-order warnings, Google Fonts bare-endpoint 404s during resource embedding, and an `fs` build-version warning.
- `renv::status()` reports lockfile packages installed but unused; no dependency or lockfile changes were made during this presentation stage.

## Decision

- [x] Slides ready for review
- [x] Diff contains only Stages 4-5 sources, records, and corresponding outputs
- [ ] Presentation PR ready to merge
- Notes: The storyboard and linked animation design were approved by the human reviewer. The first coherent deck is rendered and ready for Stage 5 human review; no presentation PR has been opened.
