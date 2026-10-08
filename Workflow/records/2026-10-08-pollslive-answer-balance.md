# L04 PollsLive answer-position balance

- Date: 2026-10-08
- Approver: Ondrej Mottl (human author)
- Decision: implement the human request to rebalance L03 onward; L01 and L02 are locked.
- Requested revision: avoid quizzes with all answers in the same position and reduce the excess of A answers.
- Scope: permute existing option objects and add a credential-free validator check against three identical correct-answer positions.

## Approved teaching scope

The existing retrieval integration map, quiz placement, question order, knowledge-state ledger, correct option IDs, explanations, evidence, alt text, and provenance are preserved. This is a focused ordering correction to approved questions, not a new authoring stage. Earlier workflow records retain the historical order; this addendum and pollslive/quiz.json define the current option order.
The wording edits already present in the working tree were retained exactly; this change adds no question or explanation wording revisions.

## Answer key and current option order

| Question ID | Before | After | A option ID | B option ID | C option ID | D option ID |
|---|---|---|---|---|---|---|
| odezva-ve-vzorci | A | D | sirka-listku | obe-prediktory | role-neurceny | delka-listku |
| interpretace-sklonu | A | C | presna-zmena | intercept | prumerna-zmena | bez-jednotek |
| vypocet-residua | A | B | plus-0-6 | minus-0-6 | 6-6 | 12-6 |


## Cross-lesson balance

| Lesson | Correct positions (Q1-Q3) |
|---|---|
| L01 (locked, onboarding) | BBA |
| L02 (locked) | BCA |
| L03 | ADC |
| L04 | DCB |
| L05 | CDA |
| L06 | BAC |
| L07 | CBD |
| L08 | DAB |
| L09 | ABD |

Across the 24 four-option retrieval questions in L02-L09, A, B, C, and D are each correct six times (25%). At each question number separately, every position is correct twice. L03-L09 alone has A=5, B=5, C=5, D=6, the closest possible balance across 21 questions. Every L03-L09 quiz has three distinct answer positions.

## Validation

- The lesson validator and canonical definition validation pass without credentials.
- Isolated negative checks reject AAA, BBB, CCC, and DDD for this lesson.
- Before/after semantic comparison confirms that only option order changed; all option labels and IDs are preserved.
- The canonical payload builder retains the new option order.
- Canonical offline and static quiz includes contain the new option order and unchanged correct answers and explanations; both quiz blocks render to standalone RevealJS HTML in an isolated temporary directory, with all three evidence images verified as embedded image data URLs.
- Evidence hashes, configuration, and asset sources match their pre-change bytes. The presentation source and outputs changed concurrently after the initial hash check; this quiz task does not write those files and preserves the concurrent work. UTF-8 has no BOM or replacement characters.
- Independent read-only review: passed on 2026-10-08 by the separate quiz_order_review subagent using the canonical vision-corrector prompt. Final source, answer positions, evidence lettering, and all 14 isolated HTML variants were checked; no findings remain. Full production deck rendering and whole-deck visual review were not repeated.

## Operational boundary

No Git state changes, live PollsLive operations, response submissions, or activation changes were performed. Full lesson HTML/PDF and ignored generated includes have not been refreshed by this task. Changed quiz definitions require an immutable pushed revision, guarded synchronization, and matching activation checksum approval before live use. L06 needs no teaching-content synchronization because its definition is unchanged.
