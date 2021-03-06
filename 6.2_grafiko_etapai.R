
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Pagrindiniai grafiko brai�ymo etapai.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2015-03-05 | 2015-03-06
#


# TURINYS -------------------------------

#
#   1. Pagrindiniai sklaidos diagramos brai�ymo etapai:
#      * plot.new,
#      * plot.window
#      * xy.coords
#      * plot.xy
#      * plot.default
#


# PASTABOS ------------------------------

#
# Sugalvoti u�davini�.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# PAGRINDINIAI GRAFIKO BRAI�YMO ETAPAI    #
# --------------------------------------- #

# Bet kokio sud�tingumo grafiko brai�ymas susideda i� keletos pagrindini� etap�: 
# grafinio �renginio atidarymo, koordina�i� sistemos sudarymo, ta�k� arba linij� 
# koordina�i� skai�iavimo ir j� atid�jimo grafiniame lange. Visus �iuos veiksmus 
# atlieka tokios funkcijos:
#
#     plot.new -- sustabdo grafiko brai�ym� viename lange ir sukuria nauj�,
#  plot.window -- grafiniame lange sukuria koordina�i� sistem�,
#    xy.coords -- apskai�iuoja ta�k� grafiniame lange koordinates,
#      plot.xy -- grafiniame lange atideda ta�kus,
# plot.default -- bazin� auk�to lygio grafin� funkcija.


# Pagrindin� auk�to lygio grafin� funkcija -- plot, kuri turi kelet� metod�. Jos
# rezultatas priklauso nuo argumento. Jei argumentas yra ta�kai su koordinat�mis 
# (x, y), tai grafiko brai�ymas perduodamas funkcijai plot.default, kuri ta�kams
# grafike atid�ti naudoja funkcij� plot.xy. �ios funkcijos argumentas -- s�ra�as
# i� keturi� element�: ta�k� koordinat�s x ir y ir koordina�i� a�i� pavadinimai.
# Tada ta�kai atidedami grafiniame lange su nustatyta koordina�i� sistema. Tokiu 
# b�du susidaro tam tikra funkcij� seka, kuri atspindi grafiko brai�ymo etapus:
#
# plot(x, y)
#         |
#        plot.default(x, y)
#                        |
#                       plot.xy(xy.coords(x, y))
#                                             |
#                                            plot.window()
#                                                       |
#                                                      plot.new()


# Visos auk�to lygio grafin�s funkcijos, tokios kaip plot, curve, hist ir kitos,
# grafik� brai�o arba naujame grafiniame lange, arba anks�iau atidarytame lange,
# kuris prie� tai i�valomas. �iuos veiksmus, prie� grafiko brai�ym� auk�to lygio
# grafine f-ja, automati�kai atlieka funkcija plot.new. 

# Pavyzd�iui, jeigu n�ra nei vieno grafinio lango, funkcija plot.new j� atidaro. 

plot.new()

# Jeigu grafinis langas atidarytas, nepriklausomai nuo to, kas jame pavaizduota,
# funkcija plot.new j� i�valo.

curve(sin, -pi, pi)
plot.new()

# Funkcijos plot.new sukurtame grafiniame lange koordina�i� a�i� ribos yra nuo 0 
# iki 1. Tuo nesunku �sitikinti naujame grafiniame lange nubrai�ius a�is.

plot.new()
axis(1)
axis(2)


# Koordina�i� sistemos sudarymui naudojama funkcija plot.window. Jos parametrai:
#
#       xlim -- a�ies Ox ribos,
#       ylim -- a�ies Oy ribos,
#        asp -- koordina�i� santykis y/x.

# Pavyzd�iui, atidarysime nauj� grafin� lang� ir jame nustatysime reikiamas a�i�
# ribas: Ox intervalas [10, 20] ir Oy intervalas [0, 5].

plot.new()
plot.window(xlim = c(10, 20), ylim = c(0, 5))
axis(1)
axis(2)

# Taip galima pakeisti ir jau nubrai�yto grafiko koordina�i� sistem�. Pavyzd�iui,
# nubrai�ysime funkcijos y = sin(x) grafik� �prastoje koordina�i� sistemoje, kur
# a�ies Oy intervalas [-1, 1]. Pakeitus koordina�i� sistem� tos pa�ios funkcijos 
# grafikas atrodo visi�kai kitaip.

par(mar = c(4, 4, 4, 4), las = 1)
plot.new()

plot.window(xlim = c(-pi, pi), ylim = c(-1, 1))
axis(1)
axis(2)
curve(sin, add = TRUE)

plot.window(xlim = c(-2*pi, 2*pi), ylim = c(-3, 3))
axis(3)
axis(4)
curve(sin, add = TRUE)


# Funkcija xy.coords sudaro s�ra�� su ta�k� koordinat�mis (x, y) bei koordina�i�
# a�i� pavadinimais: x, y, xlab ir ylab. �is s�ra�as naudojamas ta�k� atid�jimui
# grafike, kur� atlieka bazin� ta�k� ir linij� brai�ymo funkcija plot.xy, ta�iau
# prie� tai aptarsime f-jos xy.coords parametrus:
#
#          x -- ta�k� x koordina�i� vektorius,
#          y -- ta�k� y koordina�i� vektorius,
#       xlab -- Ox a�ies pavadinimas,
#       ylab -- Oy a�ies pavadinimas,
#        log -- nurodo, kuri a�is logaritmin�je skal�je,
#    recycle -- nurodo, ar trumpesn� koordina�i� vektori� cikli�kai prat�sti.

# Pavyzd�iui, tur�dami ta�k� koordina�i� vektorius, sukursime t� ta�k� brai�ymui
# reikalinga s�ra�� su ta�k� koordinat�mis ir koordina�i� a�i� pavadinimais.

x <- seq(-pi, pi, length = 100)
y <- sin(x)

xy.coords(x, y, xlab = "x", ylab = "sin(x)")

# Koordina�i� vektorius galima susieti per formul� y ~ x.

xy.coords(y ~ x, xlab = "x", ylab = "sin(x)")

# Loginiam parametrui recycle priskiriant reik�m� TRUE, nustatome, kad trumpesn�
# koordina�i� vektori� galima cikli�kai prat�sti ir tokiu b�du juos suvienodinti.

xy.coords(1:10, 1:2, xlab = "x", ylab = "y", recycle = TRUE)


# Naudojant funkcijos xy.coords sudaryt� s�ra��, funkcija plot.xy atideda ta�kus
# grafiniame lange su nustatyta koordina�i� sistema. Pagrindiniai jos parametrai:
#
#         xy -- s�ra�as su ta�k� koordinat�mis ir a�i� pavadinimais,
#       type -- diagramos tipas,
#        pch -- ta�ko simbolis arba jo numeris,
#        lty -- linijos tipas,
#        lwd -- linijos storis,
#        col -- linijos arba ta�ko spalva,
#        cex -- ta�ko mastelio koeficientas.

# Pavyzd�iui, sudarysime ta�k� koordina�i� s�ra�� ir, naudojant funkcij� plot.xy 
# nubrai�ysime ta�k� sklaidos diagram� i� anksto atidarytame grafiniame lange su 
# nustatyta koordina�i� sistema.

x <- c(2.0, 1.6, 1.2, 0.9, 1.0, 1.3, 1.6, 2.0, 2.3, 2.8, 2.9, 3.0, 2.8, 2.4, 2.1)
y <- c(0.8, 1.1, 1.3, 1.6, 2.2, 2.5, 2.9, 3.1, 3.0, 2.8, 2.4, 1.8, 1.4, 1.0, 0.9)

xy <- xy.coords(x, y, xlab = "x", ylab = "y")
xy

plot.new()
plot.window(xlim = c(0.8, 3.2), ylim = c(0.8, 3.2))
plot.xy(xy, type = "p")

# Funkcija plot.xy n�ra auk�to lygio grafin� funkcija, tod�l ta�kus ant anks�iau
# nubrai�yto grafiko atideda jo nei�trynusi. Pvz., tuos pa�ius ta�kus sujungsime
# ties�s atkarpomis, tam u�tenka pakeisti parametro type reik�m�.

plot.xy(xy, type = "b", pch = 20, col = "red")
plot.xy(xy, type = "S")
plot.xy(xy, type = "s")


# Vis� tokiam grafikui nubrai�yti reikaling� funkcij� sek� pakei�ia viena auk�to
# lygio grafin� funkcija. �iuo atveju tai funkcija plot. Ji turi metod� sklaidos 
# diagramoms brai�yti ir tam naudoja funkcij� plot.default. Pavyzd�iui, t� pa�i�
# ta�k� (x, y) sklaidos diagram� gausime naudojant tam skirt� f-j� plot.default.

plot.default(x, y, type = "b")

# �inoma, toks pat rezultatas gaunamas diagram� brai�ant su auk�to lygio grafine 
# funkcija plot, kuri ta�k� atvaizdavimui ir naudoja f-j� plot.default.

plot(x, y, type = "b")


# U�DUOTIS ------------------------------ 

# 1. 
#    
# 2. 
#    
