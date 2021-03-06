
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Grafiko a�i�, r�melio ir tinklelio formavimas.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2014-06-10 | 2014-06-27
#


# TURINYS -------------------------------

#
#   1. Grafiko a�i� sudarymas:
#      * funkcija axis
#
#   2. Koordina�i� a�i� padalijimo ta�k� radimas:
#      * funkcija axTicks
#      * funkcija axisTicks
#
#   3. R�melio ir tinklelio brai�ymas:
#      * funkcija box
#      * funkcija grid
#


# PASTABOS ------------------------------

#
# Papildyti apie box() parametrus.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# GRAFIKO A�I� FORMAVIMAS                 #
# --------------------------------------- #

# Auk�to lygio grafin�s funkcijos diagramos a�is suformuoja automati�kai, ta�iau
# jas galima pakeisti. Taip daroma tada, kada automati�kai sudaryta a�is netinka 
# ir sudaroma nauja. Tam naudojama speciali funkcija axis. Da�niausiai naudojami 
# �ie funkcijos parametrai:
#
#       side -- a�ies pozicija: 1 apa�ioje, 2 kair�je, 3 vir�uje, 4 de�in�je,
#         at -- padalinimo ta�k� vektorius,
#     labels -- loginis arba padalinimo ta�k� pavadinim� vektorius.

# Naudojant grafinius parametrus xaxt ir yaxt galima u�drausti brai�yti vien� ar 
# abi grafiko a�is. I� karto abi a�is galima u�drausti per login� parametr� axes.

curve(sin, -pi, pi, axes = FALSE)

# Standartines a�is grafikui galima atstatyti vien tik nurod�ius parametr� side.
# �ia parametro reik�m� 1 nurodo, kad a�is bus apa�ioje, o 2 --- kair�je pus�je.
# Kadangi side yra pirmas f-jos axes parametras, jo vardo galima nera�yti.

axis(1)
axis(2)

# Sinusoid�s grafike Ox a�� nat�raliau sudalinti ne kas vienet�, ta�iau kas pi/2. 
# Sudalinimo ta�k� vektori� sudarysime su funkcija seq ir priskirsime parametrui 
# at.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, at = seq(-pi, pi, by = pi/2))


# Matome, kad a�ies padalinimo ta�kuose u�ra�ytos teisingos reik�m�s, ta�iau jos
# d�l savo u�ra�ymo pavidalo nelabai informatyvios. �iuo atveju galima i�naudoti
# funkcij� expression ir tas reik�mes u�ra�yti per skai�i� pi. Taip bus gra�iau.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")

Ox.tas <- seq(-pi, pi, by = pi/2)
Ox.pav <- expression(-pi, -pi/2, 0, pi/2, pi)

axis(1, at = Ox.tas, labels = Ox.pav)


# Reik�m�s gali b�ti sura�ytos neb�tinai ties kiekvienu a�ies padalinimo ta�ku.
# Tokiu atveju parametrui label priskiriame vektori� su praleistomis reik�m�mis.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")

Ox.tas <- seq(-pi, pi, by = pi/4)
Ox.pav <- expression(-pi, NA, -pi/2, NA, 0, NA, pi/2, NA, pi)

axis(1, at = Ox.tas, labels = Ox.pav)


# Toje pa�ioje pozicijoje galima prid�ti kelias a�is. Kiekviena a�is gali tur�ti
# savo padalinimo ta�kus ir j� pavadinimus.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")

Ox.tas <- seq(-pi, -pi/4, by = pi/4)
Ox.pav <- expression(-pi, -3*pi/4, -pi/2, -pi/4)

axis(1, at = Ox.tas, labels = Ox.pav)
axis(1, at = seq(0, 3, by = 0.5), labels = c(0, NA, 1, NA, 2, NA, 3))


# Dar vienas pavyzdys, kaip toje pa�ioje pozicijoje atidedamos 2 skirtingos a�ys.
# Viena i� j� padalina a�� � intervalus, o kita --- t� interval� viduryje u�deda
# j� pavadinimus. Tod�l pirmoje a�yje nera�omi sudalinimo ta�kai, o antroje n�ra
# a�ies linijos.

curve(sin, -pi, pi, axes = FALSE, ann = FALSE)

Ox.ta1 <- seq(-pi, pi, pi/2)
Ox.ta2 <- seq(-3*pi/4, 3*pi/4, pi/2)

axis(1, at = Ox.ta1, labels = FALSE)
axis(1, at = Ox.ta2, labels = LETTERS[1:4], tick = FALSE)

abline(v = Ox.ta1, lty = 2, col = "gray")


# Funkcija axis turi ir daugiau parametr�, kuriais galima nustatyti bendr� a�ies 
# arba atskir� jos dali� vaizd�:
# 
#       tick -- loginis, nurodo ar brai�yti a�ies linij�,
#       line -- eilut�s, kurioje brai�oma a�is, numeris,
#        pos -- koordinat�, ties kuria nubr��iama a�is, 
#       hadj -- nustato a�ies u�ra�� poslink� horizontaliai,
#       padj -- nustato a�ies u�ra�� poslink� vertikaliai,
#        lty -- linijos tipas: 0 -- nebrai�oma, 1 -- i�tisin� ir taip iki 7,
#        lwd -- linijos storis,
#        col -- linijos spalva,
#  lwd.ticks -- padalijimo br�k�neli� storis,
#  col.ticks -- padalijimo br�k�neli� spalva.

# Kartais grafike u�ra�ai ant a�ies nereikalingi. Tokiu atveju parametrui labels 
# priskiriame reik�m� FALSE.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, labels = FALSE)

# Galima ir prie�inga situacija, kai a�ies linija nereikalinga, o reikalingi tik 
# a�ies padalijimo ta�k� u�ra�ai. Tada parametrui tick priskiriame reik�m� FALSE.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, tick = FALSE)

# Tok� pat� efekt� galima pasiekti ir naudojant linijos tipo parametr� lty. �iam
# parametrui priskyrus nulin� reik�m�, a�is i� viso nebrai�oma.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, lty = 0)


# Paprastai a�ys brai�omos u� funkcijos grafiko ar kitokios diagramos rib�, t.y. 
# para�t�se. Para�t�s eilut�s, kurioje atidedama a�is, numer� nurodome naudojant 
# parametr� line. Pagal nutyl�jim� a�is brai�oma nulin�je eilut�je. 

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, line = 0)
axis(1, line = 2)

# A�ies pozicij� grafike galima nurodyti u�ra�ant kitos a�ies kirtimo koordinat�.
# Tam naudojamas parametras pos.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, pos = -0.5)
axis(1, pos =  0.5)


# U�ra�us ties a�ies padalinimo ta�kais galima pastumti � kair� arba de�in�. Tam
# naudojamas parametras hadj. Pagal nutyl�jim� jam priskiriama reik�m� 0.5, kuri
# rei�kia, kad u�ra�ai ties padalinimo ta�kais centruojami. Didinant �i� reik�m�,
# u�ra�ai pastumiami � kair�. Jei u�ra�us ties padalinimo ta�kais reikia pakelti 
# vir� a�ies linijos arba nuleisti dar �emiau, naudojamas parametras padj.

# Pavyzd�iui, nubrai�ysime sinusoid�s grafik�, kuriame Ox a�is Oy a�� kert� ties
# nuliu. Galime pasteb�ti, kad funkcijos grafikas kerta kair�j� padalinimo ta�k�
# u�ra��. �� grafiko defekt� galima i�taisyti dviem b�dais: arba nerodyti u�ra�o 
# "-3", arba j� pakelti vir� a�ies. Antruoju atveju naudojamas parametras padj.
# Jam priskiriame vis� u�ra�� ties padalinimo ta�kais post�mio reik�mi� vektori�.

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, pos = 0, at = -3:3, labels = c(NA, -2:3))

curve(sin, -pi, pi, frame = FALSE, xaxt = "n")
axis(1, pos = 0, padj = c(-4, rep(0, 6)))


# NAUDINGA ------------------------------

# Ne visi grafikai turi �prastas koordina�i� a�is. Pvz., stulpelin�je diagramoje 
# svarbiausia yra stulpeli� auk�tis, o stulpeliai ant ties�s gali b�ti i�d�styti 
# bet kokia tvarka - nuo to i� esm�s niekas nesikei�ia. Pavyzd�iui, nubrai�ysime
# Titaniko keleivi� pasiskirstymo pagal lyt� skirtingose keleivi� klas�se da�ni�
# diagram�.

d <- margin.table(Titanic, c(2, 1))
d

barplot(d)

# U�ra�us po kategorij� stulpeliais galima keisti parametrui names.arg priskyrus 
# kit� reik�mi� vektori�. 

barplot(d, names.arg = c("Pirma", "Antra", "Tre�ia", "�gula"))

# Parametrui axes priskyrus reik�m� FALSE, dingsta tik Oy a�is, o u�ra�ai ant Ox 
# a�ies i�lieka. Galima sakyti, kad stulpelin� diagrama formaliai turi tik vien� 
# Oy a��, kadangi Ox a�is pagal nutyl�jim� i� viso nebrai�oma.

barplot(d, axes = FALSE)

# Stulpelin�s diagramos Ox a�ies linijos tip� reguliuoja parametras axis.lty. Jo
# reik�m� pagal nutyl�jim� lygi nuliui. Priskyrus vienet�, a�is jau bus brai�oma.

barplot(d, axis.lty = 1)

# U�ra�� ant Ox a�ies rodymas priklauso nuo loginio parametro axisnames reik�m�s.
# Jei ji lygi FALSE, nepriklausomai nuo to, kam lygi parametro axis.lty reik�m�,
# Ox a�is nebrai�oma visai.

barplot(d, axisnames = FALSE)

# �inoma, a�is galima u�drausti ir naudojant standartinius grafinius parametrus 
# xaxt ir yaxt.

barplot(d, xaxt = "n")
barplot(d, yaxt = "n")


# Naudojant standartinius funkcijos axis nustatymus, nubrai�yti toki� pat Ox a��
# nepavyksta. Tuo galima nesunkiai �sitikinti.

barplot(d, axisnames = FALSE)
axis(1)

# Problema tame, kad stulpeli� centrai nesutampa su a�ies Ox padalinimo ta�kais. 
# �ioje situacijoje galima pasinaudoti tuo, kad f-ja barplot gali i�saugoti vis�
# stulpeli� centr� koordinates, kurias v�liau galima panaudoti a�ies sudalinimui.

barstat <- barplot(d, axisnames = FALSE)
barstat

axis(1, at = barstat)


# Kadangi stulpelin�je diagramoje skai�iai ant kategorinio kintamojo a�ies nieko 
# nerei�kia, juos pakeisime � kategorij� pavadinimus, o a�ies linij� u�drausime.

barstat <- barplot(d, axisnames = FALSE)
axis(1, at = barstat, labels = c("Pirma", "Antra", "Tre�ia", "�gula"), tick = F)


# U�DUOTIS ------------------------------ 

# 1. Nubrai�ykite funkcijos y = sin(x) grafik� intervale [-pi, pi]. Grafike turi
#    b�ti dvi Ox a�ys: apa�ioje sugraduota kas pi/2, o vir�uje kas vienet�.
# 2. Nubrai�ykite lentel�s airquality kintamojo Temp kitimo laike grafik�, kuris
#    tur�t� dvi Oy a�is. Vienoje i� j� temperat�ra matuojama Farenheito skal�je, 
#    kitoje -- pagal Celsij�.
# 3. Nubrai�ykite da�ni� lentel�s d stulpelin� diagram� be Oy a�ies ir be u�ra��
#    ant Ox a�ies. Tam naudokite tik standartinius funkcijos barplot parametrus.
# 4. Nubrai�ykite da�ni� lentel�s d stulpelin� diagram� su parametru beside = T.
#    Gaunamos keturios grup�s po 2 stulpelius, kurie rodo vyr� ir moter� skai�i�. 
#    Grafik� pakeiskite taip, kad po kiekvienu stulpeliu b�t� para�yta lytis, o
#    dar �emiau b�t� u�ra�ytas kategorijos, kuriai priklauso kiekviena stulpeli� 
#    pora, pavadinimas.
# 5. Nubrai�ykite kintamojo Nile histogram�. Ant Ox a�ies turi b�ti pa�ym�ti tik
#    stulpeli� vidurio ta�kai, kurie korekti�kai atidedami nepriklausomai nuo to,
#    kiek stulpeli� yra histogramoje.
# 6. Nubrai�ykite lentel�s airquality kintamojo Temp kitimo laike grafik�. A�ies
#    Ox sudalinimo ta�kai turi sutapti su vieno m�nesio prad�ia ir kito pabaiga.
#    Ties sudalinimo ta�kais ant grafiko nubrai�ykite vertikalias pilkas linijas, 
#    o tarpuose tarp padalinimo ta�k� u�ra�ykite atitinkamo m�nesio pavadinim�.


# --------------------------------------- #
# A�IES PADALIJIMO TA�K� RADIMAS          #
# --------------------------------------- #

# Nubrai�yto grafiko a�i� padalinimo ta�kus galima gauti naudojant f-j� axTicks. 
# Jos rezultatas yra padalinimo ta�k� koordina�i� vektorius. Paprastai naudojami 
# �ie funkcijos parametrai:
#
#       side -- a�ies pozicija: 1 apa�ioje, 2 kair�je, 3 vir�uje, 4 de�in�je,
#        axp -- a�ies rib� ir interval� skai�iaus vektorius c(min, max, k),
#        usr -- grafiko rib� vektorius c(xmin, xmax, ymin, ymax),
#        log -- jei TRUE, tai nurodo, kad a�is logaritmin�je skal�je.

# Pavyzd�ui, nubrai�ysime funkcijos y = sin(x) grafik� be a�i�. Nustatysime, kam 
# lygios a�ies Ox sudalijimo ta�k� koordinat�s, kurios b�t� naudojamos, jei a�is 
# b�t� brai�oma.

curve(sin, -pi, pi, axes = FALSE)
axTicks(1)

# A�ies padalijimo ta�k� vektorius priklauso nuo grafiko. Norint, kad rezultatas
# nepriklausyt� nuo konkretaus grafiko, reikia nurodyti vis� parametr� reik�mes.
# Pavyzd�iui, apskai�iuosime intervalo nuo 5 iki 20, padalijimo � 6 lygias dalis 
# ta�k� koordinates, kai viso grafiko ribos pagal Ox a�� nustatytos nuo 0 iki 25.

axTicks(side = 1, axp = c(5, 20, 6), usr = c(0, 25, -10, 10), log = FALSE)

# Toki� koordina�i� vektori� galima panaudoti automatiniam grafiko padalinimui � 
# sektorius pagal a�ies sudalinimo ta�kus. Pavyzd�iui, nubrai�ysim laiko eilut�s 
# grafik� ir j� padalinsime � kelet� laiko interval�.

plot(Nile)
abline(v = axTicks(1), col = "red")


# Negrie�tam intervalo sudalijimui lygiomis dalimis naudojama funkcija axisTicks. 
# Funkcijos rezultatas yra intervalo sudalijimo lygiomis dalimis ta�k� vektorius.
# Tam, kad ta�k� koordinat�s b�t� tam tikra prasme "gra�ios", pradinio intervalo 
# galai ir padalijimo ta�k� skai�ius gali b�ti automati�kai �iek tiek pataisyti. 
# Funkcijos parametrai:
#
#        usr -- grafiko rib� pagal vien� a�� vektorius c(min, max),
#        log -- jei TRUE, tai nurodo, kad a�is logaritmin�je skal�je,
#        axp -- a�ies rib� ir interval� skai�iaus vektorius c(min, max, k),
#       nint -- pageidaujamas interval� dali� skai�ius.

# Pavyzd�iui, lygiomis dalimis sudalinsime interval� [-5, 15]. Jei interval� sk.
# nenurodome, jis parenkamas automati�kai. Matome, kad nedaug pakeitus intervalo 
# galus, funkcijos rezultatas nepasikei�ia - gaunami tie patys sudalinimo ta�kai.

axisTicks(usr = c(-5.0, 15.0), log = FALSE)
axisTicks(usr = c(-5.3, 15.9), log = FALSE)

# Nurod�ius intervalo dali� skai�i�, � pageidavimus atsi�velgiama tik i� dalies.

axisTicks(usr = c(-5, 15), log = FALSE, nint = 4)
axisTicks(usr = c(-5, 15), log = FALSE, nint = 5)
axisTicks(usr = c(-5, 15), log = FALSE, nint = 6)
axisTicks(usr = c(-5, 15), log = FALSE, nint = 7)


# --------------------------------------- #
# R�MELIO IR TINKLELIO BRAI�YMAS          #
# --------------------------------------- #

# Kai kurios auk�to lygio grafin�s funkcijos grafik� apriboja r�meliu. Paprastai 
# toks r�melis visi�kai nereikalingas. Parametrui frame priskyrus reik�m� FALSE, 
# r�melis nebus brai�omas. Palyginsime kelet� tipini� grafik� su r�meliu ir be. 

curve(sin, -pi, pi)
curve(sin, -pi, pi, frame = FALSE)

plot(Nile)
plot(Nile, frame = FALSE)

boxplot(Temp ~ Month, data = airquality)
boxplot(Temp ~ Month, data = airquality, frame = FALSE)


# Globaliai r�melio brai�ym� arba nebrai�ym� reguliuoja grafinis parametras bty.
# Pagal nutyl�jim� jo reik�m� lygi "o". Jei reikia, kad r�melis b�t� nebrai�omas
# visuose grafikuose, parametrui bty priskiriame reik�m� "n".

par("bty" = "n")

curve(sin, -pi, pi)
plot(Nile)
boxplot(Temp ~ Month, data = airquality)

par("bty" = "o")


# Jei parametrui bty reik�m� priskiriama kaip grafin�s funkcijos argumentui, tai
# jo poveikis pasirei�kia tik tos funkcijos sudarytam grafikui. Pavyzd�iui, taip
# galima vienai konkre�iai funkcijai u�drausti brai�yti r�mel�.

curve(sin, -pi, pi)
curve(sin, -pi, pi, bty = "n")


# R�meliui ant jau nubrai�yto grafiko u�d�ti naudojama funkcija box. Pavyzd�iui, 
# histograma brai�oma be r�melio, bet j� galima u�d�ti papildomai.

hist(Nile)
box()

# Kaip ir kitoms funkcijoms, funkcijai box kaip argument� galima perduoti bendro 
# pob�d�io grafini� parametr� reik�mes. Pvz., galima pakeisti r�melio spalv�.

hist(Nile)
box(col = "red")


# Koordina�i� tinklelis ant jau nubrai�yto grafiko u�dedamas naudojant f-j� grid. 
# Jos parametrai:
#
#         nx -- tinklelio langeli� skai�ius ant Ox a�ies, 
#         ny -- tinklelio langeli� skai�ius ant Oy a�ies,
#        col -- tinklelio linij� spalva, 
#        lty -- tinklelio linij� tipas: 1 -- i�tisin�, 2 -- punktyras ir t.t.,
#        lwd -- tinklelio linij� storis.

# Pagal nutyl�jim� parametr� nx ir ny reik�m�s yra NULL, tod�l tinklelio linijos 
# sutampa su a�i� padalijimo ta�kais, kurie b�t� gauti su f-ja axTicks. 

curve(sin, -pi, pi)
grid()

curve(sin, -pi, pi)
grid(nx = 2, ny = 2)

# Jei parametrui nx arba ny priskiriama reik�m� NA, tinklelio linijos atitinkama
# kryptimi nebrai�omos.

curve(sin, -pi, pi)
grid(nx = NA, ny = NULL)

# Jei kitaip nenurodyta, brai�omos �viesiai pilkos "lightgray" ta�kin�s "dotted"
# linijos. �inoma, �i� parametr� reik�mes galima pakeisti.

curve(sin, -pi, pi)
grid(col = "red", lty = 2)


# NAUDINGA ------------------------------

# R�melio ribos priskiriamos grafiniam parametrui usr. Jo reik�m� -- koordina�i� 
# c(xmin, xmax, ymin, ymax) vektorius. Turint jau nubrai�yt� grafik�, jas galima 
# gauti naudojant funkcij� par.

hist(Nile)

ribos <- par("usr")
ribos

# Turint tokias koordinates, r�mel� ant grafiko galima u�d�ti naudojant funkcij�
# abline. Tam reikia nubrai�yti dvi vertikalias ir dvi horizontalias linijas.

abline(v = ribos[1:2], h = ribos[3:4])


# Funkcijos grid galimyb�s gan ribotos, tod�l tinklelio brai�ymui galima naudoti 
# funkcij� abline. Pavyzd�iui, nubrai�ysime sinusoid�s grafik�, kuriame Ox a�ies 
# sudalinimo ta�kai kas pi/2, o tinklelio linijos dvigubai tankesn�s -- kas pi/4.

curve(sin, -pi, pi, xaxt = "n")

axis(1, at = seq(-pi, pi, pi/2), labels = expression(-pi, -pi/2, 0, pi/2, pi))

abline(v = seq(-pi, pi, pi/4), col = "lightgray", lty = "dotted")
abline(h = seq(-1., 1., 0.25), col = "lightgray", lty = "dotted")


# Tinklelis neb�tinai turi b�ti tolygus. Pvz., nubrai�ysime eksponent�s grafik�,
# kuriame tarpai tarp vertikali� tinklelio linij� taip pat eksponenti�kai did�ja.

curve(exp, 0, 4)
abline(v = exp(0:30/10) - 1, col = "gray")


# Tinklel� galima nubrai�yti ir gana egzoti�ku b�du. Galima pasinaudoti tuo, kad
# a�ies padalijimo br�k�neli� ilg� galima i�reik�ti per grafiko ilg� arba plot�. 
# Jeigu parametrui tck priskiriame reik�m� 1, tai br�k�nelio ilgis, priklausomai 
# a�ies, sutampa su viso grafiko auk��iu arba plo�iu.

curve(sin, -pi, pi)
axis(1, tck = 1, col.ticks = "lightgray", lty = "dotted")
axis(2, tck = 1, col.ticks = "lightgray", lty = "dotted")


# U�DUOTIS ------------------------------ 

# 1. Nubrai�ykite da�ni� lentel�s d stulpelin� diagram�. Papildomai u�d�kite jai
#    r�mel�, ta�iau taip, kad auk��iausias stulpelis su r�meliu nesiliest�.
# 2. Nubrai�ykite funkcijos y = x*sin(x) grafik� intervale [0, 5pi]. Suformuokit
#    tok� tinklel�, kur vertikalios ir horizontalios linijos eit� per funkcijos
#    lokali� minimum� ir maksimum� ta�kus.