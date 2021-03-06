
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            S�lygos konstrukcija if-else ir funkcija ifelse.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2013-08-16 | 2013-08-22
#


# TURINYS -------------------------------

#
#   1. S�lygos tikrinimas:
#      * funkcija if
#      * funkcija ifelse
#


# PASTABOS ------------------------------

#
# Pastab� n�ra.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# IF-ELSE KONSTRUKCIJA                    #
# --------------------------------------- #

# Skai�iavimai da�nai priklauso nuo kintamiesiems ar j� reik�m�ms keliam� s�lyg�:
# jei jos tenkinamos, tai atliekami vieni veiksmai, jei netenkinamos -- kiti. 
# Tokiais atvejais naudojama s�lygos tikrinimo konstrukcija if-else. Bendras jos
# pavidalas toks:
#
#   if (login� s�lyga) {
#       i�rai�kos A
#   } else {
#       i�rai�kos B
#   }
#
# Login�s s�lygos rezultatas turi b�ti vien� element� turintis loginis vektorius,
# kurio reik�m� arba TRUE, arba FALSE. S�lygos rezultatas negali b�ti NA reik�m�.
# Jei s�lygos vektorius turi daugiau nei vien� element�, tikrinama tik pirmojo 
# elemento reik�m�. Jei s�lygos reik�m� TRUE, �vykdomos i�rai�kos A, kitu atveju
# �vykdomos i�rai�kos B.

# Pastaba! Komanda else turi b�ti toje pa�ioje eilut�je kaip ir } skliaustelis.

# Pavyzd�iui, u�ra�ysime komand�, kuri patikrina ar kintamojo d reik�m� vir�ija 
# nustatyt� rib�. Jei �i nelygyb� teisinga, reik�m� prisumuojama, o toki� dyd�i�
# skai�ius padidinamas vienetu. Prie�ingu atveju � konsol� i�vedamas prane�imas.

riba <- 20   # tam tikra kintamojo reik�m�s riba
kiek <- 0    # rib� vir�ijan�i� dyd�i� skai�ius
suma <- 0    # rib� vir�ijan�i� dyd�i� suma

d <- 13      # kintamojo d reik�m� galima keisti

if (d > riba) {
    kiek <- kiek + 1
    suma <- suma + d
} else {
    cat("Dydis nevir�ija nustatytos ribos\n.")
}

kiek
suma

# Jei i�rai�k� riestiniuose skliaustuose galima u�ra�yti kaip vien� komand�, tai 
# skliaust� {} galima ir nenaudoti. Tokiu atveju visa if-else komanda u�ra�oma 
# viena eilute:
#
#   if (login� s�lyga) i�rai�ka A else i�rai�ka B

# Pavyzd�iui, u�ra�ysime komand�, kuri, priklausomai nuo testo reik�m�s, reik�m�
# 1 priskiria arba kintamajam x, arba kintamajam y.

testas <- TRUE
x <- 0
y <- 0

if (testas) x <- 1 else y <- 1

x
y


# Da�nai naudojama supaprastinta if konstrukcija:
#
#   if (login� s�lyga) {
#       i�rai�kos A
#   }

# Pvz., turime du skaitinius kintamuosius: a ir b. Kintamojo a reik�m� turi b�ti 
# ma�esn� u� kintamojo b reik�m�. Jei teisinga nelygyb� a > b, tai �i� kintam�j� 
# reik�mes sukeisime vietomis, jei ne -- kintam�j� reik�m�s lieka tokios pa�ios.

a <- 6
b <- 2

if (a > b) {
  t <- a
  a <- b
  b <- t

  rm(t)  # tarpinis kintamasis t i�trinamas
}

a
b


# Login�s s�lygos rezultatas turi b�ti vien� element� turintis loginis vektorius.
# Tai rei�kia, kad galima patikrinti s�lyg� apie vis� vektori�, ta�iau negalima 
# patikrinti s�lygos apie kiekvien� vektoriaus element� atskirai.

# Pavyzd�iui, u�ra�ysime komand�, kuri patikrina, ar vektorius z turi bent vien�
# element� su praleista reik�me. Jei taip, � konsol� i�vedami toki� element�
# numeriai. Prie�ingu atveju u�ra�omas prane�imas, kad praleist� reik�mi� n�ra.

z <- c(1, 2, NA, 4, 5, NA, NA, 8)

praleistas <- is.na(z)
praleistas

# Funkcijos is.na rezultatas yra tokio pat ilgio loginis vektorius, bet komanda
# if tikrina tik pirmojo elemento reik�m�, tod�l neatsi�velgus � kitus elementus,
# gaunamas nekorekti�kas atsakymas. 

# Naudojant funkcij� all, galima patikrinti, ar vis� loginio vektoriaus element� 
# reik�m� yra TRUE. �ia bus naudojama funkcija any, kurios reik�m� yra TRUE, jei 
# bent vienas loginio vektoriaus elementas turi reik�m� TRUE.

if (any(praleistas)) {
    i <- which(praleistas)
    cat("Element� su praleistomis reik�m�mis numeriai:\n")
    print(i)
} else {
    cat("Element� su praleistomis reik�m�mis n�ra.\n")
}


# Tuo atveju, kai vektoriaus elementui priskiriama arba viena, arba kita reik�m�,
# priklausomai nuo to, ar tam tikr� s�lyg� tenkina atitinkamas kito vektoriaus
# elementas, naudojama funkcija ifelse. Jos parametrai:
#
#     test -- logini� reik�mi� vektorius,
#      yes -- reik�m�, jei loginio testo reik�m� TRUE,
#       no -- reik�m�, jei loginio testo reik�m� FALSE.

# �iuo atveju logini� reik�mi� vektorius gali b�ti bet kokio ilgio ir paprastai 
# jis yra login�s s�lygos apie vektoriaus elementus rezultatas.

# Tokiu b�du, s�lyga apie kiekvien� vektoriaus element� patikrinama, ir viena ar
# kita reik�m� kito vektoriaus elementui priskiriama nenaudojant ciklo.

# Pavyzd�iui, u�ra�ysime komand�, kuri vektoriaus m elementui priskiria reik�m�
# 1, jei vektoriaus n elementas yra lyginis, ir reik�m� -1, jei -- nelyginis.

n <- c(2, 5, 1, 6, 8, 7, 3, 9, 4)

m <- ifelse(n %% 2 == 0, 1, -1)
m

# Pastaba! Kartais vektoriaus reik�mi� perkodavimui funkcija ifelse nereikalinga.
# Pavyzd�iui, jei lygin� vieno vektoriaus element� atitinka 0, o nelygin� 1, tai
# toks perkodavimas atliekamas papras�iau -- surandant dalybos i� dviej� liekan�.

m <- n %% 2
m


# NAUDINGA ------------------------------

# Konstrukcij� if-else galima naudoti kaip funkcij�, kurios reik�m� priklauso
# nuo s�lygos ir apskai�iuojama pagal vien� i� dviej� i�rai�k�:
#
#   y <- if (login� s�lyga) {
#       i�rai�kos A
#   } else {
#       i�rai�kos B
#   }

# Pavyzd�iui, u�ra�ysime komand�, kuri pagal kintamojo x �enkl� kitam kintamajam 
# f priskiria arba t� pa�i� reik�m� x, arba jai prie�ing� reik�m� -x.

x <- 3

y <- if (x > 0) {
    f <- x
} else {
    f <- -x
}

# Riestiniuose skliaustuose u�ra�yto i�rai�k� bloko reik�m� yra paskutin�s bloko 
# viduje esan�ios i�rai�kos rezultatas, tod�l kintamajam y priskiriama kintamojo
# f reik�m�.
y


# Kaip ir anks�iau, jei riestiniuose skliaustuose �ra�yta tik viena i�rai�ka, j� 
# galima atsisakyti ir vis� komand� u�ra�yti vienoje eilut�je:
#
# y <- if (login� s�lyga) reik�m� A else reik�m� B

# Pavyzd�iui, u�ra�ysime funkcij�-indikatori�, kuri �gyja reik�m� 1, jei x > 10,
# ir reik�m� 0 -- prie�ingu atveju.

x <- 3

y <- if (x > 10) 1 else 0
y

# Jei x b�t� daugiau nei vien� element� turintis vektorius, tokiam priskyrimui 
# geriausia naudoti anks�iau apra�yt� funkcij� ifelse.


# Kaip funkcij� galima naudoti ir supaprastint� if konstrukcij� be else dalies.
# Tokiu atveju, jei login�s s�lygos reik�m� yra FALSE, gr��inama NULL reik�m�!

y <- if (x > 10) 1
y


# U�DUOTIS ------------------------------ 

# 1. Kintamojo egzistavimui nustatyti naudojama funkcija exists. Naudodami �i�
#    funkcij�, u�ra�ykite komand�, kuri patikrina ar, egzistuoja kintamasis, ir, 
#    jei tokio kintamojo n�ra, � konsol� i�vedamas tekstinis prane�imas.
# 2. Naudojant funkcij� ifelse, u�ra�ykite komand�, kuri NA reik�m� turintiems
#    vektoriaus z elementams priskirt� reik�m� 0. U�ra�ykite analogi�k� komand� 
#    nenaudojant funkcijos ifelse.
# 3. Skai�iaus �enklo nustatymui naudojama funkcija sign. Naudojant funkcij� if,
#    u�ra�ykite skai�iaus x �enklo nustatymo funkcij�, kuri �gyja reik�m� 1, kai
#    skai�ius x > 0, reik�m� -1, kai x < 0 ir reik�m� 0, kai x = 0.
# 4. U�ra�ykite komand�, kuri patikrina, ar vis� vektoriaus n element� reik�m�s 
#    nevir�ija 5. Jei �i s�lyga teisinga, tai kintamajam k priskiriama reik�m� 0.
#    Jei s�lyga netenkinama, kintamajam k priskiriamas didesni� u� 5 vektoriaus
#    element� skai�ius, o kintamajam l priskiriamas bendras element� skai�ius.
# 5. U�ra�ykite komand�, kuri patikrint�, ar vektorius n yra sveik�j� skai�i�
#    vektorius. Jei ne, vektoriaus klas� pakeiskite � sveik�j� ir � konsol�
#    i�veskite prane�im� apie vektoriaus klas�s pakeitim�.
