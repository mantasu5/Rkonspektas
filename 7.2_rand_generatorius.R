
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Pseudoatsitiktini� dyd�i� generavimo algoritmai.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2013-05-13 | 2016-03-16
#


# TURINYS -------------------------------

#
#   1. Pseudoatsitiktini� dyd�i� generavimo algoritmai:
#      * komanda RNGkind
#      * komanda set.seed
#      * standartiniai R algoritmai
#
#   2. Tiesinis kongruentinis generatorius ir jo atmainos:
#      * mi�rus generatorius
#      * multiplikatyvinis
#      * standartiniai parametrai
#      * generatoriaus savybi� tyrimas
#
#   3. Generavimas naudojant ats. dyd�i� transformacij�:
#      * eksponentinio dyd�io generavimas
#


# PASTABOS ------------------------------

#
# Anyone who considers arithmetical methods of producing random digits is, of
# course, in a state of sin. -- John von Neumann
#


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# STANDARTINIAI ATS. DYD�I� GENERATORIAI  #
# --------------------------------------- #

# Pseudoatsitiktini� dyd�i� generatorius -- tai algoritmas, kuris generuoja sek�
# toki� skai�i�, kuri� statistin�s savyb�s pana�ios � tikr� ats. dyd�i� savybes.
# Tokiu b�du gauta skai�i� seka i� tikro n�ra atsitiktin�, kadangi sekos savyb�s
# priklauso nuo algoritmo parametr�, o pati seka visi�kai priklauso nuo pradin�s
# sekos reik�m�s, kuri vadinama seed. D�l �ios prie�asties skai�iai, sugeneruoti
# naudojant deterministin� algoritm�, ir vadinami pseudoatsitiktiniais.

# Tam tikr� pasiskirstymo d�sn� turin�i� pseudoatsitiktini� dyd�i� generavimui R
# naudoja standartines funkcijas. J� yra daug, pamin�sime tik kelet�, pavyzd�iui:
#
#     rbinom -- binominis,
#      rpois -- Puasono,
#      runif -- tolydusis,
#      rnorm -- normalusis,
#       rexp -- eksponentinis.


# Pvz., sugeneruosime tolygiai intervale [0, 1] pasiskirs�iusi� ats. dyd�i� sek�.

runif(10)

# Sugeneruosime 10 standartin� normal�j� pasiskirstym� turin�i� ats. dyd�i� sek�.

rnorm(10)


# Tolygi�j� ir normali�j� pseudoatsitiktini� dyd�i� generatorius galima nurodyti 
# su komanda RNGkind. �i komanda turi du parametrus:
#
#         kind -- tolygi�j� dyd�i� generatoriaus pavadinimas,
#  normal.kind -- normali�j� dyd�i� generatoriaus pavadinimas.


# Tolygiojo atsitiktinio dyd�io generavimui R galima naudoti �iuos standartinius 
# generatorius:
#
#         Wichmann-Hill -- periodas 6.9536*10^12
#  Marsaglia-Multicarry -- periodas 2^60
#           Super-Duper -- periodas 4.6*10^18
#      Knuth-TAOCP-2002 -- periodas 2^129
#         L'Ecuyer-CMRG -- periodas 2^191
#      Mersenne-Twister -- periodas 2^19937 - 1 

# Normali�j� dyd�i� generavimui naudojami tokie generatoriai:
#
#      Kinderman-Ramage
#         Ahrens-Dieter
#            Box-Muller
#             Inversion


# Pagal nutyl�jim� tolygi�j� dyd�i� generavimui naudojamas "Mersenne-Twister", o
# normali�j� dyd�i� -- "Inversion" generatorius.

RNGkind()

# Tolygaus atsitiktinio dyd�io generavimo algoritm� pakeisime � gerai �inom� bei
# praeityje pla�iai paplitus� generatori� "Super-Duper" (Margsalia, 1972).

RNGkind(kind = "Super-Duper")
RNGkind()

set.seed(666)
runif(1)

# Pagal nutyl�jim� tolygaus ats. dyd�io generavimui R naudoja "Mersenne-Twister" 
# algoritm�. Gr��iname j� atgal.

RNGkind(kind = "default")
RNGkind()

set.seed(666)
runif(1)

# Matome, kad su ta pa�ia seed reik�me skirtingi algoritmai generuoja skirtingus
# dyd�ius.


# NAUDINGA ------------------------------

# Visiems pseudoatsitiktini� dyd�i� generatoriams reikia nustatyti pradin� sekos 
# reik�m�, kuri vadinama seed. Jei nenurodyta kitaip, seed reik�m� priklauso nuo 
# kompiuterio laiko, tod�l kiekvien� kart� generuojama vis kita ats. dyd�i� seka.
# Pavyzd�iui, sugeneruosime 3 tolygiai pasiskirs�iusi� atsitiktini� dyd�i� sekas.
# Visos trys bus skirtingos.

runif(10)
runif(10)
runif(10)

# Su ta pa�ia seed reik�me pseudoatsitiktini� dyd�i� generavimo algoritmas visad
# generuos t� pa�i� skai�i� sek�. Tai rei�kia, kad eksperiment� galima atkartoti 
# visi�kai tiksliai. Kartais tokia galimyb� labai reikalinga. Norint gauti toki� 
# pa�i� pseudoatsitiktini� dyd�i� sek�, kiekvien� kart� reikia nurodyti t� pa�i� 
# seed reik�m�. 

# Pradin�s reik�m�s nustatymui naudojama komanda set.seed, kurios argumentas yra 
# bet koks sveikasis skai�ius, kuris ir yra seed reik�m�. Pvz., nustatysime seed
# reik�m�, sugeneruosime normali�j� ats. dyd�i� sek� ir, naudodami t� pa�i� seed
# reik�m�, dar kart� sugeneruosime toki� pa�i� ats. dyd�i� sek�.

set.seed(1234)
rnorm(10)

set.seed(1234)
rnorm(10)


# --------------------------------------- #
# MI�RUS KONGRUENTINIS GENERATORIUS       #
# --------------------------------------- #

# Egzistuoja keletas skirting� metod� pseudoatsitiktini� dyd�i� generavimui. �ia
# aptarsime vien� pla�iai paplitus� algoritm�, kuris turi kelet� modifikacij� ir 
# naudojamas iki �iol.

# Tarkime, kad X -- atsitiktinis dydis. Tiesinis kongruentinis algoritmas dyd�i� 
# X sek� generuoja pasinaudojant tokiu rekurentiniu s�ry�iu:
#
#      X := (aX + c) mod m, kur
# 
#   daugiklis a >= 0,
#  prieauglis c >= 0,
#     modulis m > a, m > c.


# Kongruentiniams pseudoatsitiktini� dyd�i� generavimo algoritmams b�dingas tam
# tikras generuojamos skai�i� sekos periodas T. Tai rei�kia, kad sekos elementai
# pradeda kartotis. Kad pseudoatsitiktiniai dyd�iai b�t� pana��s � atsitiktinius 
# dyd�ius, jie turi b�t� neprognozuojami ir bent jau nesikartoti. Sekos periodas 
# priklauso nuo algoritmo parametr�, ta�iau visada T < m. Kad priklausomyb� tarp 
# generuojam� dyd�i� b�t� kuo silpnesn�, parametras m turi b�ti didelis, nors ir
# tai negarantuoja dyd�i� nepriklausomumo, nes periodas T gali b�ti ma�as net ir 
# prie didel�s parametro m reik�m�s. Be to, didelis periodas T negarantuoja, kad 
# skai�i� seka bus atsitiktin�. Pavyzd�iui, jeigu parametrai a = c = 1, tada bus
# gaunama maksimalaus ilgio, bet visai neatsitiktin� seka, kurioje visi skai�iai 
# nuo 0 iki m-1 i�sid�sto tam tikra tvarka, ta�iau paskui v�l kartojasi ta pa�ia 
# tvarka. Tiesini� kongruentini� algoritm� teorija gerai i�nagrin�ta, ir �inomos
# s�lygos, kokie turi b�ti parametrai, kad sekos periodas b�t� maksimalus.

# TEOREMA (Greenberger, 1961, Hull-Dobell, 1966). Sekos periodas T maksimalus ir 
# lygus m tada ir tik tada, kai i�pildytos s�lygos:
#
#    -- c ir m yra tarpusavyje pirminiai,
#    -- a-1 yra vis� parametro m pirmini� dalikli� kartotinis,
#    -- a-1 yra skai�iaus 4 kartotinis, jei ir m yra 4 kartotinis.


# Praktikoje parametras m paprastai lygus did�iausiam teigiamam skai�iui w, koks 
# telpa � vien� ma�inin� �od�. Pavyzd�iui, jei vienam skai�iui skiriama 32 bitai, 
# tai w = 2^31 - 1. R �� skai�i� galima su�inoti su komanda .Machine

.Machine$integer.max   # tai ir yra skai�ius w = 2^31 - 1

# Kita da�nai parenkama parametro m reik�m� -- tai did�iausias pirminis skai�ius
# ma�esnis u� skai�i� w. �iuo atveju taip sutampa, kad m = 2^31 - 1 yra pirminis
# Merseno skai�ius.


# Kai parametras c = 0, tai algoritmas vadinamas multiplikatyviniu kongruentiniu 
# generatoriumi (Lehmer, 1949). D�l supaprast�jusi� skai�iavim�, tokia algoritmo 
# modifikacija veikia �iek tiek grei�iau, bet maksimalus periodas T yra ma�esnis 
# nei m. Periodo T ilg� ir parametr� parinkimo s�lygas nusako Carmichael teorema
# i� kurios seka, kad multiplikatyvinio kongruentinio generatoriaus generuojamos 
# sekos periodas T lygus m-1 tada ir tik tada, kai i�pildytos s�lygos:
#
#    -- m yra pirminis,
#    -- a yra primityvusis m elementas.

# Paskutin� s�lyg� galima performuluoti taip: kiekvienam pirminiui m-1 dalikliui 
# p skai�ius a^(m-1)/p - 1 nesidalina i� m. 


# --------------------------------------- #
# GENERATORIAUS PARAMETR� RINKINIAI       #
# --------------------------------------- #

# Naudojama daug tiesinio kongruentinio algoritmo parametr� rinkini�. Pateiksime 
# kelet� labiausiai paplitusi� generatori�, kuri� savyb�s gerai i�tirtos, o kai 
# kurie i� j� yra tarp standartini� R generatori�.

# Pla�iai paplit�s generatorius MINSTD (Lewis et al., 1969), kuris dar vadinamas 
# minimaliu standartiniu generatoriumi (Park, Miller, 1988). �ia naudojamas toks 
# parametr� rinkinys: 

a <- 7^5                        # kai a = 48271 arba 69621 generatorius geresnis
c <- 0
m <- 2^31 - 1

# �io generatoriaus versija su parametru a = 397204094 buvo naudojama programoje
# SAS/IML.


# Pla�iai buvo paplit�s generatorius SUPER-DUPER (Margsalia, 1972). Jo parametr�
# reik�m�s tokios:

a <- 69069
c <- 1                          # kartais naudojama versija su parametru c = 0
m <- 2^32


# I� naujesni� generatori� Fortran kalboje buvo naudojamas generatorius NAG, kur 
# parametr� reik�m�s tokios:

a <- 13^13
c <- 0                
m <- 2^59
X <- 123456789*(2^32 + 1)       # tokia naudojama seed reik�m�


# Maple programoje buvo naudojamas multiplikatyvinis kongruentinis generatorius 
# su tokiais parametrais:

a <- 427419669081
c <- 0                
m <- 10^12 - 11

# �ia m yra pirminis skai�ius, o parametro a reik�m� yra primityvusis elementas, 
# tod�l pagal Carmichael teorema, �is generatorius turi maksimal� period�.


# �iuo metu R, Python, C++, Ruby ir daugelyje kit� programavimo kalb� naudojamas 
# "Mersenne-Twister" algoritmas (Matsumoto, Nishimura, 1998). Tai i� esm�s visai
# kitokio tipo generatorius, kurio periodas lygus net 2^19937 - 1.


# --------------------------------------- #
# PAPRASTAS GENERATORIAUS SAVYBI� TYRIMAS #
# --------------------------------------- #

# Ne visi atsitiktini� dyd�i� generatoriai vienodai geri, tod�l generuojam� sek� 
# savyb�ms patikrinti naudojami �vair�s statistiniai testai. Pavyzd�iui, Diehard
# testas apima serij� i� keletos skirting� test�, kurie patikrina vis kit� sekos
# savyb�: atstum� tarp skai�i� sekoje pasiskirstym�, keli� skaitmen� kombinacij� 
# pasiskirstym�, ats. dyd�i� sum� normali�kum� ir t.t. �ia apsiribosime vizualiu 
# sekos nari� pasiskirstymo ir tarpusavio priklausomyb�s �vertinimu.

# Nustatome algoritmo parametrus.

a <- 21
c <- 1
m <- 2048

# Nustatome ats. dyd�i� sekos X element� skai�i� n ir sukuriame sveik�j� skai�i� 
# vektori�, kuris v�liau ir bus u�pildytas atsitiktiniais dyd�iais.

n <- 2000
X <- integer(n)

# Nustatome pradin� atsitiktini� dyd�i� sekos X reik�m� -- seed.

seed <- 1
X[1] <- seed

for (i in 2:n) {
  X[i] <- (a*X[i-1] + c) %% m
}

X

# Algoritmo parametrai parinkti taip, kad sekos periodas T maksimalus ir lygus m. 
# Sekos ilgis n < T, tod�l visi sekos elementai be pasikartojim� sutelpa � vien� 
# period� ir papildomos priklausomyb�s tarp tolim� sekos nari� n�ra. Patikriname
# ar sekoje yra pasikartojan�i� nari�.

anyDuplicated(X)

# Jei kongruentinio algoritmo sugeneruotos sekos narius padalintume i� parametro 
# m, gautume tolygiai intervale (0, 1] pasiskirs�ius� atsitiktin� dyd�.

X <- X/m
X

# Nubrai�ome histogram� ir matome, kad atsitiktinis dydis X tikrai gana tolygiai 
# pasiskirst�s intervale (0, 1].

hist(X, main = "Histograma", ylab = "Da�nis")

# Patikrinsime, kaip gretimos sekos X reik�m�s pasiskirs�iusios plok�tumoje. Tam 
# nubrai�ysime ta�k� (x, y) sklaidos diagram�, o koordinat�s x ir y yra gretimos 
# sekos X reik�m�s.

x <- X[seq(1, n-1, by = 2)]
y <- X[seq(2, n-0, by = 2)]

plot(x, y, xlab = "x", ylab = "y", main = "Sklaidos diagrama")

# Diagramoje matome, kad ta�kai gana tolygiai u�pildo vienetin� kvadrat�, ta�iau 
# j� i�sid�stymas yra d�sningas! Tai parodo, kad vien tik tolygaus pasiskirstymo 
# ant ties�s neu�tenka.

# Pana�i gretim� sekos nari� priklausomyb� i�ry�k�ja nubrai�ius j� pasiskirstym� 
# trimat�je erdv�je.

x <- X[seq(1, n-2, by = 3)]
y <- X[seq(2, n-1, by = 3)]
z <- X[seq(3, n-0, by = 3)]

require(lattice)
cloud(z ~ x*y, main = "Atsitiktini� dyd�i� sklaidos diagrama") 

# Kad b�t� ai�kiau, galima sudaryti ta�k� su koordinat�mis (x, y, z) projekcijas
# � atskiras plok�tumas.

par(mfrow=c(1, 3), mar = c(2, 2, 1, 1))

plot(x, y, xlab = "x", ylab = "y", main = "")
plot(x, z, xlab = "x", ylab = "z", main = "")
plot(y, z, xlab = "y", ylab = "z", main = "")


# U�DUOTIS ------------------------------ 

# 1. Tarkime, kad parametras m = 1024. Parinkite tokias parametr� a, c reik�mes,
#    kad gauta atsitiktini� dyd�i� seka b�t� kaip galima tolygiau pasiskirs�iusi
#    ant ties�s ir plok�tumoje.


# --------------------------------------- #
# GENERAVIMAS NAUDOJANT TRANSFORMACIJ�    #
# --------------------------------------- #

# Yra keletas b�d�, kaip gauti kit� pasiskirstymo d�sn� turint� atsitiktin� dyd�
# Y. Vienas i� j� -- transformuoti tolygiai intervale pasiskirs�ius� atsitiktin�
# dyd� X. Pavyzd�iui, standartini� normali�j� dyd�i� poros generavimui naudojama
# Box-Muller transformacija. �inoma, yra ir kit� b�d�.

# Jeigu tolydus atsitiktinis dydis Y turi grie�tai monotonin� pasiskirstymo f-j�
# F(y), tai ats. dydis X = F(Y) yra pasiskirst�s tolygiai intervale [0, 1]. Tok�
# rezultat� galima i�naudoti ats. dyd�i� su norima pasiskirstymo f-ja sudarymui.
# Tarkim, kad funkcija G yra pasiskirstymo f-jos F atvirk�tin�, o X yra tolygiai
# intervale [0, 1] pasiskirst�s ats. dydis. Tada Y = G(X) yra atsitiktinis dydis
# su norima pasiskirstymo funkcija F.

# Pvz., sugeneruosime eksponentin� pasiskirstymo d�sn� turin�i� ats. dyd�i� sek�. 
# Tikimybi� pasiskirstymo funkcija F(y) = 1 - exp(-lambda*y), o atvirk�tin� f-ja
# G(x) = -log(1-x)/lambda. �ia lambda yra pasiskirstymo d�snio parametras. Tegul

lambda = 0.5

# Tolygiai pasiskirs�iusi� atsitiktini� dyd�i� generavimui naudosime standartin� 
# funkcij� runif.

X <- runif(1000)
Y <- -log(1-X)/lambda

# Nubrai�ome santykini� da�ni� histogram� ir teorin� eksponentinio dyd�io tankio
# funkcij�.

hist(Y, freq = FALSE)
curve(dexp(x, lambda), add = TRUE)


# U�DUOTIS ------------------------------ 

# 1. Jeigu nenurodomi papildomi parametrai, standartin� funkcija runif generuoja
#    tolygiai intervale [0, 1] pasiskirs�ius� atsitiktin� dyd� X. Trumpai ra�oma
#    X ~ U(0, 1). Turint dyd�i� X sek� ir naudojant atvirk�tin�s transformacijos 
#    metod�, sugeneruokite atsitiktin� dyd� Y ~ U(-1, 1).
