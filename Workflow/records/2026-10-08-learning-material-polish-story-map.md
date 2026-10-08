# L04 learning-material polishing story map

## Scope and approval record

- Artifact: complete `Learning_materials/skripta.qmd`, including retained optional material.
- Date: 2026-10-08.
- Branch: `polish/l04-before-teaching`; base: `0202e5a`.
- Requested work: resolve findings A1–A10 and C25–C31 in [the review](2026-10-08-polish-review.md), with the human decisions recorded there.
- Story-map status: complete.
- Heading-strip audit completed: [x].
- Knowledge-state audit completed: [x].
- Human story-map approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-08.
- Decision and requested revisions: explicit user decision „approve both“ (2026-10-08), given after the SE revision; recorded separately for each map; no further revisions requested.
- Preserve the Old Faithful dataset, the three-researcher story, GeyserWatch, the complete four-stage SE and interval calculations and both September Extras. This is a polishing pass, not a new stage sequence.

## Complete story map

One row per major section or concept block. Headings are planned student-facing headings, not full prose.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Biological opening and prediction | Úvod | One `box-question` with the shared spine question „O kolik déle čekáme po delší erupci — a jak jistě to víme?“. Short Old Faithful context (NPS ranges, cited). A/B/C prediction: if other people watched the geyser on other days, would their slope be A) exactly the same, B) similar but not identical, C) unrelated? Collapsed answer (B), no use of *výběr* yet. Remove the lesson-plan narration about when terms arrive. |
| 2 | Learning contract | Výsledky učení | Shared four-item list from the review record, identical in the deck. |
| 3 | Data entry and core inspection | Každý řádek je jedna erupce | Visible base R from `data/old_faithful_2024.csv`: `read.csv()`, `as.Date()` for `date`, `delka_erupce_min <- duration / 60`, `str()`, `summary()` of the two model columns, missing values per column, eruptions per month. Representative-rows table. Counts, dates and ranges inline from the object. Variables, units and roles (prediktor, odezva). |
| 4 | Optional provenance | Doplňující: jak vznikl soubor old_faithful_2024.csv | Collapsed box (L02/L03 pattern) containing the prose and both code chunks: GeyserTimes archive and citation/reuse terms, NPS interval range, primary-record filters, the three removed outliers, row guard, `faithful` alternative. Also add `data/README.md` with the same provenance. |
| 5 | Whole-data reading and this summer's line | Delší erupce, delší čekání? | Plain scatter of all eruptions; three noticing questions; answer in a collapsed box. Then the same scatter with the line fitted from all eruptions and its computed slope (as in the deck); it later serves as the reference line of the simulation. Keep the paragraph separating the recorded data from the wider process (volunteer timing, neighbouring eruptions). |
| 6 | One observed subset and its estimate | Pepa: jeden měsíc, jeden odhad | Visible subset (now runnable from the CSV route, no longer an Extra), `lm()` and `coef()`; figure; interpretation in comparison wording: two eruptions differing by one minute differ on average by … minutes of waiting. Correct description of Pepa's data, not a universal value. |
| 7 | Repeat with other subsets; name the idea | Mařenka a Karel: jiné měsíce, jiné přímky | Prediction question before the three-panel figure; computed coefficient table; what stayed the same / what changed; months are not a controlled random sample. Name *výběr* (sample) and *výběrová variabilita* only after the evidence. |
| 8 | Many repetitions (simulated) | Sto hlášení v aplikaci GeyserWatch | Rebuilt simulation used for the rest of the lesson. Name the teaching inputs once (100 reports, 40 eruptions, 15 shown). Each report takes 40 eruption lengths from our summer; its waiting times are generated from this summer's line (row 5) plus random departures as large as the residuals around it. Each report therefore brings new waiting times; the full-data slope is the known reference of the demonstration, not the population truth. Collapsed box with these details. Fifteen panels with a noticing question; histogram of 100 slopes. |
| 9 | Naming SE from the evidence | Co měří standardní chyba? | Recall L01: SD describes how different the observations are; SE will describe how precise an estimate is. Compute the SD of the 100 report slopes; show that the `Std. Error` that `summary()` gives for one report (and the typical value across reports) is about the same number. Definition: SE is the typical spread of the slope estimates from many samples of the same size, and `lm()` estimates it from a single sample. Histogram with one report's estimate ± 1 SE, which now matches the spread. ± 1 SE is not yet an interval. All values computed. |
| 10 | Output reading: size versus precision | Kde ve výstupu najdeme velikost a přesnost? | Visible `summary(mod_gejzir)` for all eruptions. Ask readers to locate the slope row and two numbers before the explanation. Read `Call`, `Residuals`, `Estimate`, `Std. Error`; link `Residual standard error … degrees of freedom` to row 12. `t value` and `Pr(>\|t\|)` deferred to the next lesson. SE in slope units; it is smaller than in one report because 117 eruptions carry more information than 40. *Rozptýlení* for spread. Reporting box for estimate and SE. |
| 11 | Optional SE limits | Doplňující: co standardní chyba nezahrnuje | Retain the September Extra unchanged in substance. |
| 12 | Worked SE calculation | Jak se standardní chyba sklonu počítá? | Retain the five-eruption subset and four sub-steps. Add `residuum²`, `x − průměr` and `(x − průměr)²` columns to the source table. For RSS and S_xx add the collapsed intermediate line (listed squares) between expansion and result. Czech decimals in equations via `format_cz_math()`. Remove step narration in favour of content lead-ins. Close by explaining from the formula why more eruptions give a smaller SE (row 10). The former separate section „Histogram sklonů a jedna standardní chyba“ is absorbed into row 9. |
| 13 | Recall: quantiles | Jak vyjádřit rozsah nejistoty? / Připomenutí kvantilů | Retain; unwrap prose. Quantile band on the histogram describes 100 simulated slopes, not the interval. |
| 14 | Interval construction | Od odhadu a standardní chyby k intervalu | Retain the four sub-steps (margin, lower, upper, whole interval). Add visible `confint(object = mod_gejzir)` after the hand calculation, with a check that both give the same limits. Keep only „konfidenční interval“ as a synonym; drop „konfidenční hladina“. |
| 15 | Level comparison | Jak se interval mění s požadovanou hladinou? | Prediction question (which level is narrowest?) before the computed table and figure. Same centre, different widths. |
| 16 | Coverage meaning (rebuilt) | Jak číst hladinu intervalu? | The same 100 GeyserWatch reports from row 8 (no second simulation): each report's own 95/80/50 % `confint()` against the full-data reference slope. State what changes between reports (eruption lengths drawn and waiting times generated) and what stays fixed (model, reference line, departure size). Same reports for all three levels; realised counts reported. Seed 900723. Then the two-sentence contrast with quantiles; rule box on 95 %; warning box on what the CI does not say; reporting box for estimate, SE and CI. |
| 17 | Answer to the opening question | Co můžeme říct o Old Faithful? | Return to the spine question with computed slope and interval in comparison wording. Slope interval is not a range for one future wait; retain the prediction-interval Extra. Limits from data collection and month-to-month change. |
| 18 | Bridge | Co bude následovat dál | Replaces the „Most k následující lekci“ box: from estimate and uncertainty to judging a specific claim about a model parameter in the next lesson. |
| 19 | Earned recap | Shrnutí | Four bullets mirroring the outcomes. |
| 20 | Transfer commitment | Závěrečná otázka (H3 under Shrnutí) | Same closing question as the deck: „Co potřebujete vidět, než napíšete „po minutě erupce navíc čekáme o X minut déle“?“ with X computed. Collapsed „Možné otázky“: graph and residuals, number and origin of eruptions, SE and interval, comparison wording rather than cause. |
| 21 | Term reference | Slovníček pojmů | Retain HTML table and PDF online fallback. |

## Chronological knowledge-state ledger

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Opening / 1–2 | L01 summaries; L02 scatterplots; L03 `lm()`, intercept, slope, residuals, fitted values | The spine question: size of the effect and how sure we are | *Výběr*, SE, interval, inference | Geyser context; prediction with collapsed answer |
| Data / 3–4 | `read.csv()`, `str()`, `summary()` from L02/L03 | One eruption per row; date conversion; units; counts, ranges, missingness | Hidden preparation as a prerequisite | Runnable code and output; collapsed provenance |
| Whole data / 5 | Scatterplot reading; `lm()` line | Positive relationship with scatter; this summer's fitted line; recorded data versus wider process | One exact line for all eruptions | Plain scatter, questions before answer, then the fitted line |
| Pepa / 6 | `lm()`, `coef()`, slope in units | One subset gives one estimate | That estimate is universal | June subset, line and number |
| Months / 7 | Pepa's estimate | Same procedure, different observations, different estimates; *výběr*, *výběrová variabilita* | Months are random samples; SE | Three panels and a table; prediction first |
| GeyserWatch / 8 | Sampling variability as an idea; this summer's line; residuals (L03) | Simulated reports with generated waiting times; distribution of 100 slopes | That simulated waits are observed data; known population slope in real research | Fifteen panels and histogram; explicit statement of what is simulated |
| What SE measures / 9 | L01 SD; histogram of 100 slopes; `summary()` exists | SE as the typical spread of slope estimates across same-size samples, estimated from one sample | Interval interpretation; t, p-value | SD of 100 slopes beside one report's `Std. Error`; histogram with ± 1 SE |
| Output / 10–11 | SE meaning; coefficients | Reading `Estimate` and `Std. Error` for all eruptions; size versus precision; more eruptions → smaller SE | `t value`, p-value, hypothesis testing | Full `summary()` output with a find-it task |
| SE calculation / 12 | Residuals, squares, sums (L01/L03) | RSS, residual SD, S_xx, SE formula; why SE shrinks; meaning of n − 2 deferred | Derivation of df | Five-row table with squared columns; four-stage equations |
| Quantiles / 13 | L01 quantiles | Middle 95 % of constructed slopes | That this band is the CI | Quantile band on the histogram |
| Interval / 14 | Estimate, SE | Critical value (named, not derived), margin, limits; `confint()` | t-distribution theory | Hand calculation then identical `confint()` output |
| Levels / 15 | One interval | Higher level → wider interval | Coverage meaning | Prediction, table, figure |
| Coverage / 16 | Intervals at several levels; the simulated reports | Level as long-run coverage of a procedure; what an interval does not say | Population truth known in real research | The same 100 reports with their own intervals; realised counts |
| Answer / 17 | All of the above | Supported answer to the spine question; slope interval ≠ future-wait range | Prediction interval calculation; causation | Computed sentence; Extra |
| Ending / 18–21 | Whole lesson | Recall and transfer | Testing machinery | Bridge, summary, closing question with collapsed answers, glossary |

## Implementation and review contract

- Shared changes: Czech number formatting via `R/Functions/format_cz.R` and `format_cz_math.R` (adapted from L03); one semantic colour mapping in both artifacts (data grey, estimate and interval purple, SE and uncertainty orange; reference value orange only where it marks the interpretive focus, documented in the source); comparison wording for the slope; *rozptýlení* for spread; seed 900723; named teaching inputs; no hand-typed computed values.
- Source hygiene: remove the custom glossary CSS/JS and add `glossary-headings.lua` as in L02/L03; unwrap prose; `fig-alt` on every figure; lesson objects created next to first use; helpers in single-function files under `R/Functions/`.
- Do not add p-values, tests, prediction-interval calculation or new predictors. Keep both Extras.
- Order: implement, clean-session run of all visible chunks from `data/old_faithful_2024.csv` alone, canonical HTML/PDF render, glossary-coverage pass and separate read-only vision review, full PDF inspection, then human review.
- One simulation for the whole lesson: the GeyserWatch reports of row 8 feed the histogram, the SE comparison (row 9), the quantiles (row 13) and the coverage panels (row 16). Probe with the current data and seed 900723: SD of 100 slopes 1,09; typical report SE 1,09; full-data SE 0,66. Final values come from the rendered objects.
- Author audit: heading strip reads as a content narrative; *výběr* first appears in row 7; SE named and explained in row 9 before it is read from the full output in row 10; critical value and `confint()` first in row 14; no row needs a later concept.

## Review-driven amendments (2026-10-08)

These follow from the independent read-only review of the implemented artifact. They stay within the approved scope and order:

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 5a (H3 under row 5) | Model check before interpretation | Sedí přímka k datům? | Visible base-R residuals-versus-fitted plot for the full-data model; two clusters around zero, no funnel, a few medium-length eruptions well above the line. The paragraph separating recorded data from the wider process moved here from the collapsed provenance box. |

Ledger additions:
- Row 5a may assume L03 residual plots; it earns "the line summarises well but not perfectly"; it must not assume formal diagnostics.
- „hladina spolehlivosti“ is named in row 14, where the critical value is introduced; its meaning (long-run coverage, „pokrytí“) is earned only in row 16.
- The simulation's fixed elements and the known-only-in-simulation reference slope are stated in the main text of row 8, not only in the collapsed box.

## Author-requested amendments (2026-10-08)

Ondřej Mottl, during review of the polished learning materials: (1) the table in „Jak se standardní chyba sklonu počítá?“ uses mathematical symbols as column names — replace them with words; (2) before „Jak vyjádřit rozsah nejistoty?“, return to our model and coefficient and to what the SE in `summary()` means.

- Row 12: the worked-example table is split into two word-headed tables placed beside the step that uses them („Erupce · Čekání · Odhadnuté čekání · Residuum · Čtverec residua“ for RSS; „Erupce · Délka erupce · Odchylka od průměru · Čtverec odchylky“ for the sum of squares of eruption lengths). The equations refer to the columns by these names.
- New row 12a (H3 under row 10's section), „Co říká standardní chyba o našem sklonu?“: visible `summary(mod_gejzir)$coefficients["delka_erupce_min", c("Estimate", "Std. Error")]`; Estimate read as the size of the relationship, Std. Error as how much estimates from comparable sets of the same number of eruptions would typically vary around the true slope, compared with one GeyserWatch report; SE relative to the estimate (computed percentage); the intercept also has its own SE; closes with the open question „Jaký rozsah sklonů je tedy s našimi daty slučitelný?“, which row 13 answers. Ledger: assumes rows 9–12; earns the model-specific reading of SE; must not assume intervals or tests.

## Human decision

Approved by Ondřej Mottl on 2026-10-08 („approve both“), recorded separately for this map and its ledger. Final artifact and the recorded author amendments approved on 2026-10-08 („Ok I approve the changes (!)“).
