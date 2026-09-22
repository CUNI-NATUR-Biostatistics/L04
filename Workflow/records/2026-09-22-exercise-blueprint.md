# L04 exercise blueprint

## Status and teaching boundary

- Date: 2026-09-22
- Source: approved L04 written lesson and presentation, _internal/osnova_lekci.md, and L03 practical
- Branch: lesson/l04-exercises, based on clean main after presentation work merged
- Human exercise approval: Ondřej Mottl, 2026-09-22, explicit approval in the course-author conversation; no requested revisions

The worksheet introduces an RStudio Project because this is the first practical to load a separate local data file. The core targets 67 minutes of direct work, including project setup, within a 90-minute facilitated practical. The presentation's repeated-sampling demonstration remains conceptual context, not a student computation.

## Outcomes, prerequisites, starting states, and timing

| Segment | Purpose and approved outcome | Starting state | Direct work |
| --- | --- | --- | ---: |
| Preparation | Create and reopen a project; obtain and place script and CSV; understand project-relative paths. | RStudio, browser, public release links. | 12 min |
| L04-U01 | Check data, units, observational unit, and variable roles. | Open project; CSV in data; runnable data_gejzir. | 6 min |
| L04-U02 | Fit the model independently, then visualize observations and the fitted line; interpret slope. | data_gejzir, generic commented lm() form; L03 lm(), plot(), and abline(). | 9 min |
| L04-U03 | Inspect residual-versus-fitted graph and residual histogram; distinguish pattern from distribution. | Student-created mod_gejzir; L03 fitted() and resid(); familiar base-R hist(). | 10 min |
| L04-U04 | Use predict() for a point estimate at an in-range 4-minute eruption. | mod_gejzir; new one-row data.frame. | 7 min |
| L04-U05 | Separate slope estimate from standard error and name units. | mod_gejzir; approved L04 output-reading teaching. | 6 min |
| L04-U06 | Obtain and interpret a 95% confidence interval for the slope. | mod_gejzir; approved L04 interval teaching. | 7 min |
| L04-U07 | Combine question, graph, diagnostics, prediction, estimate, uncertainty, and limitations. | Results of U01-U06. | 10 min |

Total direct work: 67 minutes. Approximately 23 minutes remain for explanation, discussion, and slower groups. Teachers may skip the L03 refresher when students already use lm(), plot(), abline(), fitted(), and resid() comfortably. The project/file setup is permanent for local CSV work.

## Data, objects, facilitation, and optional work

- The approved data/old_faithful_2024.csv is a prepared selection of 117 GeyserTimes observations from June-August 2024, 39 per month. One row represents a recorded eruption and waiting time to the next. Source duration is seconds; cekani_min is minutes.
- The script and CSV belong in the student's L04_praktikum project. read.csv(file = "data/old_faithful_2024.csv") is project-relative; file.exists() explains a missing file without changing working directories. The core uses no package beyond base R.
- A 4-minute eruption is inside the observed duration range. predict() returns a point estimate of about 99.25 minutes. The slope confidence interval is not a prediction interval for one future waiting time.
- Full-data slope: about 13.34 minutes of waiting per minute of eruption; standard error: about 0.66; 95% confidence interval: about 12.03-14.64. Residual review should discuss scatter and visible departures without claiming the model assumptions have been proven.
- Facilitation can connect U02's scatterplot to U03's residual graph, ask for a prediction before U04, and compare U05's two columns before U06. These teacher cues stay here rather than in the public script.
- L04-N01 extends the June/July/August comparison while stating that temporal change and selection of observations cannot be separated by this comparison. L04-N02 compares 80% and 95% slope intervals from the same model. L04-N03 uses optional broom::tidy(mod_gejzir, conf.int = TRUE) to gather the slope estimate, SE, and interval in one row. Missing broom must not prevent the core or sourcing the script.
- Formal tests, p-values, prediction-interval calculation, repeated random sampling, and new modelling families remain outside L04 practical scope. The data are observational; causal claims are not supported.
### Optional task details

| Task | Purpose | Prerequisites and exact starting state | Estimated direct work |
| --- | --- | --- | ---: |
| L04-N01 | Compare slopes for three months while distinguishing data-selection differences from possible temporal change. | Runnable data_gejzir and data_cerven; U02 lm() skill; month extraction example immediately above the task. Students create all three monthly models. | 14 min |
| L04-N02 | Compare interval widths at two confidence levels without changing data or the fitted model. | Student-created mod_gejzir; U06 confint() skill. | 6 min |
| L04-N03 | Extract estimate, standard error, and interval into one tidy row, or make the conceptual comparison if broom is unavailable. | Student-created mod_gejzir; U05 and U06 outputs; optional installed broom package. | 8 min |

The optional bank now has 15 tasks and about 117 minutes of potential practice. N04-N12 may be selected independently after the core; N13-N15 form one ordered transfer route. No student is expected to finish the entire bank in the 90-minute practical. Tasks target different actions rather than repeated identical syntax.

| Task | Purpose | Prerequisites and exact starting state | Estimated direct work |
| --- | --- | --- | ---: |
| L04-N04 | Check monthly coverage in the prepared CSV. | Runnable data_gejzir and date column; earlier substr() example. | 4 min |
| L04-N05 | Refit with seconds as predictor and interpret unit conversion. | Runnable data_gejzir with duration; U02 model-fitting skill; student-created mod_gejzir for comparison. | 9 min |
| L04-N06 | Locate a point prediction on the raw-data/model plot. | data_gejzir; student-created mod_gejzir; U02 plotting and U04 prediction. | 7 min |
| L04-N07 | Use one newdata table for three point predictions and connect differences to slope. | Student-created mod_gejzir; U04 predict() skill. | 6 min |
| L04-N08 | Reconstruct one observed-minus-fitted residual. | data_gejzir, student-created mod_gejzir; L03 fitted()/resid(). | 5 min |
| L04-N09 | Locate the largest absolute residual and interpret one unusual observation. | data_gejzir, student-created mod_gejzir; U03 residual graph. | 8 min |
| L04-N10 | Read residuals against the predictor and compare with U03. | data_gejzir, student-created mod_gejzir; U03 plot. | 7 min |
| L04-N11 | Extract estimate and SE programmatically from an existing model summary. | Student-created mod_gejzir; U05 Coefficients table and bracket indexing. | 7 min |
| L04-N12 | Correct three plausible but unsupported scientific claims. | U03 diagnostics, U04 point prediction, U06 slope CI, observational data context. | 6 min |
| L04-N13 | Transfer data check, graph, and independent fit to the built-in faithful data. | Runnable data_faithful prepared immediately before N13; U01-U02 methods. | 12 min |
| L04-N14 | Diagnose and predict from the student-created faithful model. | N13 student-created mod_faithful; U03-U04 methods. | 9 min |
| L04-N15 | Report estimate, SE, and slope CI for faithful and compare datasets. | N13 student-created mod_faithful; U05-U06 methods. | 9 min |
## Review and release gates

Parse the distributed R file, check UTF-8, run it from a clean R session in a temporary project with the CSV in data, solve every core and optional task in an untracked reference harness, verify numeric results and saved Czech-labelled plots, and rehearse the GUI/file path. Check hints, task IDs, privacy/provenance, prohibited commands, and realistic timing. Then assign the complete worksheet and blueprint to a separate read-only reviewer using _internal/.ai/agents/exercise-reviewer.md, resolve findings, and record the human exercise approval. The next public release must include the exercise in website-release.yml; the stable code URL cannot work until that release. Git publishing retains separate authorization.

## Validation and independent review

- The distributed script parsed and ran from a clean R session in a temporary project with the CSV under data/. The same test without the CSV stopped with the intended Czech recovery message. The local R command shell initially used an invalid C.UTF-8 locale; validation explicitly selected an available Czech UTF-8 locale. No locale workaround appears in student code.
- An ignored reference harness solved all seven core and fifteen optional tasks after the expanded bank and reviewer correction. It verified 117 rows, 39 per month, slope 13.33503, SE 0.65745, 95% interval 12.03274-14.63731, 80% interval 12.48760-14.18246, and predict() at four minutes 99.25230. It also checked unit conversion, multiple predictions, first and largest residuals, and the faithful transfer results (272 rows; slope 10.72964, SE 0.31475, 95% interval 10.10996-11.34932; four-minute prediction 76.39296). broom extraction was available and agreed with summary() and confint().
- Seven reference plots were saved and visually checked: raw observations plus model line, fitted-versus-residual graph, residual histogram, predicted point on the line, residuals versus predictor, and faithful model and residual graphs. Czech accents and units rendered correctly. A focused U03 check confirmed that hist() counted all 117 residuals across its bins.
- The stable data URL returned HTTP 200. Its CSV matched the repository data after newline normalization and produced the same model results. The planned stable code URL currently returns HTTP 404 because the current release excludes the placeholder exercise; verify it after the next authorized release.
- Posit's RStudio documentation confirms the File > New Project > New Directory > New Project route and that a project establishes a working directory. A real beginner GUI pacing trial remains to be done; the 67-minute core is an author estimate.
- Separate read-only exercise reviewer reported No findings after reading the full worksheet, blueprint, approved L04 materials, weekly outcomes, and L03 practical. The reviewer independently checked the principal model values and judged the earlier 63-minute core timing plausible. After that review, U02 changed to require students to fit the model from a generic commented template; its budget increased to 9 minutes. A focused re-review found the revised U02 and dependent tasks actionable and the unfilled script runnable. The optional-task starting states and timing were then added to this blueprint. The final focused read-only re-review reported No findings.
- The expanded optional bank was checked for stable N01-N15 IDs, complete task fields, UTF-8 without BOM or replacement characters, and prohibited session/package/path patterns. The reviewer-requested named arguments in the visible substr() example were applied; the full reference harness and git diff --check then passed.
- Final independent read-only review of the expanded N01-N15 worksheet and blueprint reported No findings. Beginner RStudio GUI pacing remains untested; the stable code URL will be verified after an authorized release.
- U03 now pairs a residual-versus-fitted plot with a separate histogram, using the L01 hist() skill. The expected result was checked against both plots and revised to distinguish pattern along the fitted axis from residual frequencies. The direct-work estimate is 67 minutes, leaving approximately 23 minutes in the practical. Focused independent re-review found no student-facing issue.
- On 2026-09-22, Ondřej Mottl explicitly approved the complete exercise after the residual histogram and N01-N15 optional bank were added. Approval concerns the student worksheet and does not authorize Git publication or a release.
