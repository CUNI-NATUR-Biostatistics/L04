# Presentation standards rollout

## Scope

- Date: 2026-09-16
- Branch: `lesson/l04-presentation-standards`
- Requirements: Issues #5, #6, and #8; Issue #7 is tracked in `2026-09-16-pollslive-retrieval-quiz.md`

## Decisions

- The first slide uses the approved question-first course title composition and canonical logo.
- The approved illustration after `Dostali bychom příště stejnou přímku?` shows three observers obtaining different sample-based lines.
- The visible `summary(mod_gejzir)` search activity remains. One hidden `broom::tidy(mod_gejzir, conf.int = TRUE)` object supplies the projected slope, standard error, compact `tinytable::tt()` table, and displayed 95% interval.
- Render-time assertions compare the tidy estimate and standard error with `coef()` and `summary()`.

## Generated illustration provenance

- File: `Presentation/Materials/geyser_observers_slopes.png`
- Generation mode: OpenAI built-in image generation; new bitmap asset.
- Generation brief: three geyser observers at separate stations, each holding a clipboard with a differently angled purple line; warm scientific watercolor/editorial style; 16:9; no instructional text, axes, formulas, logos, or watermark.
- SHA-256: `552D30CCB747472482E301175239092D7B904316B49FA3948294A91DBA8F6476`
- Student-facing metadata: Czech alternative text, visible AI disclosure, and a conceptual takeaway are present in the slide source.
- Approval: the human author approved this illustration concept in the implementation plan on 2026-09-16.

## Approved presentation story-map addendum

This focused addendum records the new slide approved in the implementation plan on 2026-09-16. It sits immediately after `Dostali bychom příště stejnou přímku?` and before `Pepa pozoroval pouze červen`.

| Internal role | Student-facing heading | Evidence role | Takeaway | Transition |
| --- | --- | --- | --- | --- |
| Make repeated-sample variability concrete before comparing named samples. | Tři pozorovatelé, tři odhady | Three observers of the same geyser hold drawing boards with differently sloped purple lines. | Jiný výběr pozorování může vést k jinému odhadu sklonu. | The next slides instantiate the three observers as Pepa, Mařenka, and Karel with different monthly samples. |

## Knowledge-state ledger addendum

| Concept | Before this slide | Established on this slide | Used next |
| --- | --- | --- | --- |
| Sampling variability of a fitted slope | Students can predict that a new sample might change the line but have not yet seen the idea embodied. | Separate samples from the same process can produce different estimated lines. | The named monthly samples, standard error, and confidence interval quantify this variability. |

## Validation status

- Render-time assertions confirm the tidy estimate and standard error equal the corresponding `coef()` and `summary()` values; the displayed 95% bounds come directly from the same tidy row.
- Canonical render: passed; HTML and PDF contain 42 slides, and `Presentation/presentation.html` matches `docs/index.html` by SHA-256.
- Visual inspection: passed, including the title at 1600 × 900 and 1280 × 720, the generated illustration, coefficient table, and tidy-derived 95% interval.
- UTF-8, duplicate chunk-label, R parsing, focused diff, and `renv::status()` checks: passed.
- Independent read-only presentation review: passed after the story-map, interval-source, and alternative-text corrections; no remaining finding.
- The approved three-question PollsLive retrieval block is implemented and validated offline; see `2026-09-16-pollslive-retrieval-quiz.md` for evidence, independent review, and remote activation gates.
- Git publication: follow-up authorization granted on 2026-09-16; review and merge state is tracked in the lesson PR.
