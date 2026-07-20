# Stage 0 - Scope Lock

## Metadata

- Week: L04
- Date: 2026-07-20
- Author: Ondřej Mottl (with Codex)
- Reviewer: Ondřej Mottl

## Git checkpoint

- Stage group: Stages 0-1 planning
- Branch: `lesson/l04-scope-data`
- Base branch and commit: `main` at `00b5575` (`Initial commit`)
- `git status --short` reviewed: [x]
- Previous-stage PR merged: N/A
- Planned PR: Planning PR for Stages 0-1; not opened

## Topic sentence

Open with the question of how one sample can tell us anything about an underlying biological effect, then use the simple linear model introduced in L03 to distinguish a coefficient estimate from its sampling uncertainty and to interpret a confidence interval as a range of effects compatible with the data and model.

## Weekly outcomes (mapped)

- Canonical L04 outcome 1 from `_internal/osnova_lekci.md`: Explain why a different random sample would produce a different estimate of the same effect.
- Canonical L04 outcome 2 from `_internal/osnova_lekci.md`: Distinguish the magnitude of an estimated effect from the precision of that estimate.
- Canonical L04 outcome 3 from `_internal/osnova_lekci.md`: Interpret a confidence interval without claiming that it contains 95% of observations or proves a hypothesis true.
- Model-first framing from `_internal/osnova_lekci.md`: Use the question of what one sample can tell us as motivation, then add sampling uncertainty to the already familiar `lm(y ~ x)` and its biologically meaningful coefficient. Formal hypothesis testing remains a separate conceptual step in L05.

## Inspiration consulted

- Authoring problem to solve: How to motivate the epistemic problem—what one sample can tell us about an underlying effect—and answer it through repeated-sample variability and precision while keeping the familiar coefficient from L03 biologically meaningful.
- Relevant source(s) from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: ModernDive; Modern Statistics with R; genomicsclass / PH525x.
- Pattern(s) worth borrowing: Link regression and inference through repeated samples; build confidence intervals from intuitive uncertainty around an estimated effect; contrast effect magnitude with precision; keep the data-model-diagnostics-interpretation chain connected.
- Pattern(s) explicitly rejected: Introducing p-values or formal testing before students understand sampling uncertainty; postponing the motivating question about evidence until L05; a second introduction to the geometry and fitting of a line; tidyverse-first student workflow; formal derivations or advanced diagnostics.
- Why the selected pattern fits this course: It preserves the philosophically interesting motivation while starting the technical explanation from a model students already know. It isolates one conceptual step—why an estimated coefficient is uncertain—before statistical decision-making begins in L05.

## Concrete student actions (2-4)

1. Explain why observing one sample creates a problem of inference about the underlying biological effect.
2. Use repeated samples or a simple simulation to explain why estimates of the same coefficient vary.
3. Compare two estimates in terms of both effect magnitude and precision.
4. Interpret an estimated effect and its confidence interval in the context of a biological question.

## Out of scope this week

- Re-teaching how a line is described, fitted by least squares, or represented by residuals; these are foundations from the preceding lesson.
- Null and alternative hypotheses, p-values, significance thresholds, Type I and Type II errors, and power; these belong to L05.
- Two-group comparisons, binary predictors, t-tests, ANOVA, and post-hoc comparisons; these belong to L06.
- Multiple predictors, interactions, model selection, nonlinear models, hierarchical models, and generalized linear models; these belong to later lessons.
- Formal derivations of standard errors, sampling distributions, the t distribution, or confidence intervals.
- Extended philosophy-of-science debates. L04 includes only the motivating question of what one sample can tell us; formal claims, evidence thresholds, and decisions belong to L05.
- Advanced residual diagnostics or remedial methods.

## Risks and dependencies

- Risk: Students may interpret a confidence interval as containing 95% of observations or as a fixed-probability statement about this particular computed interval.
- Dependency: Stage 1 must choose a data story or simulation that makes repeated-sample variability visible while retaining a biologically meaningful quantitative coefficient from L03.
- Inspiration risk: Inference sources can become simulation-heavy or too technical; retain only enough repetition to make sampling variability and precision intuitive.

## Decision

- [x] Scope locked for implementation
- [ ] Continue Stage 1 on this same planning branch
- Notes: Scope was revised after curriculum-level review. L04 opens with the question of what one sample can tell us, but answers it only through estimation uncertainty and confidence intervals. Formal testing moves to L05 and categorical predictors to L06. Integration is practiced cumulatively in every weekly practical rather than reserved for a final lesson. Stage 1 has not started.
