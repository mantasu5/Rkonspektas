
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Vektori�, matric� ir duomen� lenteli� apjungimas.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2013-09-09 | 2013-09-23
#


# TURINYS -------------------------------

#
#   1. Vektori�, matric� ir lenteli� sujungimas:
#      * funkcija cbind
#      * funkcija rbind
#      * funkcija data.frame
#
#   2. Duomen� lenteli� apjungimas:
#      * funkcija merge
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
# DUOMEN� APJUNGIMAS                      #
# --------------------------------------- #

# Atliekant duomen� analiz� ar analizuojant gautus rezultatus labai da�nai tenka 
# juos apjungti � vien� vektori�, matric� arba duomen� lentel�. Tam naudojamos 
# kelios standartin�s funkcijos. 

# Vektori� apjungimui � matric� naudojamos funkcijos cbind ir rbind. �iuo atveju
# apjungiam� vektori� elementai turi b�ti vienodo tipo.

a <- c(1, 5, 8, 4, 6, 10, 9, 7, 2, 3)
b <- c(2.97, 6.93, 4.06, 6.83, 4.21, 6.28, 6.2, 3.7, 7.32, 6.21)

# Pavyzd�iui, sudarysime matric�, kurios vienas stulpelis yra skai�i� vektorius 
# a, o kitas stulpelis -- taip pat skai�i� vektorius b.

cbind(a, b)

# Tuos pa�ius vektorius galima apjungti eilut�mis.

rbind(a, b)

# Matricos stulpeliams ar duomen� lentel�s kintamiesiems galima suteikti vardus.

cbind(pirmas = a, antras = b)

# Jei apjungiami nevienod� element� skai�i� turintys vektoriai, tai trumpesnio 
# vektoriaus elementai cikli�kai pakartojami. Pvz., sukursime kintam�j�, kurio 
# visi elementai vienodi ir lygus 1.

cbind(pirmas = a, antras = b, tre�ias = 1)


# Jei � vien� lentel� reikia apjungti skirtingo tipo vektorius, naudojama f-ja
# data.frame. Jos parametrai:
#
#              ... -- vienas arba keli vektoriai, lentel�s kintamieji,
#        row.names -- eilu�i� pavadinim� vektorius, pagal nutyl�jim� NULL, 
#       check.rows -- pagal nutyl�jim� FALSE, patikrinami eilu�i� vardai,
#      check.names -- TRUE, patikrinama ar nesikartoja kintam�j� vardai,
# stringsAsFactors -- TRUE, kategoriniai kintamieji paver�iami faktoriais,

# Pavyzd�iui, � duomen� lentel� apjungsime skai�i� vektorius a ir b.

data.frame(a, b)

# Kintamiesiems galima nurodyti naujus vardus.

data.frame(X = a, Y = b)

# Kadangi parametro check.names reik�m� pagal nutyl�jim� TRUE, nety�ia nurod�ius 
# du vienodus kintam�j� vardus, vienas i� j� automati�kai bus pakeistas.

data.frame(X = a, X = b)

# Pagal nutyl�jim� duomen� lentel�s eilut�s sunumeruojamos, bet j� vardus galima 
# ir pakeisti. Tam reikia parametrui row.names nurodyti nesikartojan�i� reik�mi�
# vektori�. Pavyzd�iui, sukursime lentel�, kurios eilu�i� pavadinimai yra raid�s.

data.frame(X = a, Y = b, row.names = letters[1:10])

# Kategoriniai kintamieji duomen� lentel�je tampa faktoriais. Pvz., prijungsime 
# vektori�, kurio elementai yra did�iosios raid�s.

c <- c("A", "A", "B", "B", "A", "A", "B", "B", "B", "B")

d <- data.frame(X = a, Y = b, Z = c)
d

# Galima nesunkiai parodyti, kad character tipo vektorius pavirto � factor tipo
# lentel�s kintam�j�.

sapply(d, class)

# Tam, kad character tipo vektorius ir lentel�je likt� character tipo kintamuoju, 
# parametro stringsAsFactors reik�m� reikia pakeisti � FALSE.

d <- data.frame(X = a, Y = b, Z = c, stringsAsFactors = FALSE)
d

sapply(d, class)

# Kintamojo tipo i�laikymui naudojama funkcija I, tod�l ji irgi tinka character
# tipo vektoriaus �traukimui � lentel�.

d <- data.frame(X = a, Y = b, Z = I(c))
d

# Vektori� prie jau sukurtos lentel�s galima prijungti ir naudojant f-j� cbind. 
# Pvz., prie lentel�s d prijungsime login� vektori�, kurio vis� element� reik�m�
# yra TRUE. Nurodysime tik vien� reik�m�, likusios bus pakartotos.

cbind(d, L = TRUE)


# NAUDINGA ------------------------------

# Duomen� analiz�je pasitaiko situacija, kai � vien� lentel� reikia sujungti ne
# dvi, o daug ma�� duomen� lenteli�.

d.1 <- data.frame(x = 1:2, y = 11:12)
d.2 <- data.frame(x = 4:5, y = 14:15)
d.3 <- data.frame(x = 7:8, y = 17:18)

# Tokias lenteles paprastai galima apjungti naudojant funkcij� rbind.
rbind(d.1, d.2, d.3)

# Galima sukurti toki� duomen� lenteli� s�ra�� ir kaip parametr� j� perduoti tai
# pa�iai funkcijai rbind. Tam naudojama speciali funkcija do.call. 

d.list <- list(d.1, d.2, d.3)
d.list

do.call(rbind, d.list)


# Toks lenteli� sujungimo b�das labai efektyvus tais atvejais, kai, analizuojant 
# duomenis, kaip rezultatas gaunamas list tipo s�ra�as, kurio elementai yra tuos 
# pa�ius kintamuosius (kitaip neb�t� galima sujungti) turin�ios duomen� lentel�s. 

# Tokiu atveju pradiniai duomenys da�niausiai taip pat yra s�ra�o pavidalo. Pvz.,
# tai gali b�ti s�ra�as, kurio elementai yra nevienod� element� skai�i� turintys
# to paties tipo vektoriai, arba s�ra�as, kurio elementai yra kokio nors teksto 
# sakiniai arba kokio nors organizmo DNR sekos. Pradinius duomenis gali sudaryti
# duomen� lentel�s apie t� pat� objekt� skirtingais laiko momentais ir t.t.

# S�ra�o pavidalo duomenis labai patogu analizuoti naudojant funkcijas lapply ir
# sapply, kuri� rezultatas taip pat yra s�ra�as. Jei �i� funkcij� rezultatas yra
# duomen� lentel�s, tai jas galima nesunkiai apjungti naudojant do.call funkcij�.

# Tarkime, kad atliekama DNR sek� analiz�. Sek� sudaro nukleotidai A, C, G ir T. 
# Tarkime, kad turime 50 skirtingo ilgio DNR sek�, kurios apjungtos � list tipo 
# s�ra��. Vienas s�ra�o elementas yra vienas nukleotid� vektorius. Sugeneruosime
# tokius duomenis.

dnr <- replicate(50, sample(factor(c("A",�"C", "G", "T")), sample(20:50, 1), T))
dnr

# Pirma u�duotis -- apskai�iuoti kiekvienos sekos nukleodit� da�ni� lentel�. Tam
# panaudojame funkcij� table, kuri� pritaikome kiekvienai s�ra�o sekai. Gauname
# s�ra��, kurio elementai yra da�ni� lentel�s.

freq.list <- lapply(dnr, table)
freq.list

# Kadangi visos da�ni� lentel�s yra tokio paties pavidalo, jas galima nesunkiai
# apjungti � vien� didel� lentel�, kurios eilut�se bus sek� nukleotid� da�niai.

do.call(rbind, freq.list)


# Antra u�duotis -- kiekvienai DNR sekai sudaryti lentel�, kurioje b�t� �ra�ytas
# sekos ilgis, pirmas ir paskutinis jos nukleotidai.

# Kadangi tokios standartin�s funkcijos n�ra, j� tenka pasira�yti. 

dnr.info <- function(s) {

  ilgis   <- length(s)
  prad�ia <- s[1]
  pabaiga <- s[ilgis]
  
  info <- data.frame(prad�ia, pabaiga, ilgis)
  return(info)
}

# Funkcij� dnr.info, kuri suformuoja vienos sekos analiz�s lentel�, �dedame � 
# ciklo funkcij� lapply ir perb�game per sek� s�ra��.

stat.list <- lapply(dnr, dnr.info)
stat.list

# Gauname lenteli� s�ra��, kuri apjungiame naudojant do.call funkcij�.

do.call(rbind, stat.list)


# U�DUOTIS ------------------------------ 

# 1. Sudarykite data.frame tipo lentel�, kurios vienas stulpelis yra did�i�j�, o
#    kitas -- ma��j� raid�i� vektorius, atitinkamai LETTERS ir letters. Lentel�s
#    kintamieji turi i�likti character tipo.
# 2. Atlikite duomen� rinkinio dnr analiz�. Kiekvienai sekai sudarykite lentel�,
#    kuri turi du kintamuosius. Vieno kintamojo reik�m� yra pirmi trys dnr sekos
#    nukleotidai, kito kintamojo reik�m� -- nukleotid� C ir G dalis DNR sekoje.
#    Naudojant funkcij� do.call gaut� lenteli� s�ra�� apjunkite � vien� lentel�.


# --------------------------------------- #
# DUOMEN� APJUNGIMAS                      #
# --------------------------------------- #

# Kartais tenka apjungti duomen� lenteles, kurios turi bendr� kintam�j�. Tokiais
# atvejais rezultatas yra dviej� lenteli� sankirta, kuri gaunama naudojant f-j�
# merge. Pagrindiniai jos parametrai:
#
#        x -- pirmos lentel�s vardas,
#        y -- antros lentel�s vardas,
#       by -- bendras abiej� lenteli� kintamasis arba j� vektorius,
#      all -- FALSE, nurodo, kad � lentel� �traukiamos tik bendros eilut�s.

# Turime dvi lenteles: pirmoje sura�yti did�iausi Lietuvos miestai ir gyventoj�
# skai�ius juose 2001 ir 2011 metais, kitoje lentel�je yra miestai ir atstumas
# iki Vilniaus.

miestai <- read.table(header = TRUE, text = "
miestas       m2011  m2001
Alytus        63642  71491
Jonava        33172  34954
Kaunas       336912 378650
Klaip�da     177812 192954
Marijampol�   44885  48675
Ma�eikiai     38819  42675
Panev��ys    109028 119749
�iauliai     120969 133883
Utena         31139  33860
Vilnius      542932 542287
")

atstumas <- read.table(header = TRUE, text = "
miestas   atstumas
Vilnius         0
Utena          96
Alytus        101
Jonava        102
Kaunas        102
Panev��ys     136
Marijampol�   138
�iauliai      213
Ma�eikiai     291
Klaip�da      311
")

# Apjungsime �ias lenteles. Jos turi bendr� kintam�j� miestas, kur� nurodysime 
# parametrui by.

merge(miestai, atstumas, by = "miestas")

# Pagal nutyl�jim� parametrui by priskiriamas abiej� lenteli� bendr� kintam�j�
# vard� vektorius. Kadangi �iuo atveju toks kintamasis tik vienas, parametro by
# buvo galima ir nenurodyti -- jam reik�m� priskiriama vienareik�mi�kai.

merge(miestai, atstumas)


# Gali b�ti, kad bendras abiej� lenteli� kintamasis, pagal kur� jos apjungiamos, 
# vienoje lentel�je turi vienas reik�mes, o kitoje -- kitas. Tokiu atveju galimi
# keli lenteli� apjungimo variantai.

# Tarkime, kad miest� ir atstum� lentel�s turi vienod� �ra�� (eilu�i�) skai�i�,
# bet miest� s�ra�as vienoje lentel�je skiriasi nuo miest� s�ra�o kitoje. Pvz.,
# miest� lentel�je �ra�ytas Vilnius, bet jo n�ra atstum� iki sostin�s lentel�je.

miestai <- read.table(header = TRUE, text = "
miestas       m2011  m2001
Jonava        33172  34954
Kaunas       336912 378650
Klaip�da     177812 192954
Marijampol�   44885  48675
Ma�eikiai     38819  42675
Panev��ys    109028 119749
Utena         31139  33860
Vilnius      542932 542287
")

atstumas <- read.table(header = TRUE, text = "
miestas   atstumas
Utena          96
Alytus        101
Kaunas        102
Panev��ys     136
Marijampol�   138
�iauliai      213
Ma�eikiai     291
Klaip�da      311
")

# Apjungiant lenteles pagal bendr�, ta�iau nevienodas reik�mes turint� kintam�j�, 
# rezultatas yra lentel�, kurioje yra tik bendros abiem lentel�ms eilut�s. �iuo
# atveju kiekvienoje lentel�je yra po 8 miestus, ta�iau bendri abiem lentel�ms 
# yra tik 6 miestai.

merge(miestai, atstumas)

# Tam, kad b�t� �traukiamos visos abiej� lenteli� eilut�s, pakei�iama parametro
# all reik�m�. Tada gaunama lentel�, kurioje kai kurie kintamieji turi praleist�
# reik�mi�.

merge(miestai, atstumas, all = TRUE)

# Pagal nutyl�jim� � bendr� lentel� �traukiamos bendros abiem lentel�ms eilut�s.
# Jei nurodomas parametras all = TRUE, tada �traukiamos visos abiej� lenteli�
# eilut�s. Galima �traukti tik pirmos ar tik antros lentel�s eilutes, kuri� n�ra 
# kitoje lentel�je. Tam nurodomi parametrai atitinkamai all.x arba all.y.

merge(miestai, atstumas, all.x = TRUE)
merge(miestai, atstumas, all.y = TRUE)


# U�DUOTIS ------------------------------ 

# 1. Sugalvokite b�d�, kaip pradines miest� ir atstum� lenteles, kurios abi turi
#    po 10 eilu�i�, apjungti nenaudojant funkcijos merge. Kada tok� b�d� galima
#    taikyti lenteli� apjungimui?
