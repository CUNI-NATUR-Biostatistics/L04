# L04 — Od odhadu k nejistotě

**Proměnlivost odhadu a interval spolehlivosti**

Tento repozitář obsahuje čtvrtou lekci kurzu [Biostatistika a plánování ekologických pokusů (MB120P163)](https://cuni-natur-biostatistics.github.io/) vyučovaného na Přírodovědecké fakultě Univerzity Karlovy.

Úplný přehled kurzu, rozvrh, pravidla hodnocení a materiály ostatních lekcí najdete na [veřejném HUBu kurzu](https://cuni-natur-biostatistics.github.io/).

## O této lekci

Kdyby erupce gejzíru Old Faithful pozorovali jiní lidé, získali by stejnou přímku a stejný odhad vztahu? Čtvrtá lekce rozšiřuje lineární model o nejistotu, která vzniká tím, že pracujeme jen s jedním souborem pozorování.

Na datech o erupcích Old Faithful porovnáme odhady získané z různých měsíců a pomocí opakovaného výběru ukážeme jejich přirozenou proměnlivost. Vedle velikosti vztahu začneme sledovat také standardní chybu a 95% interval spolehlivosti.

Cílem není označit odhad za „jistý“ nebo „nejistý“, ale umět oddělit velikost odhadovaného vztahu od jeho přesnosti a obě informace společně vyjádřit v biologicky srozumitelné větě.

## Výsledky učení

Po prostudování této lekce dokážete:

- vysvětlit, proč různé soubory pozorování poskytují různé odhady sklonu;
- v tabulce z `summary()` najít odhad sklonu a jeho standardní chybu;
- rozlišit velikost odhadovaného vztahu od přesnosti tohoto odhadu;
- interpretovat 95% interval spolehlivosti sklonu v kontextu čekání na další erupci;
- zapsat výsledek lineárního modelu jednou věcnou větou obsahující odhad, standardní chybu a interval spolehlivosti.

## Materiály pro studenty

Následující odkazy vedou vždy na nejnovější schválené vydání L04. Rozpracovaná verze ve větvi `main` může být novější, ale není určena jako závazná studijní verze.

| Materiál | Online verze | PDF |
| --- | --- | --- |
| Skripta | [Číst online](https://cuni-natur-biostatistics.github.io/L04/current/learning/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L04/current/learning/skripta.pdf) |
| Prezentace | [Otevřít slidy](https://cuni-natur-biostatistics.github.io/L04/current/presentation/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L04/current/presentation/presentation.pdf) |


- [HUB kurzu](https://cuni-natur-biostatistics.github.io/) je hlavní vstup ke všem veřejným studijním materiálům.
- [Moodle kurzu](https://dl2.cuni.cz/course/view.php?id=106) slouží zapsaným studentům pro oznámení, testy, zadání, odevzdávání a individuální výsledky.

## Pro vyučující a správce

### Zdrojové a vyrenderované soubory

- `Learning_materials/skripta.qmd` je zdroj skript; výsledky jsou `Learning_materials/skripta.html` a `Learning_materials/skripta.pdf`.
- `Presentation/presentation.qmd` je zdroj slidů; výsledky jsou `Presentation/presentation.html` a `Presentation/presentation.pdf`.
- `data/old_faithful_2024.csv` je připravený výukový dataset erupcí Old Faithful.
- `R/` obsahuje podporované renderovací a tematické nástroje.
- `theme/` obsahuje synchronizovanou lokální kopii společné vizuální identity kurzu.

### Reprodukovatelné prostředí

Repozitář používá `renv`. Po klonování otevřete `L04.Rproj` a v čerstvé R relaci spusťte:

```r
renv::restore()
renv::status()
```

Kompletní lokální render spustíte podporovaným wrapperem:

```r
source("R/render_all.R")
```

Samostatně lze použít `R/render_skripta.R` nebo `R/render_presentation.R`. Přímé volání `quarto render` obchází synchronizaci sdíleného tématu a nemá se používat pro release render.

### Publikování

`website-release.yml` je explicitní seznam souborů povolených ve veřejném balíčku. Větev `main` vytváří veřejný náhled, zatímco stabilní tag `L04-vMAJOR.MINOR.PATCH-YYYYMMDD` vytváří neměnné vydání a aktualizuje cestu `/L04/current/`. Podrobný publikační postup je v [`WEBSITE_RELEASES.md`](WEBSITE_RELEASES.md).

Před vydáním je nutné zkontrolovat vyrenderované HTML a PDF, úplnost manifestu, provenanci a podmínky použití dat a médií a nepřítomnost neveřejných informací v celém repozitáři.

## Licence

Původní výukový obsah je licencován pod CC BY 4.0 a software pod licencí MIT. Přesné vymezení, doporučená citace a výjimky pro převzatá data, média, fonty, loga a další položky jsou v [`LICENSE.md`](LICENSE.md).
