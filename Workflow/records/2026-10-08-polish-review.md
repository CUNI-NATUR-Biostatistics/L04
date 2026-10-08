# L04 pre-teaching polish: review and decisions

## Scope

- Requested by Ondřej Mottl on 2026-10-08, after teaching L01 and polishing L02 and L03: full review of the L04 learning materials and presentation against the canonical `.ai/` guidance and the style of L01, L02 and L03.
- Branch: `polish/l04-before-teaching`, created on explicit user authorization from clean `main` at `0202e5a` (`Clarify the scope of uncertainty in L04 learning materials (#11)`). No staging, commits, pushes, pull requests, live PollsLive synchronization or publication.
- References: L01 `main` (`348e384`), polished L02 `main` (`d8321ad`), polished L03 `main` (`2b22ba2`) and their October workflow records.
- The review itself changed no teaching source. Historical July and September approvals remain historical decisions; this polish requires new, separately approved story maps for both artifacts before substantive drafting.

## Findings

The review produced 31 numbered findings in three groups. Group A covers correctness and student confusion in both artifacts; group B covers the presentation; group C covers the learning materials.

### A. Correctness and confusion (both artifacts)

1. Visible code depends on a hidden `readr` object. Tested with `read.csv("data/old_faithful_2024.csv")`: the visible June subset returns 117 all-NA rows because `date` is character; the CSV has no `delka_erupce_min`.
2. `confint()` never appears in visible code, although two outcomes and the practical use it.
3. The 100-interval coverage demonstration (`rnorm()` around the full-data estimate, `qnorm`) is presented as the same GeyserWatch observers; `set.seed(100)` instead of `900723`; a misplaced comment in the written chunk.
4. The deck overlays the 117-eruption SE on the histogram of 40-eruption slopes without explaining why the bar is narrower.
5. The deck's prediction-framed title/spine question is not the question the lesson answers, and differs from the written opening.
6. Intervention wording for the slope; L03 now uses comparison wording.
7. Dot decimals in Czech prose, equations and figures (rendered “12.92 minuty”).
8. Hand-typed “117 erupcí” on the writing-task card; repeated teaching inputs (100, 40, 15) are not named once.
9. Semantic colours for estimate, SE and interval change between figures and artifacts.
10. Spread called `rozptyl`; “konfidenční interval/hladina” offered as synonyms.
11. Retrieval quiz Q2 uses intervention wording that polished L03 replaced.

### B. Presentation

12. No H1 section dividers. 13. No lesson-derived title image. 14. Lesson-specific `<style>` block and inline `style=`. 15. “Když nehlasujeme” fallbacks; no speaker notes. 16. The AI-observer image and takeaway answer the commitment question before the data; *výběr* used before it is introduced. 17. Sequencing/process headings and copy (“Po dnešní přednášce”, “Dnes zjistíme”, “Vraťme se…”, concept-first “Lineární model”). 18. The plain whole-data scatter (`vsechna_pozorovani.png`) is generated but unused; no noticing question before the fitted line. 19. The output-reading task slide has no output. 20. The question of how to build a range from estimate and SE is never answered on a slide. 21. MCQ does not follow the L03 option-card pattern; three roughnotations on the answer slide. 22. Ending lacks `# Závěr`, outcome-mirroring summary and the series closing question. 23. Several chunks sit on the slide before their first use; an inline helper function. 24. One `fig-alt`; hard-wrapped copy; minor typos and colour misuse.

### C. Learning materials

25. No `Úvod` with one question box and A/B/C prediction; opening narrates the lesson plan. 26. No core data check (`read.csv`, `str`, `summary`, missingness); provenance box not collapsed, code outside it, no citation/reuse terms; no `data/README.md`. 27. Workflow narration (“Nejprve…”, “Teprve…”, “Nakonec…”, “Most k následující lekci”). 28. RSS and S_xx skip the collapsed intermediate stage; worked table lacks squared columns; RSE not linked to the `summary()` line. 29. Answers immediately follow noticing questions. 30. Ending lacks the L02/L03 bridge, outcome-mirroring summary and `Závěrečná otázka`; outcomes differ from the deck. 31. Custom glossary CSS/JS instead of `glossary-headings.lua`; hard-wrapped paragraph; no `fig-alt`; glossary pass needed.

### Cross-lesson decisions

| Decision | Pattern |
|---|---|
| Retain | Old Faithful story; Pepa → Mařenka → Karel; GeyserWatch slope-to-histogram animation with static continuation; step-by-step SE and interval calculations; size-versus-precision classification (rebuilt with brand classes); matched 95/80/50 % comparison; “Statistická redakce” task; SE-limits and prediction-interval Extras |
| Adapt | L02/L03 visible CSV entry and core data check; L03 `format_cz()`/`format_cz_math()`, H1 dividers, notes, option cards and series closing question; L02 `Úvod` prediction and collapsed answers |
| Omit with reason | L02 graph gallery and L03 SSE derivation (already taught); L01 onboarding |

## Human decisions (Ondřej Mottl, 2026-10-08)

- A3: rebuild the coverage demonstration. Follow-up after a coverage probe (4,000 repetitions): drawing 40 of the 117 eruptions gives 99/94/68 % coverage at 95/80/50 % (97.6/87/57 % with replacement) because all reports reuse one pool. Decision: **model-generated waits** — each of the 100 GeyserWatch observers keeps their 40 eruption lengths; waiting times are generated from the fitted line plus its residual scatter, so the 117-eruption slope is a known reference for the demonstration (probe: 94.7/78.9/49.3 %; one run of 100 at 95 %: 97).
- A5: new shared spine question, approved: **„O kolik déle čekáme po delší erupci — a jak jistě to víme?“**
- A10: keep only „konfidenční interval“ as a recognised synonym; drop „konfidenční hladina“.
- A11: update the retrieval quiz (Q2 wording). Exact new wording to be approved with the presentation map; push and live synchronization need separate authorization before the lecture on 2026-10-26.
- SE placement (follow-up question, 2026-10-08): only L01 mentions SE, as a forward-looking contrast with SD; L02 and L03 do not discuss it. L04 remains the lesson that explains SE; L01 and L03 already set it up, and L05 onwards reuses it. Within L04, a probe showed that with the current GeyserWatch reports the SD of 100 slopes (0,73) does not match a report's own SE (about 1,15), whereas with model-generated waiting times they agree (1,09 and 1,09). Decision („yes“): one model-generated simulation for the whole lesson (GeyserWatch reports, histogram, SE comparison and coverage panels) and a dedicated block in each artifact that names SE from that evidence, with the L01 SD-versus-SE recall in the learning materials.
- B13: postpone the title image; Ondřej Mottl will build it separately. Not part of this polish.
- The remaining findings received no separate decision. They are carried into the two story maps, so approving a map also approves the findings it implements.

## Proposed shared learning outcomes

Po prostudování / absolvování budete schopni:

- vysvětlit, proč jiný soubor pozorování dává jiný odhad sklonu;
- najít ve výstupu `summary()` odhad sklonu a jeho standardní chybu a rozlišit velikost vztahu od přesnosti odhadu;
- získat 95% interval spolehlivosti funkcí `confint()` a interpretovat ho bez tvrzení, že obsahuje 95 % pozorování nebo dokazuje hypotézu;
- zapsat výsledek jednou větou s odhadem, SE, intervalem a jednotkami.

## Story-map gate (completed)

Story maps: [learning materials](2026-10-08-learning-material-polish-story-map.md) and [presentation](2026-10-08-presentation-polish-story-map.md). Ondřej Mottl explicitly approved both maps and their separate ledgers before drafting on 2026-10-08 („approve both“). He subsequently approved the final changes and recorded amendments on 2026-10-08 („Ok I approve the changes (!)“); see the implementation record for final validation and remaining limitations.
