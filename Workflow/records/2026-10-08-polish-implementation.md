# L04 pre-teaching polish: implementation and verification

## Outcome and authorization

Implemented both approved maps on `polish/l04-before-teaching` (base `0202e5a`). Ondřej Mottl approved both maps and their separate knowledge-state ledgers on 2026-10-08 („approve both“), after the SE revision. This record closes the findings in [the review](2026-10-08-polish-review.md); the [learning-material map](2026-10-08-learning-material-polish-story-map.md) and [presentation map](2026-10-08-presentation-polish-story-map.md) keep their own approval records. The later author-requested amendments include the generated title illustration and four lesson illustrations, the worked SE tables and model-specific SE explanation, and answer annotations; their decisions remain recorded in the matching maps.

## Implemented changes

### Shared

- One model-generated simulation for the whole lesson: `R/Functions/simulate_reports.R` (100 reports; each draws 40 different eruption lengths from the data and generates waits from the full-data line plus normal departures with the model's residual SD) and `R/Functions/summarise_reports.R` (one `lm()` per report with slope, SE and 95/80/50 % `confint()`). Seed 900723. Realised values: SD of 100 slopes 1,09; median report SE 1,09; full-data SE 0,66; 69 of 100 slopes within one typical SE of the reference; coverage 97/78/54 of 100 at 95/80/50 %.
- SE is named from that evidence in both artifacts (SD of slopes beside one report's `Std. Error`), before the full `summary()` output; the learning materials recall L01's SD-versus-SE contrast.
- Visible data entry from `data/old_faithful_2024.csv` (`read.csv()`, `as.Date()`, `duration / 60`) replaces the hidden `readr` route; both artifacts knit from the project root. Visible `confint()` added.
- Shared spine question „O kolik déle čekáme po delší erupci — a jak jistě to víme?“ and one shared outcome list.
- Comparison wording for the slope; Czech decimals via `format_cz()`/`format_cz_math()` (adapted from L03) and decimal-comma figure axes; *rozptýlení* for spread; only „konfidenční interval“ kept as a synonym.
- Colour mapping: data grey; estimates and intervals purple; SE and uncertainty orange; the simulation reference slope dark graphite (a context line, so it does not compete with the orange SE bar). This replaces the map's provisional “orange reference”.
- `data/README.md` added with provenance; GeyserTimes reuse terms remain unverified (open item).
- Retrieval quiz Q2: options and explanation in comparison wording; question text, IDs and asset unchanged; `node pollslive/validate.mjs` passes.

### Learning materials

Sections follow the approved map rows 1–21: `Úvod` with prediction and collapsed answer; core data check; collapsed provenance box containing all preparation code; plain scatter with collapsed answer and visible full-data fit; Pepa's visible subset; months with prediction before evidence; simulated GeyserWatch; „Co měří standardní chyba?“; output reading with a find-it task; worked SE with squared-value columns and collapsed intermediate lines; quantiles; interval steps plus `confint()`; level prediction; rebuilt coverage panels from the same reports; answer to the spine question; „Co bude následovat dál“; outcome-mirroring summary; `Závěrečná otázka` with collapsed answers. Custom glossary CSS/JS replaced by `glossary-headings.lua`; glossary loads local `slovnik/pojmy.yaml` first; `fig-alt` on every figure; Typst blocks keep short code with output.

### Presentation

45 physical slides with H1 dividers at 8, 17, 22, 26, 39, matching the approved map. Lesson-specific `<style>` and all inline styles removed (classification rebuilt with `card-question`); no „Když nehlasujeme“; speaker notes added; every chunk follows the heading of its first-use slide; `fig-alt` on every figure; figures saved through `R/save_local_figure.R` (150 DPI, decimal commas); coverage figure in `R/Functions/plot_coverage.R`; the slide that reads `summary()` shows its visible `lm()` call.

## Validation

- Canonical renders recorded after the two earlier review rounds passed: `R/render_skripta.R` (HTML + 29-page PDF at that stage) and `R/render_presentation.R` with `POLLSLIVE_RENDER_MODE=offline` (HTML + 45-page static PDF); `docs/index.html` matched `Presentation/presentation.html`. The offline render used the identical pinned client revision `8f85e9f9e31dc1b0f05912d5605e4c9cc557e8e6` read-only from L01's cache via `BIOSTAT_POLLSLIVE_CLIENT_SOURCE`. Brand sync updated the lesson-local theme descendants. Final outputs after the author amendments are documented below.
- All visible chunks of both artifacts run with `Rscript --vanilla` from a folder containing only `data/old_faithful_2024.csv` (coefficients 45,91 and 13,33; SE 0,66; 95% CI 12,03–14,64).
- UTF-8 without BOM, no replacement characters, unique chunk labels (38 and 34), no raw HTML or inline styles in either source.
- All PDF pages of both artifacts inspected on contact sheets; layout fixes applied (equation wrapping, figure text size, code kept with output, coverage axis label).

## Independent review and resolutions

Two separate read-only reviewers applied `.ai/agents/vision-corrector.md` to the complete artifacts, the matching maps, the rendered PDF pages and the L02/L03 references. The learning-material reviewer also applied `.ai/agents/glossary-coverage-reviewer.md`.

Presentation, first pass (no HIGH; two teaching-correctness MEDIUMs). All resolved:
- slides 30–32 described the coverage meaning before the „95 %“ MCQ → level and width only;
- the roughnotation on MCQ 33 revealed C before the evidence → moved to the answer slide 37 (at most one roughnotation per slide);
- interval phrases were orange while the figures are purple → amethyst;
- the reference slope was undefined on slides → defined on 18 and labelled on 23;
- slide 24 answer panel → a list with units;
- the boxed run in Závěr → slides 42 and 43 are plain;
- smaller copy items:
  - divider renamed „Dají jiné erupce stejnou přímku?“;
  - grammar fixed;
  - literals removed;
  - headings 35–36 aligned with the map;
  - static-frame file write moved to slide 20;
  - model rewrite added in the slide 38 notes;
  - slide 27 shows a three-decimal chain with an arithmetic guard.
- Re-review: no MEDIUM or HIGH. Three low copy items fixed (alt text, three-decimal prompt values, slide 31 narration).

Learning materials, first pass (MEDIUMs). All resolved:
- worked numbers did not reproduce their displayed results → each step uses the displayed values; R's unrounded SE is stated; three decimals and a guard in the interval steps;
- „hladina“, α and t were used before being introduced → named together with the critical value;
- level comparison used coverage wording → explained through the critical value, with a critical-value column in the table;
- simulation caveats only in the collapsed box → moved into the main text;
- no model check → new „Sedí přímka k datům?“ (recorded as a map amendment);
- coverage hits and misses by colour only → misses dashed and thicker;
- literals → named inputs and `!expr` captions;
- glossary gaps → filled.
- Re-review: one MEDIUM (the first explanation of „hladina“ could suggest „95 % of observations“) resolved by naming the level without a proportion-of-what phrase and defining α as 1 − hladina. LOW items fixed: remaining „sto“ literals, numeral-first caption, wording, residual code kept with its plot, miss visibility, story-map amendment, remaining first-occurrence glossary links (all slugs valid).

## Final pre-commit closure (2026-10-08)

- Final human approval: Ondřej Mottl explicitly approved the changes („Ok I approve the changes (!)“), then approved the five-commit plan and authorized its pre-commit checks and local commits („I agree, you do that before commit changes and the commit“). The small units and glossary repairs below were completed under that pre-commit authorization. Pushing, live PollsLive synchronization and publication remain outside this authorization.
- Title image: generated with the assistant at the explicit request of Ondřej Mottl from the four generated lesson illustrations. All five images are embedded with Czech alt text and visible AI disclosure; provenance remains in `Presentation/Materials/GENERATED_IMAGES.md`.
- Presentation: canonical offline `R/render_presentation.R` passed, using the verified pinned client revision above without live synchronization. HTML and the 45-page PDF include the final illustrations and answer annotations; `docs/index.html` is byte-identical to `Presentation/presentation.html`. Direct parsing of the three rendered option-card blocks matches the current quiz definition exactly (correct positions D–C–B). The earlier global-text-search suspicion of an A/D mismatch was a false positive caused by the question stem repeating the option variable names.
- Separate final presentation review (`final_l04_review`, canonical vision-corrector prompt): complete source, sibling written materials, story map and amendments, all 45 PDF canvases and all 84 material HTML states inspected. No blocking or substantive teaching findings. The slide-8 story-map heading was corrected to match the implemented H1. Prediction states, answer circles on slides 12/30/33, slide-23 image swap, slide-24 output reveals and illustrated slides were checked in the browser. Two inherited shared-helper LOW findings remain below.
- Written materials: final canonical `R/render_skripta.R` passed (HTML + 30-page PDF). The worked eruption-length table now distinguishes minutes from squared minutes in both its source caption and adjacent visible prose. Missing glossary first occurrences were repaired, existing wrappers moved to eligible headings, and a duplicate wrapper removed. All slugs exist; HTML heading tooltips render as spans with no nested anchors.
- Separate final written-material and glossary review (`final_l04_skripta_review`, canonical vision-corrector and glossary-coverage-reviewer prompts): complete source and approved map checked; all 30 PDF pages inspected at readable size, with fresh final overviews and affected pages checked after the repairs; final source and rendered HTML rechecked. No findings remain.
- Focused code checks: all 82 R chunks (42 written, 40 presentation) and seven new lesson helpers parse; chunk labels are unique. Eight runnable core written-material chunks and three presentation chunks pass in separate `Rscript --vanilla` sessions with only the distributed CSV, using native Windows UTF-8. Each confirms 117 rows, no missing values, parsed dates, slope 13.33503 and SE 0.6574524. The optional archive download/export and alternative-dataset chunks were parsed but not executed in this pre-commit check.
- `node pollslive/validate.mjs` passes without credentials. Brand-manifest input hashes match every current local input. Source UTF-8/BOM/replacement-character and whitespace checks pass; Git staging filters preserve PDF bytes. The five line-ending-only entries have no substantive content change and belong to staging housekeeping rather than another commit.

## Remaining limitations and shared follow-ups

- GeyserTimes reuse terms remain unverified (site blocks automated access; ModernDive documents no licence). Verify before the next public release.
- Quiz pushes, live synchronization and activation before 2026-10-26 need separate authorization; this validation covered the native offline/static outputs only.
- Shared quiz layout, slide 5 final answer state: about 6.4 px of lower answer-panel padding clips at the 1050 x 700 browser viewport. All teaching text is visible and the PDF fits. Correct this in the canonical shared layout and validate other lessons before propagating; no lesson-local style workaround was added.
- Shared generated retrieval introduction still says „Potom společně projdeme…“, contrary to the student-facing sequencing rule. Correct the canonical generator wording rather than patching an ignored lesson-local include.
- The standalone illustrated HTML is about 38 MB. Actual classroom projection hardware was not tested; the slide-24 output was checked at the export/browser viewport size.
- The exercise `Exercises/cviceni.R` was not changed; check its slope wording against the new comparison wording before the next public release.
