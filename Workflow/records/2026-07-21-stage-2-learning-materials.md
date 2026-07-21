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
- What from the source is intentionally not being reused: Tidyverse-first student workflows, formal hypothesis testing, p-values, bootstrap formalism, and mathematical derivations.

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

- Major concept blocks have visual anchors: [ ]
- Interpretation prompts expanded: [ ]
- Explanatory payoff text improved: [ ]
- Transitions revised for self-study readability: [ ]
- Glossary markup checked where relevant: [ ]

### Development pass notes

- Which concept block improved most: Not started.
- Which visual or comparison became the main anchor: To be decided after review of the structural draft.
- Where the lesson still feels thin: The repeated-interval coverage visual, comparison of precision, and fuller explanation of what controls interval width remain for Stage 2B.

## Quality check notes

- What improved most: The template content was replaced by a coherent Old Faithful data story aligned with the locked L04 outcomes.
- What remains weak: This structural pass intentionally has fewer visual anchors and less explanatory depth than a self-study-ready lesson. The `linearni-model` glossary slug is temporarily left unwrapped because the current canonical helper matches it together with `zobecneny-linearni-model`, producing an empty tooltip; revisit after exact-slug matching is fixed.
- What needs reviewer focus: Overall conceptual order, the distinction between observed data and resampling, and whether the transition from sampling variability to confidence intervals is slow enough.
- Structural-draft validation: HTML and PDF rendered successfully; all seven PDF pages were visually inspected. The existing theme still emits non-blocking 404 warnings for bare Google Fonts endpoints during HTML embedding.

## Stage 3 - Human review gate

- Lesson-vision review completed: [ ]
- Glossary-coverage review completed: [ ]
- Human review completed: [ ]
- Credible findings resolved: [ ]
- HTML/PDF rendered and checked: [ ]
- Reviewer decision: Pending

## Decision

- [ ] Written materials are review-ready
- [ ] Diff contains only Stages 2-3 sources, records, and corresponding outputs
- [ ] Written-materials PR ready to merge
- Notes: Stage 2A structural draft started. Stage 2B and Stage 3 remain open.
