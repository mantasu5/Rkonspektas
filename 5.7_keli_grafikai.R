
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Keli� grafik� viename grafiniame lange brai�ymas.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2015-02-26 | 2016-03-19
#


# TURINYS -------------------------------

#
#   1. Grafinio lango padalinimas � kelias dalis:
#      * funkcija par su parametrais mfcol ir mfrow
#      * funkcija layout
#      * funkcija layout.show
#
#   2. Brai�ymo srities apribojimas:
#      * funkcija clip
#      * parametras add
#


# PASTABOS ------------------------------

#
# Sugalvoti daugiau u�davini�.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# GRAFINIAI PARAMETRAI mfrow IR mfcol     #
# --------------------------------------- #

# Naudojant auk�to lygio grafin� funkcij�, pavyzd�iui, plot, hist, barplot, arba 
# atidaromas naujas grafinis langas, arba i�valomas jau atidarytas langas ir tik
# tada brai�omas naujas grafikas. U� tai atsakinga pagalbin� funkcija plot.new().
# Nauj� grafin� lang� galima atidaryti naudojant funkcij� windows(). 

windows()
plot.new()

# Tokiu b�du galima atidaryti daug grafini� lang�, ta�iau vis tiek viename lange 
# galima nubrai�yti tik vien� grafik�. 

# Tuo atveju, kai grafiniame lange reikia brai�yti kelet� grafik�, grafin� lang� 
# reikia padalinti � kelet� dali�. Tam yra keletas b�d�. Vienas i� j� -- naudoti
# grafinius parametrus mfrow arba mfcol. Parametras mfrow parodo, � kiek eilu�i� 
# ir kiek stulpeli� padalintas grafinis langas.

par("mfrow")
par("mfcol")

# Jeigu nenurodyta kitaip, grafiniame lange yra viena eilut� ir vienas stulpelis.
# Parametro reik�m� yra du elementus turintis sveik�j� skai�i� vektorius. Pirmas
# skai�ius nurodo eilu�i�, antras - stulpeli� skai�i�. Jeigu grafinis langas yra
# padalinamas � dalis kei�iant parametro mfrow reik�m�, tai tos dalys u�pildomos 
# grafikais pagal eilutes i� kair�s � de�in�. Jeigu kei�iama mfcol reik�m�, tada
# grafikai brai�omi stulpeliais i� vir�aus � apa�i�. 

# Pavyzd�iui, grafin� lang� padalinsime vertikaliai � dvi dalis, nubrai�ysime du
# skirtingus grafikus.

par(mfrow = c(1, 2))

plot(Temp ~ 1, data = airquality, pch = 20, frame = FALSE)
boxplot(Temp ~ Month, data = airquality, frame = FALSE)


# NAUDINGA ------------------------------

# Da�nai tenka nagrin�ti ir tarpusavyje palyginti daug tokio paties tipo grafik�. 
# Tam, kad visi grafikai b�t� matomi vienu metu, juos galima nubrai�yti � kelet�
# dali� sudalintame grafiniame lange. Tarkime, kad eksperimentas pakartojamas 25 
# kartus. Reikia nubrai�yti kiekvieno bandymo matavim� histogramas. �ia duomenys 
# duoti matricos pavidalu.

duomenys <- replicate(25, rnorm(200, sample(20, 1)))


# Nauj� grafin� lang� padaliname � 25 ma�esnius langus. Papildomai nurodome vis�
# lang� para��i� plo�ius.

windows(10, 8)
par(mfrow = c(5, 5), mar = c(2, 2, 1, 1))

# Apskai�iuojame grafik� a�i� ribas.

xx <- round(range(duomenys) + c(-0.5, 0.5))
yy <- c(0, 60)


# Funkcij� hist �statome � cikl�. Ant kiekvienos histogramos papildomai u�dedame
# duomen� matricos stulpelio numer�.

for (i in 1:ncol(duomenys)) {

  nr <- sprintf("%02d", i)

  hist(duomenys[, i], breaks = 10, xlim = xx, ylim = yy, ann = FALSE)
  mtext(nr, 3, -2, font = 2, adj = 0.9)
}


# NAUDINGA ------------------------------

# Vokie�i� dailininko Albrechto Diurerio paveikslas Melencolia I garsus tuo, kad
# jame pavaizduotas magi�kas kvadratas. Tai toks kvadratas, kuriame skai�i� suma
# eilut�se, stulpeliuose ir �stri�ain�se yra vienoda. Nubrai�ysime tok� kvadrat�.
#
#    +----+----+----+----+
#    | 16 | 3  | 2  | 13 |
#    +----+----+----+----+
#    | 5  | 10 | 11 | 8  |
#    +----+----+----+----+
#    | 9  | 6  | 7  | 12 |
#    +----+----+----+----+
#    | 4  | 15 | 14 | 1  |
#    +----+----+----+----+

kvadratas <- c(16, 5, 9, 4, 3, 10, 6, 15, 2, 11, 7, 14, 13, 8, 12, 1)

# Grafin� lang� padaliname � 4 stulpelius ir 4 eilutes. Tokiu b�du gauname 4 x 4 
# vienod� langeli�, kurie visi yra savaranki�ki grafikai. Visi kartu jie sudarys
# magi�k� kvadrat�. Kadangi kvadrato skai�iai sura�yti pagal stulpelius, grafin� 
# lang� sudalinsime naudojant parametr� mfcol.

par(mfcol = c(4, 4))

# Kiekvieno tokio grafiko centre u�ra�ysime po vien� skai�i� i� magi�ko kvadrato.
# Sudarome funkcij�, kuri skai�i� x u�ra�o grafiko centre. Nurodome, kad grafiko
# para�t�s b�t� nulin�s, u�draud�iame brai�yti koordina�i� a�is ir nurodome, kad
# b�t� r�melis u�dedamas ant viso grafinio langelio.

centras <- function(x) {

  # Nurodome grafinio lango para��i� plot�.
  par(mar = rep(0, 4))

  plot(0, 0, type = "n", axes = FALSE, ann = FALSE, frame = FALSE)
  text(0, 0, label = x, cex = 4)
  box(which = "figure")
}

# �i� funkcij� �statome � cikl� ir taip skai�iais u�pildome visas grafinio lango
# dalis.

for (x in kvadratas) centras(x)


# U�DUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    


# --------------------------------------- #
# FUNKCIJA LAYOUT                         #
# --------------------------------------- #

# Jeigu grafinis langas padalinamas � dalis naudojant grafinius parametrus mfrow
# arba mfcol, tada visos tos dalys yra vienodo dyd�io. Be to, negalima nustatyti
# t� dali� u�pildymo tvarkos. Tokie apribojimai kartais gali sukelti nepatogum�.
# J� galima i�vengti naudojant funkcij� layout. �i f-ja leid�ia sukurti grafinio
# lango padalijimo � dalis plano matric� ir nustatyti stulpeli� ir eilu�i� plot�.
# Pagrindiniai jos parametrai �ie:
#
#        mat -- matrica, kurios elementai nurodo lango dali� u�pildymo tvark�,
#     widths -- grafinio lango stulpeli� plo�i� vektorius,
#    heights -- grafinio lango eilu�i� auk��i� vektorius.

# Plano matricos element� reik�m�s gali b�ti 0 arba sveikieji teigiami skai�iai. 
# Matricoje gali b�ti pasikartojan�i� reik�mi�. T� pa�i� reik�m� turin�ios lango
# dalys yra apjungiamos � vien�. Reik�m� 0 nurodo, kad atitinkama grafinio lango
# dalis nenaudojama.

# Pavyzd�iui, tarkime, kad grafin� lang� reikia padalinti � dvi eilutes bei tris 
# stulpelius, o j� u�pildymo tvark� nusako tokia matrica:
#
#    +----+----+----+
#    | 1  | 2  | 5  |
#    +----+----+----+
#    | 3  | 4  | 6  |
#    +----+----+----+

# U�ra�ome grafik� brai�ymo tvarkos vektori�.
i <- c(1, 2, 5, 3, 4, 6)

# Sudarome 2 x 3 dyd�io grafik� i�d�stymo plano matric�.
m <- matrix(i, nrow = 2, ncol = 3, byrow = TRUE)
m 

layout(m)

# Naudojant funkcij� layout.show, grafiniame lange galima parodyti atskir� lang�
# numerius. �ios funkcijos argumentas yra toki� lang� skai�ius. Nurodysime visus
# �e�is langus.

layout.show(6)

# Nubrai�ome keturis statistinius grafikus. Jie grafiniame lange i�d�stomi pagal 
# duod� plano matric�.

plot(Nile)
boxplot(Nile)
hist(Nile)
qqnorm(Nile)


# Sudarysime toki� grafinio lango padalijimo plano matric�, kad tie patys keturi 
# grafikai b�t� i�d�styti taip:
#
#    +----+----+----+
#    |      1       |
#    +----+----+----+
#    | 2  | 3  | 4  |
#    +----+----+----+

# Nors plano matrica yra tokio paties dyd�io 2 x 3, ta�iau �iuo atveju ji apra�o 
# keturias grafinio lango dalis.

i <- c(1, 1, 1, 2, 3, 4)
m <- matrix(i, nrow = 2, ncol = 3, byrow = TRUE)

layout(m)
layout.show(4)

plot(Nile)
boxplot(Nile)
hist(Nile)
qqnorm(Nile)


# Jeigu parametr� widths ir heights reik�m�s nenurodomos, tai santykinis eilu�i� 
# ir stulpeli� plotis pagal nutyl�jim� yra vienodas ir lygus 1. Kei�iant santyk�,
# galima reguliuoti eilu�i� ir stulpeli� plot�. Pvz., jei viena eilut� turi b�ti 
# du kartus platesn� u� kit�, tada jos plo�io koeficientas taip pat turi b�ti du 
# kartus didesnis u� kitos eilut�s plo�io koeficient�. 

# Pavyzd�iui, grafin� lang� padalinsime � dvi eilutes ir tris stulpelius, ta�iau
# �� kart� antros eilut�s plot� padarysime dvigubai ma�esn�, o stulpeli� plo�iai 
# tegul lieka vienodi.

layout(m, heights = c(2, 1))
layout.show(4)

plot(Nile)
boxplot(Nile)
hist(Nile)
qqnorm(Nile)


# NAUDINGA ------------------------------

# Grafin� lang� suskirstant � kelet� �vairaus dyd�io dali�, galima sudaryti gana
# sud�ting� diagram�. Pavyzd�iui, nubrai�ysime dviej� kintam�j� sklaidos grafik�
# ir �alia nubrai�ysime atskirai vieno ir kito kintamojo sta�iakampes diagramas.

# Grafin� lang� suskirstysime � 4 dalis: pagrindin�je dalyje brai�omas kintam�j� 
# x ir y sklaidos grafikas, antroje ir tre�ioje sta�iakamp�s diagramos, ketvirta
# dalis nenaudojama. Kadangi sta�iakamp�s diagramos siauros, tai antra eilut� ir
# antras stulpelis bus 4 kartus siauresni nei pirma eilut� ir pirmas stulpelis.

layout(matrix(c(1, 2, 3, 0), 2, 2), widths = c(4, 1), heights = c(4, 1))
layout.show(3)

x <- airquality$Temp
y <- airquality$Ozone

# Pirmiausia nubrai�ome pagrindin� sklaidos diagram�. Nustatome para��i� plo�ius.

par(mar = c(2, 3, 1, 1))
plot(x, y, pch = 19, frame = FALSE, las = 1)

# PASTABA. Atskiros grafinio lango dalys yra nesusijusios. Kad i� keleto grafik� 
# sudaryta diagrama b�t� teisinga, turi sutapti atskir� grafik� koordina�i� a�ys.
# Pvz., apa�ioje brai�omos diagramos Ox a�is turi sutapti su pagrindinio grafiko
# Ox a�imi. �iuo atveju u�tenka nustatyti vienodas para�tes i� kair�s ir de�in�s.
# Kadangi a�ys sutapatintos, nurodome, kad naujame grafike a�ys neb�t� brai�omos.

par(mar = c(0, 3, 0, 1))
boxplot(x, frame = FALSE, axes = FALSE, horizontal = TRUE)

# Kad sutapt� pagrindinio ir �oninio grafiko Oy a�ys, nustatome vienod� para��i�
# plot� i� apa�ios ir vir�aus. Kaip ir ankstesniu atveju, a�i� nebrai�ome.

par(mar = c(2, 0, 1, 0))
boxplot(y, frame = FALSE, axes = FALSE)


# U�DUOTIS ------------------------------ 

# 1. Naudojant funkcij� layout, nubrai�ykite 8 x 8 dyd�io �achmati�kai i�d�styt� 
#    juod� ir balt� kvadrat� diagram�.
# 2. 
#    


# --------------------------------------- #
# BRAI�YMO SRITIES APRIBOJIMAS            #
# --------------------------------------- #

# Kaip �inoma, visos auk�to lygio grafin�s funkcijos atidaro nauj� grafin� lang�
# arba prie� brai�ant grafik� i�valo jau atidaryt� lang�. Papildomus ta�kus arba
# linijas ant grafiko galima nubrai�yti naudojant �emo lygio grafines funkcijas. 
# Kai kurios auk�to lygio grafin�s funkcijos turi parametr� add. Jeigu priskirta
# reik�m� TRUE, tai naujas grafikas u�dedamas ant jau nubrai�yto grafiko vir�aus.

# Pavyzd�iui, nubrai�ysime vandens lygio reik�mi� histogram� ir ant jos u�d�sime
# normaliojo atsitiktinio dyd�io teorin�s tankio funkcijos grafik�. Tok� grafik�
# grafik� nubrai�ysime naudojant funkcij� curve su parametru add.

hist(Nile, freq = FALSE)

vid <- mean(Nile)
std <- sd(Nile)

curve(dnorm(x, vid, std), add = TRUE)


# �iuo atveju funkcijos grafikas u�dedamas ant visos histogramos. Ta�iau grafiko
# srit�, kurioje bus matomas ant vir�aus u�dedamas kitas grafikas, galima keisti.
# Tam naudojama funkcija clip, kuri sukuria savoti�k� sta�iakamp� trafaret�. Jos
# parametrai nurodo to sta�iakampio ribas:
#
#         x1 -- kairysis kra�tas,
#         x2 -- de�inysis kra�tas,
#         y1 -- apatinis kra�tas,
#         y2 -- vir�utinis kra�tas.

# Tarkim, kad reikia nubrai�yti funkcijos y = sin(x) grafik� intervale [-pi, pi], 
# ta�iau intervale [-2, 1] grafiko linija turi b�ti raudonos spalvos. I� prad�i�
# nubrai�ysime paprast� grafik� intervale [-pi, pi], o tada ant vir�aus u�d�sime 
# antr� kreiv� -- trafaretu apribot� raudonos spalvos sinusoid�.

curve(sin, -pi, pi, xlab = "x", ylab = "y", las = 1, frame = FALSE)

# Trafareto ribos i� kair�s ir de�in�s �inomos, o apatin� ir vir�utin� riba gali 
# sutapti su pradinio grafiko apatine ir vir�utine riba. Bet kokio grafiko ribas 
# nurodo grafinis parametras usr. Pirmosios dvi reik�m�s nurodo grafiko ribas i� 
# kair�s ir de�in�s, o kitos kitos dvi -- ribas i� apa�ios ir vir�aus. 

usr <- par("usr")
usr

# Nurodome trafareto ribas. Apatin� ir vir�utin� ribas paimame i� parametro usr.

clip(-2, 1, usr[3], usr[4])

# Ant vir�aus raudona linija brai�ome antr� sinusoid�. Funkcija curve yra auk�to 
# lygio grafin� funkcija, tod�l tam, kad antra kreiv� b�t� brai�oma ant vir�aus, 
# parametrui add priskiriame reik�m� TRUE. Atkreipkite d�mes� � tai, kad grafiko
# ribos nurodytos [-pi, pi], bet raudona linija bus matoma tik intervale [-2, 1].

curve(sin, -pi, pi, add = TRUE, col = "red", lwd = 2)

# Kart� nustatytos trafareto ribos tokios ir i�lieka. Pvz., ant grafiko u�d�sime 
# tinklel�, ta�iau jis vis tiek bus matomas tik intervale [-2, 1].

grid()

# Norint sugr��inti pradin� brai�ymo srit�, trafareto ribas reik�t� i�pl�sti iki
# pradinio grafiko rib�. Tam galima panaudoti prie� tai i�saugotas parametro usr
# reik�mes ir perduoti jas funkcijai clip per toki� konstrukcij�:

do.call(clip, as.list(usr))


# U�DUOTIS ------------------------------ 

# 1. Nubrai�ykite kintamojo Nile reik�mi� histogram�, kurioje stulpeliai � kair� 
#    nuo pirmojo ir � de�in� nuo tre�iojo kvartilio b�t� nuspalvinti raudonai.
# 2. 
#    