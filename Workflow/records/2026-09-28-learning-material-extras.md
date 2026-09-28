# L04 learning-material Extras revision

## Approval and scope

- Date: 2026-09-28
- Branch: `lesson/l04-learning-material-extras`
- Human approver: Ondřej Mottl
- Decision: approved in the course-wide L01-L08 Extra-content review and explicitly authorised for implementation on 2026-09-28.
- Scope: connect uncertainty explicitly to L03 assumptions and distinguish uncertainty in a mean trend from uncertainty for a new observation.

## Mandatory story map

- Artifact: Learning materials amendment
- Story-map status: complete
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: approved
- Approved by: Ondřej Mottl
- Approval date: 2026-09-28
- Approval decision and requested revisions: The course-wide L01-L08 Extra-content map was approved and implementation was explicitly authorised; no revisions were requested. The table below records that approved content in the canonical format without changing its substance.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Validity boundary | Doplňující: co standardní chyba nezahrnuje | After estimating SE, reconnect its interpretation to the L03 model assumptions and study design. |
| 2 | Interval distinction | Doplňující: interval pro průměrný vztah není interval pro další erupci | Extend the existing warning by separating an average relationship from one future observation without teaching the calculation. |

## Knowledge-state ledger

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
|---|---|---|---|---|
| Scope of model SE | Students know SE as repeated-estimate precision and have the L03 assumptions map. | Model SE does not automatically include selection bias, measurement bias, dependence or wrong functional form. | Robust or clustered SE calculations. | Attach to the SE section; hierarchy is L11 and alternative model forms are L10-L12. |
| Mean trend and future observation | Students can interpret a CI for the slope. | Uncertainty around an average trend and scatter of a future individual observation answer different questions. | Computing prediction intervals or prediction validation. | Expand the existing closing sentence; prediction methods remain optional/later. |

## Leakage audit

- Formal hypothesis testing remains excluded from L04.
- The prediction-interval block explains the question and relative width but provides no new formula.

## Review and validation

- Independent amendment review: passed with no findings.
- Glossary coverage: checked for the added prose; no missing first-occurrence wrapper was identified.
- Source checks: UTF-8 without BOM, no replacement characters, `git diff --check` passed.
- Render: project-native HTML and PDF render passed; all 23 PDF pages were inspected through lesson-wide contact sheets and both new Extra pages at readable size. An orphaned Extra header was corrected with a print page break and the final rerender has no clipping, overlap, broken glyphs or orphaned blocks.
