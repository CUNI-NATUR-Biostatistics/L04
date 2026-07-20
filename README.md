# _L-template – Šablona repozitáře přednášky

Šablona (GitHub Template Repository) pro týdenní repozitáře kurzu
**Biostatistika (MB120P163)**. Při vytváření nového týdenního repozitáře
`L01` až `L12` použijte na GitHubu tlačítko **Use this template**.

Repozitář je výchozí kostra pro tři propojené výstupy:

- Quarto RevealJS prezentaci v `Presentation/`
- podkladová skripta v `Learning_materials/`
- pomocné R skripty pro renderování, téma a sdílené funkce v `R/`

## Doporučený pracovní prostor

Tento repozitář je určený pro práci v multi-root workspace `CUNI-NATUR-Biostatistics`. Sdílený kontext kurzu a kanonické instrukce pro AI asistenty spravuje soukromý repozitář `_internal`; doporučené nastavení je popsané v `_internal/workspace-setup.md`. Při samostatném otevření tohoto repozitáře nemusí mít AI asistent k dispozici úplný kontext kurzu.

---

## Struktura repozitáře

```text
_L-template/
├── theme/                          # Zdroje vizuálního tématu – editujte zde
│   ├── colors.json                 # Paleta barev a sémantická přiřazení
│   ├── fonts.json                  # Písma pro HTML, RevealJS, Typst a R grafy
│   ├── custom_theme.json           # Další vzhledové parametry
│   ├── _colors.scss                # ← generováno z colors.json
│   ├── fonts-include.html          # ← generováno z fonts.json
│   ├── presentation_theme.scss     # ← generováno z JSON konfigurace
│   └── skripta_theme.scss          # ← generováno z JSON konfigurace
├── Presentation/                   # Zdroj prezentace v Quarto RevealJS
│   ├── presentation.qmd            # Hlavní zdrojový soubor prezentace
│   ├── presentation.html           # HTML výstup prezentace
│   ├── presentation_raw.pdf        # PDF export přes decktape
│   ├── presentation.pdf            # Komprimovaný PDF pro distribuci
│   └── Materials/                  # Obrázky a další podklady ke snímkům
├── Learning_materials/             # Podkladová čtenářská skripta
│   ├── skripta.qmd                 # Hlavní zdrojový soubor skript
│   ├── skripta.html                # HTML výstup
│   ├── skripta_raw.pdf             # PDF výstup přes Typst
│   ├── skripta.pdf                 # Komprimovaný PDF pro distribuci
│   ├── skripta_theme.typ           # ← generováno z JSON konfigurace
│   └── images/                     # Obrázky použité ve skriptech
├── Exercises/
│   └── cviceni.R                   # Starter skript pro praktické cvičení
├── data/                           # Datové soubory specifické pro tento týden
├── R/
│   ├── render_all.R                # Regeneruje téma a renderuje vše
│   ├── render_presentation.R       # Renderuje prezentaci a kopíruje ji do docs/
│   ├── render_skripta.R            # Renderuje skripta a komprimuje PDF
│   ├── generate_theme.R            # Generuje všechny theme artefakty z JSON
│   ├── set_r_theme.R               # ← generováno: ggplot2 paleta a theme_biostat()
│   └── Functions/
│       ├── render_glossary_term.R  # Lokální fallback pro tooltipové pojmy
│       └── Theme_generation/       # Pomocné funkce pro generování tématu
├── docs/
│   └── index.html                  # Prezentace pro GitHub Pages
├── Temp/
│   └── .gitkeep                    # Místo pro dočasné debug skripty (gitignore)
├── renv.lock                       # Zámek závislostí (renv)
├── .Rprofile                       # Aktivuje renv při otevření projektu
└── README.md
```

Poznámka: `presentation.qmd` i `skripta.qmd` načítají aktivní theme soubory
ze složky `theme/` přes cesty `../theme/...`. Generované soubory proto
neupravujte ručně.

---

## Jak začít s novým týdnem

1. Vytvořte nový repozitář z této šablony a pojmenujte ho podle týdne,
   například `L01`.
2. Přejmenujte `_L-template.Rproj` na odpovídající název, například
   `L01.Rproj`.
3. Otevřete projekt v RStudiu nebo VS Code a obnovte závislosti příkazem
   `renv::restore()`.
  Lokální pracovní soubory RStudia, Quarto cache a dočasné debug soubory se
  necommitují díky `.gitignore`.
4. Doplňte obsah do `Presentation/presentation.qmd`,
   `Learning_materials/skripta.qmd` a případně `Exercises/cviceni.R`.
  Při návrhu nové lekce postupujte podle kanonického workflow v
  `_internal/.ai/authoring/lesson-workflow.md`:
  nejdřív výstupy z učení a dataset, potom podrobná skripta, teprve pak
  prezentace.
5. Přidejte datové soubory do `data/` a obrázky pro skripta výhradně do
   `Learning_materials/images/`.
  Krátké reprodukční debug skripty ukládejte do `Temp/` podle
  `_internal/.ai/core/debugging.md`.
6. Spusťte renderovací pipeline a commitněte aktualizované výstupy.

### Praktické šablony pro jednotlivé stage

Šablona obsahuje hotové vyplňovací soubory pro jednotlivé fáze tvorby lekce v adresáři `Workflow/templates/`:

- `stage-0-scope.md`
- `stage-1-dataset.md`
- `stage-2-learning-materials.md`
- `stage-4-slides.md`
- `stage-5-review-release.md`

Pro průběžné sledování rozhodnutí a změn používejte:

- `Workflow/STAGE_LOG.md` (chronologický log stage přechodů)
- `Workflow/records/` (vyplněné kopie šablon s datem v názvu souboru)

Doporučený mini-postup:

1. Zkopírujte příslušnou šablonu do `Workflow/records/`.
2. Vyplňte rozhodnutí, rizika a checklisty.
3. Přidejte řádek do `Workflow/STAGE_LOG.md`.
4. Odkaz na vyplněný záznam vložte do PR popisu.

### Stage-by-stage workflow (recommended for every week)

Use the same production lifecycle in every weekly repository so content quality is reviewable and stable before release.

1. Stage 0 - Scope lock
  - map weekly learning outcomes
  - define 2-4 concrete student actions
  - write out-of-scope items for this week
2. Stage 1 - Dataset decision
  - compare 2-3 candidates
  - choose one dataset with explicit rationale
  - define response and key predictor(s)
3. Stage 2A - Structural draft of Learning materials
  - coherent section order
  - first visual/table
  - first interpretation prompt
4. Stage 2B - Development pass of Learning materials
  - strengthen visual anchors and explanatory transitions
  - ensure written materials are usable for self-study
5. Stage 3 - Human review gate for Learning materials
  - revise written materials before serious slide production
6. Stage 4 - Slide storyboard and build
  - per concept block: prompt -> evidence -> interpretation -> bridge
  - keep slides text-light and staged
  - generate figures locally near the slide block that uses them
7. Stage 5 - Human review gate for Presentation
  - check pacing, interaction cadence, and alignment with written materials
8. Stage 6 - Render and release readiness
  - render final outputs and verify release artefacts

Practical team cadence: prefer several small reviewable updates over one large final batch.

### Doporučený vizuální workflow pro `Presentation/presentation.qmd`

Aby byla prezentace konzistentní s aktivním učením a vizuálním rytmem kurzu, použijte jako výchozí postup:

1. Navrhněte krátký storyboard pro každý hlavní blok (prompt -> evidence -> interpretace -> most).
2. Udržujte slidy textově úsporné; vertikální rozestupy (např. `<br>`) používejte záměrně pro krokové odhalování obsahu.
3. Používejte fragments / incremental odhalování místo jednorázového zobrazení celého závěru.
4. Grafy vytvářejte lokálně u příslušného bloku slidů (v blízkém hidden chunku), ne v jednom velkém globálním bloku na začátku souboru.
5. Po každém klíčovém grafu přidejte okamžitou interpretaci (na stejném nebo následujícím slidu): co vidíme a co z toho zatím neplyne.

---

## Systém vizuálního tématu

Barvy, písma a další stylové volby se udržují v jediném místě: v JSON
souborech ve složce `theme/`. Kanonický zdroj je veřejný repozitář
[`_brand`](https://github.com/CUNI-NATUR-Biostatistics/_brand). Script
`R/generate_theme.R` při renderu:

- stáhne aktuální JSON konfiguraci z repozitáře `_brand`,
- při výpadku internetu ponechá lokální cache,
- stáhne pomocné R funkce pro generování tématu,
- znovu vygeneruje všechny theme artefakty pro HTML, RevealJS, Typst a R.

### Zdrojové soubory

| Soubor | Co řídí |
| --- | --- |
| `theme/colors.json` | Barvy a jejich sémantické role |
| `theme/fonts.json` | Písma, velikosti a typografické volby |
| `theme/custom_theme.json` | Okraje, bloky kódu, tabulky, stíny a další detaily |

### Generované soubory

| Soubor | Účel |
| --- | --- |
| `theme/_colors.scss` | Sdílené SCSS proměnné |
| `theme/fonts-include.html` | Načtení webových písem pro HTML výstupy |
| `theme/presentation_theme.scss` | RevealJS téma prezentace |
| `theme/skripta_theme.scss` | HTML téma skript |
| `Learning_materials/skripta_theme.typ` | Typst styl pro PDF |
| `R/set_r_theme.R` | ggplot2 paleta a funkce `theme_biostat()` |

Pokud změníte JSON konfiguraci a nechcete spouštět celý render, lze theme
artefakty regenerovat samostatně:

```r
source("R/generate_theme.R")
```

`render_all.R` tento krok provádí automaticky před renderem prezentace i
skript.

### Písma v PDF

HTML výstupy mohou používat Google Fonts, ale Typst pracuje jen s lokálně
nainstalovanými písmy. Pokud má PDF používat konkrétní písmo, musí být
dostupné v systému a správně nastavené v `theme/fonts.json`.

---

## Slovníček pojmů ve skriptech

`Learning_materials/skripta.qmd` je připravené pro napojení na centrální
slovník v repozitáři [`slovnik`](https://github.com/CUNI-NATUR-Biostatistics/slovnik).

Renderovací setup dělá tři věci:

- stáhne aktuální `pojmy.yaml` z `slovnik` do dočasného lokálního souboru,
- nastaví `glossary::glossary_path()` na tuto lokální kopii,
- pokusí se načíst `render_glossary_term.R` z GitHubu a při neúspěchu
  použije lokální fallback v `R/Functions/render_glossary_term.R`.

V textu skript používejte pro první výskyt pojmu v dané sekci tuto podobu:

```markdown
`r render_glossary_term("median", display = "medián")`
```

Tento wrapper vrací v HTML tooltip s definicí a v typst/PDF pouze čistý
text. Díky tomu stejné `.qmd` funguje pro oba výstupy bez ručních úprav.

HTML tooltip styly a potlačení klikání na odkazy jsou řešeny v samostatném
chunku `nastaveni-slovnik`, aby se CSS a JavaScript vložily jen do HTML
výstupu.

---

## Workflow renderování

Nejjednodušší je spustit celý pipeline najednou:

```r
source("R/render_all.R")
```

Nebo jednotlivé části samostatně:

```r
source("R/render_presentation.R")
source("R/render_skripta.R")
```

`render_all.R` provede:

1. regeneraci všech theme souborů z `theme/*.json`,
2. render prezentace,
3. render skript.

`render_presentation.R` provede:

1. Quarto render `Presentation/presentation.qmd` → `Presentation/presentation.html`,
2. kopii HTML do `docs/index.html` pro GitHub Pages,
3. export PDF přes `decktape` → `Presentation/presentation_raw.pdf`,
4. kompresi PDF → `Presentation/presentation.pdf`.

`render_skripta.R` provede:

1. Quarto render `Learning_materials/skripta.qmd` →
   `Learning_materials/skripta.html` a `Learning_materials/skripta_raw.pdf`,
2. kompresi PDF → `Learning_materials/skripta.pdf`.

### Předpoklady

- Quarto musí být nainstalované a dostupné v systému.
- PDF export prezentace vyžaduje samostatně nainstalovaný
  [decktape](https://github.com/astefanutti/decktape).
- Komprese PDF používá balíček `qpdf` v R.
- Doporučené spuštění je uvnitř projektu s aktivním `renv`.

---

## Distribuce materiálů studentům

Studenti k repozitáři přímo nepřistupují. Distribuují se jen vyrenderované
výstupy, typicky přes Moodle.

Interní release používá tag bez přípony `-moodle`, například:

```text
L01-v0.1.0-20260318
```

Moodle release používá tag s příponou `-moodle`, například:

```text
L01-v0.1.0-20260318-moodle
```

Před vydáním by měly být v repozitáři aktuální alespoň tyto soubory:

- `Presentation/presentation.html`
- `Presentation/presentation.pdf`
- `Learning_materials/skripta.html`
- `Learning_materials/skripta.pdf`

Podrobnosti viz `_internal/obecne/nove/strategie_releases.md`.

---

## Důležité poznámky

### Standardní zázemí R projektu

Šablona už obsahuje základní součásti běžného R projektu:

- `.Rprofile` pro automatickou aktivaci `renv`
- `renv.lock` a `renv/` pro reprodukovatelné závislosti
- `.gitignore` pro lokální R / RStudio / Quarto artefakty
- `Temp/` pro jednorázové debug skripty, které nemají skončit v git historii

### Typst a cesty k obrázkům

Typst při renderování PDF sandboxuje přístup k souborům. Obrázky používané
ve `skripta.qmd` proto musí být uložené uvnitř `Learning_materials/` nebo
jeho podsložek. Cesty typu `../Presentation/Materials/...` mohou při
renderu selhat.

```r
# Správně:
knitr::include_graphics(
  here::here("Learning_materials", "images", "obrazek.png")
)

# Špatně – přeruší Typst render:
knitr::include_graphics(
  here::here("Presentation", "Materials", "obrazek.png")
)
```

### UTF-8 a editace souborů

Při editaci `.qmd` souborů používejte pouze běžné file-edit nástroje
(VS Code, RStudio). PowerShell 5.1 může tiše poškodit diakritiku nebo
přidat UTF-8 BOM, který znemožní parsování YAML.
