
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Kategoriniai kintamieji -- faktoriai.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2013-03-18 | 2013-05-06
#


# TURINYS -------------------------------

# 
#   1. Faktori� sudarymas ir j� s�vyb�s:
#      * komanda factor
#      * komanda class
#      * komanda mode
#      * komanda levels
#      * komanda nlevels
#      * komanda length
#      * komanda attributes
#      * komanda str
#      * komanda is.ordered
#      * komanda gl
#
#   2. Faktori� reik�m� keitimas:
#      * komanda relevel
#      * komanda droplevels
#      * operatorius [
#      * komanda ordered
#


# PASTABOS ------------------------------

#
# Para�yti apie funkcijos reorder taikym�.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# FAKTORIAI IR J� SAVYB�S                 #
# --------------------------------------- #

# Programavimo kalboje R faktoriais vadinami vard� arba rang� skal�s kintamieji,
# kurie �gyja baigtin� skai�i� skirting� reik�mi�. Statistikoje tokie kintamieji
# vadinami kategoriniais. Kategorini� kintam�j� reik�m�s da�nai b�na u�koduotos 
# simboliais, �od�iais, pavadinimais ar skai�iais. Jei faktorius sudarytas i� 
# vard� skal�je i�matuoto kategorinio kintamojo, tai jo reik�mi� i�rikiavimas 
# neturi jokios prasm�s. Jei tai ranginis kintamasis, tai rango did�jimo tvarka 
# i�rikiuotos reik�m�s turi tam tikr� prasm�.

# Tokiems kintamiesiems sukurti R naudojama funkcija factor. Jos parametrai:
# 
#        x -- kategorinio kintamojo reik�mi� vektorius,
#   levels -- skirting� kategorinio kintamojo reik�mi� vektorius,
#   labels -- kintamojo reik�mi� pavadinim� vektorius,
#  ordered -- login� reik�m�, jei TRUE, tai nurodo, kad kintamasis yra ranginis.


# Turime vektori�, kurio reik�m�s nurodo pvz. anket� pildan�i� �moni� lyt�.
# Pagal nutyl�jim� galimos faktoriaus reik�m�s bus i�rikiuotos pagal ab�c�l�.

x <- c("Vyras", "Moteris", "Vyras", "Moteris", "Moteris", "Moteris", "Vyras")
f <- factor(x)
f


# Faktorius kaip duomen� strukt�ra yra specialaus factor tipo.
class(f)

# Nepriklausomai nuo to, kokias reik�mes �gyja kategorinis kintamasis, faktorius
# yra sveik�j� skai�i� 1, 2, ... , k vektorius, kur k yra skirting� kintamojo 
# reik�mi� skai�ius, o kiekvienam jo nariui priskirtas pavadinimas -- kategorinio 
# kintamojo reik�m�. Tod�l funkcija mode nurodo, kad faktoriaus kaip vektoriaus 
# reik�m�s yra numeric tipo.

mode(f)


# Kokias skirtingas reik�mes turi kategorinis kintamasis parodo funkcija levels.
levels(f)

# Kiek skirting� reik�mi� turi kategorinis kintamasis parodo funkcija nlevels.
nlevels(f)

# Kaip ir kiekvieno vektoriaus, faktoriaus ilgis rei�kia vis� jo element� skai�i�.
length(f)


# Faktorius kaip R kintamasis turi kelet� pagrindini� atribut�: tai yra kintamojo 
# reik�mi� vektorius ir faktoriaus kaip duomen� strukt�ros klas�.
attributes(f)

# Faktoriaus strukt�r� galima pamatyti naudojant funkcij� str. Matosi, kad faktorius 
# yra tam tikr� skirting� reik�mi� skai�i� turintis sveik�j� skai�i� vektorius.
str(f)


# Funkcija is.ordered nurodo, ar faktorius yra ranginis kintamasis, �iuo atveju ne.
is.ordered(f)


# Tam tikra i� anksto nustatyta tvarka i�d�styt� faktori� seka generuojama su 
# funkcija gl. Jos parametrai:
# 
#       n -- kintamojo �gyjam� reik�mi� skai�ius,
#       k -- reik�mi� pakartojim� skai�ius,
#  length -- bendras faktoriaus element� skai�ius,
#  labels -- faktoriaus �gyjam� reik�mi� pavadinim� vektorius,
# ordered -- loginis kintamasis, nurodantis ar faktorius yra ranginis.


# Sukursime faktori� turint� dvi kategorijas, kurios pakartotos po penktis kartus.
# Kadangi kategorij� vardai nenurodyti, juos atstoja kategorij� numeriai: 1 ir 2.
g <- gl(n = 2, k = 5)
g

# Galima sukurti dvi periodi�kai pasikartojan�ias kategorijas turint� faktori�.
g <- gl(n = 2, k = 1, length = 10)
g

# Kategorijoms galima suteikti vardus, kurie neb�tinai turi b�ti �odis ar skai�ius.
g <- gl(2, 1, 10, labels = c("M�sa", "><(((�>"))
g

table(g)


# NAUDINGA ------------------------------

# T� pat� rezultat� galima gauti ir nenaudojant proced�ros gl, ta�iau komanda 
# gaunasi ne tokia kompakti�ka: su funkcija rep generuojame pasikartojan�i� sek�,
# kuri� v�liau paver�iame � faktori� ir priskiriame kategorijoms pavadinimus.
g <- rep(1:2, length = 10)
g <- factor(g, labels = c("M�sa", "><(((�>"))
g


# U�DUOTIS ------------------------------ 

# 1. Sugeneruokite faktori� h, kuris tur�t� po 5 kartus pasikartojan�ias tris 
#    kategorijas, ir suteikite joms vardus "I lygis", "II lygis" ir "III lygis".
# 2. Faktori� h su tokiais pat kategorij� pavadinimais sudarykite naudodami 
#    funkcijas rep ir factor.
# 3. Sugeneruokite faktori� d, kuris reik�t� visas vieno m�nesio savait�s dienas.
#    Tarkime, kad m�nuo turi 30 dien�, o savait�s dienas pradedame skai�iuoti nuo
#    pirmadienio. Savait�s dienoms suteikite pilnus vardus.


# --------------------------------------- #
# FAKTORI� REIK�MI� KEITIMAS              #
# --------------------------------------- #

# I�vedant faktori� � ekran�, u�ra�omi visi skirtingi kintamojo reik�mi� variantai 
# (levels). Jei kategorinis kintamasis buvo u�ra�ytas kaip tekstini� arba simbolini� 
# reik�mi� vektorius, tai faktoriuje tos reik�m�s bus i�rikiuotos ab�c�l�s tvarka, 
# jei kintamojo reik�mi� vektorius buvo i� skai�i� -- tada i�rikiuotos j� did�jimo 
# tvarka. Ta�iau tokia tvarka dar nerei�kia, kad faktorius yra ranginis kintamasis!

# Faktoriaus vis� galim� reik�mi� vektori� ir jo element� i�d�stymo tvark� parodo 
# funkcija levels. Pavyzd�iui, kintamojo reik�m�s "Moteris" ir "Vyras" yra tekstin�s,
# tod�l pagal nutyl�jim� faktoriuje jos i�rikiuotos pagal ab�c�l�.
levels(f)


# Naudojant funkcij� levels, jau sukurto faktoriaus �gyjam� reik�mi� vektori� galima 
# pervadinti. �ia svarbu i�laikyti t� pa�i� reik�mi� tvark�: ("Moteris", "Vyras"), o
# naujas reik�mi� vektorius gali b�ti pvz., ("Mot", "Vyr"), ("M", "V") ar pana�iai.

levels(f) <- c("Mot", "Vyr")
levels(f)
f


# Su funkcija levels atliekamas faktoriaus �gyjam� reik�mi� i�d�stymo pakeitimas 
# yra nekorekti�kas! Pavyzd�iui, pakeitus faktoriaus reik�mi� "Moteris" ir "Vyras" 
# i�d�stymo tvark�, � prie�ingas pasikei�ia ir vis� faktoriaus reik�mi� prasm�s!
# Padarius toki� klaid�, visos statistin�s i�vados apie kintam�j� bus neteisingos.

levels(f) <- c("Vyras", "Moteris")
levels(f)
f


# Pagal nutyl�jim� ab�c�l�s tvarka i�d�styt� kategorinio kintamojo �gyjam� reik�mi� 
# vektori� galima pakeisti faktoriaus sudarymo metu nurodant reikiam� t� reik�mi� 
# i�d�stymo vektori� levels. 

f <- factor(x, levels = c("Vyras", "Moteris"))
levels(f)
f

# Kartu su vektoriumi levels nurod�ius j� atitinkant� vektori� labels, faktoriaus
# sudarymo metu kategorinio kintamojo �gyjamas reik�mes galima pervadinti. 

f <- factor(x, levels = c("Vyras", "Moteris"), labels = c("Vyr", "Mot"))
levels(f)
f


# Tuo atveju, kai reikia nustatyti arba pakeisti bazin� (reference) jau sudaryto 
# faktoriaus reik�m�, naudojama funkcija relevel. �ia reik�m� "Mot" v�l padarysime 
# bazine.

f <- relevel(f, ref = "Mot")
levels(f)
f


# NAUDINGA ------------------------------

# Gana da�nai pasitaiko situacija, kad d�l patogumo kategorinio kintamojo reik�m�s 
# koduojamos skai�iais. Pavyzd�iui, �vedus pa�ym�jim� "Vyras" = 0, "Moteris" = 1, 
# t� pat� vektori� x buvo galima u�ra�yti taip: (0, 1, 0, 1, 1, 1, 0). Sudarant 
# faktori�, t� kod� reik�mes galima atstatyti u�ra�ant pavadinim� vektori� labels.

z <- c(0, 1, 0, 1, 1, 1, 0)
f <- factor(z, levels = c(0, 1), labels = c("Vyras", "Moteris"))
f


# U�DUOTIS ------------------------------ 

# 1. Tarkime, kad vektoriaus c(1, -1, 0, -1, -1, 1, -1, 0, 1, 1, -1, 0, 1, 1, 0) 
#    reik�m�s rei�kia atsakymus � testo klausimus. Sudarykite faktori� a ir jo 
#    reik�m�ms priskirkite tokius pavadinimus: 1 = Taip, -1 = Ne ir 0 = Ne�inau.
# 2. Naudodami funkcij� levels, pakeiskite anks�iau sugeneruoto faktoriaus h 
#    �gyjam� reik�mi� vardus � "Pirmas", "Antras", "Tre�ias".
# 3. Naudodami funkcij� factor, pakeiskite jau sudaryto faktoriaus h �gyjam� 
#    reik�mi� tvark� � prie�ing�: "Tre�ias", "Antras", "Pirmas".


# Kartais kategorinis kintamasis �gyja tik dal� vis� galim� reik�mi�. Tokiu atveju
# galima sudaryti faktori�, kurio galim� reik�mi� vektorius levels bus didesnis, 
# nei atitinkamo kategorinio kintamojo reik�mi� aib�. 

# Pavyzd�iui, turime apklausoje dalyvaujan�i� gyventoj� miest� vektori�.
m <- c("Vilnius", "Vilnius", "Kaunas", "Vilnius", "Kaunas", "Vilnius", "Kaunas")

# Jei tyrimas buvo atliekamas apklausiant did�i�j� miest� gyventojus, nepriklausomai
# nuo to, kokias reik�mes �gijo kintamojo elementai, galimos kintamojo reik�m�s 
# yra "Vilnius", "Kaunas" ir "Klaip�da". Sukuriame faktori� su tokiomis reik�m�mis.

f <- factor(m, levels = c("Vilnius", "Kaunas", "Klaip�da"))
f

# Nors kategorinis kintamasis turi dvi skirtingas reik�mes, ta�iau i� jo sudarytas
# faktorius i� viso turi tris galimas reik�mes.

unique(f)   # visos skirtingos faktoriaus reik�m�s
nlevels(f)  # viso galimos faktoriaus reik�m�s


# Sudarant tokio kintamojo da�ni� lentel�, bus �traukiamos ir tos reik�m�s, kuri�
# kintamajame nepasitaik�. Tokiu b�du da�ni� lentel� sudaroma ne i� t� reik�mi�,
# kurias �gijo kintamasis, bet i� t�, kurias gal�jo �gyti -- kartais tai svarbu.

table(m)    # pradinio kintamojo da�ni� lentel�    --   dvi reik�m�s
table(f)    # kategorinio kintamojo da�ni� lentel� -- visos reik�m�s


# Tuo atveju, kai nenaudojamos faktoriaus reik�m�s yra nereikalingos, jas galima
# pa�alinti naudojant funkcij� droplevels. Pvz., i� faktoriaus f pa�alinsime 
# nenaudojam� kintamojo kategorij� "Klaip�da", bet pats kintamasis nepasikeis.

f <- droplevels(f)
nlevels(f)
f


# Kadangi faktorius tuo pa�iu yra ir vektorius, i� jo galima i�skirti tam tikrus
# elementus. Tokiu b�du gautas faktorius neb�tinai turi tur�ti visas pradines
# kintamojo reik�mes, tod�l kai kurios faktoriaus reik�m�s taip pat gali b�ti 
# nereikalingos. Reik�mi� i� faktoriaus i�skyrimui naudojant operatori� [, yra
# galimyb� per parametr� drop pa�alinti nereikalingas kintamojo kategorijas.

# Atskiru atveju, nenurod�ius faktoriaus indeks� aib�s, gausime t� pat� faktori�, 
# ta�iau be nenaudojam� kategorij�.

f <- f[ , drop = TRUE]
nlevels(f)
f


# U�DUOTIS ------------------------------ 

# 1. Naudodami funkcij� factor, jau sudarytam faktoriui f prid�kite anks�iau 
#    pa�alint� kategorij� "Klaip�da".
# 2. Naudodami operatori� [, i� faktoriaus f i�skirkite tik tuos elementus, kurie 
#    atitinka reik�m� "Vilnius". Pa�alinkite neegzistuojan�ias naujo faktoriaus 
#    kategorijas "Kaunas" ir "Klaip�da".
# 3. I� faktoriaus d � nauj� faktori� i�skirkite darbo dienas ir pa�alinkite 
#    nebereikalingas savaitgalio dienas atitinkan�ias reik�mes.


# Jei kategorinis kintamasis yra ranginis, tai jo reik�mes galima i�rikiuoti rango
# did�jimo tvarka ir sudaryti ordered tipo faktori�. Pavyzd�iui, pagal nutyl�jim�
# faktoriaus reik�m�s i�rikiuojamos ab�c�l�s tvarka, kuri �iuo atveju nenat�rali.

y <- c("Pirmas", "Tre�ias", "Antras", "Tre�ias", "Pirmas", "Pirmas", "Antras")
r <- factor(y)
r

# Sukurdami faktori� galime i�ra�yti reik�mes j� did�jimo tvarka ir nurodyti, kad
# jos sudaro tam tikr� rang� sistem�.

r <- factor(y, levels = c("Tre�ias", "Antras", "Pirmas"), ordered = TRUE)
r


# Tok� pat� rangin� kintam�j� galima sudaryti naudojant funkcij� ordered.
# Nenurod�ius reik�mi� i�d�stymo tvarkos, jos bus i�rikiuotos pagal ab�c�l�.
r <- ordered(y, levels = c("Tre�ias", "Antras", "Pirmas"))
r

# Taip sudarytas faktorius yra ranginis kintamasis, kurio reik�m�s turi tvark�.
is.ordered(r)


# U�DUOTIS ------------------------------ 

# 1. Faktoriaus a reik�mes i�rikiuokite tokia tvarka: "Ne", "Ne�inau", "Taip" ir 
#    sukurkite nauj� rangin� kintam�j� -- faktori� t.
# 2. I� faktoriaus t i�skirkite tik reik�mes "Ne", "Taip" ir taip sukurkite nauj�
#    rangin� kintam�j�.


# NAUDINGA ------------------------------

# Kartais faktoriai panaudojami gana �domiose situacijose. Pvz., funkcija cut 
# tolyd� kintam�j� suskaido � tam tikrus intervalus. Rezultatas yra tokio pat 
# ilgio vektorius, kur vietoj pradinio vektoriaus reik�m�s yra intervalas, � 
# kur� ta reik�m� patenka.

# Sugeneruosime 100 standartini� normali�j� dyd�i� ir suskirstysime � vienodo 
# plo�io intervalus (-3, -2], (-2, -1], ... (2, 3]. Suskai�iuosime, kiek reik�mi� 
# patenka � �iuos intervalus.

r <- rnorm(100)
t <- cut(r, breaks = -3:3)
t

# Toks kintamasis yra kategorinis, o visas jo reik�mes gauname su komanda levels.
class(t)
levels(t)

# Sudarome duomen� lentel�, kurioje pirmas kintamasis yra anks�iau sunegeneruotas
# skai�ius, o antrasis kintamasis nurodo interval�, � kur� tas skai�ius patenka.
m <- data.frame(skai�ius = r, intervalas = t)
head(m)

# Suskai�iuodami skirtingus intervalus, su�inome, po kiek reik�mi� patenka � 
# kiekvien� interval�. Gaut� da�ni� lentel� galima atvaizduoti kaip histogram�.
table(t)
plot(t)
