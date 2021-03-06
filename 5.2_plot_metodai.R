
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Pagrindiniai funkcijos plot metodai.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2014-03-07 | 2014-03-24
#


# TURINYS -------------------------------

#
#   1. Funkcijos plot metodai sklaidos diagramoms:
#      * plot.default
#      * plot.data.frame
#      * plot.formula
#
#   2. Metodas vieno kintamojo funkcij� grafikams:
#      * plot.function
#
#   3. Metodai da�ni� lentel�ms atvaizduoti:
#      * plot.table
#      * plot.factor
#


# PASTABOS ------------------------------

#
# Joki� pastab� n�ra.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# FUNKCIJA PLOT IR JOS METODAI            #
# --------------------------------------- #

# Pagrindin� grafik� ir �vairi� diagram� brai�ymo funkcija yra plot. Tai bendro 
# pob�d�io (generic) funkcija, kuri skirtingo tipo duomenims atvaizduoti naudoja 
# skirtingus metodus. Pavyzd�iui, kaip argument� nurod�ius du skai�i� vektorius 
# x ir y, nubrai�oma ta�k� su koordinat�mis (x, y) sklaidos diagrama, nurod�ius 
# da�ni� lentel�, nubrai�oma stulpelin� diagrama, nurod�ius bet kokios skaitin�s
# R funkcijos pavadinim� arba u�ra�ius jos i�rai�k�, nubrai�omas tos funkcijos 
# grafikas. Funkcija plot atpa��sta da�niausiai naudojam� statistini� proced�r� 
# rezultat� objektus ir j� atvaizdavimui naudoja specifinius metodus. Pavyzd�iui, 
# kaip argument� nurod�ius tiesini� modeli� proced�ros lm rezultat� objekt�, bus 
# brai�oma paklaid� sklaidos diagrama ir kiti diagnostiniai to modelio grafikai, 
# o nurod�ius hierarchinio klasterizavimo proced�ros hclust rezultat�, brai�oma 
# dendrograma. Galima pamin�ti kelet� da�niausiai naudojam� metod�:
# 
#   plot.default    --  skaitini� kintam�j� x ir y sklaidos diagramos brai�ymui,
#   plot.data.frame --  skaitini� duomen� lenteli� atvaizdavimui,
#   plot.formula    --  duomen� pagal j� priklausomyb�s model� atvaizdavimui,
#   plot.function   --  �vairi� funkcij� grafik� bra�ymui,
#   plot.table      --  da�ni� ir kry�mini� da�ni� lenteli� atvaizdavimui,
#   plot.factor     --  kategorini� kintam�j� (faktori�) atvaizdavimui,
#   plot.histogram  --  histogramos brai�ymui,
#   plot.density    --  tankio funkcijos �ver�io brai�ymui,
#   plot.ecdf       --  empirin�s pasiskirstymo funkcijos brai�ymui,
#   plot.ts         --  laiko eilut�s grafiko brai�ymui,
#   plot.dendrogram --  dendrogramos atvaizdavimui,
#   plot.lm         --  tiesinio modelio diagnostini� grafik� brai�ymui.

# Visus funkcijos plot metodus galima su�inoti naudojant funkcij� methods.
methods(plot)


# --------------------------------------- #
# METODAI SKLAIDOS DIAGRAMOMS SUDARYTI    #
# --------------------------------------- #

# Pats papras�iausias grafikas - ta�k� su koordinat�mis (x, y) sklaidos diagrama.
# Tokiu atveju funkcijai plot perduodami �i� ta�k� koordina�i� vektoriai x ir y.

x <- c(2.0, 1.6, 1.2, 1.0, 1.0, 1.3, 1.6, 2.0, 2.3, 2.8, 2.8, 3.0, 2.8, 2.4, 2.1)
y <- c(0.8, 1.1, 1.3, 1.6, 2.2, 2.5, 2.9, 3.1, 3.0, 2.8, 2.4, 1.8, 1.4, 1.0, 0.9)
z <- c(2.8, 6.1, 4.5, 8.0, 6.7, 9.0, 9.2, 9.3, 7.2, 9.6, 8.6, 8.4, 7.3, 6.1, 3.9)

d <- data.frame(x, y, z)
l <- list(x, y, z)

# Nubrai�ysime tris skirtingas �i� kintam�j� sklaidos diagramas.

plot(x, y)
plot(x, z)
plot(y, z)

# Diagramoje pavaizduot� ta�k� koordinat�s (x, y) gali b�ti apskai�iuotos. Tokiu 
# b�du galima nubrai�yti �vairias kreives. Pavyzd�iui, nubrai�ysime gerai �inom�
# Lisa�u kreiv�, kuri u�ra�yta parametriniu pavidalu.

t <- seq(0, 2*pi, length = 1000)
x.i <- sin(3*t + pi/8)
y.i <- cos(4*t)

plot(x.i, y.i, pch = ".", main = "Lissajous kreiv�")


# Tokiu pa�iu b�du galima brai�yti �vairi� funkcij� grafikus. Pvz., nubrai�ysime 
# racionalios trupmenos y = P(x)/Q(x) grafik� intervale [-5, 5].

x <- seq(-5, 5, length = 100)
y <- x/(x^2 + x + 1)

plot(x, y, type = "l")


# Jei funkcijai plot kaip argumentas nurodoma data.frame tipo lentel�, sudaromas
# grafikas, kuriame atvaizduojamos vis� tokios lentel�s skaitini� kintam�j� por� 
# sklaidos diagramos. Pavyzd�iui, atvaizduosime anks�iau sudarytos lentel�s vis� 
# trij� kintam�j� por� sklaidos diagramas.

plot(d)

# Lentel�je iris yra 3 r��i� g�li� �iedlapi� matavimai. Pirmi keturi kintamieji 
# yra skaitiniai, paskutinis yra kategorinis ir nurodo, kuriai r��iai priklauso 
# stebiniai. Nubrai�ysime �i� kintam�j� sklaidos diagramas.

plot(iris)

# Kategorin� lentel�s kintam�j� galima panaudoti sklaidos diagramos ta�k� spalvai 
# nustatyti. Tokiu b�du tuos pa�ius duomenis galima nagrin�ti �vairiais pj�viais.

plot(iris[, 1:4], col = iris[, 5])


# NAUDINGA ------------------------------

# Dviej� kintam�j� sklaidos diagrama yra vienas i� b�d� pasteb�ti statistin� �i�
# kintam�j� priklausomyb�. �i priklausomyb� yra akivaizdi, kai ta�k� koordinates
# (x, y) sieja ry�ys y = f(x). Nagrin�jant atsitiktini� dyd�i� priklausomyb� yra
# ra�omas statistinis modelis, kuris R kalboje i�rei�kiamas per formul�. Kair�je
# jos pus�je ra�omas kintamasis, kuris atitinka koordinat� y, o de�in�je pus�je
# u�ra�omas kintamasis x. Funkcija plot, naudodama metod� plot.formula, pagal ��
# model� sudaro dviej� kintam�j� sklaidos diagram�.

modelis <- y ~ x
modelis

# Pavyzd�iui, sudarysime duomen� lentel�s d kintam�j� x ir y sklaidos diagram�.
# Funkcijai plot kaip parametr� perduodame kintam�j� s�ry�io model� ir nurodome 
# duomen� lentel�, i� kurios ir paimami modelyje �ra�yti kintamieji x ir y.

plot(modelis, data = d)

# Jeigu modelis, pagal kur� brai�oma sklaidos diagrama, nesikei�ia, jo i�rai�k� 
# galima �ra�yti tiesiai � funkcij� plot.

plot(y ~ x, data = d)

# Formul�je �ra�yti kintamieji neb�tinai turi b�ti duomen� lentel�je. Pavyzd�iui,
# nubrai�ysime s�ra�o l kintam�j� x ir y sklaidos diagram�.

plot(y ~ x, data = l)

# Pastaba. Nenurod�ius nei duomen� lentel�s, nei s�ra�o pavadinimo, bus brai�oma 
# tokius pat pavadinimus turin�i� kintam�j� (jei tokie yra) sklaidos diagrama.
# �iuo atveju kintamieji x ir y apra�o auk��iau pamin�tos rac. trumpenos ta�kus.

plot(y ~ x)

# Naudojant model�, galima u�ra�yti labai �vairias t� pa�i� kintam�j� tarpusavio
# priklausomybes. U�ra�ysime kelet� da�niausiai pasitaikan�i� modeli�:
# 
#   y ~ x         -- ta�k� su koordinat�mis (x, y) sklaidos diagrama,
#   y ~ 1         -- ta�k� (i, y.i) diagrama, kai i -- y element� eil�s numeris, 
#     ~ x         -- ta�k� su koordinat�mis (x, 1) i�sid�stymo ties�je diagrama,
#     ~ x + y     -- ta pati ta�k� (x, y) sklaidos diagrama,
#     ~ x + y + z -- trij� kintam�j� x, y ir z por� sklaidos diagramos.

# Naudodami duomen� lentel�s d kintamuosius, pagal �iuos modelius nubrai�ysime 
# visas �ias sklaidos diagramas.

plot(y ~ x, data = d)

plot(x ~ 1, data = d)
plot(y ~ 1, data = d)

plot( ~ x, data = d)
plot( ~ y, data = d)
plot( ~ z, data = d)

plot( ~ x + y,     data = d)
plot( ~ x + y + z, data = d)


# U�DUOTIS ------------------------------ 

# 1. Naudojant funkcij� plot, nubrai�ykite br��in�, kur 10 x 10 dyd�io kvadrate
#    b�t� pa�ym�ti visi ta�kai, kuri� koordinat�s yra nat�riniai skai�iai.
# 2. Nubrai�ykite apskritim� su centru ta�ke (2, 2) ir spinduliu R=2. Apskritimo
#    ta�kai turi b�ti sujungti i�tisine raudona linija. Kad apskritimo grafikas
#    vizualiai nepavirst� � elips�s grafik�, naudojant parametr� asp nurodykite 
#    fiksuot� 1:1 kra�tini� santyk�.
# 3. Nubrai�ykite elips�s su centru koordina�i� prad�ioje grafik�. Tegul ilgoji
#    elips�s pusa�� lygi 5, o trumpoji -- 3.
# 4. Apskai�iuokite Archimedo spiral�s 1000 ta�k� koordinates, nubrai�ykite jos
#    grafik�. Brai�ant grafik�, reikia nurodyti fiksuot� 1:1 kra�tini� santyk�.
# 5. Lentel�je cars yra automobilio grei�io ir stabdymo kelio matavim� duomenys.
#    Sudarykite stabdymo kelio ir automobilio grei�io tarpusavio priklausomyb�s 
#    model� ir nubrai�ykite j� atitinkant� kintam�j� sklaidos diagram�.


# --------------------------------------- #
# METODAS FUNKCIJOS GRAFIKUI NUBRAI�YTI   #
# --------------------------------------- #

# Funkcija plot turi metod� vieno kintamojo funkcij� y = f(x) grafikams brai�yti.
# Pagrindiniai parametrai:
#
#       x -- funkcijos f(x) pavadinimas arba jos i�rai�ka,
#    from -- intervalo [a, b] reik�m� a,
#      to -- intervalo [a, b] reik�m� b,
#       n -- ta�k� skai�ius intervale [a, b].
#
# Sudarant funkcijos f(x) intervale [a, b] grafik�, �is intervalas padalinamas � 
# 100 lygi� dali�, kurias viena nuo kitos atskiria n = 101 ta�k�. Tuose ta�kuose
# skai�iuojamos funkcijos y = f(x) reik�m�s ir gaunamos ta�k� (x, y) koordinat�s.

# Pavyzd�iui, sudarysime tos pa�ios racionalios trupmenos y = P(x)/Q(x) grafik�. 
# Pirmiausia jos i�rai�k� u�ra�ysime kaip R funkcij�.

fx <- function(x) {
  y <- x/(x^2 + x + 1)
  return(y)
}

plot(fx)


# Be papildom� nustatym� nubrai�omas funkcijos intervale [0, 1] grafikas, ta�iau 
# intervalo ribas galima pakeisti.

plot(fx, from = -5, to = 5)

# Jei parametr� reik�m�s priskiriamos nustatyta tvarka, tai parametr� pavadinim� 
# galima ir nera�yti.

plot(fx, -5, 5)

# Ta�k� (x, y), i� kuri� sudaromas funkcijos grafikas, skai�i� galima pakeisti.

plot(fx, -5, 5, n = 10)
plot(fx, -5, 5, n = 1000)


# Kartais gali b�ti naudinga galimyb� i�saugoti ta�k� (x, y), i� kuri� sudarytas 
# funkcijos y = f(x) grafikas, koordinates. 

xy.list <- plot(fx, -5, 5)
xy.list

plot(xy.list)


# Gana da�nai reikalingas kokios nors standartin�s funkcijos grafikas. J� galim�
# nubrai�yti net keliais b�dais. Pavyzd�iui, nubrai�ysime standartinio normaliojo
# pasiskirstymo tankio funkcijos grafik�.

# Pirmas b�das. Galima apskai�iuoti tankio funkcijos y = p(x) reik�mes ta�kuose 
# x ir ta�kus (x, y) atid�ti plok�tumoje.

x <- seq(-3, 3, len = 100)
y <- 1/sqrt(2*pi)*exp(-x^2/2)

plot(x, y, type = "l")


# Antras b�das. Reikiamos funkcijos i�rai�k� galima u�ra�yti kaip R funkcij� ir 
# nubr��ti jos grafik�.

norm.tankis <- function(x) {
  y <- 1/sqrt(2*pi)*exp(-x^2/2)
  return(y)
}

plot(norm.tankis)
plot(norm.tankis, -3, 3)


# R turi daug praktikoje reikaling� ir da�nai naudojam� funkcij� ir atskirai j� 
# u�ra�in�ti nereikia -- u�tenka �inoti j� pavadinimus. Standartinio normalinio 
# dyd�io tankio funkcija yra dnorm, o tikimybi� pasiskirstymo funkcija -- pnorm.

plot(dnorm, -3, 3)
plot(pnorm, -3, 3)

plot(sqrt)
plot(log)
plot(exp)

plot(sin, -pi/2, pi/2)

# Standartines R funkcijas galima panaudoti kit� funkcij� sudarymui. Pavyzd�iui,
# R turi funkcij� y = sin(x), ta�iau neturi funkcijos y = sin(2x). Jos i�rai�k� 
# kaip argument� galima �ra�yti tiesiai � funkcij� plot.

plot(function(x) sin(2*x), -pi/2, pi/2)


# U�DUOTIS ------------------------------ 

# 1. Panaudojant standartin� R funkcij�, nubrai�ykite funkcijos y = |x| grafik� 
#    intervale [-1, 1].
# 2. Naudodami standartines trigonometrines R funkcijas, nubrai�ykite funkcijos
#    y = arcsin(sin(x)) grafik� intervale [-2pi, 2pi].
# 3. Nubrai�ykite normaliojo skirstinio su vidurkiu 10 ir standartiniu nuokrypiu 
#    lygiu 3 tankio funkcijos grafik�. Interval� parinkite taip, kad funkcijos
#    reik�m�s galuose b�t� labai artimos nuliui.
# 4. Panaudojant funkcij� plot, nubrai�ykite chi-kvadrat skirstinio su 5 laisv�s 
#    laipsniais tankio funkcijos grafik� intervale [0, 20]. Chi-kvadrat tankio
#    funkcijos pavadinimas dchisq.


# --------------------------------------- #
# METODAI DA�NI� LENTEL�MS IR FAKTORIAMS  #
# --------------------------------------- #

# Funkcija plot gali atvaizduoti da�ni� lenteles. Vieno kintamojo da�ni� lentel�
# atvaizduojama kaip stulpelin� diagrama, kurioje kintamojo reik�m� atitinkan�io 
# stulpelio auk�tis lygus tos reik�m�s pasikartojim� skai�iui -- da�niui.

# Pavyzd�iui, turime vektori�, kurio elementai yra did�iosios raid�s. Sudarysime 
# �io vektoriaus raid�i� da�ni� lentel� ir j� atvaizduosime.

g <- c("A", "B", "D", "A", "C", "C", "C", "C", "C", "C", "A", "A", "D", "B", "B")

t <- table(g)
t

plot(t)
plot(t, main = "Da�ni� pasiskirstymas grup�se", xlab = "Grup�", ylab = "")


# Jei funkcijos plot argumentas yra kategorinis kintamasis (faktorius), sudaroma
# to kintamojo da�ni� lentel� atitinkanti stulpelin� diagrama.

# Pavyzd�iui, kintam�j� g paversime � faktori� ir sudarysime t� pa�i� stulpelin� 
# diagram� neskai�iuodami tarpin�s da�ni� lentel�s.
 
g <- factor(g)
g

plot(g)

# Vienas i� funkcijos plot argument� gali b�ti kategorinis, o kitas -- skaitinis.
# Priklausomai nuo to, kokio tipo kintamasis bus priskirtas parametrui x, o koks
# parametrui y, funkcija plot sudarys du skirtingus grafikus. Abiem atvejais tai
# bus skaitinio kintamojo sklaidos diagramos atskirose grup�se pagal kategorinio
# kintamojo reik�mes. Skiriasi tik atvaizdavimo b�das.

s <- c(0.6, 3.4, 6.1, 0.7, 5.2, 1.4, 2.3, 3.4, 2.5, 9.4, 2.7, 4.1, 2.9, 0.1, 7.5)
k <- c("T", "N", "N", "T", "T", "T", "N", "T", "T", "N", "T", "N", "T", "T", "N")

k <- factor(k, levels = c("T", "N"), labels = c("Taip", "Ne"))

plot(k)

# Jei funkcijos plot parametrui x priskiriamas skaitinis vektorius, o parametrui 
# y -- kategorinis (faktorius), tai skirtingoms grup�ms priklausan�ios skaitinio 
# kintamojo reik�m�s i�d�stomos ant tas grupes atitinkan�i� horizontali� tiesi�. 
# Tokiu b�du gaunamos vienmat�s sklaidos diagramos.

plot(s, k)

# Jei parametrui x priskiriamas kategorinis kintamasis (faktorius), o parametrui 
# y --- skaitinis, tada i� skirtingoms grup�ms priklausan�i� skaitinio kintamojo 
# reik�mi� sudaromos atskiros t� kategorij� boxplot diagramos, kurios i�d�stomos 
# ant x a�ies.

plot(k, s)

# Jei i� karto abiems funkcijos plot parametrams x ir y priskiriami kategoriniai 
# kintamieji, nubrai�oma specifin� stulpelin� diagrama, kuri vadinama spineplot. 
# �ioje diagramoje ant Ox a�ies i�d�stomi skirtingas pirmojo kintamojo reik�mes 
# atitinkantys vienetinio auk��io stulpeliai. Kiekvienas stulpelis padalinamas �
# tiek dali�, kiek skirting� antrojo kintamojo reik�mi� yra atitinkamoje pirmojo
# kintamojo grup�je, o kiekvienos dalies dydis proporcingas t� reik�mi� da�niui.

plot(k, g)
plot(g, k)


# NAUDINGA ------------------------------

# � kintam�j� ry�ius apra�ant� model� galima �traukti kategorinius kintamuosius.
# Tokiu atveju de�in�je modelio pus�je �ra�ytas kategorinis kintamasis grupuoja
# kair�s pus�s kintamojo stebinius. Diagramos pavidalas priklauso nuo to, kokio
# tipo kintamieji yra vienoje ir kitoje modelio pus�je. Tarkime, kad kintamasis 
# x yra skaitinis, o kintamieji k ir g -- kategoriniai (faktoriai). Tokiu atveju
# galima u�ra�yti da�niausiai naudojamus modelius:
# 
#     ~ k     -- kategorinio kintamojo k stulpelin� da�ni� diagrama,
#   x ~ k     -- skaitinio kintamojo x boxplot diagrama kintamojo k grup�se,
#     ~ k + x -- skaitinio kintamojo x boxplot diagrama kintamojo k grup�se,
#   g ~ k     -- kategorinio kintamojo g spineplot diagrama grup�se pagal k,
#     ~ k + g -- kategorinio kintamojo g spineplot diagrama grup�se pagal k.

# Nubrai�ysime skaitinio kintamojo s boxplot diagramas grup�se suformuotas pagal 
# skirtingas kintamojo k reik�mes.

plot(s ~ k)

# Naudojant model�, nubrai�ysime kategorinio kintamojo g da�ni� diagram�.

plot( ~ g)

# Dviej� kategorini� kintam�j� spineplot diagram� galima nubrai�yti u�ra�ant du 
# ekvivalen�ius j� priklausomyb�s modelius. Galima atkreipti d�mes�, kad pirmas
# kintamasis de�in�je visada yra grupuojantis. �iuo atveju tai yra kintamasis g.

plot(k ~ g)
plot(  ~ g + k)


# U�DUOTIS ------------------------------ 

# 1. Sudarykite vektori� i� �ios u�duoties pirmojo sakinio raid�i�. Visos raid�s
#    vektoriuje turi b�ti vienodos: arba ma�osios, arba did�iosios. Sudarykite
#    raid�i� da�ni� lentel� ir atvaizduokite j� kaip stulpelin� diagram�.
# 2. Pirmoje u�duotyje sudaryt� raid�i� vektori� paverskite � faktori�. Gaukite
#    toki� pa�i� raid�i� pasikartojimo da�ni� stulpelin� diagram� a) nenaudojant
#    kategorinio kintamojo sklaidos modelio, b) naudojant model�.
# 3. Naudojant pirmoje u�duotyje sudaryt� raid�i� vektori�, sudarykite papildom�
#    vektori�, kurio elementams priskiriama reik�m� "B", jei raid� yra bals�, ir
#    reik�m� "P", jei raid� yra priebals�. Paverskite �� vektori� � kategorin� 
#    kintam�j�. Atvaizduokite balsi� ir priebalsi� da�ni� diagram� ir atsakykite,
#    koki� raid�i� yra daugiau?
# 4. U�ra�ykite tok� kintam�j� s�ry�io model�, kad pagal j� b�t� galima nubr��ti
#    duomen� lentel�s iris kintamojo Sepal.Length boxplot diagramas atskirai 
#    kiekvienai kategorinio kintamojo Species grupei.
