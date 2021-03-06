
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Matric� sudarymas ir pagrindin�s j� savyb�s.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2012-09-03 | 2013-05-06
#


# TURINYS -------------------------------

# 
#   1. Matric� sudarymas ir j� s�vyb�s:
#      * komanda matrix
#      * komanda mode 
#      * komanda class
#      * komanda dim
#      * komanda length
#      * komanda nrow ir ncol 
#      * komanda rownames ir colnames
#      * komanda dimnames
#      * operatorius [
#
#   2. Vektori� ir matric� apjungimas:
#      * komanda cbind
#      * komanda rbind 
#


# PASTABOS ------------------------------

#
# Ateityje prid�ti skyrel� apie array duomen� strukt�r�.
# Pastaba apie vien� dimensij� turin�io masyvo dimensijos panaikinim� su drop.
# Prid�ti skyrel� apie funkcij� str kintamojo strukt�rai nustatyti.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# MATRIC� SUDARYMAS                       #
# --------------------------------------- #

# R kalboje matrica yra dvimatis masyvas, kurio visos reik�m�s yra vienodo tipo. 
# Matricos sudarymui naudojama funkcija matrix. Jos parametrai:
# 
#     data -- vektorius, kurio reik�m�mis u�pildoma matrica,
#     nrow -- matricos eilu�i� skai�ius,
#     ncol -- matricos stulpeli� skai�ius,
#    byrow -- pagal nutyl�jim� FALSE, matrica u�pildoma stulpeliais,
# dimnames -- eilu�i� ir stulpeli� vard� s�ra�as.


# Pirmiausia nurodome matricos reik�mi� vektori�. Antras parametras yra eilu�i� 
# ir tada stulpeli� skai�ius. Pagal nutyl�jim� reik�m�s i�d�stomos stulpeliais.

x <- 1:10
m <- matrix(data = x, nrow = 5, ncol = 2)
m

# Pakeitus parametro byrow reik�m� � TRUE, t� pat� reik�mi� vektori� matricoje 
# galima i�d�lioti eilut�se.

m <- matrix(data = x, nrow = 5, ncol = 2, byrow = TRUE)
m

# Jei argumentai u�ra�omi ta pa�ia tvarka, parametr� pavadinim� galima nera�yti.
m <- matrix(x, 5, 2)
m

# Kadangi vektoriaus ilgis fiksuotas, tai i� jo sudaryt� matric� pilnai galima
# nusakyti vien tik eilu�i� arba vien tik stulpeli� skai�iumi. Bet nevisada!

matrix(x, nrow = 5)
matrix(x, ncol = 2)

# Jei matricos reik�mi� vektorius per trumpas ir jo element� neu�tenka u�pildyti 
# visai matricai, jis cikli�kai pakartojamas. �i� savyb� galima panaudoti sudarant 
# matric�, sudaryta i� vienod� reik�mi�. Pvz., sudarysime 10 eilu�i� ir 3 stulpeli� 
# matric�, kurios visi elementai lyg�s nuliui.

y <- 0
n <- matrix(y, nrow = 10, ncol = 3)
n

# Matrica gali b�ti sudaryta i� bet kokio tipo vienod� reik�mi�: skai�i�, simboli�,
# logini� reik�mi� ir t.t. Pvz., sudarysime matric� i� m�nesi� pavadinim�.

y <- month.name
n <- matrix(y, ncol = 2)
n


# U�DUOTIS ------------------------------ 

# 1. U�ra�ykite kiek �manoma trumpesn� komand�, kuri sudaryt� matric� i� 10 eilu�i� 
#    ir 2 stulpeli�, kur visi pirmo stulpelio nariai lyg�s 1, o antrojo lygus 2.
# 2. Sukurkite antros eil�s kvadratin� matric� sudaryt� i� praleist� reik�mi�.


# Kaip ir vektoriaus, visi matricos elementai yra to paties tipo. J� parodo funkcija 
# mode.

mode(x)     # vektoriaus element� tipas 
mode(m)     # matricos element� tipas

# Kintamojo klas� parodo, kokio tipo duomen� strukt�r� sudaro kintamojo elementai.
# Kintamojo, kurio reik�m� yra vektorius, klas� sutampa su to vektoriaus reik�mi�
# tipu (numeric, integer, character ir t.t.). Kintamojo, kurio reik�m� yra matrica, 
# klas� yra matrix.

class(x)    # kintamasis x yra (skaitinio tipo) vektorius
class(m)    # kintamasis m yra matrica

# Matrica nuo vektoriaus (i� kurio ji gali b�ti sudaryta) i� esm�s skiriasi tuo, 
# kad matrica turi dimensijos atribut�, �iuo atveju tai yra eilu�i� ir stulpeli� 
# skai�ius. 
attributes(m)

# Matricos dimensijos nustatymui naudojama funkcija dim. Pirmas gauto vektoriaus 
# skai�ius yra matricos eilu�i� skai�ius, antrasis -- stulpeli� skai�ius. 
dim(m)

# Matricos dimensij�, kaip ir bet kur� kit� atribut�, galima pakeisti. Pvz., matric�
# galima paversti � matric�-eilut�. Ta�iau tokia matrica-eilut� n�ra vektorius!
dim(m) <- c(1, 10)
m

# Matricos dimensij� galima panaikinti, tada matrica pavirsta � vektori�, kurio 
# elementai i�rikiuoti pagal stulpelius.
dim(m) <- NULL
m

# Kad vektorius nuo matricos skiriasi tik dimensija, galima nesunkiai parodyti.
# Naudodami funkcij� dim, vektoriui m priskirkime dimensij�. Taip pakeistas 
# vektorius v�l bus matrica.
dim(m) <- c(5, 2)
m

# Matricos element� skai�iui apskai�iuoti naudojama ta pati funkcija length.
length(m)

# Matricos eilu�i� ir stulpeli� skai�iui surasti naudojamos funkcijos nrow ir ncol.
nrow(m)
ncol(m)

# Matricos eilu�i� ir stulpeli� pavadinimams nustatyti ar pakeisti naudojamos 
# funkcijos rownames ir colnames. Pavyzd�iui., matricos stulpelius pavadinsime X 
# ir Y, o eilutes -- ma�osiomis ab�c�l�s raid�mis.

rownames(m) <- letters[1:5]
colnames(m) <- c("X", "Y")
m

rownames(m)
colnames(m)

# Eilu�i� arba stulpeli� vardus galima pakeisti arba ir visai panaikinti. 
rownames(m) <- NULL
m

# Funkcija dimnames naudojama i� karto abiej� dimensij� vardams parodyti ar jiems 
# pakeisti. �ios funkcijos rezultatas yra s�ra�as, kurio pirmas elementas yra 
# eilu�i� vard� vektorius, o antras -- stulpeli� vard� vektorius.
dimnames(m)
m


# U�DUOTIS ------------------------------ 

# 1. Naudojant funkcij� dim para�ykite toki� komand�, kuri transponuot� matric�.


# Bet kuris matricos elementas pasiekiamas nurodant eilut�s ir stulpelio numer�.
m[1, 1]

# Kaip ir vektoriams, galima nurodyti matricos eilu�i� ir stulpeli� indeks� aib�.
# Pvz., i� matricos m i�skirsime pirmas dvi eilutes ir pirmus du stulpelius.
i <- c(1, 2)
j <- c(1, 2)
m[i, j]

# Toki� pat indeks� aib� galima nurodyti ir labai kompakti�ku pavidalu.
m[1:2, 1:2]


# I� matricos galima i�skirti bet kuri� pasirinkt� eilut� ar stulpel�.
i <- 2
m[i, ]  # taip gaunama i-oji matricos eilut�, trumpiau taip: m[2, ]

j <- 1
m[, j]  # taip i�skiriamas j-asis stulpelis,  trumpiau taip: m[, 1]

# Galima i�skirti kelias matricos eilutes ar stulpelius, pvz., pirmas 3 eilutes.
i <- c(1, 2, 3)
m[i, ]

# Jei matricos eilut�s arba stulpeliai turi vardus, juos galima panaudoti nurodant
# konkre�ias eilutes arba stulpelius.
m[, "Y"]


# U�DUOTIS ------------------------------ 

# 1. U�ra�ykite komand�, kuri matricos m stulpelius sukeist� vietomis.
# 2. U�ra�ykite komand�, kuri i�skirt� pirmus tris Y stulpelio elementus.
# 3. U�ra�ykite komand�, kuri i� matricos m i�skirt� nelyginius pirmo stulpelio
#    narius i�d�stytus ma��jan�ia tvarka.


# --------------------------------------- #
# VEKTORI� IR MATRIC� APJUNGIMAS          #
# --------------------------------------- #

# Jei vektori� apjungimui � vektori� naudojama funkcija c, tai vektori� ir matric� 
# apjungimui � matric� naudojamos komandos cbind ir rbind. Funkcija cbind vektorius
# sujungia kaip matricos stulpelius, funkcija rbind -- kaip eilutes.

x <- c(2.6, 4.8, 6.3,  8.1, 11.0, 13.0, 14.2, 16.8, 18.4, 20.2, 22.4, 24.2)
y <- c(3.5, 2.9, 6.2, 18.9, 31.5, 14.1, 26.9, 32.6, 35.3, 28.3, 40.5, 46.0)


# Vektorius x ir y apjungiame � matric� su dviem stulpeliais. Gauname matric�, 
# kurios stulpeli� pavadinimai sutampa su vektori� vardais.
m <- cbind(x, y)
m

dim(m)
colnames(m)

# Pana�iai, kaip vektoriaus elementams, vardus matricos stulpeliams galima suteikti
# matricos sudarymo metu.
m <- cbind(X = x, Y = y)
m

dim(m)
colnames(m)

# Naudojant funkcij� rbind, tuos pa�ius vektorius x ir y apjungiame � matric� su 
# dviem eilut�mis, kurioms suteikiami nauji vardai.
d <- rbind(A = x, B = y)
d

dim(d)
rownames(d)

# Jei apjungiam� vektori� ilgis nesutampa, trumpesnis yra cikli�kai prat�siamas.
cbind(1, 1:10) 

# Su funkcijomis cbind ir rbind galima apjungti ne tik vektorius, bet ir kitas 
# matricas. Atkreipkite d�mes� -- stulpeli� vardai gali kartotis! Tokiu atveju 
# stulpel� parenkant pagal vard�, bus i�renkamas pirmas pasikartojant� vard� 
# turintis stulpelis, bet ne visi.

cbind(m, m)


# U�DUOTIS ------------------------------ 

# 1. Naudojant cbind para�ykite kiek �manom� trumpesn� komand�, kuri sukurt� 10 
#    eilu�i� matric�, kurios pirmojo stulpelio visi elementai b�t� lyg�s 1, 
#    antrojo lyg�s 2 ir tre�iojo -- 3.
# 2. U�ra�ykite komand�, kuri i� vektori� x ir y sudaryt� matric� i� 4 nesikartojan�i� 
#    stulpeli�.
