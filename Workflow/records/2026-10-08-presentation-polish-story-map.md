# L04 presentation polishing story map

## Scope and approval record

- Artifact: complete `Presentation/presentation.qmd`, including the PollsLive retrieval block.
- Date: 2026-10-08.
- Branch: `polish/l04-before-teaching`; base: `0202e5a`.
- Initial requested work: resolve findings A1–A11 and B12–B24 in [the review](2026-10-08-polish-review.md), with the human decisions recorded there. The title image (B13) was postponed at this stage; the later author-requested image amendment below supersedes that decision and is part of the final approved scope.
- Story-map status: complete.
- Heading-strip audit completed: [x].
- Knowledge-state audit completed: [x].
- Human story-map approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-08.
- Decision and requested revisions: explicit user decision „approve both“ (2026-10-08), given after the SE revision; recorded separately for each map; no further revisions requested.
- This map is separate from the learning-material map and needs its own approval. It is derived from the revised written backbone.

## Complete physical story map

Each row is one physical slide. H1 rows are minimal section dividers. Fragment states do not count as extra slides.

| Order | Internal role | Level | Student-facing heading | Speaker note |
|---|---|---|---|---|
| 1 | Arrival screen | H2 | O kolik déle čekáme po delší erupci — a jak jistě to víme? | Question-first title, course mark, L04, formal title „Od odhadu k nejistotě“, materials link. Illustration added later by Ondřej Mottl. |
| 2 | Biological visual hook | H2 | Gejzír Old Faithful v číslech | Retain NPS photo with credit and the data panel; counts from the object, NPS ranges cited. `fig-alt`. |
| 3 | Retrieval title | H2 | Co si pamatujete z minulé lekce? | Unchanged generated include, after the hook and before outcomes. |
| 4 | Retrieval Q1 | H2 | Ve vzorci delka_listku ~ sirka_listku je která proměnná odezvou? | Unchanged. |
| 5 | Retrieval Q2 | H2 | Sklon modelu je přibližně 2,23 cm/cm. Která interpretace je správná? | Question text unchanged; options and explanation updated to comparison wording (see below). Asset unchanged. |
| 6 | Retrieval Q3 | H2 | Jaké je residuum tohoto květu, když residuum počítáme jako naměřená minus odhadnutá délka? | Unchanged; still matches polished L03 flower 4. |
| 7 | Learning contract | H2 | Výsledky učení | Shared four-item list, incremental, restrained highlights. „Po absolvování této přednášky budete schopni:“. |
| 8 | Section divider | H1 | Dají jiné erupce stejnou přímku? | Familiar line, open question; no new term. |
| 9 | Data entry | H2 | Každý řádek je jedna erupce | Visible `read.csv()`, `as.Date()`, `duration / 60`, `nrow()` and missing-value check, with output. Same code as the learning materials. |
| 10 | Whole-data encounter | H2 | Delší erupce, delší čekání? | Plain scatter (`vsechna_pozorovani.png`, now used) with a short noticing prompt: direction, clusters, scatter. |
| 11 | Fitted line from these data | H2 | Přímka z tohoto léta | Same scatter with the fitted line and computed slope; fragment strip: same data and formula always give the same estimates. |
| 12 | Commitment | H2 | Dostali bychom příště stejnou přímku? | Partner prompt: other people, other days — same points, same slope? No „Když nehlasujeme“; facilitation in notes. No answer on the slide. |
| 13 | One subset | H2 | Pepa pozoroval pouze červen | Figure, fragment interpretation in comparison wording. |
| 14 | Prediction | H2 | Co čekáte od Mařenky a Karla? | Discussion panel; preparation chunk moves to row 15. |
| 15 | Evidence reveal | H2 | Stejný postup, tři různé výsledky | Three panels; fragment caveat that months mix chance and real change. |
| 16 | Naming | H2 | Odhad není oddělený od dat | What stayed the same / what changed panels; fragment names *výběr* and *výběrová variabilita*. The AI-observer image slide is removed (it answered row 12 early); the file stays in Materials for the title-image work. |
| 17 | Section divider | H1 | Sto pozorovatelů, sto sklonů | |
| 18 | Prediction | H2 | Co udělá sto dalších pozorovatelů? | Sketch the expected shape in pairs; inputs 100 and 40 from named objects. One visible line states the simulation plainly: eruption lengths from our summer, waiting times generated from this summer's line (row 11) with departures as large as the residuals. |
| 19 | Linked animation | H2 | Sledujte cestu jednoho sklonu | GIF regenerated from the rebuilt simulation; noticing strip retained. Notes: what changes (40 lengths drawn, new waiting times) and what stays fixed (model, reference line, departure size). |
| 20 | Static continuation | H2 | Po 100 hlášeních | Final frame. |
| 21 | Checkpoint | H2 | Co vidíme — a co ještě nevíme? | Retain two panels; the open question leads to one number for precision. |
| 22 | Section divider | H1 | Jedno číslo pro přesnost | Answers the checkpoint's first open question. |
| 23 | Naming SE from the evidence | H2 | Jak široce se sklony rozptylují? | Histogram of the 100 slopes. Fragments: their SD; then the `Std. Error` that `summary()` reports for one report — about the same number; then the name *standardní chyba (SE)* and one-line definition (typical spread of slope estimates from same-size samples, estimated from one sample). One report's estimate ± 1 SE drawn on the histogram in the shared mapping (estimate purple, SE orange); final fragment: ± 1 SE is not yet an interval (absorbs former „Co ještě neplyne?“). Notes recall L01's SD versus SE. Replaces former „Jedna standardní chyba jako měřítko“, whose 117-eruption bar did not match the histogram. |
| 24 | Output task and reveal | H2 | Najděte velikost a přesnost | Merges former „Kde R ukrývá…“ and „Najděte řádek sklonu“: `summary()` for all eruptions visible from the start beside the pair task; fragments reveal the slope row, `Estimate`, `Std. Error`, units, and why this SE is smaller than one report's (117 versus 40 eruptions). |
| 25 | Classification | H2 | Velikost vztahu, nebo přesnost? | Same four sentences rebuilt with shared brand option classes (no `<style>`, no inline style); instruction at the top; one sentence reworded to comparison wording; answers as fragments. |
| 26 | Section divider | H1 | Jaké sklony jsou s daty slučitelné? | |
| 27 | Construction | H2 | Jak z odhadu a SE vytvořit rozsah? | Prompt first; fragments add margin = critical value × SE and both limits with computed values. Critical value named, not derived. |
| 28 | Software route | H2 | Stejný interval v R | Visible `confint(object = mod_gejzir)` and output; same limits as row 27. |
| 29 | Result and caveat | H2 | 95% interval spolehlivosti | Retain figure with Czech decimals; fragment: interval for the slope, not for one future wait. |
| 30 | Prediction | H2 | Co se stane při vyšší hladině? | Ranking task; one instruction, not two. |
| 31 | Evidence reveal | H2 | Stejný odhad, různě široké intervaly | Retain. |
| 32 | Rule | H2 | Užší neznamená automaticky přesnější | Retain box-rule and fragment; fix colour roles. |
| 33 | Conceptual MCQ | H2 (blank) | — | „Co znamená „95 %“?“ in a question box, three equal `card-question` options, partner prompt; correct option circled only after commitment (L03 pattern). |
| 34 | Rebuilt coverage evidence | H2 | Sto pozorovatelů, sto 95% intervalů | The same 100 simulated reports as rows 18–23, now with each report's own `confint()`. Short text: these are the familiar reports; reference = this summer's slope, known only in this demonstration. Realised count. Seed 900723. |
| 35 | Same draws, 80 % | H2 | Stejných sto pozorovatelů, 80% intervaly | Question first, figure and count as fragment. |
| 36 | Same draws, 50 % | H2 | Stejných sto pozorovatelů, 50% intervaly | As row 35. |
| 37 | MCQ resolution | H2 | 95 % patří k postupu | Answer to row 33, now earned by rows 34–36; one roughnotation at most. |
| 38 | Application | H2 | Statistická redakce: opravte titulek | Retain. |
| 39 | Section divider | H1 | Závěr | |
| 40 | Spine return | H2 | Co už víme o čekání na další erupci? | Opening question verbatim in a question box; left panel answers with computed slope and interval in comparison wording; right panel: how to judge a specific claim about the slope. |
| 41 | Writing task | H2 | Napište jednu vědeckou větu | Retain; evidence card fully computed (no typed „117“). |
| 42 | Model answer | H2 | Jedna možná věta | Comparison wording, Czech decimals. |
| 43 | Caveat | H2 | Co ještě omezuje náš závěr? | Retain. |
| 44 | Earned recap | H2 | Shrnutí | Four bullets mirroring the outcomes. |
| 45 | Closing question | H2 | Co potřebujete vidět, než napíšete „po minutě erupce navíc čekáme o X minut déle“? | X computed. Pair prompt; bridge to the next lesson as a fragment (judging a claim about the slope). Replaces „Je vztah skutečný — a zobecnitelný?“. |

## Physical count

- Baseline: 42 physical slides, including four retrieval slides, no H1 dividers.
- Proposed: 45 physical slides with five H1 dividers (rows 8, 17, 22, 26, 39).
- Removed or merged: ANO/NE opening vote (its question is replaced by the spine question and row 12), „Od jedné přímky k její nejistotě“, „Lineární model“ (replaced by rows 10–11), the AI-observer image slide, „Kde R ukrývá velikost a přesnost?“ (merged into 24), „Jedna standardní chyba jako měřítko“ and „Co ještě neplyne?“ (replaced by 23), „Jak široký rozsah je slučitelný s daty?“ (replaced by 27), „Vraťme se k hlavní otázce“ (now 40), „Je vztah skutečný — a zobecnitelný?“ (now 45).
- Added: five dividers, data entry (9), plain scatter (10), SE naming from the evidence (23), construction (27), `confint()` (28).
- One simulation for the whole deck: the reports of rows 18–21 feed the SE comparison (23) and the coverage panels (34–36). Probe with the current data and seed 900723: SD of 100 slopes 1,09; typical report SE 1,09; full-data SE 0,66.
- Reordered: the MCQ (33) now precedes the coverage simulation; its answer (37) follows the evidence.

## Retrieval quiz Q2 (exact proposed wording)

Question text unchanged. Option IDs unchanged.

- `prumerna-zmena` (correct): „Dva květy, jejichž šířky se liší o 1 cm, se podle modelu liší v délce v průměru asi o 2,23 cm.“
- `presna-zmena`: „Každý lístek, který je o 1 cm širší, je přesně o 2,23 cm delší.“
- `intercept`: „Intercept modelu je 2,23 cm.“ (unchanged)
- `bez-jednotek`: „Sklon nemá jednotky.“ (unchanged)
- Explanation: „Sklon udává, o kolik se v průměru liší odhadnutá délka dvou květů, jejichž šířky se liší o 1 cm (cm délky na cm šířky).“

Committing and pushing `quiz.json` and the live synchronization before 2026-10-26 each need separate authorization.

## Chronological knowledge-state ledger

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Opening / 1–7 | L01–L03; retrieval uses only L03 content | Spine question; outcomes | *Výběr*, SE, interval | Photo, data panel, retrieval |
| Data and line / 8–11 | `read.csv()`, scatterplots, `lm()` | One eruption per row; this summer's line and slope; determinism of `lm()` | That another summer gives the same slope | Code with output; plain then fitted scatter |
| Variability / 12–16 | One fitted line | Different observations → different slopes; *výběr*, *výběrová variabilita* | SE, intervals | Commitment, Pepa, three months, what changed |
| Repetition / 17–21 | Sampling variability; this summer's line; residuals (L03) | Simulated reports with generated waits; distribution of 100 slopes | That simulated waits are observed data; known population slope in real research | Prediction sketch with explicit simulation statement, GIF, static frame, checkpoint |
| SE / 22–25 | L01 SD; histogram of slopes; `summary()` exists | SE as the typical spread of slope estimates, estimated from one sample; reading it in the output; more eruptions → smaller SE; size versus precision; ± 1 SE is not an interval | t, p-value | SD of slopes beside one report's SE; output with task; classification |
| Interval / 26–32 | Estimate and SE | Critical value (named), margin, limits, `confint()`, level → width | t-distribution theory, coverage meaning | Construction, R output, interval figures, rule |
| Coverage / 33–38 | Intervals at several levels | Level as long-run success of a procedure | Population truth in real research | MCQ commitment, rebuilt same-draw simulations, resolution, rewriting task |
| Ending / 39–45 | Whole lesson | Answer to the spine question with limits; recall; transfer | Hypothesis testing | Spine return, writing task, caveat, summary, closing question |

## Implementation and review contract

- Same shared rules as the learning-material map: `format_cz()`/`format_cz_math()`, one colour mapping (data grey, estimate and interval purple, SE and uncertainty orange, coverage reference orange as the interpretive focus), comparison wording, seed 900723, named teaching inputs, no hand-typed computed values.
- Delete the `<style>` block and all inline `style=`; use existing `_brand` classes, or stop and propose a reusable `_brand` addition. No `Když nehlasujeme`; facilitation cues in `{.notes}`.
- Object locality: every chunk after the heading of its first-use slide; `vytvorit_plot_sto_intervalu()` moves to `R/Functions/`. `fig-alt` on every figure; unwrap visible copy.
- Order: implement after the written backbone, clean-session run of visible chunks, offline canonical render, separate read-only vision review including all fragment states, full PDF inspection, then human review.
- Author audit: heading strip reads as a content narrative; no sequencing words in visible copy; *výběr* first in row 16; SE named and explained in row 23 before it is read in the full output (24); critical value in row 27; coverage meaning in rows 34–37.

## Author-requested amendment: generated illustrations (2026-10-08)

Ondřej Mottl generated the four proposed illustrations and a title illustration (provenance and prompts in `Presentation/Materials/GENERATED_IMAGES.md`) and asked for them to be incorporated („Please incorporate and re-render“). This supersedes the earlier postponement of the title image. Headings, order, slide count (45) and the knowledge-state ledger are unchanged.

| Order | Change |
|---|---|
| 1 | Title slide uses `.course-title-illustrated` with `geyser_titulni_ilustrace.png`, visible AI caption and a speaker note. |
| 14 | Team photo of Pepa, Mařenka and Karel beside the discussion panel; clipboards show dots only, so the prediction stays open. |
| 18 | GeyserWatch crowd illustration in the right column; the sketch prompt moved into the left column and the simulation panel was shortened. |
| 37 | Ring-toss illustration beside the answer panels, after the MCQ and the coverage evidence; speaker note links the stake to the true slope and the ring to the interval. |
| 43 | Night-eruption illustration beside the limitation text. |

## Author-requested amendment: marked answers on main-part questions (2026-10-08)

Ondřej Mottl: „the questions during the main part are not marked with roughnotation“. Following the L02/L03 pattern (correct option circled in orange on a click after partner discussion; at most one roughnotation per slide):

| Order | Change |
|---|---|
| 12 | The open yes/no prompt becomes a question card with options A) přesně stejný, B) podobný, ale ne stejný, C) úplně jiný sklon (matching the learning-material Úvod prediction); B is circled after discussion. Rows 13–16 then show the answer in data. |
| 30 | The ranking prompt becomes a question card with options A) užší, B) širší; B is circled after discussion; the ranking task stays as the partner instruction. |
| 33 | Option C is circled after commitment (as in L03). This deliberately supersedes the reviewer-driven move of the circle to row 37; rows 34–36 now explain why C is right, and row 37 keeps the answer panel without a second circle. |

Ledger note: rows 12 and 33 now reveal their answers on the question slide after commitment, before the supporting evidence. Slide count (45), headings and order are unchanged. Roughnotation does not render in the static decktape PDF (shared `_brand` export path, as in L02/L03).

## Human decision

Approved by Ondřej Mottl on 2026-10-08 („approve both“), recorded separately for this map and its ledger. Final artifact and the recorded author amendments approved on 2026-10-08 („Ok I approve the changes (!)“). The initial map remains the historical baseline; the recorded amendments define the final image placements and answer-reveal states.
