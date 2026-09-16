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
8. Central 95% misconception MCQ followed by a statistical-headline editing task.
9. Predict how 80% intervals change in width and coverage.
10. Predict how many 50% intervals cover the reference slope.
11. Write and peer-review a scientific interpretation using the supplied evidence card.

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
- Human review completed: [x]
- Credible findings resolved: [x]
- Presentation rendered and checked: [x]
- Reviewer decision: Stage 5 approved by the human reviewer on 2026-07-23.

## Stage 5 review batch 1 - 2026-07-23

- Added a credited NPS Old Faithful photograph and concise dataset context to the opening.
- Added centred ANO/NE voting cards to the opening question and corrected centring on the two sampling prompts.
- Rebuilt the linked animation so previous fitted lines remain visible in low-alpha amethyst, the current line and matching histogram marker use indigo velvet, both panels say `Hlášení`, and axis labels remain inside the frame.
- Removed the standalone teaching-demonstration caveat slide.
- Combined the full `summary(mod_gejzir)` output with a fragment reveal identifying the slope row, estimate, standard error, values, and units.
- Replaced the sentence list with four cards that reveal the two semantic colour groups on click.
- Restyled the standard-error histogram with grey bars, an indigo estimate, and orange `± 1 SE` emphasis.
- Reordered the 95% answer reveal directly after the MCQ, added roughnotation to the correct answer and crossed-out misconceptions, and replaced the partner-convince prompt with a short statistical-headline editing game.
- Linked coverage back to the 100 observers as 100 independently constructed intervals. The slide explicitly avoids the incorrect interpretation that 95 sample slopes should lie inside one observed interval.
- Reworded the summary with Czech term names followed by the R output labels in parentheses and changed the closing question to evidence and generalisation.
- Preserved the reviewer's existing wording, spacing, and slide-local code relocations; completed the same code-placement rule throughout the source.

## Stage 5 review batch 2 - 2026-07-23

- Standardised every student-facing use of the dataset name to `gejzír Old Faithful`.
- Kept all four classification sentences visible after the reveal, added pale semantic card backgrounds, and presented `Velikost vztahu` and `Přesnost odhadu` as indigo and orange legend badges.
- Moved the interaction-specific HTML and CSS directly after the slide heading.
- Replaced abstract long-run-coverage phrasing with concrete language about how often repeated intervals capture or miss the true slope.
- Replaced the textual 100-observer sequence with a deterministic teaching simulation of 100 separate 95% intervals. The rendered example shows 94 intervals covering the same true slope and six orange misses.
- Rendered both fragment states in a headless browser and confirmed that the sentences remain visible before and after the semantic-colour reveal.

## Stage 5 review batch 3 - 2026-07-23

- Added an explicit reveal before the sampling-variability question: the same data and same model formula always produce the same estimates, because `lm()` performs no random draw in this analysis.
- Kept the following question focused on a genuinely different set of observations, so later changes in fitted slopes cannot be mistaken for randomness inside the model-fitting function.

## Stage 5 review batch 4 - 2026-07-23

- Replaced the arbitrary simulation constants with the fitted slope estimate and standard error from `mod_gejzir`.
- Labelled the fitted slope as a known model-based reference used by the teaching simulation, not as the unknown true population slope.
- Reused the same 100 simulated estimates and fixed x-axis for 95%, 80%, and 50% intervals, so only confidence level and interval width change.
- Added interactive 80% and 50% comparison slides. The shared simulation produces 94, 78, and 50 covering intervals respectively and expands the deck to 37 slides.
- Visually compared all three rendered slides and verified in a browser that the 80% and 50% figures remain hidden until their reveal.

## Stage 5 review batch 5 - 2026-07-23

- Replaced presenter-directed wording such as `Než kliknete` with direct questions for students while retaining the fragment reveals.
- Made all three repeated-interval figures taller and moved their common legend to the right.
- Recoloured intervals that miss the reference slope grey, kept covering intervals amethyst, and drew the orange reference slope as the final plot layer so it remains visible.
- Added a data-and-model card to the scientific-sentence task with the sample size, observed ranges, slope estimate, standard error, 95% interval, and units.
- Rendered the 37-slide deck and visually checked the three interval comparisons and the revised writing task together.

## Final approved deck validation

- Built 37 slides with eleven planned active-learning moments and a visible no-vote fallback for both voting prompts.
- Rendered `Presentation/presentation.html`, `Presentation/presentation.pdf`, and the matching `docs/index.html` with `R/render_presentation.R`.
- Visually inspected the original 35 rendered PDF pages, both added confidence-level slides, all subsequently revised slides, both classification fragment states, both confidence-level reveal states, and beginning, intermediate, and final animation states.
- Confirmed the linked animation contains 124 frames at 1600 x 800 pixels: 100 reports plus opening and closing pauses. Each report uses the same highlighted slope in the scatterplot and accumulating histogram.
- Confirmed the static final frame immediately follows the GIF, so the explanation remains usable when animation playback is unavailable.
- Confirmed `Presentation/presentation.html` and `docs/index.html` have identical SHA-256 hashes.
- Confirmed `Presentation/presentation.qmd` is UTF-8 without BOM or replacement characters.
- Render warnings remain non-blocking: inherited SCSS variable-order warnings, Google Fonts bare-endpoint 404s during resource embedding, and an `fs` build-version warning.
- `renv::status()` reports lockfile packages installed but unused; no dependency or lockfile changes were made during this presentation stage.

## Decision

- [x] Slides approved by the human reviewer
- [x] Diff contains only Stages 4-5 sources, records, and corresponding outputs
- [ ] Presentation PR opened and ready to merge
- Notes: Stage 5 was approved after five feedback batches. The presentation branch is ready to be committed, published, and opened as a pull request.

## Issue #5 title-screen retrofit (2026-09-16)

Ondřej Mottl approved sketch A for L03–L06 on 2026-09-16. The first slide of L04 now leads with the existing lesson question, while the original formal topic remains secondary. The next biological or visual hook, learning outcomes, and remaining teaching sequence are unchanged. This title-only retrofit does not rewrite the historical story-map approval or approve the later Issue #6 illustration pass.
