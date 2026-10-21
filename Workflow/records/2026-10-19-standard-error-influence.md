# L04 standard error explained, leverage and Cook's distance

## Scope and trigger

- Date: 2026-10-19.
- Branch: `lesson/l04-standard-error-influence` (to be created by the author from `main` at `8a5dc89`).
- Trigger: Ondřej Mottl found that the standard error is only vaguely introduced in the skripta (the worked calculation exists but is a five-eruption toy placed after `summary()`, never applied to the real data and never linked back to the simulation) and very quickly passed over in the presentation (one definition slide). Separately, leverage and Cook's distance are only Extras in L03, yet L07 uses Cook's distance, L09 uses it in core text and L10 calls it "known from previous lessons".
- Human decisions (Ondřej Mottl, 2026-10-19):
  - The main SE route uses all 117 eruptions; the five-eruption hand calculation becomes a collapsed Extra.
  - Add an Extra on the standard error of a mean.
  - Lecture time is not a constraint (L02 ended about 15 min and L03 about 30 min before the estimate).
  - The exercise is in scope.
  - L03 has already been taught this year: leverage and Cook's distance get a full core introduction in L04; L03 stays unchanged in this branch.
- Out of scope: L03 (promoting its Extras to core is a later, separate revision), the dataset file `data/old_faithful_2024.csv` (stays 117 rows), the GeyserWatch simulation and seed, the CI, coverage and band sections, PollsLive (another agent is revising lesson openings and retrieval questions), the Moodle question bank, `interval = "prediction"`.
- Coordination: the only edits near the lesson opening are the learning-outcome lists (skripta row 2, deck row 3, exercise header). Everything else sits in the SE block and after the confidence band. If the parallel opening-question branch merges first, rebase onto it before implementation.

## Probe values (current data; final values come from rendered objects)

SE identity used on the main route (exact for one predictor, because S_xx = (n − 1) · SD²):

SE(sklon) = RSE / (SD délek erupcí × √(n − 1))

| Quantity | Value |
|---|---|
| All 117 eruptions: RSE, SD of lengths, n | 6,83 min; 0,965 min; 117 |
| SE from the identity / from `summary()` | 0,657 / 0,657 |
| Identity with n = 40 (one GeyserWatch report) | 1,13; simulated SD of 100 slopes 1,09, typical report SE 1,09 |
| June alone (39 eruptions): identity / `summary()` | 1,12 / 1,12 |
| Four times as many eruptions | SE halves (√4 = 2) |
| Mean wait: mean, SD, SE of mean | 94,26 min; 14,55 min; 1,35 min |

Influence (the three eruptions removed during data preparation, recovered from the GeyserTimes archive with the provenance code of the lesson):

| eruption_id | Date | Duration | Wait | Residual (120-eruption model) | Leverage | Cook's distance |
|---|---|---|---|---|---|---|
| 1471579 | 2024-08-01 | 41 s (0,68 min) | 106 min | +46,1 | 0,079 (largest of 120) | 1,39 |
| 1461337 | 2024-06-04 | 121 s (2,02 min) | 94 min | +18,2 | 0,029 | 0,072 |
| 1468130 | 2024-07-08 | 256 s (4,27 min) | 121 min | +18,4 | 0,012 | 0,029 |

- 120 eruptions: slope 11,92 (SE 0,77). 117 eruptions: slope 13,34 (SE 0,66). Without only the 41-s eruption: 13,14.
- 4/n for 120 eruptions = 0,033; two eruptions exceed it.
- Within the 117 eruptions used by the lesson: leverage 0,009–0,045; largest Cook's distance 0,059 (3,00 min, 107 min wait); dropping any one eruption moves the slope by at most 0,18 min/min, about a quarter of the SE.
- Teaching contrast from real data, no hypothetical point needed: 1461337 and 1468130 have almost the same residual (+18 min), but the first lies farther from the mean length and has more than twice the Cook's distance. The 41-s eruption combines the largest leverage with the largest residual.
- The 41-s duration lies below the NPS range of 1,5–5 min that the lesson already cites for eruption durations, which gives a domain-based reason for excluding it, the same kind of reason used for the 50–127 min waiting filter.

---

## A. Learning-material story-map amendment

- Artifact: `Learning_materials/skripta.qmd`.
- Story-map status: complete.
- Heading-strip audit completed: [x].
- Knowledge-state audit completed: [x].
- Human story-map approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-19.
- Decision and requested revisions: explicit user decision „I approve“ (2026-10-19) of the completed record after D1–D3 were resolved; recorded separately for each map; no revisions requested.

Rows refer to the [approved 2026-10-08 map](2026-10-08-learning-material-polish-story-map.md) and the [2026-10-11 band amendment](2026-10-11-confidence-band.md) (rows 16a–16e).

### SE block (replaces rows 9–12)

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 9 | Naming SE from the evidence (retained) | Co měří standardní chyba? | Unchanged up to the ± 1 SE histogram. Replace „Přesto mu R tuto velikost odhadne“ with an explicit open question that the next two sections answer: „Jak může R poznat šířku histogramu z jediného hlášení?“. |
| 9a | Prediction and intuition: what drives SE | Co dělá sklon stabilnějším? | `box-question`: three pairs of imagined report sets; for each pair, which gives steadier slopes? (1) points close to the line vs. far from it; (2) eruption lengths spread over the whole range vs. squeezed into a narrow range; (3) 10 vs. 40 eruptions per report. Collapsed answer, then one hidden figure: three pairs of mini-fans of report lines, each panel titled with the computed SD of its slopes. Generated by `simulate_reports()` extended with optional, backward-compatible arguments for the departure SD and the pool of lengths (defaults reproduce the current simulation exactly; new draws run after the existing ones so all GeyserWatch numbers stay unchanged). Seesaw intuition for pair 2: points far apart along the x-axis pin the line down. The word *pákový efekt* is not used yet. |
| 9b | SE from one sample: main route on 117 eruptions | Standardní chyba z jediného výběru | Answers row 9's question. Formula in words first, three ingredients colour-matched to the pairs of 9a: typical size of residuals (RSE), spread of eruption lengths (SD), number of eruptions (√(n − 1)). Introduce *reziduální směrodatná odchylka* here: visible chunk computing it from `residuals(mod_gejzir)` (L03 link) as √(součet čtverců residuí / (n − 2)); name n − 2 as *stupně volnosti*, derivation deferred to the next lesson. Visible chunk: `sd()` of eruption lengths, `nrow()`, then SE = 0,66. Close the loop with the simulation: the same formula with n = 40 gives about 1,13, close to the SD of the 100 report slopes (1,09). √n rule: four times as many eruptions halve the SE. Symbolic form SE = σ̂ / √S_xx with one sentence on S_xx = (n − 1) · SD². The paragraph „why more eruptions give a smaller SE“ moves here from old row 12. All values computed. |
| 10 | Output reading: confirmation | Kde ve výstupu najdeme velikost a přesnost? | Retained find-it task and output reading, now as confirmation: `Std. Error` is the number computed in 9b; `Residual standard error` is ingredient 1 of 9b. The warning that RSE is not the SE of the slope moves here from old row 12. Reporting box unchanged. |
| 10a | Optional: SE of a mean | Doplňující: standardní chyba průměru | Collapsed Extra. L01 promised SE also for a mean. SE of the mean wait = SD / √n = 14,55 / √117 = 1,35 min. Same logic without the spread-of-x ingredient (no slope). Link to the course's "everything is a model" thread: visible `summary(lm(cekani_min ~ 1, data = data_gejzir))` shows the mean as `(Intercept)` with the same `Std. Error`. All values computed. |
| 10b | Optional: worked hand calculation | Doplňující: výpočet standardní chyby krok za krokem | Collapsed Extra containing the existing five-eruption calculation (two tables, four steps, R check) unchanged in substance. Step headings become bold lead-ins inside the box. Intro sentence: the same formula as in 9b, slowed down on five eruptions so every step can be done on a calculator. |
| 10c | Reading SE for our slope (retained) | Co říká standardní chyba o našem sklonu? | Retained. Add one quick question with a collapsed answer: „Kolik erupcí bychom potřebovali, aby se standardní chyba zmenšila na polovinu?“ (four times as many, about 470; computed). |
| 11 | Optional SE limits (retained, moved) | Doplňující: co standardní chyba nezahrnuje | Unchanged in substance; now after 10c. One added sentence: whether a single observation drives the estimate is checked later in this lesson (row 16f). |

### Influence block (new, after row 16e „Co pás neříká“, before row 17)

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 16f | Bridge and prediction on real excluded data | Může jedna erupce změnit sklon? (H2) | Bridge from the band: uncertainty grows towards the edges of the eruption lengths. Return to the provenance Extra: three eruptions were removed during data preparation. Visible code adds them back (three rows typed with `data.frame()`: id, date, duration in seconds, wait; then `/ 60` and `rbind()` with the two model columns) and fits `mod_gejzir_120`. Hidden figure: the 117 eruptions grey, the three excluded ones orange and labelled A/B/C. `box-question`: which one would move the line most if added? Collapsed answer: C (41 s). |
| 16g | Leverage | Krajní erupce mají delší páku (H3) | Name *pákový efekt* (*leverage*) from the seesaw of 9a: how far an eruption's length lies from the mean length, compared with the other lengths. It does not depend on the wait. It is the per-eruption counterpart of SE ingredient 2 and the reason the band (row 16c) widens towards the edges. Visible `hatvalues(mod_gejzir_120)` with the largest value (the 41-s eruption). |
| 16h | Cook's distance | Cookova vzdálenost: co kdyby erupce chyběla? (H3) | Name *Cookova vzdálenost* (*Cook's distance*): how much the fitted values would change if this one eruption were left out. Large when a large residual meets a long lever. Real contrast: B and A have almost the same residual (+18 min) but different leverage, so Cook's distance 0,07 vs. 0,03; C has 1,39. Visible `cooks.distance()` and a base-R index plot with the 4/n guide line (L03 Extra style, purple dashed). Refit without C only: slope moves from 11,92 to 13,14. 4/n is a flag for a closer look, not a rule for deletion. All values computed. |
| 16i | Influence on the scale of uncertainty | Mění některá z našich erupcí závěr? (H3) | Back to the 117 eruptions the lesson uses: largest Cook's distance 0,06; leaving out any single eruption moves the slope by at most 0,18 min/min, about a quarter of the SE 0,66. No single eruption carries the conclusion. Reading rule: compare the drop-one change with the SE. |
| 16j | Decision rule and honest provenance | Co s vlivnou erupcí? (H3) | `box-rule`: an influential observation is first checked, not deleted. Decide from knowledge about the data, not from Cook's distance alone; report the result with and without it when the decision is uncertain. Applied: the 41-s eruption is shorter than the NPS range of 1,5–5 min, so it is either a recording error or an unusual event outside the process we describe; excluding it has a reason stated in advance. The other two excluded eruptions are not influential; wording depends on decision D1. |

### Follow-on edits in the learning materials

| Row | Edit |
|---|---|
| 2 Výsledky učení | Outcome 2 becomes: „najít ve výstupu `summary()` odhad sklonu a jeho standardní chybu, vysvětlit, co standardní chybu zmenšuje, a rozlišit velikost vztahu od přesnosti odhadu;“. New outcome after outcome 3: „posoudit pomocí pákového efektu a Cookovy vzdálenosti, zda jedna erupce výrazně mění odhad sklonu;“. Same wording in the deck and exercise header. |
| 4 Provenance Extra | Replace „pro přehlednější výukový příklad jsme odstranili tři odlehlá pozorování“ with the stated reason (D1) and a forward link to 16f. `data/README.md` gets the same sentence. Code and ids unchanged. |
| 17 Co můžeme říct o Old Faithful? | One added sentence: no single eruption of the 117 changes the slope by more than about a quarter of its SE; the 41-s eruption was excluded for a stated reason. |
| 18 Co bude následovat dál | Unchanged except that the list of what we added mentions influence checking. |
| 19 Shrnutí | SE bullet: add the three ingredients and the √n rule. New bullet: leverage, Cook's distance, comparing the drop-one change with the SE, and checking instead of deleting. |
| 20 Závěrečná otázka | „Možné otázky“: add „Nemění závěr jedna erupce? Které erupce byly vyřazeny a proč?“. |
| 21 Slovníček | Terms `pakovy-efekt` and `cookova-vzdalenost` already exist in slovnik; wrap their first uses. `rezidualni-smerodatna-odchylka` and `stupne-volnosti` first uses move to 9b. |

### Knowledge-state ledger (changed and new rows)

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| What SE measures / 9 | L01 SD; histogram of 100 slopes; `summary()` exists | SE as the typical spread of slopes across same-size samples; the open question of how one sample can know it | Formula; RSE | SD of 100 slopes beside one report's `Std. Error`; ± 1 SE histogram |
| Drivers / 9a | GeyserWatch simulation; residuals (L03) | Three drivers of slope stability: scatter around the line, spread of lengths, number of eruptions | Leverage as a named quantity; the formula | Prediction, then three pairs of mini-fans with computed SDs |
| SE from one sample / 9b | Residuals, squares, sums, `sd()` (L01/L03); the three drivers | RSE; degrees of freedom named only; SE = RSE / (SD × √(n − 1)); √n rule; check against the simulation | Derivation of df; t-distribution | Visible chunks giving 0,66; n = 40 gives about 1,13 vs. 1,09 |
| Output / 10 | SE computed by hand from ingredients | `Estimate`, `Std. Error`, `Residual standard error` as known quantities; size versus precision | `t value`, p-value | Full `summary()` with find-it task |
| Extras / 10a–10b, 11 | 9b | SE of a mean; intercept-only model; step-by-step arithmetic; SE limits | Testing a mean | Collapsed boxes |
| Our slope / 10c | 9b, 10 | Relative size of SE; four times the data for half the SE | Interval | Computed question with answer |
| Influence / 16f–16j | Residuals and fitted values (L03); SE with its three ingredients (9a–9b); band wider at the edges (16c); provenance Extra (row 4) | Leverage; Cook's distance; drop-one comparison with SE; 4/n as a flag; checking before deleting | Formal outlier tests; robust regression; more than one predictor | Real excluded eruptions added back; `hatvalues()`, `cooks.distance()`, index plot, refit without one eruption |

Heading-strip audit: „Co měří standardní chyba?“ → „Co dělá sklon stabilnějším?“ → „Standardní chyba z jediného výběru“ → „Kde ve výstupu najdeme velikost a přesnost?“ → „Co říká standardní chyba o našem sklonu?“ → … → „Co pás neříká“ → „Může jedna erupce změnit sklon?“ → „Krajní erupce mají delší páku“ → „Cookova vzdálenost: co kdyby erupce chyběla?“ → „Mění některá z našich erupcí závěr?“ → „Co s vlivnou erupcí?“ → „Co můžeme říct o Old Faithful?“. Each heading names a question or result; no row needs a later concept.

---

## B. Presentation story-map amendment

- Artifact: `Presentation/presentation.qmd`.
- Story-map status: complete.
- Heading-strip audit completed: [x].
- Knowledge-state audit completed: [x].
- Human story-map approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-19.
- Decision and requested revisions: explicit user decision „I approve“ (2026-10-19) of the completed record after D1–D3 were resolved; recorded separately for each map; no revisions requested.
- This map is separate from map A and needs its own approval.

Rows refer to the [approved 2026-10-08 presentation map](2026-10-08-presentation-polish-story-map.md) and the band rows 37a–37d of the [2026-10-11 amendment](2026-10-11-confidence-band.md).

### SE section „Jedno číslo pro přesnost“ (after row 23)

| Order | Internal role | Level | Student-facing heading | Speaker note |
|---|---|---|---|---|
| 23 | Naming SE (retained) | H2 | Jak široce se sklony rozptylují? | Unchanged; the last fragment becomes the question „Jak to R pozná z jediného hlášení?“. |
| 23a | Prediction vote | H2 | Co dělá sklon stabilnějším? | Three `card-question` pairs (scatter, spread of lengths, 10 vs. 40 eruptions), pair prompt, 1 min. No answers yet. |
| 23b | Evidence reveal | H2 | Tři dvojice, tři odpovědi | The mini-fan figure from map A row 9a, one pair per fragment, computed SD of slopes in each panel title. |
| 23c | Formula in words | H2 | Tři ingredience standardní chyby | SE ≈ typical residual / (spread of lengths × √n), one fragment per ingredient, colour-matched to 23b. Speaker note: exact form uses √(n − 1); the skripta shows it. |
| 23d | Pair calculation | H2 | Spočítejte standardní chybu sami | Panel with RSE 6,83, SD 0,965, n 117 (computed); pairs, calculator, 2 min. Reveal: 0,66. |
| 23e | Rule from the formula | H2 | Proč mělo hlášení větší standardní chybu? | n = 40 gives about 1,13 vs. 1,09 from the simulation; takeaway strip: four times as many eruptions halve the SE. Replaces the „117 vs. 40“ takeaway on row 24. |
| 24 | Output task and reveal (modified) | H2 | Najděte velikost a přesnost | Unchanged task; the reveal adds „stejné číslo, jaké jsme spočítali“ and marks `Residual standard error` as ingredient 1. The speaker note pointing to the skripta for the calculation is removed. |

### Influence section (after row 37d „Kolik erupcí leží uvnitř pásu?“, before row 38)

| Order | Internal role | Level | Student-facing heading | Speaker note |
|---|---|---|---|---|
| 37e | Section divider | H1 | Může jedna erupce změnit závěr? | |
| 37f | Prediction vote on real data | H2 (blank) | — | Question box: „Při přípravě dat jsme vyřadili tři erupce. Která by přímku pohnula nejvíc?“. Figure from map A row 16f with A/B/C; three `card-question` options; C circled after commitment (L03 pattern). |
| 37g | Evidence reveal | H2 | Jedna krátká erupce, jiný sklon | Lines with and without eruption C; computed slopes 13,34 vs. about 11,9. |
| 37h | Naming leverage and Cook's distance | H2 | Delší páka, větší vliv | B and A have the same residual (+18 min) but different leverage; Cook's distance 0,07 vs. 0,03; C has 1,39. One line of visible code each: `hatvalues()`, `cooks.distance()`. |
| 37i | Influence on the scale of SE and the decision rule | H2 | Mění některá z našich erupcí závěr? | Index plot of Cook's distance for the 117 eruptions with the 4/n line; computed: largest drop-one change 0,18 vs. SE 0,66. `.panel-warning`: check, do not delete; the 41-s eruption is outside the NPS range, which is a reason stated in advance. |

### Follow-on edits in the presentation

| Row | Edit |
|---|---|
| 3 Výsledky učení | Outcomes in the shared wording from map A. |
| 43 Co ještě omezuje náš závěr? | One line: the conclusion does not rest on a single eruption (link to 37i). |
| 44 Shrnutí | SE bullet with the three ingredients; new influence bullet as in map A row 19. |
| 45 Closing question | Pair-prompt note: „Nemění závěr jedna erupce?“ among the things to see. |

Physical count: 49 → 59 slides. Active-learning moments: +2 votes (23a, 37f), +1 pair calculation (23d). Lecture time is not a constraint (author decision); estimated +15 min.

### Knowledge-state ledger (new rows)

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Drivers and formula / 23a–23e | Slides 18–23 (simulation, SD of slopes, SE named); residuals (L03) | Three ingredients; RSE; √n rule | df derivation; t | Vote, mini-fans, pair calculation |
| Output / 24 | 23d | `Std. Error` as the computed number | `t value`, p-value | `summary()` |
| Influence / 37e–37i | Band wider at the edges (37b–37d); SE; residuals and fitted values (L03) | Leverage; Cook's distance; drop-one change compared with SE; check, do not delete | Formal outlier tests | Vote on real excluded eruptions; two lines; index plot |

---

## C. Exercise blueprint amendment

- Artifact: `Exercises/cviceni.R`.
- Blueprint status: complete.
- Human blueprint approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-19.
- Decision and requested revisions: explicit user decision „I approve“ (2026-10-19) of the completed record after D1–D3 were resolved; recorded separately for each map; no revisions requested.

### Changes

| Task | Change | Direct work |
|---|---|---:|
| Header | Outcomes in the shared wording from map A. | — |
| L04-U05 | Keep steps 1–4. New step 5: compute the SE of the slope for `mod_gejzir` from `sigma()`, `sd()` and `nrow()` using a commented formula shown above the task, and check it against `summary()` (0,66). New step 6: the same for `mod_cerven` (1,12); interpretation: which ingredient made June less precise? `sigma()` is explained in the comment block above the task. | +5 min |
| L04-U08 (new) | „Může jedna erupce změnit sklon?“. A commented `data.frame()` with the three excluded eruptions is placed above the task; students (1) add them with `rbind()` and fit `mod_gejzir_120`; (2) find the largest `hatvalues()` and `cooks.distance()` with `which.max()`; (3) refit without that eruption and compare the slope change with the SE from U05; (4) for `mod_gejzir`, find the largest Cook's distance. Interpretation: would you delete the eruption only because its Cook's distance is large? Expected output with computed values; hints 1/2 as usual. | +10 min |
| L04-U09 | Former U08 (final sentence), renumbered; the model answer is unchanged. | — |
| L04-N17 (new) | Standard error of the mean wait: `sd() / sqrt(nrow())` and the intercept-only model `lm(cekani_min ~ 1)`; compare. New section „Standardní chyba průměru“. | optional |
| Out of scope | `influence.measures()`, `plot(mod, which = 5)`, ggplot versions, robust methods. | — |

Task numbers are referenced only inside L04 (exercise and its records), so renumbering U08 → U09 has no outside effect.

### Timing (decision D3)

Core route after the band amendment: 100–106 min typical, up to about 110 min for slower groups. The changes add about 15 min, giving 115–121 typical, which exceeds the 120-minute practical. Options:

1. **Recommended:** give the June model in U04 as ready-made code (students already practise `lm()` in U02 and fit July and August themselves) and drop U05 step 6 (June SE) into the optional bank as N18. Saves about 6 min, so about 109–115 typical.
2. Keep everything core and accept about 115–121 min with no buffer.
3. Make the new U08 optional (N18); core then grows by only about 5 min. Influence would then not be practised by every student before L07.

### Validation contract

Clean R session; an untracked reference harness solves U01–U09 and N01–N17; the three typed eruptions are checked against the provenance code; the Cook's distance plot is inspected; realistic core-route timing is reported; independent review uses `_internal/.ai/agents/exercise-reviewer.md`.

---

## Implementation and review contract (all three artifacts)

- Shared objects: `data_gejzir`, `mod_gejzir`, `data_odhady_hlaseni`, `odhad_sklonu`, `standardni_chyba_sklonu`, `format_cz()` / `format_cz_math()`, `render_glossary_term()`, `biostat_cols`, `theme_biostat()`. New objects: `data_vyrazene`, `data_gejzir_120`, `mod_gejzir_120`. No hand-typed computed values; the three excluded eruptions are typed raw data, identical in the skripta, deck and exercise.
- `simulate_reports()` gains optional arguments only; default calls must reproduce the current simulation byte-identically (checked by comparing `data_odhady_hlaseni` before and after).
- Colours: data grey; estimate and line purple; SE and its ingredients orange; the three excluded eruptions orange (interpretive focus); Cook's guide line purple dashed (L03 style).
- Order: implement A, then B, then C. Clean-session run of the visible skripta chunks from `data/old_faithful_2024.csv` alone; canonical HTML/PDF renders (offline PollsLive mode for the deck); full visual PDF check.
- Independent read-only reviewers: `vision-corrector.md` and `glossary-coverage-reviewer.md` (skripta), `changes-reviewer.md` with presentation checks (deck), `exercise-reviewer.md` (exercise). Findings are resolved and re-reviewed before human review.
- Environment note: `renv` reports "project out of sync"; check `renv::status()` before the canonical renders and do not commit incidental lockfile changes.

## Open decisions

- **D1 – the two non-influential excluded eruptions.** They were removed „pro přehlednější výukový příklad“ and the new section shows that they barely move the slope. Options: (a) **recommended:** state this honestly in the provenance Extra and in 16j („their removal changes the slope only a little; today we would keep them“), dataset unchanged; (b) restore them in a later dataset revision (119 rows; changes every number, PollsLive and Moodle items), not in this branch.
- **D2 – how students get the excluded eruptions.** (a) **Recommended:** three rows typed with `data.frame()` in visible code (transparent, no new file); (b) a small file `data/old_faithful_2024_vyrazene.csv` (requires `datasets.md` steps and a manifest update).
- **D3 – exercise timing.** See section C.

## Human decisions

- 2026-10-19, Ondřej Mottl: decisions listed under Scope and trigger. Map A, map B and blueprint C await separate approval of this completed record.
- 2026-10-19, Ondřej Mottl, open decisions:
  - D1: option (a) „agree“. The provenance Extra and row 16j state that the two non-influential eruptions were removed only for a cleaner example and barely change the slope; the dataset stays at 117 rows.
  - D2: option (a) „agree“. The three excluded eruptions are typed with `data.frame()` in visible code; no new data file.
  - D3: option 2 „longer is fine“. Everything in section C stays core (U05 steps 5–6 and the new U08); the core route of about 115–121 min typical is accepted for the 120-minute practical.

## Implementation notes (2026-10-19)

- Helpers: `simulate_reports()` gained the optional argument `sd_departures` (default `stats::sigma(mod_reference)`); with the lesson seed the default call reproduces the previous output exactly (`identical()` check). New single-function helper `R/Functions/simulate_stability_pairs.R` simulates the four settings for row 9a / slides 23a–23b (GeyserWatch, doubled scatter, only eruptions of at least 3 min, 10 eruptions); each setting starts from seed 900723, so the GeyserWatch setting reproduces `data_odhady_hlaseni`. SD of slopes: 1,09 / 2,19 / 3,18 / 2,84. The lessons draw no other random numbers, so no later value changed.
- Skripta: rows 9–11 and 16f–16j implemented as mapped. Deviations: the skripta has no text-highlight classes, so the three ingredients are matched by number (1–3) rather than colour; the 10-eruption pair is not used as a √n example in the text because its simulated ratio (2,6) differs from the formula ratio (about 2,1) through small-sample variation of the lengths; the √n rule is stated from the formula and checked with n = 40 (1,13 vs. 1,09). The five-eruption calculation moved unchanged in substance into the collapsed Extra; its H4 steps became bold lead-ins and its Typst non-breakable wrappers were removed inside the box. The provenance Extra and `data/README.md` now state the reason for each excluded eruption (D1) and list their raw values.
- Presentation: rows 23–24 and 37e–37i implemented; slide 23b reveals the pairs cumulatively in an r-stack (three images). Physical count 49 → 59 slides. Slide 37g shows two lines without bands with a source comment (two-line comparison exemption).
- Exercise: U05 steps 5–6, new core U08, former U08 → U09, new optional N17 in section „Standardní chyba průměru“; header and recap updated (U01–U09, N01–N17). The three excluded eruptions are live code above U08 because they need no earlier object.

## Validation (2026-10-19)

- Excluded eruptions: values recovered from the GeyserTimes archive with the provenance filters of the lesson (scratchpad probe, not in the repository): 120 rows; ids 1461337, 1468130, 1471579 match the documented exclusions.
- Skripta: canonical render (`R/render_skripta.R`) passes, HTML and PDF (53 pages; 54 after the review fixes); inline values checked in the HTML (0,66 by hand; 1,13 vs. 1,09; 2,19 / 3,18 / 2,84; 11,92 → 13,14; Cook 0,072 / 0,029 / 1,39; max drop-one change 0,18 = 27 % of SE; SE of mean 1,35). New PDF pages 19–24 and 43–51 inspected; figure heights reduced afterwards to limit white space.
- Presentation: offline render (`POLLSLIVE_RENDER_MODE=offline`) passes; 59 slides printed (61 after the review fixes); slides 24–28 and 48–51 inspected in the PDF; panel-title and overflow issues on slides 25, 48, 49 and 51 fixed and re-inspected. Remaining render warnings are the pre-existing SCSS "variable used before declaration" messages.
- Exercise: untracked reference harness (scratchpad) sources `cviceni.R` with `Rscript --vanilla` in a fresh folder containing only the script and `data/old_faithful_2024.csv`, and solves U01–U09 and N01–N17; all numeric checks pass. All new R lines are at most 80 characters (counted in characters).

## Independent review (2026-10-19)

Reviewer models (per `behaviour.md`): Sonnet for the complete skripta (`vision-corrector.md`), presentation (`changes-reviewer.md` with presentation checks) and exercise (`exercise-reviewer.md`) reviews, because these are full-artifact pedagogical and code reviews; Haiku for `glossary-coverage-reviewer.md`, a bounded check. All reviewers were read-only.

- Exercise: no high findings. Fixed: a time-pressure line in „Jak se skriptem pracovat“ (U05 step 6 and U08 step 4 may be finished at home, U09 always); U08 states the identical column names and asks to print the influential row; prerequisites list `nrow()`, `round()` and SD/`sd()`; U08 hints reworked (reasoning first, no full `which.max(cooks.distance())` call, ASCII object name); N17 explanation moved above its heading; U05 interpretation asks which ingredient made June less precise. Reviewer's realistic core-route estimate: about 114–121 min typical, 125–135 min for slower groups (accepted under D3).
- Glossary: first prose uses per `##` section wrapped in the new and edited text; repeated wraps in the same section removed (including three pre-existing ones). Headings are not counted, per the reviewer prompt.
- Skripta: no high findings. Fixed: an explanation of the 10-eruption pair (2,84) against the formula (2,36) and the √n rule; A/B/C labels in outputs and the leverage plot; the leverage definition and inline values; a readable Cook's distance plot for the 117 eruptions in 14.3 and the count above 4/n for the 120 eruptions (guarded by `stopifnot()`); Czech wording („tyto dvě erupce sklon téměř neovlivňují“, „po takovém ověření“, „Zatím jsme pracovali“); data-derived values made inline; a motivating sentence for √(n − 1) and an RSE display equation; named first arguments; dead objects removed; PDF page-break fixes (non-breakable answer box and textbook formula; the leverage-plot block that overflowed the page removed; smaller six-panel figure). Not changed: the link from β̂/σ̂ to L03 notation (pre-existing CI-section notation).
- Presentation: one high finding (leverage and Cook's distance named on slides but defined only in notes) and several medium ones; all addressed as listed below. Not changed (low): `set.seed()` inside `simulate_stability_pairs()` (documented; the lessons draw no other random numbers); `stats::` prefixes in helpers (repository convention); the word „ingredience“.

### Review-driven changes to the approved maps (for author confirmation)

1. Map A: the H3 „Souhlasí vzorec se simulací?“ is followed by a new H3 „Obvyklý zápis vzorce“; section 14.3 gains a visible Cook's distance plot for the 117 eruptions.
2. Map B, slide 24 (row 23a): the comparisons are called „Srovnání 1–3“ and the question asks which variant gives „méně rozptýlené sklony“; slide 25 heading „Tři srovnání, tři odpovědi“.
3. Map B, slide 28 (row 23e): the table is replaced by a full-width SE-versus-n curve (40 and 117 shown, 4 × 117 as a fragment); heading „Proč má hlášení se 40 erupcemi větší SE?“.
4. Map B, rows 37e–37i: the leverage/Cook slide is split into „Krajní erupce mají delší páku“ and „Delší páka a velké residuum, velký vliv“, each with a visible definition; the decision rule moves to a new slide „Co s vlivnou erupcí?“, which also states on the slide that A and B were removed only for clarity. Physical count 59 → 61.
5. Map B, row 38: „Statistická redakce: opravte titulek“ moves before the H1 „Může jedna erupce změnit závěr?“, directly after the band slides it belongs to.

### Focused re-checks (2026-10-19)

- Exercise: all findings resolved, no new issues; ready for human review.
- Skripta: all medium findings resolved; low items fixed afterwards (intro of 10.2 kept with its code, alias removed, L03 mention moved to the first use of leverage, „Mohlo jít o…“, wording „srovnání variant“ aligned with the deck). Accepted: two PDF page breaks (the opening of the collapsed „standardní chyba průměru“ Extra and the long leverage-plot chunk, which cannot sit in one non-breakable block).
- Presentation: all high and medium findings resolved; low items fixed afterwards (slide 51 takeaway, the meaning of 4/n and the switch back to the lesson model on slide 53, computed count on slide 24, label position on slide 28, note wording on slide 54). Accepted: some empty space on slides 52 and 54 and a marginal component-dominant run on slides 26–30.
- Final canonical renders: skripta HTML and PDF (54 pages), deck offline render (61 slides); no U+FFFD characters; the exercise harness passes.

## Author edits and terminology pass (2026-10-20)

- Author requests: the „Co čekáte?“ box in row 9a is a table (srovnání, co se mění, varianta A, varianta B); slide 26 redesigned and a new slide „Jak velké je typické residuum?“ added (RSS → ÷ (n − 2) → √, with the closing formula); the deck has 62 slides.
- Terminology review (`_internal/terminology_review_2026-10-20.md`), L04 items applied in the skripta, deck and exercise: RSS instead of SSE with a one-time bridge to L03; residuální with s (display text only, slugs unchanged); the RSE acronym removed (Czech term, „Residual standard error“ only as the R output label); „směrodatná chyba“ removed; „konfidenční interval“ reduced to a plain recognition note; hranice instead of meze; odhadnuté hodnoty/čekání instead of bare „odhad“ and „předpověď“ for fitted values; „výběry stejné velikosti“; hladina spolehlivosti in full; pokrytí named once in the deck and the exercise; one reporting form „odhad sklonu = X, SE = Y, 95% CI […]“; Cook's distance defined via odhadnuté hodnoty; „vlivné pozorování“ in headings and a short outlier/leverage/influence distinction; `sigma()` named in the skripta; „výběrová variabilita“ instead of „typická výběrová nejistota“; first-use wraps for `jednotka-pozorovani`, `heteroskedasticita`, `nelinearita`.
- Left for the course-wide pass: the PollsLive quiz and Moodle items, glossary entries that do not exist yet (`vlivne-pozorovani`, `prumerny-trend`), heading-wrap consistency, the picture word for heteroskedasticity (in L04 „vějíř“ already names the fan of report lines), α wrapped as hladina významnosti, slope-unit style and the several meanings of „soubor“.
- Validation: canonical skripta render and offline deck render pass (62 slides); exercise harness passes; no U+FFFD.
- Further author requests (2026-10-20): the pair-task formula on „Spočítejte standardní chybu sami“ is a display equation; new slide „Co vypíše `summary()`?“ before „Najděte velikost a přesnost“ (first full `summary()` output in the course: pair prompt plus a part-by-part reading as fragments); the skripta explains the five numbers under `Residuals`; the exercise gets a short part-by-part reading guide above U05. The deck has 63 slides; renders and the exercise harness pass.
- Slides 30–31 reworked into a zoom-in pair (2026-10-20): „Co vypíše `summary()`?“ fits the model and shows the whole output with a part-by-part reading; „Tabulka `Coefficients`: velikost a přesnost“ shows only the coefficient table (3 significant digits) with the find-two-numbers task. The output is no longer printed twice; 63 slides.
- Further author requests (2026-10-20): „Statistická redakce“ reveals one possible correction as a fragment after the pairs have answered; a 2 × 2 gallery of simulated data (small/large residual × small/large leverage, line with and without the added point, leverage and Cook's distance in the panel titles) added to the skripta (section „Cookova vzdálenost: co kdyby erupce chyběla?“) and to the deck as the slide „Kdy jeden bod pohne přímkou?“ before the A/B/C table. New helpers `R/Functions/simulate_influence_gallery.R` and `R/Functions/plot_influence_gallery.R` (seed 900723). The deck has 64 slides; both renders pass.

### Approval: confidence-interval section reorder (2026-10-20)

- Proposal: presentation section „Jaké sklony jsou s daty slučitelné?“ reordered meaning-first: (1) vote „Při mnoha opakováních zachytí skutečný sklon kolik intervalů?“, (2) sto 95% intervalů, (3) „95 % patří k postupu“, (4) construction odhad ± kritická hodnota × SE, (5) `confint()`, (6) our 95% interval, (7) Statistická redakce, (8) vote on 80 %, (9) the same 100 reports at 80 % and 50 % in one slide, (10) „Užší neznamená automaticky přesnější“; the band slides move under a new H1 „Kde může ležet průměrný trend?“. Skripta unchanged (author decision). Slide „Jedna krátká erupce, jiný sklon“ deleted.
- Approver: Ondřej Mottl. Approval date: 2026-10-20. Decision: explicit „yes 52! I also approve the reoderd“.
- Implemented (2026-10-20): the CI section now runs vote (odhad ± asi 2 SE, kolik ze 100 zachytí skutečný sklon?) → sto 95% intervalů → „95 % patří k postupu“ (CI named there) → construction → `confint()` → our interval → Statistická redakce → vote on 80 % → 80 % and 50 % in one slide → „Užší neznamená automaticky přesnější“ (four levels on our data plus the rule); the band slides sit under the new H1 „Kde může ležet průměrný trend?“. „Jedna krátká erupce, jiný sklon“ deleted; its objects moved to the slides that first use them. The deck has 62 slides; offline render passes.
- Author approval (2026-10-20): Ondřej Mottl approved the implemented CI reorder, including the opening vote phrased as „odhad ± asi 2 SE“ („I approve“). Next step: full independent review of skripta, presentation and exercise against the course instructions.

## Full review against the instructions (2026-10-20)

Reviewers (read-only): Sonnet for the skripta (`vision-corrector.md`), the presentation (`changes-reviewer.md` with presentation checks and a cross-artifact consistency pass) and the exercise (`exercise-reviewer.md`); Haiku for `glossary-coverage-reviewer.md`.

- Skripta (two HIGH, rest MEDIUM/LOW; no teaching-order or statistical defect). Fixed: hand-typed derived values made inline (two-thirds share, 120, 41 s, α and 1 − α); four-stage equations for the residual SD on the main route (words → numbers → σ̂ = √(RSS/(n − 2))) and for the SE of a mean; „predikční interval“ named and wrapped; fitted-value and fitting wording („odhadnutá hodnota“, „odhadne“), „hladina spolehlivosti“ in full, „výběr“ for samples where touched, „ve výstupu R *Residual standard error*“, „nulový model“; glossary wraps from both reviews (including `prumerny-trend`, `vlivne-pozorovani`, summary bullets); `lines()` calls vertical, `mean(x = …)`; three non-breakable blocks that left half-blank PDF pages now break. Not changed: the heteroskedasticity picture word „trychtýř“ (course-wide decision pending; „vějíř“ already names the fan of report lines), dropped table captions in the Typst PDF (template-level), alt-text numerals for teaching inputs, the closing-question wording difference with the deck, and the remaining meanings of „soubor“ outside touched lines.
- Presentation (two HIGH, ten MEDIUM). Fixed: „průměrný trend“ defined on the vote slide and the band H1 renamed „Jak přesně známe celou přímku?“; the with/without-C slopes and the A+B shift shown on „Co s vlivným pozorováním?“ (replacing the deleted slide's numbers); „vlivné pozorování“ named on the Cook slide with the odlehlé/vlivné distinction in the takeaway; visible model code for `mod_gejzir_120` on the leverage slide; summary cut to five short bullets at normal size; classification cards interleaved; GIF slide asks a noticing question before the explanation; „referenční sklon“ in the opening CI vote; three inline helper functions moved to `R/Functions/plot_stability_pairs.R`, `compute_se_by_n.R`, `plot_se_by_n.R`; „erupcí v našich datech“ on slide 2; low wording items (hladina spolehlivosti, units on slide 54, option units on the A/B/C vote, „Odhad závisí na datech“, R label for the residual SD). Not changed (author decision needed): a mid-lecture return to the spine question, the component-dominant run on slides 26–32, three blank-heading votes, seven H1 dividers.
- Exercise (no HIGH). Fixed: „hranice“ in U07, „odhadnuté čekání/hodnota“ for fitted values (7 places), explanations moved above five optional task headings, N13 run instruction, U08 split into 5 steps with the 4/n count asked, honest note on the removed eruptions, „výběr“ in three places, `sqrt(x = …)`. Harness passes; reviewer's core-route estimate 90–105 min direct work.
- Headings in the artifacts that differ from the approved map wording after author requests: „Co s vlivným pozorováním?“ (map: „Co s vlivnou erupcí?“), band H1 „Jak přesně známe celou přímku?“.
- Validation: canonical skripta render (55 pages) and offline deck render (62 slides) pass; changed PDF pages and slides inspected; exercise harness passes; no U+FFFD.
- Author decisions after the review (2026-10-20): D1 yes, a mid-lecture return to the spine question added as slide 33 „O kolik déle čekáme — a jak jistě to víme?“ (už víme / ještě nevíme) before the CI section; D2 the component-dominant run on slides 26–32 stays; D3 the three blank-heading votes stay; D4 the residual picture word is „vějíř (heteroskedasticita)“ — „trychtýř“ replaced in the skripta and the exercise. The deck has 63 slides; renders and the exercise harness pass.
- Author requests (2026-10-20): new deck slide 12 „Sedí přímka k datům?“ (residuals vs. fitted and residual histogram, stressed as good practice); inset histograms of the report slopes (shared bins and count scale) in every panel of „Tři srovnání, tři odpovědi“ via `plot_stability_pairs()`; SD of the 100 slopes and the typical SE shown with three decimals (1,095 vs. 1,091) in the deck and the skripta table, keeping one SE value; approved narrative change: new slide „Skutečnost, výběr, odhad“ (research vs. simulation rows) after the H1 „Sto pozorovatelů, sto sklonů“, „jeden výběr“ wording on the GeyserWatch slide, the simulation panel and the ring-toss slide refer to the chosen reality, and a three-item paragraph (skutečnost / výběr / odhad, L01 callback) in the skripta GeyserWatch section. The deck has 65 slides; both renders pass.
- Author request (2026-10-20): the skripta six-panel figure in „Co dělá sklon stabilnějším?“ also gets the inset slope histograms; it now uses `plot_stability_pairs()` (new arguments `n_col`, `show_sd_label`) like the deck. Both renders pass (skripta, deck 65 slides).

## Focused re-review of the 2026-10-20 additions

Reviewers (read-only): Sonnet for the deck and the skripta, Haiku for the exercise.

- Exercise (two MEDIUM). Fixed: the Ohlédnutí Q4 line wrap; U08 Nápověda 2 now says how to count eruptions above 4/n (`sum()` over `cooks.distance(...) > 4/n`).
- Deck (no HIGH, five MEDIUM). Fixed: slide 19 no longer uses „hlášení“ and „GeyserWatch“ before slide 20 introduces them, and the „Skutečnost“ card names the cílová populace; the slide 20 simulation panel is shortened to the referenční přímka; the slide 27 insets are explained in the takeaway, the notes and all three alt texts; the right column on the classification slide is swapped so each row mixes Estimate and SE; „Co s vlivným pozorováním?“ shows the chain 13,34 -> 13,14 (A and B, with units) -> 11,92 (C, × SE of our model) and expands NPS. LOW items fixed: slide 12 takeaway says why the residual check sits before SE and intervals (the function list moved to the notes); the vote card on the průměrný trend no longer blurs the line and the trend; units kept with numbers on the A/B/C vote; the 80 % heading shortened. Not changed: a code comment for `data_gejzir_120` (the visible comment already says „Model ze 117 erupcí a vrácených A, B, C“).
- Skripta (one HIGH reported, four MEDIUM). The HIGH item (display „heteroskedasticity“) is not a defect: it is the Czech genitive of heteroskedasticita after „bez vějíře“. Fixed: the vějíř sentence says what the pattern is (rozšiřování rozptylu residuí); the L01 callback no longer overclaims (výběr vs. cílová populace „zmínili“, odhad added; `populace` and `simulace` wrapped); the six-panel caption and alt text explain the inset histograms; the SE table header is „Hodnota“ and the units are stated in the text; „odhadneme“ instead of „fitujeme“; „známe skutečný (referenční) sklon“ instead of „víme, kde je pravda“; „ingredience“ introduced once where the three properties are first combined; item 2 of the stability list gives the comparison value; the band heading matches the deck („Jak přesně známe celou přímku?“). Not changed: page whitespace on pp. 17, 19 and 22, the equation punctuation gap, and the collapsed answer box visible in the PDF (known limitation).
- Helper `plot_stability_pairs.R`: header comment updated for `n_col = 2`.
- Validation: canonical skripta render (56 pages) and offline deck render (65 slides) pass; changed slides 12, 19, 20, 27, 34, 48, 53 and 58 and skripta pages 15 and 18 inspected; exercise harness passes; no U+FFFD.

## Author request: band gallery (2026-10-21)

- New deck slide „Kdy je pás široký?“ after „Pás pro průměrný trend“: a 2 × 2 gallery of simulated data with one true trend (many points and small scatter; large scatter; 5 points; x only between 4,5 and 5,5), fitted line with its 95% confidence band drawn over x = 0–10 and the band width at x = 9 in the panel titles (1,1; 5,2; 6,2; 13,3). The takeaway ties the band width to the SE ingredients and adds that the band is widest far from the data. New helpers `R/Functions/simulate_band_gallery.R` and `R/Functions/plot_band_gallery.R` (seed 900723). Skripta unchanged.
- Validation: offline deck render passes (66 slides); the new slide inspected.
- Author request (2026-10-21): the band gallery also goes into the skripta as subsection „Kdy je pás široký?“ between „Pás spolehlivosti kolem přímky“ and „Pás v číslech: `predict()`“: a „Co čekáte?“ box (which of four described data sets has the widest band at x = 9) with a collapsed answer, the same figure (same helper, seed and settings as the deck, passed explicitly so prose values are inline), the three ingredients, and a paragraph on extending the line beyond the data with the first wrapped use of `extrapolace` in the course (L06 and L08 use the term later). Closing sentence: our band is narrow across the observed range of eruption lengths, and estimates apply only within it. Skripta render passes; pages 39–40 inspected (some white space remains under the box on p. 39 because the figure does not fit there).

## Author approval (2026-10-21)

- Approver: Ondřej Mottl. Date: 2026-10-21. Decision: explicit „I approve the lesson“ for the skripta (57 pages), presentation (66 slides) and exercise in their current state, including the band gallery in the deck and the skripta.
