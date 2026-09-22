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
# Příprava: vlastní projekt a dva soubory -----
#----------------------------------------------------------#

# Projekt v RStudiu je hlavní složka pro jednu práci. Soubor
# .Rproj pomáhá tuto složku znovu otevřít. Skript s kódem
# a datový soubor jsou uvnitř projektu samostatné soubory.
# Uložení skriptu samo neuloží objekty v aktuální relaci R.
#
# V RStudiu zvolte File > New Project > New Directory >
# New Project. Jako Directory name zadejte L04_praktikum.
# V Create project as subdirectory of vyberte složku, kde
# chcete práci uchovat, a potvrďte Create Project.
# Název otevřeného projektu uvidíte vpravo nahoře.
#
# V panelu Files klikněte New Folder, pojmenujte ji `data`
# a otevřete ji. Z této adresy stáhněte datový soubor:
# https://cuni-natur-biostatistics.github.io/L04/current/data/old_faithful_2024.csv
# Uložte jej jako old_faithful_2024.csv do složky data.
# Kliknutím na .. v panelu Files se vraťte do hlavní složky.
# Z této adresy stáhněte skript:
# https://cuni-natur-biostatistics.github.io/L04/current/code/cviceni.R
# Uložte jej do hlavní složky projektu jako cviceni.R.
# V RStudiu zvolte File > Open File a stažený skript otevřete.
#
# L04_praktikum/
#   L04_praktikum.Rproj
#   cviceni.R
#   data/
#     old_faithful_2024.csv
#
# Skript spouštějte shora dolů. Jeden příkaz spusťte kurzorem
# na jeho řádku pomocí Ctrl + Enter. U víceřádkového příkazu
# označte všechny jeho řádky a stiskněte Ctrl + Enter.
# Výsledek uvidíte v Console, graf v Plots. Řádky začínající
# znakem # jsou komentáře a R je nespouští. Pod „Vaše řešení“
# pište vlastní příkazy bez # a slovní odpovědi na komentářové
# řádky začínající #. Svou kopii ukládejte pomocí Ctrl + S.
# Nápovědy čtěte postupně a výsledkem si ověřte práci.
#
# Hlavní úlohy L04-U01 až L04-U07 tvoří společnou trasu.
# Úlohy navíc jsou dobrovolné a hodí se i k samostudiu.
# Projekt znovu otevřete dvojklikem na soubor .Rproj.
# Restart R odstraní objekty z aktuální relace, ale projekt,
# uložený skript a CSV zůstanou na disku. Po restartu spusťte
# uložený skript znovu shora dolů.


#--------------------------------------------------#
## Výsledky učení a návaznost na L03 -----
#--------------------------------------------------#

# Po praktiku dokážete zobrazit data s odhadnutou přímkou,
# posoudit graf residuí, získat bodový odhad pomocí predict()
# a číst odhad sklonu, jeho standardní chybu a 95% interval
# spolehlivosti. Závěr spojí čísla s otázkou a omezeními dat.
#
# V L03 jste fitovali přímku pomocí lm(), četli sklon v
# původních jednotkách a kontrolovali residua. Pokud si
# pamatujete práci s plot(), abline(), fitted() a resid(),
# můžete toto krátké připomenutí přeskočit:
# - prediktor patří na vodorovnou osu, odezva na svislou;
# - residuum = pozorovaná hodnota minus odhad modelu;
# - nenulová residua sama o sobě neznamenají chybný model.


#--------------------------------------------------#
## Kontrola souboru -----
#--------------------------------------------------#

# Cesta začíná v hlavní složce otevřeného projektu.
# Kontrola nic nestahuje ani nemění ve vašem počítači.
soubor_gejzir <- "data/old_faithful_2024.csv"

if (
  !file.exists(soubor_gejzir)) {
  stop(
    "Soubor data/old_faithful_2024.csv nebyl nalezen. Otevřete projekt L04_praktikum a zkontrolujte název i umístění CSV ve složce data.",
    call. = FALSE
  )
}


#----------------------------------------------------------#
# Hlavní úlohy -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Co představuje jeden řádek dat? -----
#--------------------------------------------------#

# Výukový soubor vychází z dobrovolnických záznamů
# GeyserTimes o gejzíru Old Faithful z června až srpna 2024.
# Jeden řádek představuje zaznamenanou erupci a čekání na
# následující erupci. Sloupec duration udává délku erupce
# v sekundách, cekani_min čekání v minutách. Přípravu
# souboru z původního archivu popisují skripta L04.
data_gejzir <-
  read.csv(file = soubor_gejzir)

head(x = data_gejzir)

# Jedna minuta má 60 sekund. Vytvoříme český název
# proměnné, kterou použijeme v modelu.
data_gejzir$delka_erupce_min <-
  data_gejzir$duration / 60


#----------------------------------------#
### Úloha | L04-U01 -----
#----------------------------------------#

# Zadání: V data_gejzir ověřte počet řádků, počet chybějících
# hodnot zvlášť v duration a cekani_min a rozsah proměnných
# delka_erupce_min a cekani_min. Pro otázku, zda délka erupce
# souvisí s dalším čekáním, určete prediktor a odezvu.
# Co znamená jeden řádek?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: 117 úplných řádků; délky erupcí
# 1,65–4,83 min a čekání 62–116 min. Jeden řádek spojuje
# erupci s čekáním na další; délka erupce je prediktor.
# Nápověda 1: Zkontrolujte zvlášť úplnost a rozsah.
# Otázka určuje, která veličina druhou vysvětluje.
# Nápověda 2: Použijte nrow(), sum(is.na()) a range()
# na příslušné sloupce objektu data_gejzir.


#--------------------------------------------------#
## Jak data vystihuje jedna přímka? -----
#--------------------------------------------------#

# Obecný zápis z L03 má pořadí odezva ~ prediktor.
# Řádky níže jsou jen vzor: obecné názvy nahraďte
# sloupci a tabulkou ze své biologické otázky.
# mod_nazev <- lm(
#   formula = odezva ~ prediktor,
#   data = data_tabulka
# )


#----------------------------------------#
### Úloha | L04-U02 -----
#----------------------------------------#

# Zadání: Z data_gejzir fitujte pomocí lm() model čekání
# podle délky erupce a uložte jej jako mod_gejzir. Zobrazte
# jeho koeficienty pomocí coef(). Poté nakreslete bodový graf
# s délkou erupce v minutách na ose x a čekáním v minutách
# na ose y; do téhož grafu přidejte přímku mod_gejzir.
# Popište směr vztahu, rozptýlení bodů kolem přímky
# a význam sklonu v jednotkách těchto dat.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Rostoucí přímka prochází oblakem
# 117 bodů, které neleží přesně na ní. Erupce delší o jednu
# minutu souvisí v modelu v průměru s čekáním delším asi
# o 13,34 minuty. Vztah sám o sobě nedokazuje příčinu.
# Nápověda 1: Ve vzorci modelu rozlište, co chcete
# odhadovat a podle čeho. Body ukazují jednotlivé erupce,
# přímka shrnuje jejich vztah.
# Nápověda 2: Do lm() dejte cekani_min vlevo od ~ a
# delka_erupce_min vpravo; data jsou data_gejzir.
# V plot() popište obě osy, pak přidejte
# abline(reg = mod_gejzir).


#--------------------------------------------------#
## Co zůstalo po odečtení přímky? -----
#--------------------------------------------------#

# Graf residuí proti odhadnutému čekání ukáže, zda se
# odchylky mění podél přímky. Histogram stejných residuí
# ukáže jejich četnosti bez informace o délce erupce
# nebo odhadnutém čekání. V obou grafech je residuum
# v minutách; nula znamená shodu měření s modelem.


#----------------------------------------#
### Úloha | L04-U03 -----
#----------------------------------------#

# Zadání: Z mod_gejzir nakreslete graf residuí proti
# odhadnutým čekáním. Přidejte vodorovnou přerušovanou čáru
# v nule a popište obě osy v minutách. Samostatně vytvořte
# histogram residuí: vodorovná osa ukazuje residuum
# v minutách, svislá počet erupcí. U grafu proti odhadům
# posuďte vzor a změnu rozptylu; u histogramu popište,
# kde leží většina residuí a zda jsou některá nápadně
# vzdálená od nuly. Co každý graf ukazuje o vhodnosti
# jednoduché přímky a co z něj samotného nepoznáte?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: V grafu proti odhadům jsou residua
# po obou stranách nuly, ve dvou oblastech odhadnutého
# čekání; není patrný jednoznačný plynulý oblouk ani zřetelné
# rozšiřování oblaku, ale několik odchylek je větších.
# Histogram ukazuje četnosti týchž 117 residuí, většinou
# poblíž nuly, s několika vzdálenějšími hodnotami. Sám
# neukáže, při kterých odhadech odchylky vznikly; graf
# proti odhadům zase neukáže četnosti hodnot tak přehledně.
# Žádný graf nedokazuje dokonalou vhodnost či přesnost modelu.
# Nápověda 1: První graf zachová dvojice odhad–residuum;
# histogram se ptá, kolik residuí spadá do různých rozsahů.
# Nápověda 2: Pro první graf použijte plot() s fitted()
# a resid(), poté abline(h = 0, lty = 2). Samostatný
# histogram vytvořte pomocí hist() z resid(mod_gejzir)
# a popište osy argumenty xlab a ylab.


#--------------------------------------------------#
## Jaké čekání odhaduje model po čtyřminutové erupci? -----
#--------------------------------------------------#

# predict() použije hotový model pro novou hodnotu
# prediktoru. newdata je tabulka se stejně pojmenovaným
# sloupcem jako prediktor v modelu. Čtyři minuty leží
# v rozsahu zde pozorovaných délek erupcí.


#----------------------------------------#
### Úloha | L04-U04 -----
#----------------------------------------#

# Zadání: Vytvořte jednořádkovou tabulku data_nova_erupce
# se sloupcem delka_erupce_min a hodnotou 4. Pomocí
# predict() a mod_gejzir získejte bodový odhad čekání.
# Uveďte výsledek v minutách. Zaručuje přesný čas
# následující erupce? Využijte graf z U02 a residua z U03.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Model odhaduje asi 99,25 min.
# Jednotlivá čekání se kolem přímky liší; číslo není
# zárukou přesného čekání po jedné budoucí erupci.
# Nápověda 1: Do nové tabulky patří známá délka erupce,
# nikoli čekání, které teprve odhadujete.
# Nápověda 2: V data.frame() pojmenujte sloupec
# delka_erupce_min; do predict() dejte object = mod_gejzir
# a newdata = data_nova_erupce.


#--------------------------------------------------#
## Jak velký je vztah a jak přesně jej známe? -----
#--------------------------------------------------#

# summary() zobrazí v tabulce Coefficients odhad Estimate
# a standardní chybu Std. Error. Pro naši otázku sledujte
# řádek sklonu delka_erupce_min, ne řádek (Intercept).


#----------------------------------------#
### Úloha | L04-U05 -----
#----------------------------------------#

# Zadání: Zobrazte summary(mod_gejzir). V řádku
# delka_erupce_min najděte Estimate a Std. Error,
# zaokrouhlete je na dvě desetinná místa a vysvětlete
# rozdíl mezi velikostí vztahu a přesností jeho odhadu.
# Jakou mají jednotku? Sloupce t value a Pr(>|t|)
# nyní nevykládejte; patří k L05.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Sklon asi 13,34 a standardní
# chyba asi 0,66 minuty čekání na minutu erupce.
# První číslo udává velikost odhadovaného vztahu,
# druhé přesnost odhadu sklonu za předpokladů modelu.
# Nápověda 1: V jednom řádku čtěte dva různé sloupce.
# Residua jednotlivých čekání představují další otázku.
# Nápověda 2: Ve výstupu summary() v tabulce Coefficients
# hledejte průsečík řádku delka_erupce_min se sloupci
# Estimate a Std. Error.


#--------------------------------------------------#
## Jaký rozsah sklonů je slučitelný s daty? -----
#--------------------------------------------------#

# confint() vrací intervaly koeficientů modelu.
# Pro naši otázku opět sledujte řádek delka_erupce_min.


#----------------------------------------#
### Úloha | L04-U06 -----
#----------------------------------------#

# Zadání: Pomocí confint() vypište 95% intervaly
# koeficientů mod_gejzir. Opište a v kontextu Old Faithful
# vyložte interval sklonu. Vysvětlete, proč tento interval
# neobsahuje „95 % čekacích dob“ a proč není rozsahem
# čekání po jedné konkrétní budoucí erupci.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: 95% interval sklonu je asi
# 12,03–14,64 minuty čekání na minutu erupce. Vztahuje
# se k odhadované průměrné změně čekání, ne k jednotlivým
# pozorováním ani k přesnosti bodové předpovědi z U04.
# Nápověda 1: Každý řádek výstupu patří jinému parametru;
# biologická otázka se týká sklonu přímky.
# Nápověda 2: Použijte confint(object = mod_gejzir)
# a čtěte hranice řádku delka_erupce_min.


#--------------------------------------------------#
## Co lze říct o erupcích Old Faithful? -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha | L04-U07 -----
#----------------------------------------#

# Zadání: Zapište několik vět o vztahu délky erupce
# a následujícího čekání v tomto souboru 117 pozorování.
# Propojte bodový graf s přímkou, oba grafy residuí, bodový
# odhad pro 4minutovou erupci, sklon, jeho standardní
# chybu a 95% interval. Uveďte jednotky a omezení:
# dobrovolnická pozorování nejsou náhodným výběrem všech
# erupcí a blízké erupce mohou být časově propojené.
# Nepište, že délka erupce čekání způsobuje.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Kladný vztah se sklonem asi 13,34,
# SE asi 0,66 a 95% intervalem asi 12,03–14,64 min
# čekání na minutu erupce. Předpověď asi 99,25 min je
# bodový odhad pro 4minutovou erupci; graf residuí
# a způsob získání dat omezují jeho výklad.
# Nápověda 1: Oddělte velikost vztahu, nejistotu sklonu
# a čekání po jedné konkrétní erupci.
# Nápověda 2: Projděte výsledky U02–U06 v pořadí:
# graf, residua, predict(), Estimate, Std. Error, confint().


#----------------------------------------------------------#
# Shrnutí a sebekontrola -----
#----------------------------------------------------------#

# 1. Jak projekt pomáhá R najít soubor i po restartu?
# 2. Co ukazuje přímka nad body a co oba grafy residuí?
# 3. Jak se liší predict() pro čtyřminutovou erupci
#    od odhadu sklonu v summary()?
# 4. Proč 95% interval sklonu nepopisuje 95 % čekacích dob?


#----------------------------------------------------------#
# Úlohy navíc -----
#----------------------------------------------------------#

# Následující úlohy jsou dobrovolné. Hlavní trasa
# je hotová i bez nich.


#--------------------------------------------------#
## Dostanou tři měsíce stejný sklon? -----
#--------------------------------------------------#

# Sloupec date obsahuje datum ve tvaru RRRR-MM-DD.
# substr() z něj vezme prvních sedm znaků RRRR-MM.
# Krátký příklad ukazuje výběr červnových záznamů.
data_cerven <-
  data_gejzir[
    substr(x = data_gejzir$date, start = 1, stop = 7) == "2024-06",
  ]


#----------------------------------------#
### Úloha navíc | L04-N01 -----
#----------------------------------------#

# Zadání: S již připravenými červnovými daty vyberte
# z data_gejzir zvlášť červenec a srpen 2024. Pro každý
# měsíc ověřte počet řádků, fitujte stejný model čekání
# podle délky erupce a porovnejte všechny tři sklony.
# Znamená rozdíl sklonů sám o sobě, že jde pouze o
# náhodnou výběrovou variabilitu?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Každý měsíc má 39 záznamů a sklony
# se liší. Měsíce mohou zachycovat i skutečnou změnu
# procesu; tyto příčiny ze tří měsíců neoddělíme.
# Nápověda 1: Zachovejte odezvu i prediktor;
# mění se pouze vybrané řádky dat.
# Nápověda 2: Napodobte výběr data_cerven s řetězci
# "2024-07" a "2024-08". Na každý ze tří měsíčních
# objektů použijte lm() se stejným vzorcem a poté coef().


#--------------------------------------------------#
## Jak se mění šířka intervalu? -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha navíc | L04-N02 -----
#----------------------------------------#

# Zadání: Pro sklon stejného mod_gejzir porovnejte
# 80% a 95% interval spolehlivosti. Který je širší?
# Změnil se odhad sklonu nebo samotná data?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: 80% interval sklonu je asi
# 12,49–14,18; 95% interval 12,03–14,64. Širší
# je 95% interval. Data i bodový odhad jsou stejné.
# Nápověda 1: Měníte požadovanou hladinu intervalu,
# nikoli model nebo jeho pozorování.
# Nápověda 2: V confint() nastavte level = 0.80;
# 95% interval z U06 má výchozí hladinu 0.95.


#--------------------------------------------------#
## Přehled koeficientů pomocí broom -----
#--------------------------------------------------#

# Dobrovolná úloha vyžaduje balíček {broom}. Pokud chybí,
# můžete úlohu přeskočit; hlavní trasa je hotová.
# Pokud jej chcete použít, spusťte jednou v Console:
# install.packages(pkgs = "broom")


#----------------------------------------#
### Úloha navíc | L04-N03 -----
#----------------------------------------#

# Zadání: Pokud máte balíček {broom}, použijte
# broom::tidy() na mod_gejzir s conf.int = TRUE.
# V řádku delka_erupce_min najděte odhad, standardní
# chybu a obě hranice 95% intervalu. Porovnejte je
# se summary(mod_gejzir) a confint(mod_gejzir).
# Pokud balíček nemáte, podle již získaných výstupů
# odpovězte: jde o tři různé modely?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Jeden řádek tabulky uvádí
# pro stejný sklon odhad asi 13,34, SE asi 0,66
# a 95% interval asi 12,03–14,64. Jde o různé
# informace z jednoho modelu.
# Nápověda 1: tidy() mění uspořádání výstupu,
# ne data ani fitovaný model. Sledujte řádek prediktoru.
# Nápověda 2: Použijte broom::tidy() s argumenty
# x = mod_gejzir a conf.int = TRUE; čtěte sloupce
# estimate, std.error, conf.low a conf.high.



#----------------------------------------------------------#
# Úlohy navíc: data a jednotky -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Kolik erupcí připadá na každý měsíc? -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N04 -----
#----------------------------------------#

# Zadání: Z data_gejzir$date zjistěte počet řádků zvlášť
# pro červen, červenec a srpen 2024. Použijte prvních
# sedm znaků každého data, stejně jako u data_cerven.
# Souhlasí součet měsíčních počtů s U01? Co tato
# kontrola říká o zastoupení měsíců ve výukovém souboru?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Každý měsíc má 39 řádků;
# součet je 117. Počty jsou vyrovnané, ale samotné
# počty neříkají, že jde o náhodný výběr všech erupcí.
# Nápověda 1: Každé datum potřebuje měsíční značku
# a potom spočítat, kolikrát se každá značka vyskytuje.
# Nápověda 2: Použijte substr() jako u data_cerven
# a výsledné značky předejte do table().


#--------------------------------------------------#
## Změní sekundy samotný vztah? -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N05 -----
#----------------------------------------#

# Zadání: Z data_gejzir fitujte nový model čekání
# podle původního sloupce duration v sekundách.
# Uložte jej jako mod_sekundy. Vyložte jeho sklon
# v minutách čekání na jednu sekundu erupce.
# Porovnejte s mod_gejzir přepočet sklonu při změně
# prediktoru o 60 sekund. Jsou to jiné erupce?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Sklon je asi 0,2223 min čekání
# na sekundu erupce; za 60 sekund vychází asi 13,34 min.
# Jde o stejná pozorování vyjádřená v jiných jednotkách.
# Nápověda 1: Změní se číselná velikost jednotky
# prediktoru, ne měření jednotlivých erupcí.
# Nápověda 2: Ve vzorci lm() ponechte cekani_min
# vlevo a duration dejte vpravo; sklon najděte v coef()
# a vynásobte jej číslem 60.


#----------------------------------------------------------#
# Úlohy navíc: graf a předpověď -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Kde v grafu leží odhad pro čtyři minuty? -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N06 -----
#----------------------------------------#

# Zadání: Z data_gejzir znovu vykreslete body a přímku
# mod_gejzir jako v U02. Do stejného grafu přidejte
# odlišně zbarvený bod pro délku erupce 4 minuty
# a bodový odhad čekání z U04. Leží tento nový bod
# na přímce? Je to další skutečně naměřená erupce?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Zvýrazněný bod leží na přímce
# přibližně v (4; 99,25). Jde o výsledek modelu,
# nikoli o nové pozorování čekání.
# Nápověda 1: Nejdříve potřebujete stejný graf bodů
# a modelové přímky; přidaný bod má známé x a
# modelový odhad y.
# Nápověda 2: Po plot() a abline() použijte points()
# s x = 4, y z predict() a argumenty col a pch.


#--------------------------------------------------#
## Tři délky erupce, tři bodové odhady -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N07 -----
#----------------------------------------#

# Zadání: Pomocí jediného volání predict() získáte
# z mod_gejzir odhad čekání pro erupce dlouhé 2, 3
# a 4 minuty. Vytvořte pro ně třířádkové newdata,
# přečtěte výsledky ve stejném pořadí a porovnejte
# změny odhadu mezi sousedními délkami. Proč jsou
# obě změny stejné?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Asi 72,58; 85,92; 99,25 min.
# Každá další minuta délky zvýší odhad o sklon
# přibližně 13,34 min, protože model je přímka.
# Nápověda 1: Sloupec v newdata může obsahovat
# více hodnot; jeden výstup odpovídá jednomu řádku.
# Nápověda 2: Do data.frame() vložte sloupec
# delka_erupce_min = c(2, 3, 4) a tabulku předejte
# funkci predict() jako newdata.


#----------------------------------------------------------#
# Úlohy navíc: residua podrobněji -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Co se stalo u první zaznamenané erupce? -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N08 -----
#----------------------------------------#

# Zadání: Pro první řádek data_gejzir zjistěte
# skutečné cekani_min, první hodnotu fitted(mod_gejzir)
# a první resid(mod_gejzir). Ověřte odečtením,
# že residuum má správné znaménko. Ležel první
# bod nad přímkou, nebo pod ní?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Pozorované čekání je 68 min,
# odhad asi 72,36 min a residuum asi -4,36 min.
# První bod leží pod přímkou.
# Nápověda 1: Residuum je pozorovaná hodnota
# minus odhad pro tentýž řádek.
# Nápověda 2: Z každého potřebného vektoru vyberte
# první hodnotu zápisem [1] a odečtěte od čekání
# první odhad z fitted().


#--------------------------------------------------#
## Které čekání se od přímky liší nejvíc? -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N09 -----
#----------------------------------------#

# Zadání: Mezi residui mod_gejzir najděte řádek
# s největší absolutní hodnotou. Z data_gejzir pro
# tento řádek vypište datum, délku erupce v minutách
# a skutečné čekání. Uveďte odhad modelu a residuum.
# Znamená jedno nápadné čekání, že model nesmíme použít?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Řádek 97, datum 2024-08-15,
# délka 3 min, čekání 107 min, odhad asi 85,92 min
# a residuum asi +21,08 min. Nápadný bod je důvod
# k opatrné kontrole, ne automatickému zamítnutí modelu.
# Nápověda 1: Hledejte velikost odchylky bez ohledu
# na její kladné či záporné znaménko.
# Nápověda 2: Na resid(mod_gejzir) použijte abs()
# a pak which.max(); vrácené číslo použijte jako
# index řádku v datech, fitted() i resid().


#--------------------------------------------------#
## Zůstává vzor vzhledem k délce erupce? -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N10 -----
#----------------------------------------#

# Zadání: Z data_gejzir$delka_erupce_min a
# resid(mod_gejzir) vytvořte graf residuí proti
# délce erupce; přidejte vodorovnou nulovou čáru.
# Porovnejte jej s grafem residuí proti fitted()
# z U03. V jakých jednotkách je osa x v každém
# z obou grafů? Vidíte v jednom grafu zásadně
# jiný závěr o zbývajících odchylkách?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Osa x nového grafu je délka
# erupce v minutách, v U03 odhadnuté čekání
# v minutách. S jedním prediktorem jde o stejná
# residua seřazená podle dvou propojených os.
# Nápověda 1: Mění se vodorovná veličina, nikoli
# model nebo svislé hodnoty residuí.
# Nápověda 2: V plot() použijte x =
# data_gejzir$delka_erupce_min a y = resid(mod_gejzir);
# nulu označte pomocí abline(h = 0, lty = 2).


#----------------------------------------------------------#
# Úlohy navíc: čtení a sdělení nejistoty -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Vyberte čísla bez opisování celé tabulky -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N11 -----
#----------------------------------------#

# Zadání: Z matice coef(summary(mod_gejzir))
# vyberte pouze řádek delka_erupce_min a z něj
# sloupce Estimate a Std. Error. Uložte obě čísla
# do dvou česky pojmenovaných objektů. Ověřte,
# že odpovídají číslům z U05. Proč se při tomto
# výběru nefitoval nový model?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Odhad asi 13,34 a SE asi
# 0,66; čteme již existující mod_gejzir.
# Nápověda 1: Výstup má pojmenované řádky
# a sloupce; potřebujete jeden z každého.
# Nápověda 2: Z coef(summary(mod_gejzir))
# vybírejte hranatými závorkami [řádek, sloupec]
# pomocí názvů delka_erupce_min, Estimate
# a Std. Error.


#--------------------------------------------------#
## Tři věty, které znějí přesvědčivě -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N12 -----
#----------------------------------------#

# Zadání: Podle výsledků mod_gejzir posuďte tyto věty
# a každou nepřesnou větu opravte:
# A. „95% interval obsahuje 95 % čekání po erupcích.“
# B. „Po čtyřminutové erupci bude čekání přesně 99,25 min.“
# C. „Delší erupce způsobuje delší čekání.“
# U každé opravy uveďte, o jaké měření nebo odhad
# se správné tvrzení opírá.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: A zaměňuje interval sklonu
# za rozdělení jednotlivých čekání; B zaměňuje
# bodový odhad za jistou předpověď; C z asociace
# v pozorovacích datech vyvozuje příčinu.
# Nápověda 1: Rozlište nejistotu sklonu, rozptyl
# čekání kolem přímky a důkaz o příčině.
# Nápověda 2: K A použijte confint(), k B
# predict() a graf residuí, k C způsob získání dat.


#----------------------------------------------------------#
# Úlohy navíc: jiný soubor erupcí -----
#----------------------------------------------------------#

# N13 až N15 řešte v tomto pořadí. R obsahuje klasický
# dataset faithful s jinými pozorováními Old Faithful.
# Jeden řádek opět obsahuje délku erupce a čekání
# na následující. Původní sloupce se jmenují
# eruptions a waiting; obě hodnoty jsou v minutách.
# Vytvoříme samostatný objekt s českými názvy,
# aby data_gejzir zůstala zachována.
data_faithful <-
  data.frame(
    delka_erupce_min = faithful$eruptions,
    cekani_min = faithful$waiting
  )


#--------------------------------------------------#
## Sedí přímka i na jiné erupce? -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N13 -----
#----------------------------------------#

# Zadání: V data_faithful ověřte počet řádků
# a rozsahy obou proměnných. Nakreslete bodový
# graf délky erupce a čekání. Fitujte vlastní model
# čekání podle délky erupce jako mod_faithful
# a přidejte jeho přímku do grafu. Vyložte sklon
# v jednotkách těchto dat. Je stejný jako
# sklon mod_gejzir?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: 272 pozorování; délka
# 1,6–5,1 min a čekání 43–96 min. Sklon
# mod_faithful je asi 10,73 min čekání na
# minutu erupce, tedy jiný než v souboru 2024.
# Nápověda 1: Přenesete postup z U01 a U02
# na jiný objekt se stejně pojmenovanými sloupci.
# Nápověda 2: Použijte nrow(), range(), plot(),
# lm() se vzorcem cekani_min ~ delka_erupce_min
# a potom abline(reg = mod_faithful).


#--------------------------------------------------#
## Co čekání po čtyřminutové erupci? -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N14 -----
#----------------------------------------#

# Zadání: Z mod_faithful vytvořeného v N13
# nakreslete graf fitted() proti resid() s nulovou
# čárou. Potom pomocí predict() odhadněte čekání
# po erupci dlouhé 4 minuty. Porovnejte bodový
# odhad s U04. Dokáže samotná předpověď
# popsat čekání jedné erupce přesně?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Odhad z faithful je asi
# 76,39 min, tedy jiný než asi 99,25 min ze
# souboru 2024. Residua ukazují další variabilitu
# jednotlivých čekání kolem přímky.
# Nápověda 1: Diagnostika i předpověď musí
# používat nový model mod_faithful, ne mod_gejzir.
# Nápověda 2: V plot() použijte fitted(mod_faithful)
# a resid(mod_faithful); do predict() dejte newdata
# s delka_erupce_min = 4.


#--------------------------------------------------#
## Jak nejistě známe sklon z faithful? -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L04-N15 -----
#----------------------------------------#

# Zadání: V summary(mod_faithful) najděte odhad
# sklonu a jeho standardní chybu. Pomocí confint()
# zjistěte 95% interval sklonu. Napište jednu
# věcnou větu s jednotkami a porovnejte ji
# s výsledkem pro mod_gejzir. Proč dva soubory
# erupcí nemusejí dát shodná čísla?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Sklon asi 10,73,
# SE asi 0,31 a 95% interval asi
# 10,11–11,35 min čekání na minutu erupce.
# Data faithful a výukový soubor 2024 obsahují
# různá pozorování; jejich výsledky nevykládejte
# jako dva fity téže tabulky.
# Nápověda 1: Stejný postup jako v U05–U06
# odpovídá na stejnou otázku v jiných datech.
# Nápověda 2: Ve summary() sledujte řádek
# delka_erupce_min ve sloupcích Estimate
# a Std. Error; v confint() tentýž řádek.
