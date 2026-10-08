# Výuková data L04

## Erupce gejzíru Old Faithful

`old_faithful_2024.csv` obsahuje 117 erupcí gejzíru Old Faithful v Yellowstonském národním parku z června, července a srpna 2024 (39 v každém měsíci). Jeden řádek představuje jednu erupci a čekání na erupci následující.

| Sloupec | Význam |
|---|---|
| `eruption_id` | identifikátor erupce v GeyserTimes |
| `geyser` | název gejzíru |
| `date` | datum erupce (místní čas America/Denver) |
| `time` | čas erupce ve tvaru HHMM |
| `cekani_min` | čekání do následující erupce v minutách |
| `webcam` | zda erupci zachytila webkamera (`Yes`/`No`) |
| `duration` | délka erupce v sekundách |

Výukové materiály převádějí `duration` na minuty jako `delka_erupce_min`.

### Původ

- Pozorování zaznamenali dobrovolníci v databázi [GeyserTimes](https://geysertimes.org/); zdrojem je oficiální archiv <https://geysertimes.org/archive/geysers/Old_Faithful_eruptions.tsv.gz>.
- Podobný výběr z roku 2024 publikuje balíček ModernDive jako `old_faithful_2024` (114 řádků): <https://moderndive.github.io/moderndive/reference/old_faithful_2024.html>.
- Rozsah délek erupcí a čekání uvádí National Park Service: <https://www.nps.gov/places/old-faithful-geyser.htm>.

### Příprava

Postup je zapsán v kódu výukových materiálů (`Learning_materials/skripta.qmd`, rozbalovací blok „Doplňující: jak vznikl soubor old_faithful_2024.csv“): pouze přesně zaznamenané hlavní erupce, čekání jako rozdíl časů dvou po sobě jdoucích erupcí, ponechány intervaly 50–127 minut, odstraněna tři předem prověřená odlehlá pozorování (`1461337`, `1468130`, `1471579`) a kontrola počtu 117 řádků.

### Podmínky opětovného použití

Podmínky užití archivu GeyserTimes nebyly ověřeny: web při automatickém přístupu vyžaduje ověření v prohlížeči a dokumentace ModernDive licenci neuvádí. Před dalším veřejným vydáním je ověřte. Převzatá data se neřídí licencí původního výukového textu v kořenovém `LICENSE.md`.
