# Stage 6: release L04-v0.5.0-20261008

- Requester: Ondrej Mottl, 2026-10-08.
- Authorization: "Go one by one and make new Release" for L03-L08; "rerun manually workflows if needed" for successful HUB acceptance. L09 is excluded.
- Target: `L04-v0.5.0-20261008` at merged main commit `aecca2b48b7785cdede90f5768a4fa9eee969362`.
- No new teaching source edits, commits, branch pushes, PollsLive synchronization, or activation are included in this release operation.

## Pre-publication validation

- Local main is clean for tracked files and matches GitHub main. Packaging uses exact Git bytes from `git -c core.autocrlf=false archive`; no working-copy line-ending conversion enters the bundle.
- The canonical shared Ruby packager validates website-release.yml, including lesson, academic year, file existence and the public allowlist.
- ZIP integrity, exact 9-resource allowlist, source byte identity, sizes and SHA-256 hashes pass; public source/data encoding and credential-marker checks pass.
- The bundle includes the approved exercise and license. Existing complete-exercise independent review, clean-session/reference-harness evidence, and human approval are recorded in the lesson exercise workflow records; unchanged exercises were not retested merely for this release.
- Committed PDFs: 30 learning-material pages and 45 presentation pages. Presentation HTML equals docs/index.html by bytes.
- Retrieval key: `DCB`. Credential-free lesson validator passes. The latest source/render independent-review evidence remains applicable.
- Repository is public. Pages uses Actions. The github-pages environment permits main and the intended lesson tags.
- Evidence directory: `C:\Users\ondre\AppData\Local\Temp\biostat-releases-5f1a5e3f\L04`. Prepared ZIP SHA-256: `c53945c96724bf99837cb94111a05348c94112c78180acdecfdcedd305c25a67`.

## Title and provenance gate

- The lesson-derived title illustration is present in the committed HTML and PDF. Its PDF title preview was inspected; provenance, reference assets, alt text and AI disclosure are recorded in the lesson workflow/materials records.

- GeyserTimes terms verified on 2026-10-08: https://docs.geysertimes.org/legal/terms, A1.07-A1.08. The database is under ODbL 1.0 and individual contents under DbCL 1.0. GeyserTimes contributors/GeyserTimes attribution and license links are included in the prepared public release notes.
- The committed data README retains the historical statement that the terms had not yet been verified. The release notes and this record document the subsequent verification; the exact-main bundle is not silently altered.

## Publication and live verification

- Published stable release: https://github.com/CUNI-NATUR-Biostatistics/L04/releases/tag/L04-v0.5.0-20261008. Downloaded public ZIP manifest, allowlist, all resource sizes/hashes, and resolved tag commit match the prepared exact-main bundle.
- Independently verified 18 live resource hashes across stable and immutable routes:
  - https://cuni-natur-biostatistics.github.io/L04/current/
  - https://cuni-natur-biostatistics.github.io/L04/releases/L04-v0.5.0-20261008/
- HUB at https://cuni-natur-biostatistics.github.io/materialy.html independently shows `L04-v0.5.0-20261008` and 9 stable resource links. No lesson preview route is presented as stable.
- Release workflow: https://github.com/CUNI-NATUR-Biostatistics/L04/actions/runs/37787861078; success: release, Pages, and automatic HUB notification passed.
- HUB workflow: https://github.com/CUNI-NATUR-Biostatistics/CUNI-NATUR-Biostatistics.github.io/actions/runs/37788036863; success.

## Remaining limits

- Offline quiz rendering does not prove live PollsLive synchronization, scheduled opening or activation. Those operations are separate and were not performed.
- Existing pedagogical/layout limitations remain in the latest lesson review records; publication does not erase them.
- The shared tag-triggered stale Pages defect remains an infrastructure follow-up if encountered. Recovery uses a fresh supported workflow, not repeated reruns of a contaminated artifact run.
- This local Stage 6 record is excluded from the public allowlist and remains uncommitted for the repository owner.
