# Publikování materiálů na web kurzu

Soubor `website-release.yml` je explicitní seznam souborů, které smí být zveřejněny na studentském webu. Nic, co v tomto manifestu není uvedeno, release workflow do webového balíčku nepřidá.

Release vzniká tagem ve formátu `L04-vMAJOR.MINOR.PATCH-YYYYMMDD[-moodle]`. Workflow ověří manifest a existenci souborů, vytvoří neměnný webový balíček, publikuje GitHub Pages lekce a pošle hlavnímu HUBu požadavek na aktualizaci. Renderování musí proběhnout lokálně před vytvořením tagu; workflow zdrojové QMD znovu nespouští.

Veřejné Pages cesty mají tvar:

- `/L04/preview/` jako náhled posledních commitnutých HTML souborů z `main`
- `/L04/releases/<tag>/learning/index.html`
- `/L04/releases/<tag>/presentation/index.html`
- `/L04/current/` jako alias nejnovějšího release nejvyššího akademického roku

Preview workflow se spouští po změně manifestu nebo commitnutých HTML souborů na `main`. Nevytváří release ani neaktualizuje hlavní studentský HUB.

HUB je kanonický veřejný vstup pro studenty a odkazuje pouze na stabilní vydání. Moodle zůstává pro testy, odevzdávání, individuální výsledky, neveřejná zadání a oznámení pro zapsané studenty. Přípona `-moodle` pouze přidává ZIP; nemění veřejnost ani stabilitu vydání.

Před prvním vydáním zkontrolujte také celý repozitář, nejen manifest. Pokud má HUB nabízet odkaz na zdrojový repozitář, musí být repozitář veřejný a jeho strom i historie nesmí obsahovat osobní údaje, neveřejné hodnocení, přístupové údaje ani interní poznámky. Zahrnuté položky musí mít vyřešenou provenanci a práva k publikování. Licenční podmínky tohoto repozitáře shrnuje `LICENSE.md`; podmínky převzatých položek tím nejsou nahrazeny.

GitHub Pages je potřeba jednou nastavit na **Source: GitHub Actions**. Prostředí `github-pages` musí povolit větev `main` a tagy `L04-v*`.

Pro okamžitou aktualizaci HUBu musí organizace nastavit secrets `HUB_APP_ID` a `HUB_APP_PRIVATE_KEY` pro GitHub App oprávněnou odeslat `repository_dispatch` pouze do repozitáře `CUNI-NATUR-Biostatistics.github.io`. Bez těchto secrets release a lesson Pages proběhnou, ale HUB je nutné obnovit ručně.
