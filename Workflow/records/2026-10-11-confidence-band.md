# L04 confidence band around the fitted line

## Scope and trigger

- Date: 2026-10-11.
- Branch: `lesson/l04-confidence-band`; base: `24f402c` (`origin/main`).
- Trigger: Ondřej Mottl noticed that no lesson explains the shaded band around a plotted linear model. L02–L05, L08 and L09 draw every model line with `se = FALSE`; L07 is the first lesson that draws a band and explains it in half a sentence.
- Human decisions (Ondřej Mottl, 2026-10-11):
  - L04 teaches the band as **core** content in the learning materials, the presentation and the exercise; one branch and one pull request.
  - The prediction-interval idea moves from the Extra into core text, **without a calculation**; learning outcome 3 is extended.
  - From the new L04 section onwards, every plotted fitted model shows its 95% band, including students' own exercise plots (base-R pattern). Exempt: content before the new section; lines that are not a fitted model's estimate (simulated, reference, fan or "what-if" lines, loess diagnostics); busy multi-line plots with a stated reason.
- Out of scope for this branch: the course-wide rule in `_internal`/`_brand`, the slovnik term and the later lessons (separate branches); prediction-interval calculation or `interval = "prediction"`; any change to the dataset, the GeyserWatch simulation (seed 900723) or the SE/CI derivations; the L04 PollsLive quiz.

## Probe values (current data; final values come from rendered objects)

| Quantity | Value |
|---|---|
| Eruption lengths | 1,65–4,83 min; mean 3,63 min |
| 95% band at 2 / 3 / 3,63 (mean) / 4 / 4,5 / 4,8 min | widths 4,92 / 2,99 / 2,50 / 2,69 / 3,38 / 3,95 min |
| Mean wait at 4 min | 99,25 min, 95% CI [97,91; 100,60] |
| Eruptions outside the band | 95 of 117 (81 %) |

Teaching caution: the mean eruption length (3,63 min) lies in the gap between short and long eruptions (only 21 eruptions between 3 and 3,9 min). The band is narrowest **at the average eruption length**, not "where most eruptions are". Text and slides must use that wording.

Second caution: each GeyserWatch report has 40 eruptions, so the fan of report lines is wider than the band from all 117 eruptions. This is the same relationship as SE 1,09 (reports) versus 0,66 (all data) in the SE section, and the text must say so.

---

## A. Learning-material story-map amendment

- Artifact: `Learning_materials/skripta.qmd`.
- Story-map status: complete.
- Heading-strip audit completed: [x].
- Knowledge-state audit completed: [x].
- Human story-map approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-11.
- Decision and requested revisions: explicit user decision „approve A, B, C“ (2026-10-11); recorded separately for each map; no revisions requested.

New rows are inserted between rows 16 („Jak číst hladinu intervalu?“) and 17 („Co můžeme říct o Old Faithful?“) of the [approved 2026-10-08 map](2026-10-08-learning-material-polish-story-map.md). All other rows are unchanged except where listed under "Follow-on edits".

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 16a | Prediction about many lines | Kde může ležet průměrný trend? | Short bridge: so far, uncertainty concerned one number, the slope. But the line also gives an estimated mean wait for every eruption length. `box-question` with a prediction and a collapsed answer: „Kdybychom do jednoho grafu nakreslili přímky všech 100 hlášení GeyserWatch, kde by se od sebe lišily nejvíc: A) u krátkých erupcí, B) u průměrně dlouhých, C) u dlouhých, D) u krátkých i dlouhých stejně?“ Answer: at both edges, least near the average length (A and C together; worded as the collapsed answer, no grading). |
| 16b | Evidence: fan of report lines | (H3) Sto hlášení, sto přímek | Hidden figure: all 100 report lines from `data_odhady_hlaseni` (`intercept`, `odhad_sklonu`) as thin semi-transparent purple `geom_abline()` lines over the observed eruption range, with the reference line in dark graphite and a dashed vertical line at the mean eruption length. No new simulation. Explain: every line passes through the average point of its own report, and those average points vary little. Lines with different slopes therefore cross near the middle and spread apart towards the edges. A slope that is uncertain matters more the farther we are from the middle. State that the reports have 40 eruptions each, so the fan is wider than the uncertainty from all 117 eruptions (link to the SE section). `fig-alt`. |
| 16c | Naming the band from one sample | (H3) Pás spolehlivosti kolem přímky | Real data with `geom_smooth(method = "lm", formula = y ~ x, se = TRUE)`, purple line with amethyst fill (alpha 0.2). Visible code chunk (students reuse it). Name the **pás spolehlivosti** (*confidence band*): for each eruption length, a 95% interval for the **mean** wait of eruptions of that length. One sample gives one band, as one sample gives one `confint()`. It is narrowest at the average eruption length (dashed line); wording per the teaching caution above. Same reading of „95 %“ as in row 16: it describes the procedure, not one band. The band is built from many intervals, one for each eruption length (one sentence, no simultaneous-band discussion). |
| 16d | Computing points of the band | (H3) Pás v číslech: `predict()` | Visible `predict(object = mod_gejzir, newdata = data.frame(delka_erupce_min = c(2, prumerna_delka, 4.5)), interval = "confidence")`, with `prumerna_delka` computed from the data. Read the columns `fit`, `lwr`, `upr`. Inline: widths (≈ 4,9 / 2,5 / 3,4 min) computed from the object. The middle row reproduces the narrowest place in the figure. Link to L03: `fit` is the same estimated value as before; `lwr`/`upr` are new. |
| 16e | Misconception and the next-eruption distinction | (H3) Co pás neříká | Warning box with the computed share of eruptions outside the band („95 ze 117“). The band is not the range where 95 % of eruptions lie; it describes where the **mean** trend may be. Promote the core of the Extra „interval pro průměrný vztah není interval pro další erupci“ here: a single future eruption differs from the mean trend by its own scatter, so a range for one new wait must be wider (two uncertainties at once). No formula, no `interval = "prediction"`. The Extra is removed; any remainder that is not promoted is dropped. Reporting box: how to describe a figure with a band in one sentence. |

### Follow-on edits in the learning materials

| Row | Edit |
|---|---|
| 2 Výsledky učení | Outcome 3 becomes: „získat 95% interval spolehlivosti sklonu funkcí `confint()` a pás spolehlivosti kolem přímky funkcí `predict()` a interpretovat je bez tvrzení, že obsahují 95 % pozorování nebo dokazují hypotézu;“. The same wording goes into the deck and the exercise header. |
| 5, 6, 7, 8 figures | Unchanged (`se = FALSE`); exempt because the band has not been taught yet. Add a short source comment to each so later audits recognise the exemption. |
| 17 Co můžeme říct o Old Faithful? | Replace the two sentences about the slope interval and the future eruption with one sentence that points back to 16e. Add one sentence on the band: the mean wait after a 4-minute eruption is estimated as … min (95% CI … to …), computed from `predict()`. |
| 19 Shrnutí | Extend the CI bullet: the band shows the uncertainty of the mean trend for each eruption length and is narrowest at the average length; it does not cover 95 % of eruptions. |
| 20 Závěrečná otázka | Add to „Možné otázky“: a graph with the band and the residuals. |
| 21 Slovníček | Add the term once it exists in slovnik (see dependency below). |

### Knowledge-state ledger (new rows)

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Fan / 16a–16b | The 100 GeyserWatch reports and their slopes (row 8); SE as spread of slopes (row 9); coverage (row 16); fitted values (L03) | The line's height at a given length is also an estimate; the uncertainty of the slope translates into a fan that is narrowest near the average point | That the band from all data is as wide as the fan | Prediction, then fan figure with reference line and mean-length marker |
| Band / 16c | Slope CI and its long-run reading (rows 14–16) | Pás spolehlivosti = 95% interval for the mean wait at each length; one sample gives one band; narrowest at the average length | Simultaneous bands; band for GLMs | `geom_smooth(se = TRUE)` on real data |
| Numbers / 16d | `predict()` for point estimates (L03, exercise) | `interval = "confidence"`; columns `fit`, `lwr`, `upr`; widths differ with eruption length | Formula for the band's SE | Visible `predict()` output for three lengths |
| Misconception / 16e | Residuals (L03); band | The band does not contain 95 % of observations; one new wait needs a wider range (conceptual only) | Prediction-interval calculation | Computed count of eruptions outside the band |

### Dependency: glossary term

`pas-spolehlivosti` does not exist yet in `slovnik/pojmy.yaml`. Two options:
1. **Recommended:** add the term on a separate `slovnik` branch before the final render (needs a separate authorization). Until then, the draft shows the term as plain bold text, so the render does not break.
2. Leave it out of the glossary in L04 and add it later in the course-wide pass.

---

## B. Presentation story-map amendment

- Artifact: `Presentation/presentation.qmd`.
- Story-map status: complete.
- Heading-strip audit completed: [x].
- Knowledge-state audit completed: [x].
- Human story-map approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-11.
- Decision and requested revisions: explicit user decision „approve A, B, C“ (2026-10-11); recorded separately for each map; no revisions requested.
- This map is separate from map A and needs its own approval.

New physical slides are inserted between rows 37 („95 % patří k postupu“) and 38 („Statistická redakce: opravte titulek“) of the [approved 2026-10-08 map](2026-10-08-presentation-polish-story-map.md). The deck grows by four slides.

| Order | Internal role | Level | Student-facing heading | Speaker note |
|---|---|---|---|---|
| 37a | Prediction vote | H2 (blank) | — | Question box: „Nakreslíme přímky všech 100 hlášení do jednoho grafu. Kde se budou lišit nejvíc?“. Three equal `card-question` options: A) u krátkých erupcí, B) u průměrně dlouhých, C) na obou okrajích. Partner prompt. Option C is circled as a fragment after commitment (L03 pattern); 37b then shows the evidence. |
| 37b | Evidence reveal | H2 | Sto hlášení, sto přímek | The fan figure from map A (same object, same colours), mean length marked with a dashed line; one line under the figure states what we see. Speaker note: lines cross near the average point, the uncertain slope matters more far from the middle; reports have 40 eruptions, so the fan is wider than with all data. |
| 37c | Naming and reading | H2 | Pás pro průměrný trend | Real data with the band. Two annotated points from `predict(interval = "confidence")`: the narrowest place at the average length and a wide place at 2 min, with computed limits. One line of visible code: `predict(..., interval = "confidence")`. Speaker note: one sample, one band; narrowest at the average length, not where most eruptions are. |
| 37d | Misconception card | H2 | Pás ≠ kde leží 95 % erupcí | Same figure; the eruptions outside the band are highlighted (grey → orange) as a fragment, with the computed count „95 ze 117“. Rule box: the band is for the mean trend; one next eruption needs a wider range. At most one roughnotation. |

### Follow-on edits in the presentation

| Row | Edit |
|---|---|
| 3 Výsledky učení | Outcome 3 in the shared wording from map A. |
| 5–23 figures | Unchanged (`se = FALSE`); exempt, source comment added. |
| 40 Co už víme o čekání na další erupci? | Left panel: add the mean wait after a 4-minute eruption with its CI (computed). |
| 44 Shrnutí | Extend the CI bullet as in map A row 19. |
| 45 Closing question | Pair-prompt note: a graph with the band among the things to see. |

Physical count: 45 → 49 slides. Active-learning moments: +1 vote (37a) and +1 noticing fragment (37d). Timing in the 90-minute lecture: about 6 minutes, recovered by shortening the speaker script on rows 35–36 (80 % and 50 % coverage), which stay as slides.

### Knowledge-state ledger (new rows)

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Vote and fan / 37a–37b | Slides 18–23 (100 reports) and 34–37 (coverage) | The fitted line's height is uncertain too; narrowest near the average point | Band width from all data | Vote, then fan |
| Band / 37c | Slope CI | Pás spolehlivosti; `predict(interval = "confidence")` | Formula; simultaneous bands | Band with two annotated intervals |
| Misconception / 37d | Residuals | Band ≠ 95 % of eruptions; next eruption needs a wider range | Prediction-interval calculation | Highlighted points with computed count |

---

## C. Exercise blueprint amendment

- Artifact: `Exercises/cviceni.R`.
- Blueprint status: complete.
- Human blueprint approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-11.
- Decision and requested revisions: explicit user decision „approve A, B, C“ (2026-10-11); timing option 3 chosen (see below).

### Changes

| Task | Change | Direct work |
|---|---|---:|
| Header | Outcome 3 in the shared wording. The refresher of the previous lesson is unchanged. | — |
| L04-U07 | Title becomes „Jaké průměrné čekání odhaduje model a jak přesně?“. (1) As now: a one-row table with 4 minutes and `predict()`. (2) New: the same call with `interval = "confidence"`; interpret `lwr`/`upr` as the 95% interval for the **mean** wait after 4-minute eruptions (≈ 97,91 to 100,60 min). (3) New: draw the band on the U02 plot using a commented base-R pattern placed above the task: a grid `data_mrizka <- data.frame(delka_erupce_min = seq(from = min(...), to = max(...), length.out = 50))`, `mat_pas <- predict(..., newdata = data_mrizka, interval = "confidence")`, then `plot()`, `lines()` for `fit` and `lines(lty = 2)` for `lwr` and `upr`. Students uncomment and adapt it. (4) Interpretation: why do most points lie outside the band? Expected output with computed values; hints 1/2 as usual. | 8 → 14 min |
| L04-N06 | Unchanged (point on the line). | — |
| L04-N07 | Add `interval = "confidence"` for lengths 2, 3, 4 and compare the widths (≈ 4,92 / 2,99 / 2,69 min); explain why the width differs while the differences between estimates stay equal to the slope. | optional |
| L04-N16 (new) | Count eruptions outside the band, using `predict(object = mod_gejzir, interval = "confidence")` with no `newdata`, plus a logical condition and `sum()` (95 of 117). Interpretation: what kind of range would contain most single eruptions? (conceptual answer only). Placed under „Graf a předpověď“. | optional |
| Out of scope | `interval = "prediction"`, `polygon()`, ggplot. | — |

### Timing and the proposed offset (decision needed)

The core route goes from about 92 to about 98 minutes, above the 85–95 minute budget. Options:

1. **Recommended:** in U04, give students the June model as ready-made code and ask them to fit July and August (they already practise `lm()` in U02). Saves about 4 min → about 94 min.
2. Make the drawing step of U07 (step 3) optional, as N17. The core keeps `interval = "confidence"` only → about 95 min. The base-R band pattern is then first practised in L05.
3. Accept about 98 min. The remaining buffer for explanation and slower groups is about 22 min instead of 28.

### Validation contract

Clean R session; an untracked reference harness solves U01–U08 and N01–N16; the saved band plot is inspected; realistic core-route timing is reported; independent review uses `_internal/.ai/agents/exercise-reviewer.md`.

---

## Implementation and review contract (all three artifacts)

- Shared objects: `data_gejzir`, `mod_gejzir`, `data_odhady_hlaseni`, `odhad_sklonu`, `format_cz()` / `format_cz_math()`, `render_glossary_term()`, `biostat_cols`, `theme_biostat()`. No hand-typed computed values.
- Colours: data grey; the model line and band purple with amethyst fill (alpha 0.2), as in L07; reference line graphite; highlighted outside points orange (interpretive focus only).
- Order: implement A, then B, then C. Clean-session run of the visible skripta chunks from `data/old_faithful_2024.csv` alone; canonical HTML/PDF renders (offline PollsLive mode for the deck); full visual PDF check.
- Independent read-only reviewers: `vision-corrector.md` and `glossary-coverage-reviewer.md` (skripta), `changes-reviewer.md` with presentation checks (deck), `exercise-reviewer.md` (exercise). Findings are resolved and re-reviewed before human review.
- Environment note: `renv` reported "project out of sync" during the probe on 2026-10-11. This is pre-existing; check `renv::status()` before the canonical renders and do not commit incidental lockfile changes.

## Human decisions

- 2026-10-11, Ondřej Mottl: „approve A, B, C“. Map A, map B and blueprint C are approved separately with no revisions.
- Timing: „there is 120 m for exercises, so no problem“. Option 3: the core route of about 98 minutes is accepted within the 120-minute practical; no offset in U04.
- Glossary: option 1, with the term `pas-spolehlivosti` added directly on `slovnik` `main` (author decision).

## Implementation notes (2026-10-11)

- Skripta: section "Kde může ležet průměrný trend?" implemented as rows 16a–16e. Deviation from row 16c: the visible band code is base R first (grid → `predict(interval = "confidence")` → `lines()`, the same pattern as exercise U07), as required by `student-facing-r.md`. `geom_smooth(se = TRUE)` appears in the collapsed Extra „Doplňující: kratší alternativa pomocí geom_smooth()“, and the hidden figure uses it. The former Extra on the mean trend vs. the next eruption is promoted into 16e and „Co můžeme říct o Old Faithful?“ and removed. Pre-band model layers carry `# No band` source comments.
- Presentation: slides 38–41 added as mapped (the deck now has 49 slides). New figures: `Presentation/Materials/vejir_sta_primek.png`, `pas_spolehlivosti_intervaly.png`, `pas_spolehlivosti_mimo.png`. The answer slide gains the 4-minute mean-wait CI. Pre-band layers and the animation lines carry `# No band` comments.
- Exercise: U07, N07 and the review question extended as mapped. N16 is placed at the end of the optional bank in a new section „Pás spolehlivosti podrobněji“, keeping the task numbering in order and the N13–N15 route intact. The header now says N01–N16.
- Glossary: `pas-spolehlivosti` added in `slovnik/glossary_data.yaml` on `main` (author decision); `pojmy.yaml` and `docs/slovnik_pojmu.html` regenerated with `R/render_slovnik.R`. The diff contains additions only. Not yet committed.

## Validation (2026-10-11)

- Skripta: canonical HTML/PDF render passes (36 pages). Inline values were checked in the HTML: fan 67,0–78,7 vs. 91,7–96,6 min; widths 4,9 / 2,5 / 3,4 min; 95 ze 117 (81 %); 4 min → 99,25 [97,91; 100,60]. PDF pages 28–36 were inspected; two non-breakable Typst blocks that pushed figures off the page were removed.
- Presentation: offline render (`POLLSLIVE_RENDER_MODE=offline`) passes; 49 slides printed; new slides 38–41 and slide 44 inspected in the PDF.
- Exercise: an untracked reference harness (outside the repository) sources `cviceni.R` in a clean `Rscript --vanilla` session and solves U01–U08 and N01–N16. Checks: U07 CI 97,91–100,60; N07 widths 4,92 / 2,99 / 2,69; N16 = 95; the narrowest band is near 3,6 min. The band plot was inspected.
- Render side effects: line-ending-only changes in three tracked files were restored. `docs/index.html` is the regenerated published deck.

## Independent review (2026-10-11)

Reviewer models (per `behaviour.md`): Sonnet for the complete skripta (`vision-corrector.md`), presentation (`changes-reviewer.md` with presentation checks) and exercise (`exercise-reviewer.md`) reviews, because these are full-artifact pedagogical and code reviews. Haiku for `glossary-coverage-reviewer.md`, a bounded check. All reviewers were read-only.

- Glossary: two missing `pas-spolehlivosti` wrappers (the H3 heading and „Co bude následovat dál“), now added. „česky také konfidenční interval“ (pre-existing, kept as a synonym by the 2026-10-08 map): the author decided on 2026-10-11 to keep it unchanged.
- Skripta, first round: no blocking findings. Fixed: the reporting sentence; the prediction-interval wording; „mezera“ → „řidší oblast mezi shluky“; the stated property that the `lm()` line passes through the point (mean length; mean wait); a definition of „průměrný trend“; „mez“ → „hranice“ (the lesson's convention); the base-R chunk split into calculation and plot, with `lwd = 2`; named inputs `delka_kratka` and `delka_ctyri_minuty`; and the optional wording fixes. Re-check: all resolved; three new PDF layout issues were fixed (non-breakable question and warning boxes, a compact plot chunk at 4,6 in). During that fix a faulty edit removed the `lines()` paragraph and the `geom_smooth()` Extra; both were restored and the section structure re-verified. The Extra's code still splits across a PDF page; accepted because the box is collapsed in the HTML.
- Presentation, first round: no blocking findings. Fixed: R object locality (one chunk per slide that first uses its objects; the 4-minute CI chunk is now on the answer slide); slide 41 now has its question as the heading, the grey figure first, and an r-stack fragment that highlights the 22 eruptions **inside** the band, followed by a `.panel-warning`; visible statements on slides 39–40 (line legend, narrowest at the average length); [a; b] CI notation; assignment newlines; label placement. Re-check: all resolved; footer clearance, panel title and two wordings fixed afterwards.
- Exercise, first round: no blocking or high findings. Fixed: N16 hint leakage and its missing `|`/matrix explanation; explanation of `mat_pas[, "lwr"]`, `length.out`, `lwd` and `lty`; the U07 question about the narrowest place and the share of points inside; bands added to N06 and N13 (rule: every plotted model shows its band). Re-check: all resolved, no new issues. Realistic core route: 100–106 min typical, up to about 110 min for slower groups, within the 120-minute practical.
- `mat_` prefix: kept (L08 precedent); to be proposed as an addition to the canonical prefix list in the course-wide guidance pass.

### Review-driven changes to the approved maps (for author confirmation)

1. Vote question (skripta row 16a, deck slide 38): it asks where the 100 lines differ **least** (A short / B average length / C long; answer B), not where they differ most. The fan is asymmetric (wider at the short-eruption edge), so „most“ had a defensible answer A that overlapped with C.
2. Deck slide 41 (map row 37d): heading „Kolik erupcí leží uvnitř pásu?“; orange marks the 22 eruptions inside the band rather than the 95 outside (orange stays sparse, and there is no clash of „95“ with „95 %“). The rule text „Pás ≠ kde leží 95 % erupcí“ moves into a `.panel-warning`.

Author confirmation (2026-10-11): Ondřej Mottl confirmed both review-driven changes to the approved maps („I confirm both changes“).

## Final validation (2026-10-11)

- Skripta: canonical render passes (37 pages); inline values re-checked in the HTML; PDF pages 28–36 inspected.
- Presentation: offline render passes (49 slides); slides 38–41 and 44 inspected.
- Exercise: the untracked reference harness passes in a clean session (U01–U08, N01–N16); the reviewer independently verified the values and the N13 band with `data_faithful`.

## Human review

- 2026-10-11, Ondřej Mottl: „I approve the materials.“ The skripta, presentation and exercise are approved after the independent reviews and re-checks.
