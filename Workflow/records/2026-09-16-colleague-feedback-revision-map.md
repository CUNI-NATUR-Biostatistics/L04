# L04 colleague-feedback revision map

- Date: 2026-09-16
- Branch: `lesson/l04-presentation-standards`
- Source: Tomáš Jor comments on the July L04 release
- Presentation story-map status: complete; human approval: approved by the human author in this session on 2026-09-16, without requested revisions
- Written-material story-map status: complete; human approval: approved by the human author in this session on 2026-09-16, without requested revisions
- Scope: two focused conceptual caveats in the approved uncertainty sequence.

## Presentation story-map addendum

| Internal role | Existing student-facing heading | Planned visible change | Speaker note |
| --- | --- | --- | --- |
| Prevent a false sampling interpretation | Stejný postup, tři různé výsledky | Immediately after comparing June, July, and August, state that differing slopes may reflect selection of observations and real temporal change; three months do not separate these causes. | Treat the later repeated-sampling demonstration as the cleaner same-process model. |
| Separate two uncertainty questions | Interval spolehlivosti / Co ještě neplyne | One compact contrast: the interval here concerns the slope; uncertainty for one future waiting time also includes observation-level scatter around the line. | Do not teach prediction-interval computation or introduce a new formula. |

## Presentation knowledge-state ledger

| Concept | Known before edit | Established by edit | Later use |
| --- | --- | --- | --- |
| Different monthly data yield different lines | Observed in the three panels | Different months may also represent a changing process | Repeated-sampling example and cautious interpretation |
| Fitted line and residual scatter | Established in L03 | Uncertainty in a model coefficient is a different question from one future outcome | Confidence interval interpretation |

## Written-material story-map addendum

| Internal role | Existing student-facing heading | Planned change | Speaker note |
| --- | --- | --- | --- |
| Keep the two targets distinct | Interval spolehlivosti sklonu | Add a brief comparison of slope uncertainty and uncertainty for one future waiting time, without a prediction-interval derivation. | The existing month-versus-time caveat remains unchanged because it is already explicit. |

## Written-material knowledge-state ledger

| Concept | Known before edit | Established by edit | Later use |
| --- | --- | --- | --- |
| Slope, fitted line, residual | Established in L03 and earlier L04 text | One future observation includes scatter around the fitted line in addition to uncertainty in the relationship | Prevents misreading the slope CI as a forecast range |

## Implementation and validation

- Added a three-month sampling/temporal-change caveat to `Presentation/presentation.qmd` and a slope-interval versus individual-future-outcome distinction to both the presentation and `Learning_materials/skripta.qmd`.
- Canonical `R/render_skripta.R` and offline `R/render_presentation.R` completed. Artifacts: 23-page skripta PDF and 42-slide presentation PDF, with presentation HTML identical to `docs/index.html`.
- Checked the rendered month comparison and confidence-interval slides, and the written interval discussion; checked UTF-8, duplicate chunk labels, R parsing, focused `git diff --check`, and fresh `renv::status()`.
- Independent `vision-corrector` review found no actionable issue in these focused caveats and confirmed their alignment with the approved map. PDF structure passed; presentation pages 15–16 and 27 and the written interval discussion were visually inspected locally.
