# L04 exercise polish: blueprint, review and validation

## Status and decisions

- Date: 2026-10-09.
- Branch: `polish/l04-exercises`, created on explicit user authorization from clean `main` at `9b05f8a` (after the merged and released lesson polish). The older `lesson/l04-exercises` branch from September was left untouched.
- Trigger: Ondřej Mottl asked for a review of the L04 R exercise against the guidance and the October L05/L09 exercise format. The review produced 19 findings (A: alignment with the polished lesson; B: structure; C: task anatomy; D: timing and workflow).
- Human decisions (2026-10-09): the practical is 120 minutes; keep `predict()`; fully restyle to the L05/L09 format; make a new branch. Promoting the months comparison with an SE comparison into the main route follows from finding 1–2 and the decision to keep `predict()`.
- Supersedes: [2026-09-22 exercise blueprint](2026-09-22-exercise-blueprint.md) (historical approval retained there).

## Changes against the September worksheet

- Structure follows L05/L09: `Příprava` with „Jak získat a otevřít soubory“ (numbered steps, Existing Directory, Save As, box-drawing folder tree), „Jak se skriptem pracovat“ (Environment panel, Ctrl + Shift + C to uncomment, Session > Restart R), „Výsledky učení a předpoklady“ (the lesson's shared outcomes), „Technická kontrola souboru“ (`paste0()` message, variable dictionary with units and source; no licence claim because GeyserTimes reuse terms are unverified). One `# Úlohy navíc` section with `##` groups; closing „Ohlédnutí a vlastní kontrola“.
- Task anatomy follows L05/L09: numbered `Zadání`, empty answer lines, `Očekávaný výsledek`, `Nápověda 1`, `Nápověda 2` and a separate `Interpretace`, each on its own line; short function explanations before tasks; commented examples to copy.
- Alignment with the polished lesson: students load the CSV themselves with `read.csv()`, `as.Date()` and `/ 60` (lesson code); checks use `str()`, `summary()`, `colSums(is.na())`; months via `format(x = date, format = "%m")` instead of `substr()`; comparison wording for the slope; *rozptýlení*; no lesson codes (L03/L05) in student text; closing sentence in the slide 42 form „13,34 ± 0,66 minuty (odhad sklonu ± SE; 95% CI [12,03; 14,64] …)“.
- Task IDs: the practical has not yet been taught, so the main route was renumbered to follow the lesson order. Old U04 (`predict()`) is now U07; old U07 (conclusion) is now U08; new U04 is the three-month comparison; U05 adds the one-month SE comparison. Old N01 (months) moved into U04; N01 is now „SE and number of eruptions“; old N04 (monthly counts, now in U01) became a histogram of eruption lengths. N02–N03 and N05–N15 keep their content.

## Outcomes, starting states and timing (120-minute practical)

| Segment | Purpose | Starting state | Direct work |
|---|---|---|---:|
| Příprava | Obtain files, open project, run the file check | RStudio, browser, release links | 12 min |
| L04-U01 | Load, convert date and minutes, check structure, missingness, ranges, months; roles | `soubor_gejzir`; lines for `as.Date()` and `/ 60` shown above the task | 12 min |
| L04-U02 | Fit `mod_gejzir`, coefficients, graph with line, slope in comparison wording | `data_gejzir`; generic `lm()` form; commented plot example | 10 min |
| L04-U03 | Residuals against fitted values and residual histogram | `mod_gejzir`; function list above the task | 10 min |
| L04-U04 | Three months, three slopes (sampling variability) | `data_gejzir`; commented June example | 14 min |
| L04-U05 | Estimate and SE; one month versus all eruptions | `mod_gejzir`, `mod_cerven`; SE definition above the task | 9 min |
| L04-U06 | 95% CI of the slope | `mod_gejzir` | 7 min |
| L04-U07 | `predict()` for a 4-minute eruption; contrast with the CI | `mod_gejzir`; `data.frame()` example | 8 min |
| L04-U08 | Written conclusion with estimate ± SE, CI, months, limitation | Results of U01–U07 | 10 min |

Total direct work: about 92 minutes, leaving about 28 minutes for explanation, discussion and slower groups in the 120-minute practical. Teachers may skip the refresher of the previous lesson. The optional bank (N01–N15) is independent practice; N13–N15 form one ordered route.

Out of scope: formal tests, p-values, t-distribution, prediction-interval calculation, repeated random sampling or simulation code, new model families. The data are observational; causal claims are not supported.

## Validation

- UTF-8 without BOM or replacement characters; the file parses; task IDs U01–U08 and N01–N15 are unique. No `library()`, `require()`, `setwd()`, `attach()`, `View()`, `par()`, `T`/`F` or lesson codes in student text; the only install command is commented.
- The unfilled script runs from a clean `Rscript --vanilla` session in a temporary project with only `data/old_faithful_2024.csv`; without the CSV it stops with the intended Czech message.
- An untracked reference harness (scratchpad, outside the repository) solved all 8 main and 15 optional tasks and verified every stated value: 117 rows, 39 per month, ranges 1,65–4,83 min and 62–116 min; slope 13,34; monthly slopes 12,92 / 13,99 / 12,88; SE 0,66 (all), 1,12 (June), 0,77 (June + July, 78 rows); 95% CI 12,03–14,64; 80% CI 12,49–14,18; prediction 99,25 at 4 min and 72,58 / 85,92 / 99,25 at 2/3/4 min; 0,2223 min per second; first residual −4,36; largest residual row 97 (2024-08-15, +21,08); 28 short and 89 long eruptions; faithful 272 rows, slope 10,73, SE 0,31, CI 10,11–11,35, prediction 76,39; broom row agrees.
- Saved plots (data with line, residuals against fitted values, residual histogram, eruption-length histogram, predicted point, residuals against predictor) were inspected: Czech labels render and the patterns match the expected results.

## Independent review

A separate read-only reviewer applied `_internal/.ai/agents/exercise-reviewer.md` to the complete worksheet, this blueprint, the polished lesson, the L03 practical and the L05/L09 format references. It re-solved every task in its own temporary harness and confirmed all stated values. Findings and resolutions:

- M1 (timing against canonical 90-minute practical): the 120-minute practical is the author's decision of 2026-10-09, recorded here. The canonical `_internal` guidance (`course-context.md`, `exercises.md`) still states 90 minutes; updating it is a separate cross-repository change awaiting the author's decision. The reviewer estimated 95–105 min of direct work for slower groups; the pacing trial remains open.
- M2 (meaning of „95 %“ not explained before U06/N02): a short explanation of the interval, CI and hladina spolehlivosti now precedes U06; U06 hints now support interpretation (what the interval concerns; a sentence frame) instead of repeating the call.
- L1 (new functions only in hints): one-line explanations of `%in%` (N01), `points()` (N06), `abs()`/`which.max()` and row selection by number (N09) now precede the tasks; Nápověda 2 no longer restates them as code.
- L2 (Nápověda 2 near-complete code in U02/U03): rewritten to name arguments and axes without complete calls.
- L3 (U08 expected result contradicted U03): now „bez zřetelného oblouku ani trychtýře, i když několik erupcí střední délky leží výrazně nad přímkou“.
- L4 (long lines): rewrapped; only the data URL exceeds 80 characters.

After the fixes the reference harness again passed all checks and the encoding check passed.

Focused re-review by the same read-only reviewer (2026-10-09): **No findings**. All earlier findings resolved; M1 adequately recorded. Verdict: ready for human review. Residual gaps: beginner pacing trial; canonical 90-minute guidance awaiting the author; live release URLs; GeyserTimes reuse terms.

## Human decisions after review (2026-10-09)

- Ondřej Mottl: „Every lesson is now 120 minutes“. The canonical `_internal` guidance was updated locally to 120-minute practicals with an 85–95 minute direct-work budget (`course-context.md`, `exercises.md`, `exercise-reviewer.md`); the lecture remains 90 minutes. This resolves M1; the L04 main route (about 92 minutes) is within the new budget.
- Ondřej Mottl: „I approve the excercise“ — explicit human approval of the restyled worksheet after independent review. Approval does not authorize staging, commits, pushes, a pull request or a release.

## Remaining gates

- Independent read-only review with `_internal/.ai/agents/exercise-reviewer.md`.
- Beginner GUI pacing trial (timing is an author estimate).
- Human approval: given 2026-10-09 (see above). Staging, commits, pull request and release need separate authorization.
