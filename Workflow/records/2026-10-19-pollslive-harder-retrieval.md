# L04 PollsLive retrieval quiz: harder replacement questions

- Date: 2026-10-19
- Branch: `pollslive-harder-retrieval`
- Workstream: focused post-presentation PollsLive revision
- Approver: Ondřej Mottl (human author)
- Decision: approved on 2026-10-19 in the authoring session, after a requested revision.
- Requested revisions: the first proposed Q3 (reversing the response and predictor roles) was rejected. Its replacement on leverage was approved, then withdrawn by the author the same day because leverage is taught only in optional boxes of L03. The final Q3 (sum of residuals versus sum of squared residuals) was approved on 2026-10-19.

Integration-map status: unchanged and approved. Exact-question status: approved.

## Reason for the revision

After teaching L03 the author judged the retrieval questions far easier than the Moodle self-tests. The previous L04 set asked for recall (which side of `~` is the response), had distractors that needed no statistics to reject, and its correct answer was the only hedged option. The new set asks for one computation, one interpretation of a familiar diagnostic figure and one transfer to a new situation. Every distractor is a named misconception, and the options have similar length and tone.

## Integration map

The retrieval block keeps its approved position: after the Old Faithful opening question and before `Výsledky učení` (`{{< include ../pollslive/generated/active.qmd >}}` in `Presentation/presentation.qmd`). No other slide changes.

| Position | Teaching move | Student knowledge used | Bridge |
|---|---|---|---|
| Q1 | Rescale a slope to a different predictor difference | L03 slope as average difference per unit | One fitted slope is a single estimate. |
| Q2 | Read residual sign and group structure | L03 residuals coloured by species | The model summarises data imperfectly. |
| Q3 | Compare lines by the sum of squared residuals, not the plain sum | L03 slides `Jak porovnat celé přímky?` to `Počítač hledá nejmenší součet čtverců` | `lm()` picks the line with the smallest sum of squares for one data set; L04 asks how that line varies across data sets. |

## Exact production questions

The canonical text is `pollslive/quiz.json`. Correct answers:

| Question ID | Correct option | Key | Distractors and the misconception each encodes |
|---|---|---|---|
| `rozdil-pri-pul-centimetru` | Asi o 1,1 cm | C | 2,2 cm (slope not rescaled); 4,5 cm (divided by 0,5); "nelze určit" (thinks the intercept or actual widths are needed) |
| `residua-podle-druhu` | podhodnocuje; chybí druh | A | nadhodnocuje (residual sign reversed); "průměr nula, v pořádku" (overall mean taken as per-group mean); "nejdelší lístky" (residual confused with response size; virginica is longest) |
| `soucet-nebo-ctverce` | druhá přímka, menší součet čtverců | D | "součet residuí je nula" (plain sum as the criterion); "obě stejně" (mixed signs taken as equally good); "nelze bez koeficientů" (thinks the residuals are not enough) |

Checked numbers (fresh R session): intercept 1,084 cm, slope 2,230 cm/cm; mean residual by species setosa −0,17, versicolor +0,22, virginica −0,05 cm. Q3 teaching residuals: first line sum 0, sum of squares 1,00 cm²; second line sum 0,2 cm, sum of squares 0,10 cm². The evidence calls the lines "první" and "druhá" so that they cannot be confused with the answer letters or with the L03 candidate lines A, B and C.

## Knowledge-state ledger

| Item | Available before quiz? | Evidence in L03 |
|---|---|---|
| Slope as average difference per unit, rescaled to another difference | yes | learning materials and slides on slope interpretation; Moodle family `sklon-rozdil` |
| Residual = measured − fitted; positive = underestimation | yes | slides and learning materials on residuals |
| Residual plot coloured by species reveals a missing predictor | yes | slide `Stejná residua, ale s druhem` (`rezidua_podle_druhu.png`) |
| Residuals are squared because plain sums cancel; the better line has the smaller sum of squares | yes | slides `Jak porovnat celé přímky?`, `Čtverce residuí čtyř květů`, `Která přímka je nejlepší podle těchto dat?` |

## Evidence

| Asset | Source | SHA-256 |
|---|---|---|
| `l03-coef-listky.png` | rendered by `R/render_pollslive_assets.R` (printed `coef()` output) | `ab706c47351121c6287f619bf530fece376b448d84ccf5e10292d1bc6a17d1bb` |
| `l03-rezidua-podle-druhu.png` | byte-identical copy of L03 `Presentation/Materials/rezidua_podle_druhu.png` | `e7b17466d25cd40e6daeeee6a49d96a5300e6622a0b0b7f847c4aef8c2818474` |
| `l03-dve-primky-residua.png` | rendered by `R/render_pollslive_assets.R` (teaching residuals) | `8d89bb98674a75ea16294df284377bc7e5b0e357b0be4fc611cd45404c853559` |

The previous assets `l03-formula-roles.png`, `l03-slope-estimate.png` and `l03-residual-example.png` are removed. `R/verify_pollslive_assets.R` pins the new checksums.

## Answer key and course balance

L04 key: C A D (three distinct positions).

| Lesson | Correct positions (Q1-Q3) | Status |
|---|---|---|
| L02 | B C A | locked, taught |
| L03 | A D C | locked, taught |
| L04 | C A D | this revision |
| L05 | B D A | approved revision |
| L06 | A B D | approved revision |
| L07 | D B C | approved revision |
| L08 | C A B | approved revision |
| L09 | — | reworked separately |
| L10 | D C B | approved revision |

Across these 24 four-option questions A, B, C and D are each correct six times. At each question number every position is correct exactly twice. The reworked L09 quiz should fit around this balance.

## Validation

- `node pollslive/validate.mjs`: passed without credentials.
- `Rscript R/verify_pollslive_assets.R`: passed.
- Offline render: see the review section.

## Review

Independent read-only review: pending.

## Operational boundary

No staging, commits, pushes, live PollsLive operations, response submissions or activation changes were made. The poll for L04 must be synchronized from a pushed revision before 2026-10-26, and its `_internal` activation entry approved separately.
