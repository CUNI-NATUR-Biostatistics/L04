#----------------------------------------------------------#
#
#       L04 — Od odhadu k nejistotě
#                 Praktické cvičení v R
#             Studenti biologie a ekologie
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

#----------------------------------------------------------#
# Příprava -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Jak získat a otevřít soubory -----
#--------------------------------------------------#
# Ke cvičení potřebujete dva soubory: tento skript cviceni.R a datový
# soubor old_faithful_2024.csv. Oba najdete na webu kurzu:
# https://cuni-natur-biostatistics.github.io/L04/current/code/cviceni.R
# https://cuni-natur-biostatistics.github.io/L04/current/data/old_faithful_2024.csv
#
# Jak soubory uložit:
# 1. Vytvořte složku L04_praktikum a v ní podsložku data.
# 2. Soubor cviceni.R uložte do složky L04_praktikum.
# 3. Soubor old_faithful_2024.csv uložte do podsložky data. Jeho jméno
#    neměňte.
# Pokud prohlížeč uloží soubory rovnou do složky Stažené soubory,
# přesuňte je odtud na uvedená místa.
#
# Jak otevřít projekt v RStudiu:
# RStudio Project je obyčejná složka, ve které pracujete. RStudio do ní
# přidá soubor .Rproj, pomocí kterého složku příště snadno znovu otevřete.
# Skript, data i výstupy zůstávají samostatnými soubory uvnitř složky.
# 1. V RStudiu zvolte File > New Project > Existing Directory.
# 2. Vyberte složku L04_praktikum a potvrďte Create Project.
# 3. V panelu Files otevřete cviceni.R.
# 4. Přes File > Save As si uložte vlastní kopii, například
#    cviceni_L04_prijmeni.R.
#
# Výsledná složka vypadá takto:
# L04_praktikum/
# ├── L04_praktikum.Rproj
# ├── cviceni.R
# └── data/
#     └── old_faithful_2024.csv

#--------------------------------------------------#
## Jak se skriptem pracovat -----
#--------------------------------------------------#
# Hlavní úlohy U01–U08 řešte v uvedeném pořadí, protože na sebe navazují.
# Pozdější úlohy používají tabulku data_gejzir z vaší úlohy U01 a model
# mod_gejzir z vaší úlohy U02.
# Úlohy navíc N01–N15 jsou dobrovolné. Slouží k dalšímu procvičování,
# klidně i po praktiku, a nemusíte je stihnout.
#
# Spouštění kódu:
# - Jeden příkaz spustíte tak, že do něj umístíte kurzor a stisknete
#   Ctrl + Enter.
# - Více příkazů najednou označte myší a stiskněte Ctrl + Enter.
# - Výsledky se vypisují v panelu Console, grafy v panelu Plots a vytvořené
#   objekty uvidíte v panelu Environment.
#
# Komentáře a odpovědi:
# - Řádky začínající znakem # jsou komentáře; R je nespouští.
# - Kód pište pod řádek "Vaše řešení". Slovní odpovědi pište jako komentáře.
# - Některé ukázky kódu jsou zakomentované. Zkopírujte je do svého řešení
#   a z každého řádku odstraňte úvodní #. Nejrychleji to uděláte tak, že
#   vložené řádky označíte a zvolíte Code > Comment/Uncomment Lines
#   (Ctrl + Shift + C). Spusťte je až tehdy, když už existují objekty,
#   které používají.
# - Nápovědy čtěte postupně. Druhá nápověda je konkrétnější než první.
# - Kopii skriptu průběžně ukládejte pomocí Ctrl + S.
#
# Když se něco pokazí:
# Pokud objekty v Environmentu neodpovídají skriptu, zvolte Session >
# Restart R. Restart smaže objekty z paměti, ale uložené soubory zůstanou.
# Potom znovu spusťte přípravu a své hotové hlavní úlohy shora dolů.

#--------------------------------------------------#
## Výsledky učení a předpoklady -----
#--------------------------------------------------#
# Po cvičení byste měli umět:
# - vysvětlit, proč jiný soubor pozorování dává jiný odhad sklonu,
# - najít ve výstupu summary() odhad sklonu a jeho standardní chybu
#   a rozlišit velikost vztahu od přesnosti odhadu,
# - získat 95% interval spolehlivosti funkcí confint() a interpretovat ho
#   bez tvrzení, že obsahuje 95 % pozorování nebo dokazuje hypotézu,
# - zapsat výsledek jednou větou s odhadem, standardní chybou, intervalem
#   a jednotkami.
#
# Navazujeme na předchozí lekce: datové rámce, read.csv(), plot(), hist(),
# lm(), coef(), fitted(), resid() a graf residuí. Nové funkce vysvětlujeme
# vždy u úlohy, kde je poprvé potřebujete.
#
# Krátké připomenutí z minulé lekce (pokud ho znáte, přeskočte ho):
# - prediktor patří na vodorovnou osu, odezva na svislou;
# - sklon říká, o kolik se v průměru liší odezva dvou pozorování, jejichž
#   prediktor se liší o jednu jednotku;
# - residuum je naměřená hodnota minus hodnota odhadnutá modelem;
# - nenulová residua sama o sobě neznamenají chybný model.

#--------------------------------------------------#
## Technická kontrola souboru -----
#--------------------------------------------------#
# Následující kód zkontroluje, zda je datový soubor na správném místě.
# Označte ho celý a spusťte Ctrl + Enter. Cesta k souboru začíná ve složce
# otevřeného projektu. Pokud soubor chybí, R se zastaví a vypíše, co máte
# zkontrolovat.
soubor_gejzir <- "data/old_faithful_2024.csv"
if (
  !file.exists(soubor_gejzir)) {
  stop(
    paste0(
      "Soubor data/old_faithful_2024.csv nebyl nalezen. ",
      "Otevřete projekt L04_praktikum a zkontrolujte jméno ",
      "a umístění CSV v podsložce data."
    ),
    call. = FALSE
  )
}
# Data pocházejí z dobrovolnických záznamů erupcí gejzíru Old Faithful
# v Yellowstonském národním parku z června až srpna 2024. Jeden řádek
# tabulky představuje jednu zaznamenanou erupci a čekání na erupci
# následující. Proměnné a jednotky:
# eruption_id ... identifikátor erupce v databázi GeyserTimes;
# geyser      ... název gejzíru;
# date        ... datum erupce ve tvaru RRRR-MM-DD;
# time        ... čas erupce ve tvaru HHMM;
# cekani_min  ... čekání do následující erupce v minutách;
# webcam      ... zda erupci zachytila webkamera (Yes/No);
# duration    ... délka erupce v sekundách.
# Zdroj: GeyserTimes (geysertimes.org). Původ a přípravu tabulky popisují
# výukové materiály k této lekci.

#----------------------------------------------------------#
# Hlavní úlohy -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Co představuje jeden řádek dat? -----
#--------------------------------------------------#
# Tabulku ze souboru CSV načtete funkcí read.csv() jako v minulých
# lekcích; výsledek uložíte do objektu šipkou <-. Dva sloupce upravíte:
# - read.csv() načte datum jako text. as.Date() z něj udělá kalendářní
#   datum, se kterým R umí počítat:
#   data_gejzir$date <- as.Date(x = data_gejzir$date)
# - Délka erupce je v sekundách. Jedna minuta má 60 sekund, takže nový
#   sloupec v minutách vytvoříte dělením:
#   data_gejzir$delka_erupce_min <- data_gejzir$duration / 60
#
# Načtenou tabulku zkontrolujete těmito funkcemi:
# - str() ukáže typ každého sloupce.
# - summary() vypíše minimum, kvartily, průměr a maximum.
# - colSums(x = is.na(x = ...)) spočítá v každém sloupci chybějící
#   hodnoty. is.na() vrací TRUE pro chybějící hodnotu a při sčítání se TRUE
#   počítá jako 1, FALSE jako 0.
# - format(x = data_gejzir$date, format = "%m") vrátí měsíc každého data
#   jako text "06", "07" nebo "08". table() pak spočítá, kolikrát se každý
#   měsíc vyskytuje.

#----------------------------------------#
### Úloha | L04-U01 -----
#----------------------------------------#

# Zadání:
# 1. Načtěte soubor, jehož cesta je uložena v soubor_gejzir, a tabulku
#    uložte jako data_gejzir.
# 2. Převeďte sloupec date na kalendářní datum a vytvořte sloupec
#    delka_erupce_min s délkou erupce v minutách (oba řádky jsou výše).
# 3. Prohlédněte si tabulku pomocí str() a colSums() a zapište do
#    komentáře, zda některá hodnota chybí.
# 4. Pomocí summary() zjistěte rozsah sloupců delka_erupce_min
#    a cekani_min.
# 5. Spočítejte, kolik erupcí připadá na každý měsíc.
# 6. Pro otázku „Souvisí délka erupce s čekáním na další erupci?“ zapište
#    do komentáře prediktor a odezvu.

# Vaše řešení:


# Očekávaný výsledek:
# Tabulka obsahuje 117 erupcí, v červnu, červenci i srpnu po 39. Žádná
# hodnota nechybí. Erupce trvaly 1,65 až 4,83 minuty a čekání 62 až 116
# minut. Prediktorem je délka erupce, odezvou čekání na další erupci.
#
# Nápověda 1:
# Kontrolovat můžete až tabulku, která už existuje v Environmentu. Jeden
# řádek je jedna erupce, takže počet erupcí je počet řádků. Odezva je
# proměnná, kterou chceme vysvětlit.
#
# Nápověda 2:
# Funkci read.csv() zadejte argument file = soubor_gejzir. Oba řádky
# s as.Date() a dělením 60 zkopírujte z textu nad úlohou. summary() stačí
# zavolat na data_gejzir; měsíce spočítáte vnořením format() do table().
#
# Interpretace:
# Co představuje jeden řádek? Proč je užitečné vědět, kolik erupcí pochází
# z každého měsíce?

#--------------------------------------------------#
## Jak data vystihuje jedna přímka? -----
#--------------------------------------------------#
# Obecný tvar modelu z minulé lekce:
#   lm(formula = odezva ~ prediktor, data = tabulka)
# Funkce coef() vrací intercept a sklon modelu. Přímku odhadnutou funkcí
# lm() přidáte do posledního grafu funkcí abline() s argumentem
# reg = jméno_modelu.
#
# Ukázka: bodový graf všech erupcí. Každý bod je jedna erupce.
# Ukázka je zakomentovaná, protože potřebuje data_gejzir z U01.
# plot(
#   x = data_gejzir$delka_erupce_min,
#   y = data_gejzir$cekani_min,
#   xlab = "Délka erupce (min)",
#   ylab = "Čekání na další erupci (min)",
#   pch = 16
# )

#----------------------------------------#
### Úloha | L04-U02 -----
#----------------------------------------#

# Zadání:
# 1. Z data_gejzir fitujte model, ve kterém je odezvou cekani_min
#    a prediktorem delka_erupce_min. Uložte jej jako mod_gejzir.
# 2. Zobrazte jeho koeficienty pomocí coef().
# 3. Zkopírujte graf z ukázky, odstraňte # a přidejte do grafu přímku
#    mod_gejzir.
# 4. Do komentáře popište směr vztahu, rozptýlení bodů kolem přímky
#    a význam sklonu v jednotkách těchto dat.

# Vaše řešení:


# Očekávaný výsledek:
# Rostoucí přímka prochází oblakem 117 bodů, které na ní neleží přesně;
# body tvoří dvě skupiny, krátké a dlouhé erupce. Sklon je asi 13,34 minuty
# čekání na minutu erupce: dvě erupce, jejichž délky se liší o minutu, se
# podle modelu v průměru liší čekáním asi o 13,34 minuty.
#
# Nápověda 1:
# Ve vzorci modelu patří odezva vlevo od ~ a prediktor vpravo. Body
# ukazují jednotlivé erupce, přímka shrnuje jejich průměrný vztah.
#
# Nápověda 2:
# Funkci lm() zadejte argumenty formula a data; odezva cekani_min patří
# vlevo od ~. Přímku přidáte až po vykreslení grafu. Sklon je druhá
# hodnota výstupu coef().
#
# Interpretace:
# Dokazuje tento vztah, že delší erupce delší čekání způsobuje? Proč ne?

#--------------------------------------------------#
## Co přímka nevystihla? -----
#--------------------------------------------------#
# Residuum je naměřené čekání minus čekání odhadnuté přímkou, v minutách.
# Nula znamená, že erupce leží přesně na přímce.
# - resid() vrací residua modelu, fitted() hodnoty odhadnuté modelem.
# - abline(h = 0) přidá do grafu vodorovnou čáru v nule; argument lty = 2
#   ji udělá přerušovanou.
# - hist() nakreslí histogram; popisky os nastavíte argumenty xlab a ylab.

#----------------------------------------#
### Úloha | L04-U03 -----
#----------------------------------------#

# Zadání:
# 1. Nakreslete bodový graf residuí mod_gejzir (osa y) proti hodnotám
#    odhadnutým modelem (osa x). Obě osy popište včetně jednotky minuty.
# 2. Přidejte vodorovnou přerušovanou čáru v nule.
# 3. V samostatném grafu nakreslete histogram residuí. Vodorovná osa
#    ukazuje residuum v minutách, svislá počet erupcí.

# Vaše řešení:


# Očekávaný výsledek:
# Residua leží po obou stranách nuly ve dvou skupinách odhadnutého čekání,
# bez zřetelného oblouku nebo trychtýře. Několik erupcí střední délky leží
# výrazně nad nulou. Histogram ukazuje, že většina residuí je blízko nuly
# a jen několik je vzdálenějších.
#
# Nápověda 1:
# Graf proti odhadnutým hodnotám ukazuje, zda se odchylky od přímky
# systematicky mění podél přímky. Histogram ukazuje, jak často se residua
# různé velikosti vyskytují, ale ne to, u kterých odhadů vznikla.
#
# Nápověda 2:
# Na vodorovnou osu patří fitted(object = mod_gejzir), na svislou
# resid(object = mod_gejzir). V obou grafech nastavte popisky os
# argumenty xlab a ylab, aby obsahovaly jednotku minuty.
#
# Interpretace:
# Vystihuje jedna přímka vztah dobře, ale ne dokonale? Co z těchto grafů
# nepoznáte o tom, jak byly erupce zaznamenány?

#--------------------------------------------------#
## Dostanou tři měsíce stejný sklon? -----
#--------------------------------------------------#
# Představte si tři pozorovatele: Pepu, který sledoval gejzír v červnu,
# Mařenku v červenci a Karla v srpnu. Každý má jen své erupce a fituje
# stejný model.
#
# Řádky jednoho měsíce vyberete hranatými závorkami [řádky, sloupce].
# Podmínka před čárkou vybere řádky, ve kterých je TRUE; prázdné místo za
# čárkou znamená „všechny sloupce“.
# Ukázka: výběr červnových erupcí. Je zakomentovaná, protože potřebuje
# data_gejzir z U01.
# data_cerven <-
#   data_gejzir[
#     format(x = data_gejzir$date, format = "%m") == "06",
#   ]

#----------------------------------------#
### Úloha | L04-U04 -----
#----------------------------------------#

# Zadání:
# 1. Zkopírujte ukázku a vytvořte data_cerven. Stejným způsobem vytvořte
#    data_cervenec (měsíc "07") a data_srpen (měsíc "08").
# 2. Ověřte počet řádků každé tabulky.
# 3. Pro každý měsíc fitujte stejný model jako v U02 a uložte jej jako
#    mod_cerven, mod_cervenec a mod_srpen.
# 4. Porovnejte sklony všech tří modelů se sklonem mod_gejzir.

# Vaše řešení:


# Očekávaný výsledek:
# Každý měsíc má 39 erupcí. Sklony jsou asi 12,92 (červen), 13,99
# (červenec) a 12,88 (srpen) minuty čekání na minutu erupce; model ze
# všech erupcí má sklon asi 13,34. Sklony jsou si podobné, ale ne stejné.
#
# Nápověda 1:
# Odezva, prediktor i vzorec modelu zůstávají stejné. Mění se jen řádky,
# ze kterých model odhadujete.
#
# Nápověda 2:
# V ukázce změňte "06" na "07" a "08" a jméno nového objektu. Na každou
# tabulku použijte nrow(), lm() se vzorcem cekani_min ~ delka_erupce_min
# a coef().
#
# Interpretace:
# Pepa, Mařenka i Karel použili stejný postup. Proč se jejich sklony liší?
# Můžeme ze tří měsíců oddělit náhodu od skutečné změny chování gejzíru?

#--------------------------------------------------#
## Jak velký je vztah a jak přesně jej známe? -----
#--------------------------------------------------#
# Ve výstupu summary() sledujte v tabulce Coefficients řádek
# delka_erupce_min, ne řádek (Intercept).
# - Estimate je odhad sklonu, tedy velikost vztahu.
# - Std. Error je standardní chyba (SE) odhadu sklonu. Odhaduje z jediného
#   souboru dat, jak moc by se odhady sklonu typicky lišily mezi soubory
#   stejného počtu erupcí. Má stejnou jednotku jako sklon.
# Sloupce t value a Pr(>|t|) zatím nevykládejte; patří do následující
# lekce.

#----------------------------------------#
### Úloha | L04-U05 -----
#----------------------------------------#

# Zadání:
# 1. Zobrazte summary(object = mod_gejzir).
# 2. V řádku delka_erupce_min najděte Estimate a Std. Error a zaokrouhlete
#    je na dvě desetinná místa.
# 3. Zobrazte summary(object = mod_cerven) z U04 a najděte standardní
#    chybu sklonu pro samotný červen.
# 4. Do komentáře zapište, která standardní chyba je menší a proč.

# Vaše řešení:


# Očekávaný výsledek:
# Model ze všech erupcí: odhad sklonu asi 13,34 a standardní chyba asi
# 0,66 minuty čekání na minutu erupce. Samotný červen (39 erupcí):
# standardní chyba asi 1,12. Model ze 117 erupcí má menší standardní
# chybu, protože více pozorování nese více informace a odhad je přesnější.
#
# Nápověda 1:
# Odhad a jeho standardní chyba stojí ve stejném řádku tabulky
# Coefficients, ale v různých sloupcích. Porovnáváte dva modely se stejným
# vzorcem, které se liší jen počtem erupcí.
#
# Nápověda 2:
# Ve výstupu summary() hledejte průsečík řádku delka_erupce_min se sloupci
# Estimate a Std. Error. Počet erupcí obou modelů znáte z U01 a U04.
#
# Interpretace:
# Co by standardní chyba 0,66 znamenala pro někoho, kdo by zaznamenal jiný
# soubor 117 erupcí za stejných podmínek? Je velikost vztahu a přesnost
# jeho odhadu totéž?

#--------------------------------------------------#
## Jaký rozsah sklonů je slučitelný s daty? -----
#--------------------------------------------------#
# Interval spolehlivosti (anglicky confidence interval, CI) vytvoří kolem
# odhadu sklonu rozsah sklonů, které jsou slučitelné s daty a modelem.
# Číslo 95 % je hladina spolehlivosti: kdybychom stejný postup opakovali
# na mnoha souborech erupcí, asi 95 % takto vytvořených intervalů by
# zachytilo skutečný sklon. Interval se týká sklonu, ne jednotlivých
# čekání.
#
# confint() vypíše 95% intervaly spolehlivosti všech koeficientů modelu.
# Sloupce 2.5 % a 97.5 % jsou dolní a horní hranice intervalu. Pro naši
# otázku sledujte řádek delka_erupce_min.

#----------------------------------------#
### Úloha | L04-U06 -----
#----------------------------------------#

# Zadání:
# 1. Pomocí confint() vypište 95% intervaly spolehlivosti koeficientů
#    mod_gejzir.
# 2. Opište hranice intervalu pro sklon a zaokrouhlete je na dvě
#    desetinná místa.
# 3. Do komentáře vyložte interval v kontextu Old Faithful.

# Vaše řešení:


# Očekávaný výsledek:
# 95% interval spolehlivosti sklonu je asi 12,03 až 14,64 minuty čekání
# na minutu erupce. Data a model jsou slučitelné s tímto rozsahem kladných
# sklonů, ne pouze s jediným číslem 13,34.
#
# Nápověda 1:
# Interval popisuje, jak velký může být průměrný rozdíl čekání mezi
# erupcemi lišícími se o minutu, ne jak dlouho čeká jednotlivý návštěvník.
#
# Nápověda 2:
# Výklad můžete začít větou: „Data a model jsou slučitelné se sklony
# od … do … minuty čekání na minutu erupce.“
#
# Interpretace:
# Proč tento interval neobsahuje „95 % čekacích dob“? Co přesně popisuje
# číslo 95 %?

#--------------------------------------------------#
## Jaké čekání odhaduje model po čtyřminutové erupci? -----
#--------------------------------------------------#
# predict() použije hotový model pro novou hodnotu prediktoru. Argument
# newdata je tabulka se sloupcem pojmenovaným stejně jako prediktor
# v modelu. Tabulku s jedním řádkem vytvoříte funkcí data.frame(), například
#   data.frame(delka_erupce_min = 2)
# Čtyři minuty leží v rozsahu pozorovaných délek erupcí.

#----------------------------------------#
### Úloha | L04-U07 -----
#----------------------------------------#

# Zadání:
# 1. Vytvořte jednořádkovou tabulku data_nova_erupce se sloupcem
#    delka_erupce_min a hodnotou 4.
# 2. Pomocí predict() a mod_gejzir získejte odhad čekání po čtyřminutové
#    erupci a uveďte jej v minutách.
# 3. Do komentáře porovnejte tento odhad s intervalem z U06: popisují
#    stejnou věc?

# Vaše řešení:


# Očekávaný výsledek:
# Model odhaduje po čtyřminutové erupci čekání asi 99,25 minuty. Je to
# bodový odhad průměrného čekání po takových erupcích. Interval z U06 se
# týká sklonu, ne čekání po jedné budoucí erupci; jednotlivá čekání se
# kolem přímky rozptylují o několik minut (viz residua z U03).
#
# Nápověda 1:
# Do nové tabulky patří známá délka erupce, nikoli čekání, které teprve
# odhadujete.
#
# Nápověda 2:
# V data.frame() pojmenujte sloupec delka_erupce_min; do predict() dejte
# object = mod_gejzir a newdata = data_nova_erupce.
#
# Interpretace:
# Zaručuje odhad 99,25 minuty, kdy přesně začne další erupce? Proč ne?

#--------------------------------------------------#
## Co lze říct o erupcích Old Faithful? -----
#--------------------------------------------------#
# Věcný závěr začíná velikostí vztahu a jeho nejistotou. Data jsou
# pozorovací: dobrovolníci nezaznamenali náhodný výběr všech erupcí
# a blízké erupce mohou být časově propojené.

#----------------------------------------#
### Úloha | L04-U08 -----
#----------------------------------------#

# Zadání:
# Napište do komentáře 4–6 vět pro návštěvníka parku o vztahu délky erupce
# a čekání na další erupci. Dodržte toto pořadí:
# 1. biologická otázka a co představuje jeden řádek dat;
# 2. graf s přímkou a kontrola residuí;
# 3. odhad sklonu ± standardní chyba s jednotkami;
# 4. 95% interval spolehlivosti;
# 5. rozdíl sklonů mezi měsíci;
# 6. alespoň jedno omezení dat.
# Nepište, že délka erupce čekání způsobuje.

# Vaše řešení:


# Očekávaný výsledek:
# Například: „Dvě erupce, jejichž délky se lišily o jednu minutu, se podle
# lineárního modelu v průměru lišily čekáním na další erupci o 13,34 ± 0,66
# minuty (odhad sklonu ± SE; 95% CI [12,03; 14,64] minuty čekání na minutu
# erupce).“ Závěr dále zmíní, že residua nemají zřetelný oblouk ani
# trychtýř, i když několik erupcí střední délky leží výrazně nad přímkou,
# že sklony měsíců se liší asi o jednu minutu a že dobrovolnická
# pozorování nejsou náhodným výběrem všech erupcí.
#
# Nápověda 1:
# Velikost vztahu a jeho nejistotu uveďte před omezeními. Oddělte
# průměrný vztah od čekání po jedné konkrétní erupci.
#
# Nápověda 2:
# Čísla vezměte z U02 a U05 (sklon a SE), U06 (interval) a U04 (měsíce).
# Omezení najdete v textu nad touto úlohou.
#
# Interpretace:
# Která věta vašeho závěru by se nezměnila, kdyby standardní chyba byla
# dvakrát větší?

#----------------------------------------------------------#
# Úlohy navíc -----
#----------------------------------------------------------#
# Tyto úlohy nejsou součástí hlavních úloh. Můžete si vybrat jednotlivé
# úlohy; většina potřebuje data_gejzir z U01 a mod_gejzir z U02. Úlohy
# N13–N15 řešte v uvedeném pořadí. Nové objekty pojmenujte jinak než
# objekty z hlavních úloh, abyste si je nepřepsali.

#--------------------------------------------------#
## Nejistota a počet erupcí -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N01 -----
#----------------------------------------#

# Operátor %in% vrátí TRUE, pokud hodnota patří mezi zadané hodnoty.
# Například c("06", "08") %in% c("06", "07") vrátí TRUE a FALSE.

# Zadání:
# 1. Z data_gejzir vyberte erupce z června a července dohromady a uložte je
#    jako data_dva_mesice.
# 2. Fitujte stejný model jako v U02 a uložte jej jako mod_dva_mesice.
# 3. Porovnejte standardní chybu sklonu pro 39 erupcí (mod_cerven z U04),
#    pro dva měsíce a pro všech 117 erupcí (mod_gejzir).

# Vaše řešení:


# Očekávaný výsledek:
# Dva měsíce obsahují 78 erupcí. Standardní chyba sklonu je asi 1,12
# (červen), 0,77 (dva měsíce) a 0,66 (všechny erupce). S více erupcemi se
# standardní chyba zmenšuje.
#
# Nápověda 1:
# Do výběru patří řádky, jejichž měsíc je jeden ze dvou měsíců. Model,
# vzorec i sloupce zůstávají stejné jako v U02.
#
# Nápověda 2:
# Podmínku pro řádky sestavte z format() jako v U04 a operátoru %in%
# s vektorem dvou měsíců. Standardní chybu čtěte ve sloupci Std. Error
# výstupu summary().
#
# Interpretace:
# Proč se standardní chyba zmenšuje, i když jde stále o stejný gejzír?

#----------------------------------------#
### Úloha navíc | L04-N02 -----
#----------------------------------------#

# Zadání:
# 1. Pro sklon mod_gejzir vypište 80% a 95% interval spolehlivosti.
# 2. Porovnejte jejich šířku.

# Vaše řešení:


# Očekávaný výsledek:
# 80% interval sklonu je asi 12,49 až 14,18; 95% interval 12,03 až 14,64.
# Širší je 95% interval. Data i odhad sklonu zůstaly stejné.
#
# Nápověda 1:
# Měníte požadovanou hladinu intervalu, nikoli model nebo jeho data.
#
# Nápověda 2:
# Ve funkci confint() nastavte argument level = 0.80; výchozí hladina
# je 0.95.
#
# Interpretace:
# Znamená užší 80% interval, že jsme z dat získali přesnější informaci?

#----------------------------------------#
### Úloha navíc | L04-N03 -----
#----------------------------------------#

# Tato úloha vyžaduje balíček {broom}. Pokud chybí, můžete úlohu přeskočit
# nebo odpovědět jen na otázku v Interpretaci. Balíček nainstalujete
# jednou příkazem v Console (bez úvodního #):
# install.packages(pkgs = "broom")

# Zadání:
# 1. Použijte broom::tidy() na mod_gejzir s argumentem conf.int = TRUE.
# 2. V řádku delka_erupce_min najděte odhad, standardní chybu a obě
#    hranice 95% intervalu.
# 3. Porovnejte je s výstupy summary() a confint() z U05 a U06.

# Vaše řešení:


# Očekávaný výsledek:
# Jeden řádek tabulky uvádí pro sklon odhad asi 13,34, standardní chybu
# asi 0,66 a 95% interval asi 12,03 až 14,64, stejně jako summary()
# a confint().
#
# Nápověda 1:
# broom::tidy() mění uspořádání výstupu, ne data ani fitovaný model.
#
# Nápověda 2:
# Zadejte broom::tidy(x = mod_gejzir, conf.int = TRUE) a čtěte sloupce
# estimate, std.error, conf.low a conf.high.
#
# Interpretace:
# Jde o tři různé modely, nebo o tři pohledy na jeden model?

#--------------------------------------------------#
## Data a jednotky -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N04 -----
#----------------------------------------#

# Zadání:
# 1. Nakreslete histogram délek erupcí z data_gejzir. Vodorovnou osu
#    popište včetně jednotky.
# 2. Spočítejte, kolik erupcí trvalo méně než 3 minuty a kolik 3 minuty
#    a déle.

# Vaše řešení:


# Očekávaný výsledek:
# Histogram má dvě skupiny: krátké erupce kolem 2 minut a dlouhé kolem
# 4 minut. Méně než 3 minuty trvalo 28 erupcí, 3 minuty a déle 89 erupcí.
#
# Nápověda 1:
# Podmínka „kratší než 3 minuty“ vrací pro každou erupci TRUE nebo FALSE.
# TRUE se při sčítání počítá jako 1.
#
# Nápověda 2:
# Použijte hist(x = data_gejzir$delka_erupce_min, xlab = ...) a
# sum(data_gejzir$delka_erupce_min < 3).
#
# Interpretace:
# Jak tyto dvě skupiny souvisejí se dvěma oblaky bodů v grafu z U02?

#----------------------------------------#
### Úloha navíc | L04-N05 -----
#----------------------------------------#

# Zadání:
# 1. Z data_gejzir fitujte model čekání podle původního sloupce duration
#    v sekundách. Uložte jej jako mod_sekundy.
# 2. Vyložte jeho sklon v minutách čekání na jednu sekundu erupce.
# 3. Sklon vynásobte 60 a porovnejte se sklonem mod_gejzir.

# Vaše řešení:


# Očekávaný výsledek:
# Sklon je asi 0,2223 minuty čekání na sekundu erupce; po vynásobení 60
# vychází asi 13,34 minuty na minutu erupce. Jde o stejná pozorování
# v jiných jednotkách.
#
# Nápověda 1:
# Změní se jen jednotka prediktoru, ne měření jednotlivých erupcí.
#
# Nápověda 2:
# Ve vzorci lm() ponechte cekani_min vlevo a duration dejte vpravo; sklon
# najděte v coef().
#
# Interpretace:
# Proč změna jednotky prediktoru změní číslo sklonu, ale ne vztah?

#--------------------------------------------------#
## Graf a předpověď -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N06 -----
#----------------------------------------#

# points() přidá body do již nakresleného grafu; argument col určuje barvu
# a pch tvar bodu.

# Zadání:
# 1. Znovu nakreslete bodový graf a přímku mod_gejzir jako v U02.
# 2. Do stejného grafu přidejte odlišně zbarvený bod pro délku erupce
#    4 minuty a odhad čekání z U07.

# Vaše řešení:


# Očekávaný výsledek:
# Zvýrazněný bod leží na přímce přibližně v místě (4; 99,25).
#
# Nápověda 1:
# Přidaný bod má známou souřadnici x a souřadnici y odhadnutou modelem.
#
# Nápověda 2:
# Po plot() a abline() použijte points() s x = 4, y z predict()
# a argumenty col a pch.
#
# Interpretace:
# Je tento bod další naměřenou erupcí?

#----------------------------------------#
### Úloha navíc | L04-N07 -----
#----------------------------------------#

# Zadání:
# 1. Vytvořte tabulku se sloupcem delka_erupce_min a hodnotami 2, 3 a 4.
# 2. Jedním voláním predict() získejte odhad čekání pro všechny tři délky.
# 3. Porovnejte rozdíly mezi sousedními odhady.

# Vaše řešení:


# Očekávaný výsledek:
# Odhady jsou asi 72,58; 85,92 a 99,25 minuty. Erupce, jejichž délky se
# liší o minutu, se v odhadu liší vždy o sklon, asi 13,34 minuty.
#
# Nápověda 1:
# Sloupec tabulky může obsahovat více hodnot; každý řádek dá jeden odhad.
#
# Nápověda 2:
# Do data.frame() vložte delka_erupce_min = c(2, 3, 4) a tabulku předejte
# funkci predict() jako newdata.
#
# Interpretace:
# Proč jsou oba rozdíly stejné?

#--------------------------------------------------#
## Residua podrobněji -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N08 -----
#----------------------------------------#

# Zadání:
# 1. Pro první řádek data_gejzir zjistěte naměřené cekani_min, první
#    hodnotu fitted(mod_gejzir) a první hodnotu resid(mod_gejzir).
# 2. Odečtením ověřte znaménko residua.

# Vaše řešení:


# Očekávaný výsledek:
# Naměřené čekání je 68 minut, odhad asi 72,36 minuty a residuum asi
# −4,36 minuty.
#
# Nápověda 1:
# Residuum je naměřená hodnota minus odhad pro tentýž řádek.
#
# Nápověda 2:
# Z každého vektoru vyberte první hodnotu zápisem [1].
#
# Interpretace:
# Leží první erupce nad přímkou, nebo pod ní?

#----------------------------------------#
### Úloha navíc | L04-N09 -----
#----------------------------------------#

# abs() vrátí absolutní hodnotu. which.max() vrátí pořadí největší
# hodnoty ve vektoru; toto číslo pak použijete jako číslo řádku
# v hranatých závorkách, například data_gejzir[5, ].

# Zadání:
# 1. Mezi residui mod_gejzir najděte erupci s největší absolutní hodnotou
#    residua.
# 2. Vypište její datum, délku erupce v minutách, naměřené čekání, odhad
#    modelu a residuum.

# Vaše řešení:


# Očekávaný výsledek:
# Je to řádek 97 z 15. 8. 2024: erupce trvala 3 minuty, čekání 107 minut,
# odhad asi 85,92 minuty a residuum asi +21,08 minuty.
#
# Nápověda 1:
# Hledejte velikost odchylky bez ohledu na její znaménko.
#
# Nápověda 2:
# Funkci which.max() použijte na absolutní hodnoty residuí. Stejné číslo
# řádku pak vyberte v data_gejzir, ve fitted() i v resid().
#
# Interpretace:
# Znamená jedno nápadné čekání, že model nesmíme použít?

#----------------------------------------#
### Úloha navíc | L04-N10 -----
#----------------------------------------#

# Zadání:
# 1. Nakreslete residua mod_gejzir proti délce erupce a přidejte
#    vodorovnou nulovou čáru.
# 2. Porovnejte graf s grafem residuí proti odhadnutým hodnotám z U03.

# Vaše řešení:


# Očekávaný výsledek:
# Osa x je nyní délka erupce v minutách, v U03 odhadnuté čekání v minutách.
# S jedním prediktorem jde o stejná residua seřazená podle dvou propojených
# os; závěr se nemění.
#
# Nápověda 1:
# Mění se vodorovná veličina, nikoli model ani residua.
#
# Nápověda 2:
# V plot() použijte x = data_gejzir$delka_erupce_min a
# y = resid(object = mod_gejzir); nulu označte pomocí
# abline(h = 0, lty = 2).
#
# Interpretace:
# Proč vypadají oba grafy tak podobně?

#--------------------------------------------------#
## Čtení a sdělení nejistoty -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N11 -----
#----------------------------------------#

# Zadání:
# 1. Z tabulky koeficientů summary(mod_gejzir)$coefficients vyberte řádek
#    delka_erupce_min a sloupce Estimate a Std. Error.
# 2. Obě čísla uložte do dvou česky pojmenovaných objektů.

# Vaše řešení:


# Očekávaný výsledek:
# Odhad asi 13,34 a standardní chyba asi 0,66, stejné jako v U05.
#
# Nápověda 1:
# Tabulka má pojmenované řádky i sloupce; potřebujete jeden řádek a dva
# sloupce.
#
# Nápověda 2:
# Vybírejte hranatými závorkami [řádek, sloupec] pomocí jmen
# "delka_erupce_min", "Estimate" a "Std. Error".
#
# Interpretace:
# Proč se při tomto výběru nefitoval nový model?

#----------------------------------------#
### Úloha navíc | L04-N12 -----
#----------------------------------------#

# Zadání:
# Posuďte tyto věty a každou nepřesnou větu opravte:
# A. „95% interval obsahuje 95 % čekání po erupcích.“
# B. „Po čtyřminutové erupci bude čekání přesně 99,25 minuty.“
# C. „Delší erupce způsobuje delší čekání.“
# U každé opravy uveďte, o který výsledek se správné tvrzení opírá.

# Vaše řešení:


# Očekávaný výsledek:
# A zaměňuje interval sklonu za rozdělení jednotlivých čekání. B zaměňuje
# bodový odhad za jistou předpověď. C vyvozuje příčinu ze vztahu
# v pozorovacích datech.
#
# Nápověda 1:
# Rozlište nejistotu sklonu, rozptýlení jednotlivých čekání kolem přímky
# a důkaz o příčině.
#
# Nápověda 2:
# K větě A použijte confint() z U06, k větě B predict() z U07 a residua
# z U03, k větě C způsob získání dat.
#
# Interpretace:
# Která z vět je podle vás v médiích nejčastější?

#--------------------------------------------------#
## Jiný soubor erupcí -----
#--------------------------------------------------#
# R obsahuje klasický dataset faithful s jinými pozorováními Old Faithful.
# Jeden řádek opět obsahuje délku erupce a čekání na následující erupci.
# Sloupce se jmenují eruptions a waiting; obě hodnoty jsou v minutách.
# Vytvoříme samostatnou tabulku s českými názvy, aby data_gejzir zůstala
# zachována.
data_faithful <-
  data.frame(
    delka_erupce_min = faithful$eruptions,
    cekani_min = faithful$waiting
  )

#----------------------------------------#
### Úloha navíc | L04-N13 -----
#----------------------------------------#

# Zadání:
# 1. V data_faithful ověřte počet řádků a rozsahy obou proměnných.
# 2. Nakreslete bodový graf délky erupce a čekání.
# 3. Fitujte model čekání podle délky erupce, uložte jej jako mod_faithful
#    a přidejte jeho přímku do grafu.

# Vaše řešení:


# Očekávaný výsledek:
# 272 erupcí; délka 1,6 až 5,1 minuty a čekání 43 až 96 minut. Sklon
# mod_faithful je asi 10,73 minuty čekání na minutu erupce.
#
# Nápověda 1:
# Postup z U01 a U02 použijte na jinou tabulku se stejně pojmenovanými
# sloupci.
#
# Nápověda 2:
# Použijte nrow(), range(), plot(), lm() se vzorcem
# cekani_min ~ delka_erupce_min a abline(reg = mod_faithful).
#
# Interpretace:
# Je sklon stejný jako u mod_gejzir? Proč nemusí být?

#----------------------------------------#
### Úloha navíc | L04-N14 -----
#----------------------------------------#

# Zadání:
# 1. Z mod_faithful nakreslete graf residuí proti odhadnutým hodnotám
#    s nulovou čarou.
# 2. Pomocí predict() odhadněte čekání po erupci dlouhé 4 minuty
#    a porovnejte odhad s U07.

# Vaše řešení:


# Očekávaný výsledek:
# Odhad z faithful je asi 76,39 minuty, tedy jiný než asi 99,25 minuty
# ze souboru 2024.
#
# Nápověda 1:
# Kontrola residuí i předpověď musí používat nový model mod_faithful.
#
# Nápověda 2:
# V plot() použijte fitted(object = mod_faithful) a
# resid(object = mod_faithful); do predict() dejte newdata
# s delka_erupce_min = 4.
#
# Interpretace:
# Proč dva soubory erupcí téhož gejzíru dávají jiný odhad?

#----------------------------------------#
### Úloha navíc | L04-N15 -----
#----------------------------------------#

# Zadání:
# 1. V summary(mod_faithful) najděte odhad sklonu a jeho standardní chybu.
# 2. Pomocí confint() zjistěte 95% interval sklonu.
# 3. Napište jednu větu s jednotkami ve stejném tvaru jako v U08.

# Vaše řešení:


# Očekávaný výsledek:
# Sklon asi 10,73 ± 0,31 minuty čekání na minutu erupce (odhad sklonu ± SE;
# 95% CI [10,11; 11,35]).
#
# Nápověda 1:
# Postup z U05 a U06 odpovídá na stejnou otázku v jiných datech.
#
# Nápověda 2:
# V summary() sledujte řádek delka_erupce_min ve sloupcích Estimate
# a Std. Error; v confint() tentýž řádek.
#
# Interpretace:
# Proč má mod_faithful menší standardní chybu než mod_gejzir?

#----------------------------------------------------------#
# Ohlédnutí a vlastní kontrola -----
#----------------------------------------------------------#
# Zkuste bez kódu odpovědět na tyto otázky:
# 1. Proč Pepa, Mařenka a Karel dostali různé sklony, i když použili
#    stejný model?
# 2. Co znamená sklon 13,34 a co jeho standardní chyba 0,66? Proč je
#    standardní chyba pro jeden měsíc větší?
# 3. Co popisuje 95% interval spolehlivosti sklonu a co nepopisuje?
# 4. Jak se liší odhad z predict() od intervalu spolehlivosti sklonu?
# 5. Která omezení dat brání tvrzení, že délka erupce čekání způsobuje?
# Pokud si nejste jistí, vraťte se k úlohám U04, U05, U06, U07 a U08.
#
# Věcný závěr začíná velikostí vztahu a jeho nejistotou. Interval
# popisuje nejistotu sklonu, ne rozptýlení jednotlivých čekání.
