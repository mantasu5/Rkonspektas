
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Duomen� eksportavimo � tekstin� ar binarin� fail� b�dai.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2013-07-22 | 2013-07-25
#


# TURINYS -------------------------------

#
#   1. Duomen� eksportavimas � tekstin� fail�:
#      * proced�ra write
#      * proced�ra writeLines
#      * proced�ra write.table
#      * proced�ra write.csv
#
#   2. Duomen� �ra�ymas � binarin� fail�:
#      * proced�ra save
#      * proced�ra load
#


# PASTABOS ------------------------------

#
# Kol kas pastab� n�ra.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# DUOMEN� EKSPORTAVIMAS � TEKSTIN� FAIL�  #
# --------------------------------------- #

# Vektoriaus ar matricos reik�m�s � tekstin� fail� �ra�omos naudojant proced�r� 
# write. Pagrindiniai parametrai tokie:
#
#        x -- R kintamasis: vektorius arba matrica,
#     file -- kabut�se u�ra�omas duomen� failo vardas arba kelias iki failo,
#      sep -- simbolis, kuriuo faile atskiriamos vektoriaus reik�m�s,
# ncolumns -- vektoriaus element� skai�ius vienoje failo eilut�je,
#   append -- jei TRUE, vektoriaus reik�m�s �ra�omos � jau esant� fail�.

# Jei parametrui file nurodomas tik duomen� failo vardas, tai darbiniame kataloge 
# sukuriamas failas, � kur� �ra�omos kintamojo reik�m�s. Darbin� katalog� galima 
# su�inoti su komanda getwd(), o pakeisti su komanda setwd (kaip �iame skripte). 
# Nepriklausomai nuo darbinio katalogo, galima nurodyti ir piln� keli� iki failo,
# ta�iau toks u�ra�ymo b�das ilgesnis ir da�nai nepatogus. Papras�iau programos 
# prad�ioje nurodyti reikiam� darbin� katalog� ir duomenis � j� ra�yti nurodant 
# tik failo vard�.

# Kintamojo reik�m�s sura�omos � tekstin� fail�, bet failo i�pl�timas neb�tinai 
# turi b�ti txt. Pagal nutyl�jim� skaitinio vektoriaus reik�m�s faile sura�omos
# eilut�mis po 5 reik�mes vienoje eilut�je, o simbolinio -- po vien� element� � 
# vien� eilut�.

# Sukursime paprast� vektori� i� skaitmen� ir j� �ra�ysime � tekstin� fail�.
v <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
v

write(x = v, file = "numb.vec")

# Galima pamatyti, kad kataloge "C:/Downloads" sukuriamas failas numb.vec, kurio
# viduje penkiuose stulpeliuose �ra�ytos vektoriaus reik�m�s.

# Pagal nutyl�jim� vektoriaus reik�m�s faile atskiriamos tarpu. T� pat� vektori�
# �ra�ysime � fail�, kuriame reik�m�s bus atskirtos tabuliacijos �enklu \t.
write(x = v, file = "numb.vec", sep = "\t")

# Jei elementai atskiriami naujos eilut�s �enklu \n, tai faile jie bus sura�yti 
# � vien� stulpel�.
write(x = v, file = "numb.vec", sep = "\n")

# Jei d�l koki� nors prie�as�i� vektoriaus reik�mes faile reikia �ra�yti � vien�
# ar kelis stulpelius, tai pakei�iama numatytoji parametro ncolumns reik�m�.
write(x = v, file = "numb.vec", ncolumns = 2)

# Kartais pasitaiko situacija, kai keletos vektori� reik�mes reikia sura�yti � t� 
# pat� fail�. Tokiais atvejais parametro append reik�m� reikia pakeisti � TRUE.
# Pavyzd�iui, � jau sukurt� fail� dar kart� �ra�ysime t� pat� vektori�.

write(x = v, file = "numb.vec")
write(x = v, file = "numb.vec", append = TRUE)


# Kadangi R kalboje matrica suprantama kaip vektorius, kurio elementai i�d�styti
# stulpeliais ar eilut�mis, tai matric� taip pat galima �ra�yti � fail�. Kadangi
# matricos elementai nuskaitomi stulpeliais, o � fail� �ra�omi eilut�mis, tam kad
# faile matrica tur�t� tokius pat i�matavimus, j� reikia transponuoti.

# Pavyzd�iui, sukursime 3x4 dyd�io skai�i� matric� ir �ra�ysime j� � fail�.
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
m <- matrix(x, ncol = 4)
m

# Transponavimui naudojama funkcija t. Stulpeli� skai�ius nurodomas toks pat.
write(x = t(m), file = "numb.mat", ncolumns = 4)


# Tekstinio vektoriaus elementai pagal nutyl�jim� � fail� �ra�omi stulpeliu. 
t <- c("P", "R", "O", "G", "R", "A", "M", "A", "V", "I", "M", "A", "S")
t

write(x = t, file = "text.vec")


# Jei vektoriaus elementai yra simboli� sekos, �od�i� junginiai ar sakiniai, tai
# patogumo d�lei faile tie sakiniai ra�omi po vien� � vien� eilut� -- stulpeliu. 
# Tokiu atveju galima naudoti speciali� proced�r� writeLines. Jos parametrai:
#
#    text -- tekstinis vektorius,
#     con -- tekstinio failo ar kito i�vedimo �renginio pavadinimas,
#     sep -- simbolis, kuriuo faile atskiriamos vektoriaus reik�m�s.

t <- c("Pirmas sakinys.", "Antras sakinys.", "Tre�ias sakinys.", "Jau pabaiga.")

writeLines(text = t, con = "text.txt")

# Vektoriaus elementus faile galima atskirti ne tik naujos eilut�s, bet ir kokiu
# nors kitu simboliu. Pavyzd�iui, elementus faile atskirsime tarpo �enklu.

writeLines(text = t, con = "text.txt", sep = " ")


# NAUDINGA ------------------------------

# Proced�rai write nenurod�ius failo vardo, pagal nutyl�jim� darbiniame kataloge 
# automati�kai sukuriamas tekstinis failas "data" be i�pl�timo.
write(x = v)

# Jei parametrui file vietoj failo vardo nurodomos tu��ios kabut�s, tai vektorius
# "�ra�omas" � konsol�. 
write(x = v, file = "")

# Tokiu b�du galima pakeisti � konsol� i�vedamo vektoriaus format�. Pavyzd�iui, 
# vektori� � konsol� i�vesime dviem stulpeliais.
write(x = v, file = "", ncolumns = 2)


# U�DUOTIS ------------------------------ 

# 1. Naudodami proced�r� write, u�ra�ykite komand�, kuri matricos m elementus �
#    fail� sura�yt� viename stulpelyje.
# 2. Naudodami proced�r� write, u�ra�ykite komand�, kuri tekstinio vektoriaus t 
#    elementus � fail� �ra�yt� dviem stulpeliais.
# 3. Naudodami proced�r� write, u�ra�ykite komand�, kuri vektoriaus t elementus
#    � fail� sura�yt� vienoje eilut�je. Papildykite komand� taip, kad elementai 
#    b�t� �ra�omi be tarp�.
# 4. Naudodami proced�r� writeLines, u�ra�ykite toki� komand�, kuri vektoriaus t
#    elementus �ra�yt� vienoje eilut�je be tarp�.


# Duomen� lentel�s � tekstin� fail� �ra�omos naudojant proced�r� write.table. 
# Da�niausiai naudojami parametrai:
#
#         x -- duomen� lentel�, data.frame tipo kintamasis,
#      file -- kabut�se u�ra�omas duomen� failo vardas arba kelias iki failo,
#       sep -- simbolis, kuriuo faile atskiriamos vektoriaus reik�m�s,
#       dec -- de�imtainio kablelio simbolis, pagal nutyl�jim� tai ta�kas ".",
# row.names -- jei TRUE, tai lentel� �ra�oma su eilu�i� pavadinimais,
# col.names -- jei TRUE, tai lentel� �ra�oma su stulpeli� pavadinimais,
#    append -- jei TRUE, vektoriaus reik�m�s �ra�omos � jau esant� fail�,
#     quote -- jei TRUE, tekstiniai kintamieji ir faktoriai �ra�omi � kabutes.

# Vietoje logini� reik�mi� TRUE arba FALSE, parametrams row.names ir col.names
# galima priskirti atitinkamai eilu�i� arba stulpeli� vard� vektori�. 

# Kategorini� kintam�j� reik�m�s gali b�ti ne tik atskiri simboliai arba �od�iai,
# bet ir keletos simboli� ar �od�i� junginiai su tarpu, pvz., vardas ir pavard�.
# Kadangi pagal nutyl�jim� duomen� lentel� � fail� �ra�oma stulpelius atskiriant
# tarpu, i� keli� �od�i� sudaryta kintamojo reik�m� u�ra�oma per kelet� stulpeli�. 
# Gali susidaryti situacija, kai stulpeli� faile yra daugiau nei kintam�j�. Tok� 
# duomen� fail� sunku korekti�kai nuskaityti, tod�l pagal nutyl�jim� kategorini�
# kintam�j� reik�m�s � fail� �ra�omos kabut�se. Stulpelius faile atskiriant ne
# tarpu, bet tabuliacijos �enklu \t, kabliata�kiu arba kokiu nors kitu specifiniu 
# simboliu, kabu�i� galima atsisakyti.


# Sudarysime duomen� lentel� d, kurios stulpeliuose yra trys skirtingo tipo 
# vektoriai: numeric, logical ir character.

x <- c(22.1, 37.5, 68.3, 47.7, 92.9, 87.2, 39.4, 19.6, 97.2, 32.4)
y <- c(FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE)
z <- c("P", "P",  "P",  "T",  "T",  "T",  "A",  "A",  "A",  "A")

# Duomen� lentel�s stulpeliai tur�s pavadinimus X, Y ir Z.
d <- data.frame(X = x, Y = y, Z = z)
d

# �ra�ysime gaut� duomen� lentel� � fail�. U�tenka nurodyti lentel�s pavadinim�
# ir failo vard�. Jis bus �ra�ytas � darbin� katalog�.
write.table(x = d, file = "duom.dat")


# Be papildom� nustatym� � fail� atskiru stulpeliu �ra�omi eilu�i� pavadinimai.
# Tais atvejais, kai eilu�i� pavadinimai sutampa su numeriais, kurie nuskaitymo 
# metu priskiriami automati�kai, � fail� j� galima ir nera�yti.
write.table(x = d, file = "duom.dat", row.names = FALSE)

# Pagal nutyl�jim� kategorini� kintam�j� reik�m�s �ra�omos kabut�se. Tuo atveju,
# kai kintamojo reik�m�s yra vienas simbolis arba vienas �odis, kabu�i� nereikia.
write.table(x = d, file = "duom.dat", row.names = FALSE, quote = FALSE)

# Pagal nutyl�jim� stulpeliai faile atskiriami tarpu, ta�iau da�nu atveju geriau
# atskirti tabuliacijos �enklu arba kabliata�kiu. Tai nurodoma per parametr� sep.
write.table(x = d, file = "duom.dat", row.names = FALSE, sep = ";")

# Pagal lietuvi� kalbos taisykles trupmenin� skai�iaus dalis skiriama kableliu,
# tai nurodoma per parametr� dec. �ia duomen� lentel� � fail� �ra�oma stulpelius 
# atskiriant tabuliacijos �enklu.
write.table(d, file = "duom.dat", row.names = F, quote = F, sep = "\t", dec = ",")


# Kad duomenis b�t� galima nesunkiai perkelti i� vienos programos � kit�, jie � 
# failus ra�omi tam tikru standartiniu formatu. Vienas tekstinio duomen� failo 
# formatas yra taip vadinamas "comma separated value" arba sutrumpintai CSV. Jis
# skirtas lentel�s pavidalo duomenims u�ra�yti, kur stulpeliuose yra kintamieji,
# o eilut�se yra stebiniai.

# Toks failas pirmoje eilut�je turi stulpeli� pavadinimus. Jei stulpeliai vienas
# nuo kito atskiriami kableliu, tai trupmenin� skai�iaus dalis skiriama ta�ku.
# Duomen� tokiu formatu �ra�ymui naudojama write.csv proced�ra. Jei stulpeliai 
# vienas nuo kito skiriami kabliata�kiu, tai trupmenin� skai�iaus dalis skiriama 
# mums �prastu kableliu. Duomenys tokiu formatu �ra�omi su proced�ra write.csv2.
# �i� proced�r� parametrai tokie patys kaip ir proced�ros write.table, skirtumas
# toks, kad nereikia nurodyti parametr� sep ir dec reik�mi�.

# Pavyzd�iui, CSV formatu �ra�ysime t� pa�i� duomen� lentel� d.
write.csv2(x = d, file = "duom.csv")

# Kaip ir anks�iau, �ia nereikalingi eilu�i� numeriai ir kintamieji kabut�se.
write.csv2(d, "duom.csv", row.names = F, quote = F)


# U�DUOTIS ------------------------------ 

# 1. Duomen� lentel�je iris yra duomenys apie keli� r��i� augal� �ied� matavimus.
#    Naudodami proced�r� write.table, �ra�ykite �iuos matavimus � tekstin� fail� 
#    "irisas.txt": stulpeliai faile atskiriami tabuliacijos �enklu, kategoriniai 
#    kintamieji �ra�omi be kabu�i�, eilu�i� numeriai nereikalingi.
# 2. Kintamasis Titanic yra laivo katastrof� i�gyvenusi� keleivi� kry�min� da�ni� 
#    lentel�, sudaryta pagal lyt�, am�i� ir klas�. Konsol�je galima pamatyti, kad
#    j� sudaro keturios atskiros dalys. Naudodami proced�r� write.table, �ra�ykite 
#    �i� lentel� � tekstin� fail�: eilu�i� numeri� nereikia, stulpeliai atskirti
#    tabuliacijos �enklu, kategorini� kintam�j� reik�m�s ra�omos be kabu�i�.
# 3. Naudodami proced�r� write.table, duomen� lentel� cars �ra�ykite � tekstin� 
#    fail� su lietuvi�kais stulpeli� pavadinimais.
# 4. CSV formatu �ra�ykite duomen� lentel� iris. Trupmenin� skai�iaus dalis turi
#    b�ti skiriama kableliu.


# --------------------------------------- #
# DUOMEN� �RA�YMAS � BINARIN� FAIL�       #
# --------------------------------------- #

# Jei duomenys sud�tingos strukt�ros, juos ne visada patogu laikyti tekstiniame 
# faile. Pavyzd�iui, tokie gali b�ti sud�tingi s�ra�ai, R statistini� proced�r� 
# rezultat� lentel�s ir t.t. Tokiais atvejais kintamuosius ar duomen� rinkinius 
# patogiau u�saugoti kaip binarin� R duomen� fail� su standartiniu tokio tipo
# failui i�pl�timu .RData (i�pl�timas gali b�ti ir kitoks). Taip daroma ir tada, 
# kai reikia i�saugoti sud�ting� ar ilgai trunkan�i� skai�iavim� rezultus, o j� 
# pakartojimas u�trunka ilgiau nei importavimas i� failo. Duomenis binariniu 
# formatu �ra�ome naudojant proced�r� save.

# Pavyzd�iui, binariniu formatu i�saugosime duomen� lentel�. Failas bus �ra�ytas
# � darbin� katalog�. Taip pat galima nurodyti ir piln� keli� iki failo.
save(d, file = "duom.RData")

# Tokiu b�du galima i�saugoti i� karto kelet� vektori�, duomen� lenteli� ar kit�
# R kintam�j�. J� vardai atskiriami kableliu.
save(x, y, z, file = "duom.RData")

# Jei kintam�j�, kuriuos reikia i�saugoti, yra daug, j� vardus galima sura�yti �
# character tipo vektori�. Tada proced�ros parametrui list reikia nurodyti t� 
# kintam�j� vard� vektori�. Pavyzd�iui, u�saugosime kelet� toki� kintam�j�.
save(list = c("x", "y", "z", "d"), file = "duom.RData")


# Binarinio tipo failas importuojamas naudojant proced�r� load. Pademonstruosime
# jos veikim� importuodami fail� "duom.RData".

# I�trinami visi kintamieji.
rm(list = ls())

# �sitikiname, kad prie� importavim� n�ra joki� kintam�j�.
ls()

# Importuojame fail� "duom.RData", kuriame �ra�yti kintamieji, x, y, z ir d.
load(file = "duom.RData")

# Matome, kad atsirado anks�iau � fail� �ra�yti kintamieji.
ls()


# U�DUOTIS ------------------------------ 

# 1. Vektori� v ir matric� m �ra�ykite � vien� binarin� fail� "vecmat.RData".
#    U�ra�ykite ir komandos variant�, kuriame naudojamas parametras list.
