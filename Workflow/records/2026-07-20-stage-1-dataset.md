# Stage 1 - Dataset Research and Revised Shortlist

## Metadata

- Week: L04
- Date: 2026-07-20
- Author: Ondřej Mottl (with Codex)
- Reviewer: Ondřej Mottl

## Git checkpoint

- Stage group: Stage 1 dataset decision, separated after the Stage 0 planning PR was merged
- Branch: `lesson/l04-dataset`
- Base branch and commit: `main` at `75569b0` (`Set up L04 and lock the lesson scope`)
- `git status --short` reviewed: [x]
- Stage 0 record is present through merged PR #1: [x]
- Planning PR: Not opened

## Correction to the first search

The initial Stage 1 pass compared only three locally convenient datasets (`iris`, Palmer Penguins, and `trees`). That was too narrow to support a dataset decision. In particular, availability in the current R environment is not a sufficient reason to reuse `iris` when regression confidence intervals are already taught in many established courses.

This revised search starts from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`, traces the hub's most relevant sources to their actual regression or confidence-interval examples, and adds other established university teaching examples. The previous `iris` recommendation is withdrawn. Following human review, Old Faithful 2024 is locked below as the L04 dataset.

## What the teaching literature suggests

Across the sources, the most useful design is not merely “run `confint(lm(...))`.” The recurring conceptual sequence is:

1. distinguish a population quantity from an estimate based on one sample;
2. show that another sample gives another estimate;
3. make the sampling distribution visible;
4. name its spread as the standard error;
5. show many intervals, including the minority that miss the target;
6. only then interpret the interval from the observed study.

The strongest precedents are:

- [ModernDive, Chapter 10](https://moderndive.com/v2/inference-for-regression.html) uses 114 Old Faithful eruptions specifically to connect sample-dependent regression slopes, bootstrap distributions, and confidence intervals.
- [PH525x Biomedical Data Science](https://genomicsclass.github.io/book/pages/confidence_intervals.html) uses a known mouse-phenotype reference population, repeated random samples, and 250 intervals to make coverage visible. Its example concerns a mean rather than a regression slope, but its visual logic transfers directly.
- [BioCEED's simple linear regression tutorial](https://bioceed.uib.no/dropfolder/WebJS/Statistics_Basic_1.html) uses published High-Arctic butterfly data to connect a biologically meaningful slope, standard error, and confidence interval.
- [Modern Statistics with R](https://modernstatisticswithr.com/regression.html) explicitly recommends coefficient confidence intervals over reporting standard errors alone and demonstrates `confint()` and bootstrap inference.
- [Penn State STAT 501](https://online.stat.psu.edu/stat501/Lesson02) uses slope intervals and explicitly examines how sample size, residual variation, and predictor spread affect interval width.

This supports a hybrid lesson design: one real, interpretable regression supplies the scientific question, while a transparent repeated-sampling or model-based scaffold makes long-run interval behaviour visible. The scaffold should explain the real analysis, not replace it.

## Broad candidate scan

The scan below includes genuine dataset candidates and instructive examples that should not become the main L04 dataset. “Reject” means reject for this lesson, not that the dataset or tutorial is generally poor.

| Tutorial or dataset | Why it entered the scan | Main limitation for L04 | Screen result |
|---|---|---|---|
| ModernDive `old_faithful_2024`: waiting time to next eruption versus eruption duration | Built expressly for inference about a regression slope; 114 documented observations; two intuitive quantitative variables; no package-specific method is needed after import | Natural science rather than biology; volunteer observations are not literally a random sample; possible temporal dependence needs an explicit limitation | **Selected for L04** |
| BioCEED / Bowden et al. High-Arctic butterflies: annual mean female wing length versus May-June temperature | Published ecological data; slope has immediate units (mm per °C); BioCEED already teaches its estimate, SE, and CI | Tutorial reduces nearly 4,500 individual records to only 17 annual means; temporal dependence and aggregation matter; the simple analysis is not the full published model | **Shortlist: domain leader** |
| PH525x / `UsingR::father.son`: son's height versus father's height | 1,078 pairs; long-established regression example in biomedical teaching; large pool makes repeated subsampling easy | Historical Galton/Pearson and eugenics context must be confronted; paternal-only framing is scientifically dated; imperial units | **Shortlist: sampling backup** |
| PH525x mouse phenotype population | Best observed example of repeated intervals and 95% coverage in a life-science context | The worked parameter is a mean or difference in means, not a regression slope | Borrow the coverage visual, not the main dataset |
| UCLA capuchin body weight example | Official R regression tutorial ends by relating sample-to-sample variability to coefficient uncertainty | Dataset is simulated, so it cannot carry the real scientific story | Borrow the known-population scaffold only |
| CUNY North Carolina births: birth weight versus pregnancy length | Biological/health context; course asks students to interpret a slope CI in words | Gestational age and birth weight are not well represented by one unrestricted line; prematurity and other structure are central; sensitive context | Reject |
| Penn State FEV versus age | Biomedical, intuitive units, and frequently used to introduce regression | Residual spread increases strongly with age and development; the simple model invites assumption problems before L04 can address them | Reject |
| Penn State skin-cancer mortality versus latitude | A canonical slope-CI example with interpretable units and moderate sample size | Historical state-level data restricted to white males; ecological confounding and sensitive outcome dominate the lesson | Reject |
| ModernDive UN fertility versus life expectancy | Contemporary, documented, and used in an inference-for-regression chapter | The 183 countries are effectively the population of UN states, not a random sample; strong confounding and possible curvature | Reject |
| Modern Statistics with R `mtcars`: fuel use versus horsepower | Clear `lm()` and `confint()` implementation precedent | Not biostatistics; dated units and vehicle context add no disciplinary value | Reject |
| BioCEED marine mammal dive depth versus body mass | Biological variables and an explicit coefficient CI | Cross-species taxonomic structure masks different relationships; body mass spans orders of magnitude and suggests transformation | Reject |
| `datasets::trees`: volume versus trunk diameter | Small, complete, built into R | Documentation itself motivates transformation and adding height, anticipating later lessons | Reject |
| Palmer Penguins: body mass versus flipper length | Engaging morphology and enough observations for subsampling | Species, sex, year, and repeated-individual structure are scientifically important; filtering cannot remove all of the hidden structure cleanly | Retain only as a possible practical transfer |
| `datasets::iris`: petal length versus petal width | Maximum continuity with L03 | The pooled line is strongly shaped by the intentionally balanced three-species mixture; reusing it would sacrifice novelty without solving the population problem | Previous front-runner withdrawn |

Sources for the less central examples include the [UCLA introduction to regression](https://stats.oarc.ucla.edu/wp-content/uploads/2024/02/Intro-to-regression.html), [CUNY regression lab](https://www.math.csi.cuny.edu/~maher/teaching/2019/spring/stats/labs/lab12/index.html), and [Penn State STAT 501 lessons](https://online.stat.psu.edu/stat501/Lesson01). The butterfly observations and their provenance are archived in [Dryad](https://datadryad.org/dataset/doi:10.5061/dryad.43gt3).

## Shortlist comparison

| Criterion | Old Faithful 2024 | High-Arctic butterflies | Father-son heights |
|---|---|---|---|
| Learning-outcome fit | Excellent: already supports slope variability, SE, bootstrap CI, and comparison of sample sizes | High: estimate and imprecision are both scientifically meaningful | High: large reference pool makes repeated samples and coverage easy to stage |
| Biology relevance | Moderate: natural system, but not biological | Excellent: climate ecology and morphology | High superficially, but the historical framing needs substantial care |
| Interpretability | Excellent after expressing the slope per 10 seconds of eruption | Excellent: change in mean wing length per 1 °C | Easy units, but heredity interpretation is easily overstated |
| Stepwise buildability | Excellent: one row is one eruption; a simple line is defensible | Moderate: students must accept hidden filtering and aggregation to annual means | Excellent computationally |
| Practical feasibility | Excellent: 114 complete observations, small file, documented source | Good: source is an Excel workbook with nearly 4,500 rows and requires preparation | Excellent after vendoring two columns |
| Scientific complication | Volunteer sampling and possible serial dependence | Time series, aggregation, sex/species filtering, mismatch with full published analysis | Eugenics history, nonrepresentative historical sample, paternal-only model |
| Overall role | **Locked main dataset** | Strong alternative or later transfer example | Backup only |

## Numerical feasibility probes

These are internal checks, not proposed student-facing output.

### Old Faithful 2024

- Model: `waiting ~ duration`, 114 observations.
- Estimated slope: 0.371 minutes of additional waiting per additional second of eruption; equivalently 3.71 minutes per 10 seconds.
- 95% coefficient interval: 0.307 to 0.435 minutes per second.
- Fitted R²: 0.539; maximum Cook's distance: 0.093.
- Across 2,000 fixed-seed subsamples from the observed data, the 5th to 95th percentile of fitted slopes narrowed from 0.247-0.471 at `n = 20`, to 0.298-0.438 at `n = 40`, to 0.338-0.405 at `n = 80`.

This produces visible, orderly changes in precision without requiring a transformation, subgroup, or second predictor.

### High-Arctic butterflies

- BioCEED's simplified analysis uses 17 annual observations after filtering females and averaging within year.
- Model: annual mean wing length versus mean May-June temperature.
- Estimated slope: -0.105 mm per °C; SE 0.0945; 95% interval approximately -0.307 to 0.096; fitted R² 0.077.
- The interval communicates genuine imprecision, but the tiny year-level sample and time structure make it a less clean vehicle for first principles.

### Father-son heights

- Model: son's height versus father's height, 1,078 pairs.
- Estimated slope: 0.514 inches per inch; 95% interval 0.461 to 0.567; fitted R² 0.251; maximum Cook's distance 0.019.
- The numerics are unusually clean for repeated subsampling, but scientific and historical interpretation would consume lesson time that should be spent on uncertainty.

The local probes used fixed seed `1204`. No downloaded research file or probe script is intended for the repository.

## Dataset decision - locked

- Name/source: `old_faithful_2024`, assembled for ModernDive from volunteer observations recorded by [GeyserTimes](https://geysertimes.org/) in 2024.
- Response: waiting time to the next eruption, in minutes.
- Predictor: duration of the current eruption, expressed in tens of seconds for an easier slope interpretation.
- Scientific question: How much longer do we expect to wait after an eruption that lasts 10 seconds longer, and how precisely can this sample estimate that relationship?
- Why it was selected: It is the only candidate found that was deliberately built into a complete regression-inference teaching sequence and also survives the L04 content filter. The two-variable model is defensible, the coefficient is concrete, repeated samples behave visibly, and no categorical predictor, transformation, or later-course method is needed.
- Required limitation: The data were recorded by volunteers over selected dates and should not be described as a literal simple random sample of every Old Faithful eruption. The lesson must distinguish the observed study sample, any bootstrap or model-based teaching scaffold, and the wider process about which an inference is being made.

### Visual direction

Old Faithful also offers a strong visual identity for the lesson. Use a small number of purposeful geyser photographs rather than decorative repetition:

- an eruption photograph for the opening scientific question;
- a before/during eruption pairing when introducing duration and waiting time;
- optionally, an image of observers or the webcam to connect the measurements to how the data were collected.

Prefer the [Yellowstone National Park photo galleries](https://www.nps.gov/yell/learn/photosmultimedia/photogallery.htm) and [NPS Old Faithful material](https://www.nps.gov/places/old-faithful-geyser.htm). The NPS gallery includes public-domain collections, but copyright status can vary by item. Before adding any image, verify its detail page, retain the photographer or NPS credit, and add the attribution to the figure caption or slide footer. Do not use the NPS arrowhead mark as decoration.

## Planned lesson use

1. Begin with one observed eruption and the practical question of predicting the wait after it.
2. Fit the familiar one-predictor line and interpret the slope per 10 seconds.
3. Ask whether another set of eruptions would give exactly the same slope.
4. Show several samples, then many fitted slopes; introduce the standard error as the spread of estimates.
5. Use a clearly labelled model-based simulation or finite-reference-pool demonstration to show repeated 95% intervals and occasional misses. Do not pretend that the true Old Faithful slope is known.
6. Return to the real 114-eruption dataset and interpret its estimate and 95% coefficient interval as effect size plus precision.
7. Leave “does the interval exclude zero?” and formal testing for L05.

## Resolved decision and remaining design questions

1. Resolved: The pedagogical cleanliness and visual potential of Old Faithful justify using a natural-science main story in this biostatistics lesson.
2. Remaining for lesson design: Should the butterfly example appear briefly at the end as a biological transfer, or be reserved for the practical where students integrate the idea independently?
3. Remaining for lesson design: Use a small, explicitly labelled model-based coverage simulation only if the real dataset remains the scientific anchor and the distinction between simulation and observation is unmistakable.

## Decision

- [x] Dataset locked for implementation
- [x] Inspiration hub traced to concrete teaching examples
- [x] Broad tutorial and dataset scan completed
- [x] Three finalists compared
- [x] Local numerical probes completed for the leading candidates
- [x] Diff contains only the Stage 1 record and stage-log update
- [x] Stage 1 decision approved by the human reviewer
- [x] Stage 1 PR ready to prepare
- Notes: The original three-dataset search and `iris` recommendation have been superseded. Old Faithful 2024 is locked as the L04 dataset. No lesson source, permanent dataset file, image asset, or rendered output has been created.
