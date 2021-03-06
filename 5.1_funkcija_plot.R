
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Funkcija plot ir pagrindiniai jos parametrai.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2014-02-26 | 2014-03-09 | 2014-06-18
#


# TURINYS -------------------------------

#
#   1. Funkcija plot ir pagrindiniai jos parametrai:
#      * parametrai x ir y 
#      * parametras type 
#      * parametras pch 
#      * parametras cex 
#      * parametras lty 
#      * parametras lwd 
#      * parametras col 
#
#   2. Papildomi funkcijos plot parametrai:
#      * parametrai main ir sub 
#      * parametrai xlab ir ylab
#      * parametrai xlim ir ylim
#      * parametras asp 
#      * parametras ann 
#      * parametras frame 
#      * parametrai xaxt ir yaxt
#      * parametras axes 
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
# FUNKCIJA PLOT IR JOS PARAMETRAI         #
# --------------------------------------- #

# Pagrindin� grafik� ir �vairi� diagram� brai�ymo funkcija yra plot. Tai bendro 
# pob�d�io (generic) funkcija, kuri skirtingo tipo duomenims atvaizduoti naudoja 
# skirtingus metodus. Susipa�insime su plot.default medodu, kuris naudojamas tuo 
# atveju, kai sudaroma ta�k� su koordinat�mis x ir y sklaidos diagrama. Esminiai 
# funkcijos plot parametrai:
# 
#      x -- x reik�mi� vektorius (abscis�),
#      y -- y reik�mi� vektorius (ordinat�).
#
# Diagramos i�vaizd� galima pakeisti nurodant kitas grafini� parametr� reik�mes. 
# Da�niausiai naudojami �ie parametrai:
#
#   type -- sklaidos diagramos tipas,
#    pch -- ta�ko simbolis,
#    cex -- ta�ko simbolio dydis,
#    lty -- linijos tipas,
#    lwd -- linijos storis,
#    col -- ta�ko arba linijos spalva.


# Nubrai�ysime paprast� ta�k� (x, y) sklaidos diagram�. �iuo atveju vektoriaus y 
# elementai yra tam tikros funkcijos y = f(x) reik�m�s ta�kuose x.

x <- -5:15
y <- x^3 - 10*x^2 - 10*x + 3

# Parametrams x ir y priskirsime kintamuosius x ir y. Jei parametr� pavadinimai
# nurodomi, reik�mes jiems galima priskirti bet kokiu eili�kumu.

plot(x = x, y = y)
plot(y = y, x = x)

# Jei parametrai sura�omi nustatyta tvarka, tai j� pavadinim� galima ir nera�yti. 

plot(x, y)


# Pademonstruosime, kaip, kei�iant parametro type reik�m�, gaunami kiti sklaidos
# diagramos variantai. Vienas nuo kito jie skiriasi ta�k� (x, y) atvaizdavimo ir 
# j� sujungimo b�dais.

plot(x, y, type = "p")       # diagramoje atidedami nesujungti ta�kai
plot(x, y, type = "l")       # nubrai�oma ta�kus jungianti lau�t�
plot(x, y, type = "b")       # ta�kai sujungiami ties�s atkarpomis
plot(x, y, type = "o")       # brai�omi ir ta�kai, ir juos jungianti lau�t�
plot(x, y, type = "s")       # brai�oma laiptuota lau�t� I
plot(x, y, type = "S")       # brai�oma laiptuota lau�t� II
plot(x, y, type = "h")       # ta�kuose x atidedami y auk��io stulpeliai

plot(x, y, type = "n")       # suformuojamas grafikas be ta�k�


# Kei�iant parametro pch reik�m�, galima nurodyti, kokiu simboliu �ioje sklaidos 
# diagramoje bus vaizduojamas ta�kas. Sveikieji skai�iai nuo 0 iki 25 �ymi spec.
# daugiausiai naudojamus simbolius, skai�iai nuo 32 iki 127 �ymi ASCII simbolius.
# Be to, parametro pch reik�m� gali b�ti ir bet koks kabut�se �ra�ytas tekstinis 
# simbolis.

plot(x, y)

plot(x, y, pch = 1)          # pagal nutyl�jim� naudojamas tu��ias ta�kas
plot(x, y, pch = 19)         # tokio pat dyd�io, ta�iau u�pildytas ta�kas
plot(x, y, pch = "*")        # ta�ko simbolis gali b�ti nurodomas kabut�se
plot(x, y, pch = ".")        # ta�ko simbolis gali b�ti ir paprastas ta�kas


# Diagramos ta�ko simbolio dydis priklauso nuo mastelio parametro cex reik�m�s. 
# Pagal nutyl�jim� �i reik�m� lygi 1 ir tai atitinka standartin� simbolio dyd�.

plot(x, y, cex = 1)          # standartinis bet kokio ta�ko simbolio dydis
plot(x, y, cex = 2)          # du kartus padidintas ta�kas
plot(x, y, cex = 0.5)        # du kartus suma�intas ta�kas


# Kei�iant parametro lty reik�m�, galima keisti ta�kus jungian�ios linijos tip�:
# "blank", "solid", "dashed", "dotted", "dotdash", "longdash", "twodash". �iuos
# linijos tipus atitinka sveikieji skai�iai nuo 0 iki 6.

plot(x, y, type = "l", lty = 1)   # ta�kai jungiami i�tisine linija
plot(x, y, type = "l", lty = 2)   # ta�kai jungiami punktyrine linija
plot(x, y, type = "l", lty = 3)   # ta�kai sujungiami ta�kine linija


# Kei�iant parametro lwd reik�m�, kei�iamas diagramos ta�kus jungian�ios linijos 
# storis. Pagal nutyl�jim� �io parametro reik�m� lygi 1.

plot(x, y, type = "l", lwd = 1)   # standartinis linijos storis
plot(x, y, type = "l", lwd = 2)   # dvigubas linijos storis


# Diagramos ta�k� ir juos jungian�i� linij� spalva nustatoma naudojant parametr�
# col, kurio reik�m� yra spalvos pavadinimas. Standartini� R spalv� s�ra�as toks: 

colors()

# Vietoje spalv� pavadinim� galima naudoti spalv� numerius tam tikroje palet�je. 
# Pagal nutyl�jim� naudojama palet� turi 8 pagrindines spalvas, tod�l parametro
# col reik�m� 1 �ioje palet�je atitinka spalv� "black", reik�m� 2 - spalv� "red" 
# ir t.t. Kitoje spalv� palet�je tie patys numeriai gali reik�ti kitas spalvas!

palette()

plot(x, y, col = "black")
plot(x, y, col = "red")

plot(x, y, col = 1)
plot(x, y, col = 2)


# Naudojant parametr� bg, simboliams su numeriais nuo 21 iki 25 galima nurodyti 
# u�pildymo spalv�. Kaip ir anks�iau, tam galima naudoti spalvos numer� palet�je.

plot(x, y, pch = 21, col = 2)     # simbolio kont�ro spalva
plot(x, y, pch = 21,  bg = 2)     # simbolio u�pildymo spalva


# NAUDINGA ------------------------------

# Sklaidos diagramoje kiekvienas ta�kas gali b�ti vaizduojamas vis kitu simboliu.
# Tam parametrui pch reikia nurodyti simboli� vektori�. Jei jo element� skai�ius
# ma�esnis negu diagramos ta�k� skai�ius, ta�ko simboliai cikli�kai pakartojami. 
# Pavyzd�iui, nubrai�ysime sklaidos diagram� naudojant du pasikartojan�ius ta�ko 
# simbolius.

plot(x, y, pch = 1:2)

# Ta�ko simbolius nurodantys numeriai neb�tinai turi eiti i� eil�s, tod�l galima
# sudaryti bet kok� parametro reik�mi� vektori�.

plot(x, y, pch = c(1, 13))

# Ta�kus sklaidos diagramoje galima pavaizduoti net ir raid�mis.

plot(x, y, pch = letters)


# Keletos reik�mi� vektori� galima nurodyti ir kitiems parametrams. Pavyzd�iui,
# visi diagramos ta�kai gali b�ti skirting� dyd�i� ir spalv�. Vienu metu galima 
# keisti i� karto keli� parametr� reik�mes.

plot(x, y, pch = 22, cex = 1:3, col = 1:3)
plot(x, y, pch = 22, cex = 1:3,  bg = 1:3)


# Grafinius diagramos ta�ko parametrus galima kontroliuoti panaudojant papildom�
# kintam�j�. Tokiu b�du kiekvieno ta�ko dydis arba spalva keisis proporcingai to
# kintamojo reik�m�ms. Jei tas papildomas kintamasis yra kategorinis, tai galima 
# vizualiai atskirti skirtingas to kintamojo reik�mes atitinkan�ius ta�kus.

# Pavyzd�iui, nubrai�ysime diagram�, kur neigiam� y koordinat� turintys ta�kai
# bus atvaizduojami kita spalva. Tam sukursime papildom� kategorin� kintam�j� ir
# j� priskirsime spalvos parametrui col.

plot(x, y, pch = 20, col = factor(y < 0))


# U�DUOTIS ------------------------------ 

# 1. Nubrai�ykite funkcijos v = sin(u) grafik� intervale [-pi, pi]. Grafike turi
#    b�ti pavaizduoti: a) nesujungti ta�kai (u, v), b) i�tisin� linija be ta�k�, 
#    c) ta�kai ir juos jungianti m�lyna punktyrin� linija.
# 2. Nubrai�ykite ta�k� su koordinat�mis (x, y) sklaidos diagram�, kurioje ta�ko 
#    simbolio dydis b�t� proporcingas koordinat�s x reik�mei. Proporcingumo koef.
#    galima pasirinkti laisvai.
# 3. Nubrai�ykite toki� ta�k� su koordinat�mis (x, y) sklaidos diagram�, kurioje
#    ant visus ta�kus jungian�ios kreiv�s b�t� pavaizduoti tik tie ta�kai, kuri�  
#    koordinat� y < 0.
# 4. I� failo "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_1b.dat" 
#    nuskaitykite duomen� lentel�. Nubrai�ykite: a) �ios lentel�s kintam�j� x ir 
#    y sklaidos diagram�, b) diagram�, kurioje ta�k� (x, y) spalva priklauso nuo
#    tos pa�ios lentel�s kintamojo z reik�m�s.


# --------------------------------------- #
# PAPILDOMI FUNKCIJOS PLOT PARAMETRAI     #
# --------------------------------------- #

# Funkcija plot turi papildom� parametr�, kurie nustato diagramos a�i� ir bendr�
# grafiko antra�t�, nustato atskir� a�i� atra�tes, kei�ia a�i� ribas arba kitaip
# formuoja grafiko i�vaizd�. �ia da�niausiai naudojami tokie parametrai:
#
#   main -- bendra diagramos antra�t�, 
#    sub -- papildoma antra�t�,
#   xlab -- a�ies Ox antra�t�,
#   ylab -- a�ies Oy antra�t�,
#   xlim -- a�ies Ox reik�mi� kitimo ribos, vektorius c(x1, x2),
#   ylim -- a�ies Oy reik�mi� kitimo ribos, vektorius c(y1, y2),
#    asp -- nustatomas grafiko y/x kra�tini� santykis,
#  frame -- jei FALSE, grafikas brai�omas be r�melio,
#   axes -- jei FALSE, grafikas brai�omas be a�i�,
#    ann -- jei FALSE, grafikas rodomas be antra��i�,
#   xaxt -- jei "n", Ox a�is nebrai�oma,
#   yaxt -- jei "n", Oy a�is nebrai�oma.


# Pagrindin� grafiko antra�t� suformuojama naudojant parametr� main. Jo reik�m�
# yra � kabutes �ra�ytas antra�t�s tekstas, kuris u�ra�omas vir�utin�je grafiko 
# dalyje. Parametrui galima priskirti ir kintam�j� su antra�t�s tekstu.

plot(x, y, main = "Kintam�j� x ir y sklaidos diagrama")

# Naudojant naujos eilut�s simbol� \n, labai ilg� antra�t� galima u�ra�yti per
# kelias eilutes. �iuo atveju antra�t�s tekstas priskirtas atskiram kintamajam.

antra�t� <- "Per dvi eilutes u�ra�ytas\n labai ilgas grafiko pavadinimas"
plot(x, y, main = antra�t�)

# Parametras sub naudojamas papildomai antra�tei, kuri ra�oma grafiko apa�ioje.

plot(x, y, sub = "Papildoma antra�t�")


# Be papildom� nustatym� a�i� Ox ir Oy pavadinimai sutampa su parametrams x ir y 
# priskirt� kintam�j� vardais. Jiems pakeisti naudojami parametrai xlab ir ylab. 

plot(x, y)

plot(x, y, xlab = "x", ylab = "y = f(x)")

# Parametrams xlab ir ylab priskyrus kabut�se �ra�yt� tarpo simbol�, pavadinimai
# ant a�i� bus nematomi. 

plot(x, y, xlab = "", ylab = "")


# Pagal nutyl�jim� a�i� Ox ir Oy ribos nustatomos automati�kai ir jos parenkamos 
# taip, kad diagramoje b�t� atvaizduoti visi ta�kai (x, y). Jei tas ribas reikia
# padidinti arba suma�inti, naudojami parametrai xlim ir ylim. Pavyzd�iui, jeigu
# a�ies Ox reik�mi� kitimo ribos turi b�ti [a, b], tai parametrui xlim nurodomas
# vektorius c(a, b).

# I� prad�i� nustatysime, kokiose ribose kinta ta�k� (x, y) koordinat�s x ir y. 
# Vektoriaus element� �gyjam� reik�mi� ribos nustatomos naudojant komand� range.

range(x)
range(y)

# Galima parodyti, kad parametrams xlim ir ylim nusta�ius tokias ribas, gaunamas
# grafikas nesiskiria nuo automati�kai sudaromo grafiko. 

plot(x, y)
plot(x, y, xlim = range(x), ylim = range(y))

# Parametrams xlim ir ylim nurodomos ribos gali b�ti ir platesn�s, ir siauresn�s. 
# Tokiu b�du a�ies reik�mi� ribas galima apriboti ir parodyti tik dal� diagramos 
# ta�k�. Pavyzd�iui, diagramoje nerodysime ta�k� (x, y), kuri� koordinat� y < 0.

plot(x, y, ylim = c(0, 1000), type = "b")

# Pavyzd�iui, i�pl�sime a�ies Ox reik�mi� ribas nuo [-5, 15] iki [-10, 30].

plot(x, y, xlim = c(-10, 30))

# Jeigu parametrui nurodomos tokios ribos [a, b], kad a > b, tai atitinkama a�is 
# grafike nukreipiama � prie�ing� pus�. Pavyzd�iui, diagramoje apsuksime a�� Ox.

plot(x, y, xlim = c(30, -10))


# Bet kokios diagramos ar funkcijos grafiko i�vaizda priklauso nuo a�i� Ox ir Oy 
# mastelio. Kei�iant grafinio lango dyd�, kei�iasi ir grafiko kra�tini� santykis,
# tod�l i�temptas ar suspaustas grafikas atrodo skirtingai. Naudojant parametr� 
# asp, kra�tini� santyk� y/x galima u�fiksuoti.

plot(x, y)
plot(x, y, asp = 1/50)
plot(x, y, asp = 1/200)


# Naudojant login� parametr� frame.plot, galima u�drausti grafiko r�mel�.

plot(x, y, frame.plot = FALSE)

# Naudojant parametr� axes, galima nurodyti, kad grafikas b�t� brai�omas be a�i�.
# Tokiu atveju nelieka ir r�melio, ta�iau i�lieka grafiko a�i� pavadinimai.

plot(x, y, axes = FALSE)


# NAUDINGA ------------------------------

# Pa�ias bendriausias grafik� brai�ymo taisykles reguliuoja special�s grafiniai
# parametrai.

# Naudojant parametr� ann, galima u�drausti rodyti visas diagramos antra�tes i� 
# karto, net jei jos ir yra nustatytos atitinkamais parametrais.

plot(x, y, main = "Diagramos antra�t�", xlab = "x", ylab = "f(x)")
plot(x, y, main = "Diagramos antra�t�", xlab = "x", ylab = "f(x)", ann = FALSE)


# Parametrams xaxt arba yaxt nurod�ius reik�m� "n", galima u�drausti a�ies Ox ar 
# Oy brai�ym�. Tokiu atveju grafiko r�melis i�lieka.

plot(x, y, xaxt = "n")


# U�DUOTIS ------------------------------ 

# 1. U�ra�ykite komand�, kuri ta�k� (x, y) sklaidos diagramoje a�ies Ox ribas 
#    automati�kai prapl�st�: a) po 10 vnt. � abi puses, b) po 10 % � abi puses.
# 2. Nubrai�ykite ta�k� (x, y) sklaidos diagram�, kurioje b�t� atvaizduoti tik
#    patys ta�kai, bet neb�t� nei a�i�, nei a�i� pavadinim�, nei kit� antra��i�. 
