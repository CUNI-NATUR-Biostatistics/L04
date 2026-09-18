# L04 PollsLive retrieval quiz: integration map and exact questions

- Date: 2026-09-16
- Branch: `lesson/l04-presentation-standards`
- Workstream: focused post-presentation standards retrofit

Integration-map status: approved.

Exact-question status: approved.

Human approval: approved by the human author in this session on 2026-09-16, without requested revisions.

## Scope and integration map

The retrieval block replaces only `Co už umíme z předchozí lekce?`. It appears before `Výsledky učení` and before the existing full-data/model callback. The standard sequence is participation, aggregate results, three native question-and-explanation slides, the learning outcomes, and `Od jedné přímky k její nejistotě`.

| Position | Teaching move | Student knowledge used | Bridge |
|---|---|---|---|
| Q1 | Map formula roles | L03 `lm()` grammar | One fitted model answers a directed question. |
| Q2 | Interpret slope with units | L03 coefficient interpretation | One slope is an estimate from one dataset. |
| Q3 | Calculate a residual | L03 observed minus fitted rule | Different samples produce different residuals and slopes. |

## Exact production questions

### Q1 — formula roles

**Evidence:** a faithful code card with `delka_listku ~ sirka_listku` from approved L03.

**Question:** Ve vzorci `delka_listku ~ sirka_listku` je která proměnná odezvou?

1. `delka_listku` — **correct**
2. `sirka_listku`
3. Obě jsou prediktory
4. Vzorec role proměnných neurčuje

**Explanation:** Proměnná vlevo od `~` je odezva; proměnná vpravo je prediktor.

### Q2 — interpret slope

**Evidence:** approved L03 fitted model and its slope estimate, generated directly from `mod_listky`.

**Question:** Sklon modelu je přibližně 2,23 cm/cm. Která interpretace je správná?

1. Při zvýšení šířky korunního lístku o 1 cm model odhaduje průměrné zvýšení délky asi o 2,23 cm. — **correct**
2. Každý jednotlivý lístek se prodlouží přesně o 2,23 cm.
3. Intercept modelu je 2,23 cm.
4. Sklon nemá jednotky.

**Explanation:** Sklon udává odhadovanou průměrnou změnu odezvy na jednotku prediktoru, zde cm délky na cm šířky.

### Q3 — calculate a residual

**Evidence:** approved L03 example with measured length 6,0 cm and fitted length 6,6 cm.

**Question:** Jaké je residuum tohoto květu, když residuum počítáme jako naměřená minus odhadnutá délka?

1. −0,6 cm — **correct**
2. +0,6 cm
3. 6,6 cm
4. 12,6 cm

**Explanation:** `6,0 − 6,6 = −0,6 cm`. Záporné residuum znamená, že měření leží pod modelovým odhadem.

## Knowledge-state ledger

| Item | Available before quiz? | Evidence |
|---|---|---|
| Response and predictor roles in an R formula | yes | L03 `lm()` grammar |
| Slope meaning and units | yes | L03 coefficient block |
| Fitted value and residual | yes | L03 progressive worked example |
| Sampling variability, standard error, confidence interval | no | introduced in L04 |

## Evidence and accessibility

Code/output cards are rendered reproducibly from the approved L03 model; the residual graphic reuses `reziduum_s_popisky.png` with its source-derived values. All assets are checksum-pinned, have Czech alt text and provenance, and appear identically in PollsLive and the native fallback.

## Implementation and validation

- `pollslive/quiz.json` uses schema version 2 and contains the three approved questions.
- The standard include is placed after the opening question and before the learning outcomes; the approved bridge follows the outcomes.
- `node pollslive/validate.mjs` passes without credentials.
- All R chunks parse; checked source files are UTF-8 without BOM or replacement characters; no duplicate chunk labels were found.
- Offline PollsLive rendering completed through the canonical presentation wrapper. The final PDF has 42 pages, and `Presentation/presentation.html` is byte-identical to `docs/index.html`.
- The generated `active.qmd`, `offline.qmd`, and `static.qmd` each contain all three questions and no development URL or placeholder.
- Focused PDF inspection covered the quiz fallback and the bridge.

### Final evidence checksums (SHA-256)

- `pollslive/assets/l03-formula-roles.png`: `2E4E9CA4C29724C4188677170002F1404121E7A05CE2FF8824C3539380CAED71`
- `pollslive/assets/l03-slope-estimate.png`: `C19C44167E995FD79016A0338EF7C631EEFC7553474EA400BA3B130BF7A2EDDC`
- `pollslive/assets/l03-residual-example.png`: `776C7693FB13DC0120217C118C8C0B18B88C58E9443534D14B4BAC6DBA73FBAC`

## Independent review

The first read-only review found answer-revealing evidence in L03 Q1 and L04 Q1/Q2, literal Markdown markers in fallback text, and incomplete workflow evidence. The evidence cards and quiz text were corrected and rerendered. The focused read-only re-review passed with no content or rendering blockers. It confirmed neutral L03 Q1 evidence, non-revealing L04 Q1/Q2 cards, clean fallback text, matching evidence hashes, approved include positions and bridges, and valid final PDFs.

## Operational limitations

Remote PollsLive synchronization, remote setting verification, QR/link testing on a second device, and schedule activation require an immutable pushed lesson commit and therefore remain pending. No remote poll operation was performed and no production response was submitted. Activation remains disabled.

## 2026-09-18 author feedback revision

The existing PollsLive include now appears after the opening question and before `Výsledky učení`; quiz content and evidence remain unchanged.

Validation: canonical offline render produced a 42-page PDF with retrieval on page 4 and outcomes on page 8; HTML matches `docs/index.html`. The local `_internal` client was used because the pinned cache is absent.
