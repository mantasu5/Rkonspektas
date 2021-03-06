
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            �vair�s kintam�j� i�vedimo � ekran� b�dai.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2013-07-25 | 2013-07-26 | 2014-02-22
#


# TURINYS -------------------------------

#
#   1. Kintam�j� i�vedimas:
#      * proced�ra cat
#      * proced�ra print
#
#   2. Kintam�j� strukt�ros u�ra�ymas:
#      * funkcija dput
#      * funkcija dget
#      * funkcija dump
#      * funkcija source
#


# PASTABOS ------------------------------

#
# Para�yti apie funkcijas sink ir capture.output.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# KINTAM�J� I�VEDIMAS � EKRAN�            #
# --------------------------------------- #

# Pats papras�iausias b�das pamatyti vektoriaus, matricos arba bet kokio kito R 
# kintamojo reik�m� -- i�vesti � ekran�. Tam konsol�je reikia para�yti kintamojo
# vard� ir paspausti klavi�� Enter. Ra�ant program� � fail� (skript�), kintamojo
# reik�m� � ekran� i�vedama paspaudus ant jo klavi�� F5. Pavyzd�iui, taip galima 
# pamatyti standartinio R kintamojo konstantos pi reik�m�.
pi

# Ra�ant program� ir atliekant skai�iavimus, rezultatus tenka i�vesti tam tikru
# pavidalu. Pvz., "Kintamojo pi reik�m� yra 3.141593". �iuo atveju tekst� reikia
# apjungti su kintamojo pi reik�me. Tokiu atveju rezultato i�vedimui � ekran�
# naudojama proced�ra cat. Jos parametrai:
#
#     ... -- R kintamasis: vektorius arba matrica,
#    file -- kabut�se u�ra�omas duomen� failo vardas arba kelias iki failo,
#     sep -- simbolis, kuriuo atskiriami objektai,
#    fill -- pagal nutyl�jim� FALSE, nurodo kaip u�pildomos eilut�s,
#  labels -- character tipo vektorius su eilu�i� vardais,
#  append -- jei TRUE, vektoriaus reik�m�s �ra�omos � jau esant� fail�.

# Pagal nutyl�jim� parametro file reik�m� yra tu��ios kabut�s, tod�l rezultatas
# i�vedamas � konsol�. Nurod�ius failo vard�, rezultatas bus i�vedamas � fail�
# darbiniame kataloge. 

# Vietoje parametro ... ra�omi kintam�j� vardai, kurie vienas nuo kito atskiriami 
# kableliu. Taip pat kabut�se galima ra�yti tekst�, kuris bus prijungtas prie kit�
# kintam�j�.

# Pa�iu papras�iausiu atveju proced�ra cat kintamojo reik�m� i�veda � konsol�.
cat(pi)

# Kad kursorius po rezultato i�vedimo konsol�je b�t� perkeliamas � kit� eilut�, 
# proced�rai papildomai perduodame eilut�s galo simbol� \n.
cat(pi, "\n")


# U�ra�ysime komand�, kuri i�veda tekst� "Kintamojo pi reik�m� yra 3.141593". J� 
# galima suskaidyti � tris sud�tines dalis: tekst�, kintam�j� pi ir kursoriaus 
# perk�limo � kit� eilut� simbol� \n. Juos reikia apjungti. Sudarome atitinkamus 
# kintamuosius ir perduodame juos proced�rai.

txt <- "Apytiksl� skai�iaus pi reik�m� yra"
var <- pi
new <- "\n"

cat(txt, var, new)

# Kad b�t� papras�iau, tokias nesud�tingas komandas galima apjungti � vien�.
cat("Apytiksl� skai�iaus pi reik�m� yra", pi, "\n")


# NAUDINGA ------------------------------

# Proced�r� cat galima panaudoti nesud�ting� duomen� rinkini� i�vedimui � fail�.
# Tam reikia nurodyti failo vard� arba piln� keli� iki failo.
cat(pi, file = "test.dat")

# Pagal nutyl�jim� kintamojo reik�m�s atskiriamos tarpu, tod�l faile sura�omos �
# vien� eilut�.
v <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
cat(v, file = "test.dat")

# Nurod�ius, kad kintamojo reik�m�s bus atskirtos eilut�s galo simboliu \n, jos 
# faile bus sura�omos po vien� � vien� eilut�.
cat(v, file = "test.dat", sep = "\n")


# U�DUOTIS ------------------------------ 

# 1. Tegu kintamasis k lygus 3, o kintamasis n lygus 8. Naudodami proced�r� cat,
#    u�ra�ykite komand�, kuri � konsol� i�vest� tekst� "Atlikta: 3 i� 8".
# 2. Naudodami proced�r� cat, u�ra�ykite komand�, kuri � ekran� i�veda tekst�: 
#    "Data: 2013-07-26". Dat� parodo standartin� R funkcija Sys.Date(). 
# 3. Naudodami proced�r� cat, sukurkite tekstin� fail�, kurio pirma eilut� yra 
#    u�komentuota simboliu #, u� jo �ra�yta data ir laikas, antra eilut� tu��ia, 
#    tre�ioje eilut�je skai�iai 1, 2 ir 3. Dat� ir laik� parodo funkcija date().
#    Tok� fail� galima sukurti su viena komanda, bet naudojant parametr� append 
#    visas tris eilutes � t� pat� fail� galima �ra�yti atskirai vien� po kitos.


# Sud�tingesni� kintam�j�, pvz., da�ni� lentel�s, i�vedimui naudojama proced�ra 
# print. Jos parametrai priklauso nuo kintamojo klas�s, pagrindiniai yra tokie:
#
#          x -- R kintamasis,
#      quote -- jei TRUE, tai tekstas i�vedamas kabut�se,
#     digits -- reik�mini� skaitmen� skai�ius, pagal nutyl�jim� 7,
#   na.print -- simbolis, kuris spausdinamas vietoje praleistos reik�m�s,
# zero.print -- simbolis, kuris spausdinamas vietoj nulio da�ni� lentel�je.

# Jei vektorius turi praleist� reik�mi�, jos �ymimos ir ekrane matomos kaip NA. 
v <- c(0, 1, 2, 3, NA, 5, NA, 7, 8, 9)
v

# Be papildom� nustatym� proced�ra print vektori� su praleistomis reik�m�mis 
# i�veda tok�, koks jis ir yra.
print(v)

# Kartais praleistas reik�mes NA galima pakeisti kitu simboliu, pvz., br�k�niu, 
# arba ir visai nespausdinti.
print(v, na.print = "-")


# Jei vektoriaus reik�m�s yra simboliai, �od�iai arba j� junginiai, jie ra�omi 
# kabut�se ir � ekran� taip pat i�vedami kabut�se.
t <- c("A", "B", "C", "D")
t

print(t)

# Parametro quote reik�m� pakeitus � FALSE, character tipo vektoriaus reik�m�s �
# ekran� bus i�vedamos be kabu�i�.
print(t, quote = FALSE)


# Kei�iant parametro digits reik�m�, galima keisti � ekran� i�vedam� reik�mini�
# skaitmen� skai�i�.

print(pi)
print(pi, digits = 1)
print(pi, digits = 3)
print(pi, digits = 5)


# Parametras zero.print gali b�ti naudingas, kai � ekran� i�vedama "reta" da�ni�
# lentel�, kuri turi daug nulini� reik�mi� ir kurios vizualiai trukdo ��velgti
# kitas lentel�s reik�mes. Tokiu atveju galima nurodyti, kad vietoje nulio b�t�
# atspausdinamas koks nors kitas simbolis.

# Sukursime testin� da�ni� lentel� i� automobili� grei�io ir stabdymo atstumo
# duomen� rinkinio cars.
cars

# Gaunama gana didel� da�ni� lentel�, ta�iau did�ioji dauguma jos reik�mi� yra 
# nuliai ir pasteb�ti nenulines reik�mes sunku.
l <- table(cars)
l

# Vietoje nulio galima atspausdinti ta�k�, ir vaizdas pasidaro �ymiai geresnis.
print(l, zero.print = ".")


# U�DUOTIS ------------------------------ 

# 1. Naudodami proced�r� print, vektori� v i�veskite � ekran� taip, kad vietoje
#    praleist� reik�mi� b�t� tu��ias tarpas.
# 2. Duomen� lentel�je co2 yra 1959-1997 met� duomenys apie CO2 koncentracij�.
#    Naudodami proced�r� print, i�veskite duomenis � ekran� taip, kad matavim�
#    reik�m�s b�t� sveiki skai�iai.


# --------------------------------------- #
# KINTAM�J� STRUKT�ROS U�RA�YMAS          #
# --------------------------------------- #

# Da�nai vektoriai, matricos arba kitos duomen� strukt�ros sukuriamos u�ra�ant
# tam tikr� komand�. Pvz., vieno tipo reik�m�s � vektori� apjungiamos naudojant 
# komand� c.
v <- c(1, 2, 3, 4, 5, 6)
v

# Naudojant komand� matrix i� vektoriaus v sukursime 2x3 dyd�io matric�.
m <- matrix(v, nrow = 2, ncol = 3)
m

# Duomen� lentel� galima sukurti naudojant komand� data.frame.
d <- data.frame(var = c("a", "b", "c"), ats = c("taip", "ne", "ne�inau"))
d

# Kartais i�kyla atvirk�tinis u�davinys -- turint vektori�, matric� arba duomen�
# lentel� reikia u�ra�yti t� duomen� strukt�r� sukurian�i� komand�. Tam naudojama 
# funkcija dput. Pagrindiniai jos parametrai:
#
#       x -- R kintamasis,
#    file -- failo, � kur� i�vedama kintam�j� sukurianti komanda, vardas,
# control -- kintamojo strukt�ros detalumo parametras, "all", NULL.

# Pagal nutyl�jim� parametro file reik�m� yra "", tod�l nenurod�ius failo vardo, 
# funkcijos dput rezultatas automati�kai i�vedamas � konsol� (ekran�). Kintamojo
# strukt�ros detalum� nusako parametras control. Pagal nutyl�jim� jo reik�m� yra 
# "all", tod�l kintamojo strukt�ra atstatoma kiek �manoma tiksliau. Norint gauti
# minimali� kintamojo strukt�r�, parametrui control galima nurodyti reik�m� NULL.

# Tekstinio pavidalo kintamojo strukt�r� galima nukopijuoti, pataisyti, perkelti 
# � kit� program� ir taip atkartoti kintam�j�.


# Kadangi vektorius -- labai paprasta duomen� strukt�ra, j� sukurianti komanda 
# taip pat yra nesud�tinga.
dput(v)

# Matrica m nuo vektoriaus v skiriasi tuo, kad turi eilu�i� ir stulpeli� skai�i�
# nusakant� atribut� (dimensij�).
dput(m)

# � konsol� i�vedama komanda, kuri� suvykd�ius gaunama tokia pati matrica.
n <- structure(c(1, 2, 3, 4, 5, 6), .Dim = 2:3)
n

# Duomen� lentel�s strukt�ra �ymiai sud�tingesn�. Kiekviena data.frame kintamojo
# eilut� yra s�ra�as, o stulpeliai yra vektoriai, kurie gali b�ti skirtingo tipo.
# Taip pat lentel� turi eilu�i� numerius ir stulpeli� pavadinimus.
dput(d)

# � konsol� i�vedamas toks data.frame tipo kintamojo strukt�r� apra�antis kodas.

structure(list(var = structure(1:3, .Label = c("a", "b", "c"), class = "factor"), 
    ats = structure(c(3L, 1L, 2L), .Label = c("ne", "ne�inau", 
    "taip"), class = "factor")), .Names = c("var", "ats"), row.names = c(NA, 
-3L), class = "data.frame")

# Esmin� �ios lentel�s dalis yra du kategoriniai kintamieji var ir ats, kuri�
# reik�mes galima sutapatinti su sveikais skai�iais. Toki� minimali� kintamojo
# strukt�r� galima gauti parametrui control nurod� reik�m� NULL.
dput(d, control = NULL)


# Kintamojo strukt�ros kod� galima i�saugoti tekstiniame faile.
dput(d, file = "duom.dmp")

# Kintamasis atkuriamas naudojant funkcij� dget, kuriai nurodomas failo vardas.
# I� failo nuskaityta strukt�ra paver�iama � kintam�j� ir i�vedama � konsol�.
dget(file = "duom.dmp")

# Funkcijos dget rezultat� galima priskirti kitam kintamajam. Pvz., nuskaitysime
# fail� "duom.dmp" ir sukursime nauj� duomen� lentel� b.
b <- dget(file = "duom.dmp")
b


# Pana�iu b�du tekstin� kintamojo pavidal� galima gauti naudojant fukcij� dump. 
# Pagrindiniai jos parametrai:
#
#    list -- character tipo kintam�j� vard� vektorius,
#    file -- failo, � kur� i�vedama kintam�j� sukurianti komanda, vardas,
# control -- kintamojo strukt�ros detalumo parametras, "all", NULL,
#  append -- jei TRUE, vektoriaus reik�m�s �ra�omos � jau esant� fail�.

# Parametrui file nurod�ius failo vard�, darbiniame kataloge sukuriamas R script 
# failas, kur� suvykd�ius gaunami list vektoriuje nurodyti kintamieji.


# Pavyzd�iui, � konsol� i�vesime kintamojo v kod�.
dump(list = "v", file = "")

# Tokiu b�du galima gauti i� karto keli� kintam�j� kod�.
dump(list = c("v", "m"), file = "")


# Sukursime keletos kintam�j� script fail�. 
dump(list = c("v", "m"), file = "dump.R")

# Naudojant funkcij� source tok� fail� galima suvykdyti ir atkurti jame �ra�ytus 
# kintamuosius.
source(file = "dump.R")


# U�DUOTIS ------------------------------ 

# 1. Naudodami funkcij� dput, sukurkite duomen� lentel�s cars strukt�ros kod�.
#    Nukopijuokite i� jo t� dal�, kuri atitinka kintam�j� speed ir naudodami j� 
#    sukurkite nauj� vektori� s.
# 2. Darbiniame kataloge sukurkite tekstin� fail� "vector.R", jo viduje �ra�ykite
#    komand�, kuri sukuria bet kok� skai�i� vektori�. Naudodami funkcij� source
#    nuskaitykite �� fail�.
