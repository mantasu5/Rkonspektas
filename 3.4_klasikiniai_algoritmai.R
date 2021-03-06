
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Keletas klasikini� algoritm� su ciklais.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2013-08-23 | 2013-08-25 | 2014-02-23
#


# TURINYS -------------------------------

#
#   1. Keletas klasikini� algoritm� su ciklais:
#      * Newton-Raphson metodas kvadratinei �akniai surasti
#      * vektoriaus element� i�rikiavimas "burbuliuko" metodu
#      * Euklido algoritmas did�iausiam bendram dalikliui
#      * pseudoatsitiktini� dyd�i� generavimo algoritmas
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
# NEWTON-RAPHSON METODAS                  #
# --------------------------------------- #

# Newton-Raphson metodas taikomas lygties f(x) = 0 �akn� radimui. �ia naudojama
# tokia iteracin� i�rai�ka:
#
#   x := x - f(x)/f'(x)
#
# Pritaikysime �� metod� apytiksliam �aknies i� skai�iaus traukimui. Nagrin�kime
# funkcij� f(x) = x^2 - a. Jos i�vestin� f'(x) = 2x. Atlik� pertvarkymus gauname 
# toki� iteracin� i�rai�k�:
#
#   x := (x + a/x)/2

# �ia dydis a yra skai�ius, i� kurio traukiama �aknis, o kair�je lygties pus�je 
# esantis dydis x yra apytiksl� tos �aknies reik�m�. Algoritmui reikia nurodyti
# pradin� x reik�m� ir iteracij� skai�i�. 

# Tegu iteracij� skai�ius fiksuotas ir lygus n, tod�l naudosime konstrukcij� for.
# Kadangi tarpini� reik�mi� vektorius nesudaromas, ciklo kintamasis nenaudojamas. 

a <- 25   # skai�ius, i� kurio traukiama kvadratin� �aknis

n <- 10   # iteracij� skai�ius
x <- 1    # pradin� reik�m�

for (i in 1:n) {
  x <- (x + a/x)/2
  print(x)
}

# Galima pasteb�ti, kad kuo pradin� reik�m� ar�iau tikrosios �aknies reik�m�s, 
# tuo ma�iau iteracij� reikia.
x

# Kvadratin�s �aknies traukimui naudojama standartin� funkcija sqrt.
sqrt(a)


# --------------------------------------- #
# VEKTORIAUS ELEMENT� I�RIKIAVIMAS        #
# --------------------------------------- #

# Apra�ysime vien� paprast� vektoriaus element� i�rikiavimo algoritm�. Pirmasis
# vektoriaus elementas lyginamas su antruoju, tada su tre�iuoju ir taip toliau 
# iki paskutinio. Jei jo reik�m� didesn�, element� reik�mes sukei�iame vietomis. 
# T� pat� pakartojame pradedant antruoju, tre�iuoju ir likusiais elementais iki 
# prie�paskutinio. Kadangi didel� reik�m� turintis elementas "kyla � vir��", �is 
# metodas vadinamas "burbuliuko" metodu.

# �io algoritmo iteracij� skai�ius �inomas, ta�iau jis priklauso nuo vektoriaus 
# element� skai�iaus, kuris i� anksto gali b�ti ne�inomas, tod�l jam nustatyti
# naudojame standartin� funkcij� length.

v <- c(1, 6, 4, 3, 2, 8, 5, 10, 9, 0, 7)

for (i in 1:(length(v) - 1)) {
  for (j in (i + 1):length(v)) {
    if (v[i] > v[j]) {
      temp <- v[i]
      v[i] <- v[j]
      v[j] <- temp
    }
  }
}

v

# Vektoriaus element� rikiavimui R turi standartin� funkcij� sort.
sort(v)


# --------------------------------------- #
# BENDRAS DID�IAUSIAS DALIKLIS            #
# --------------------------------------- #

# Apra�ysime Euklido algoritm� dviej� sveik� skai�i� a ir b did�iausiam bendram
# dalikliui surasti. Tarkime, a > b > 0. Skai�i� a i�rei�kiame tokiu pavidalu:
#
#   a = bq + r.
#
# �ia q yra sveikasis skai�ius, dydis r vadinamas liekana, r < b. Tada dyd�iams 
# a ir b priskiriamos naujos reik�m�s:
#
#   a := b,
#   b := r.
# 
# V�l surandama liekana, priskiriamos naujos reik�m�s ir veiksmai kartojami tol, 
# kol liekana r nepasidarys lygi nuliui. Paskutin� nelygi nuliui liekana ir yra
# did�iausias bendras daliklis.

a <- 776
b <- 544

# Kadangi iteracij� skai�ius i� anksto ne�inomas ir priklauso nuo s�lygos, �ia 
# naudojame cikl� while. Veiksmus kartojame tol, kol liekana didesn� u� nul�.

# Pirm� iteracij� taip pat �keliame � cikl�, tod�l liekanai suteikiame pradin�
# reik�m�.

r <- b

while (r > 0) {
  r <- a %% b
  print(r)
  a <- b
  b <- r
}

# Pirmos iteracijos liekanos reik�m� antroje iteracijoje perduodama dyd�iui b, o 
# tre�ioje -- dyd�iui a. Tuo pa�iu principu perduodamos vis� iteracij� liekanos.
# Ciklo viduje liekanos reik�m� i�vedama � konsol�. Kadangi reik�mi� priskyrimas 
# atliekamas ciklo pabaigoje, paskutin�s nelygios nuliui liekanos reik�m� �gyja 
# dydis a. 
a


# --------------------------------------- #
# ATSITIKTINI� DYD�I� GENERAVIMAS         #
# --------------------------------------- #

# �ia apra�ysime pseudoatsitiktini� dyd�i� generavimo algoritm�, kuris vadinamas
# tiesiniu kongruentiniu generatoriumi. Pagal �� algoritm� atsitiktiniai dyd�iai
# generuojami iteraciniu b�du:
# 
#   X := a*X + c mod m, kur
#
#   daugiklis a >= 0,
#  prieauglis c >= 0,
#     modulis m > a, m > c.

# Parametras m da�niausiai yra didelis pirminis skai�ius. Istori�kai pirmas buvo
# naudojamas toks parametr� rinkinys:

a <- 7^5
c <- 0
m <- 2^31 - 1


# Nustatome atsitiktini� dyd�i� sekos ilg�, kuris sutampa su iteracij� skai�iumi.
n <- 100

# Sukuriame tu��i� vektori�, kurio elementams priskirsime atsitiktines reik�mes.
X <- vector(length = n)

# Visi pseudoatsitiktini� dyd�i� generatoriai turi pradin� sekos reik�m�, seed.
# Su ta pa�ia seed reik�me visada gaunama ta pati dyd�i� seka.

seed <- 1234
X[1] <- seed

for (i in 2:n) {
  X[i] <- (a*X[i-1] + c) %% m
}

# Vektoriaus elementus padalinus i� m, gaunamas dydis, kurio reik�m�s tolygiai
# pasiskirs�iusios intervale (0, 1]. 
X <- round(X/m, 9)
X

# Tokio dyd�io generavimui naudojama standartin� funkcija runif.
runif(100)


# U�DUOTIS ------------------------------ 

# 1. Pataisykite Newton-Raphson algoritmo pavyzd� taip, kad skai�iavimai b�t� 
#    nutraukiami, kai skirtumas tarp dviej� paskutini� �aknies aproksimacij� yra 
#    ma�esnis u� tam tikr� i� anksto nustatyt� dyd� epsilon. Vietoje ciklo for 
#    panaudokite cikl� while.
