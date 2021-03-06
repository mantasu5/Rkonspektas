
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            S�ra�� sudarymas ir pagrindiniai veiksmai su jais.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2012-09-03 | 2013-05-06
#


# TURINYS -------------------------------

# 
#   1. S�ra�� sudarymas ir j� s�vyb�s:
#      * komanda list
#      * komanda class
#      * komanda length 
#      * komanda names
#      * komanda attributes
#      * komanda str
#      * operatorius [
#      * operatorius [[
#      * operatorius $
#
#   2. S�ra�� apjungimas:
#      * komanda c
#      * komanda unlist 
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
# S�RA�� SUDARYMAS                        #
# --------------------------------------- #

# S�ra�as -- tokia duomen� strukt�ra, kuri nuo vektoriaus skiriasi tuo, kad s�ra�o 
# elementai gali b�ti skirtingo tipo.

s <- list(0, NA, "a", TRUE, NULL)
s

# Be to, s�ra�o elementai gali b�ti net ir skirtingos duomen� strukt�ros. Pvz., 
# vienas elementas gali b�ti skai�ius, kitas -- logini� reik�mi� vektorius, tre�ias 
# elementas i� skai�i� sudaryta matrica, ketvirtas -- ka�koks kitas s�ra�as, kurio 
# elementai yra kiti s�ra�ai. Tokiu b�du galima sukurti sud�tingas, hierarchines 
# duomen� strukt�ras.

s <- list(1:9, c(FALSE, FALSE, TRUE), matrix(1:4, 2, 2))
s


# Tokia duomen� strukt�ra yra specialaus list tipo.
class(s)

# Kaip ir vektoriaus, s�ra�o element� skai�ius randamas su funkcija length.
length(s)

# Kaip ir vektoriaus, s�ra�o elementams galima suteikti vardus. Tam naudojama
# komanda names.

names(s) <- c("skaitmenys", "logika", "matrica")
s

# Vardus elementams galima suteikti s�ra�o sudarymo metu.
s <- list(skaitmenys = 1:9, logika = c(F, F, T), matrica = matrix(1:4, 2, 2))
s

# Kaip ir kit� R objekt�, s�ra�o atributus galima pa�i�r�ti su komanda attributes.
attributes(s)

# Sud�tingo objekto strukt�r� galima pamatyti naudojant funkcij� str. Pvz., matome,
# kad s�ra�as s yra sudarytas i� trij� element�, kurio pirmasis vadinasi �skaitmenys� 
# ir yra sveik�j� skai�i� vektorius, antras yra pavadintas �logika� ir yra vektorius
# i� trij� logini� reik�mi�, o tre�ias elementas vadinasi �matrica�, kurio elementai 
# yra skai�iai 1, 2, 3, 4 ir sudaro 2*2 matric�.

str(s)


# U�DUOTIS ------------------------------ 

# 1. Sukurkite s�ra��, kuris turi du elementus: pirmas elementas yra vektorius i�
#    ma��j� lotyni�k� raid�i�, o antras -- i� to vektoriaus padaryta matrica su 
#    dviem stulpeliais. S�ra�o elementams suteikite vardus �vektorius� ir �matrica�.


# S�ra�o elementus pagal j� eil�s numer� galima i�skirti dviem b�dais: naudojant 
# operatori� [ ir naudojant operatori� [[. Pvz., i�skirsime pirm� element�.
a <- s[1]
a

b <- s[[1]]
b

# Kadangi operatori� [ naudojant i�skirtas vektoriaus elementas taip pat yra 
# vektorius, tai analogi�kai i�skirtas s�ra�o elementas taip pat bus s�ra�as. 
# Operatori� [[ naudojant i�skirtas s�ra�o elementas tur�s savo pradin� tip� 
# ir strukt�r�.

# Palyginus dviem b�dais i�skirt� s�ra�o element� klas� -- objekto tip� matome,
# kad pirmasis yra s�ra�as i� vieno elemento -- vektoriaus, o antrasis ir yra
# tas sveik�j� skai�i� vektorius.

class(a)
class(b)

names(a)
names(b)

length(a)
length(b)

str(a)
str(b)

# Jei s�ra�o elementai turi vardus, juos galima panaudoti element� i�skyrimui.
# �iuo atveju operatori� [ ir [[ naudojimas nesiskiria nuo j� naudojimo nurodant 
# element� numerius.

x <- s["skaitmenys"]
x

y <- s[["skaitmenys"]]
y

# Operatorius $ naudojamas vieno s�ra�o elemento i�skyrimui nurodant jo vard�.
# Elemento vardas da�niausiai ra�omas be kabu�i�.

s$skaitmenys


# Kaip ir vektoriams, naudojant operatori� [ galima i�skirti kelet� element� i� 
# karto. Naudojant operatori� [[ galima i�skirti tik vien� s�ra�o element�.

i <- c(1, 3)
s[i]

i <- c("skaitmenys", "matrica")
s[i]


# NAUDINGA ------------------------------

# Vienoje i�rai�koje galima naudoti skirtingus operatorius [, [[ ar $. Kartais tas
# yra b�tina, ypa� tais atvejais, kai s�ra�as yra sud�tingos strukt�ros ir reikia
# pasiekti giliai esant� element�. Statistini� proced�r� rezultatai da�niausiai
# yra s�ra�ai, kurie gali b�ti sudaryti i� kit� s�ra��, kuri� elementai da�nai yra 
# vektoriai, matricos ir t.t. Pvz., i� s�ra�o s i�skirsime pirmojo elemento, kuris 
# yra vektorius, ketvirt� nar�.

# �ia s�ra�o elementas i�skiriamas su [[ ir jo numeriu, o vektoriaus su [ ir numeriu.
s[[1]][4]            

# �ia s�ra�o elementas i�skiriamas su [[ ir jo vardu, o vektoriaus su [ ir numeriu.
s[["skaitmenys"]][4] 

# �ia s�ra�o elementas i�skiriamas su $ nurodant vard�, o vektoriaus su [ ir numeriu.
s$skaitmenys[4]      


# U�DUOTIS ------------------------------ 

# 1. Para�ykite komand�, kuri, nepriklausomai nuo s�ra�o element� skai�iaus, 
#    i�skirt�  pirm� ir paskutin� jo elementus.
# 2. Trimis auk��iau apra�ytais b�dais i�skirkite i� s�ra�o s paskutinio elemento 
#    (matricos) paskutin� element�. Para�ykite toki� komand�, kuri nepriklausyt� 
#    nuo s�ra�o ilgio.


# --------------------------------------- #
# S�RA�� APJUNGIMAS                       #
# --------------------------------------- #

# Praktikoje da�nai tenka analizuoti to paties tipo, bet skirtingo ilgio vektorius, 
# kuri� negalima apjungti � matric�, nes eilut�s ar stulpeliai negali b�ti skirtingo
# ilgio. Tokiais atvejais vektorius patogu apjungti � s�ra��.

# Sukurkime tu��i� s�ra��, prie kurio prijungsime naujus elementus -- vektorius.
u <- list()
v <- list()

u[[1]] <- c(22, 83, 64, 23, 34, 93, 95, 36, 25, 49, 55, 13)
u[[2]] <- c(60, 95, 19, 9, 82, 26, 53, 84, 50, 74, 88, 62, 83, 42, 18, 77, 3)
u[[3]] <- c(67, 24, 63, 85, 65, 49, 37, 42, 72)
u[[4]] <- c(21, 35, 97, 88, 77, 62, 91, 58, 23, 56, 5, 2, 34, 82, 16)

v[[1]] <- c(3, 66, 43, 55, 97, 81, 96, 5, 98, 52, 15, 68, 11, 50, 87, 17)


# Viename s�ra�e yra keturi vektoriai, kitame -- vienas. Visi jie to paties tipo, 
# ta�iau skirting� ilgi�.
u 
v

# Naudojant funkcij� c, s�ra�us, kaip ir vektorius, galima prijungti vien� prie 
# kito. Tokiu atveju gaunamas s�ra�as, kurio ilgis lygus apjungiam� s�ra�� element� 
# skai�iui.
l <- c(u, v)
l

length(l)
class(l)
str(l)


# Naudojant funkcij� list, s�ra�us u ir v galima apjungti � vien� bendr� s�ra��. 
# Tokiu atveju gaunamas s�ra�as i� dviej� element�, kuri� kiekvienas atskirai yra 
# s�ra�as.
z <- list(Pirmas = u, Antras = v)
z

length(z)
class(z)
str(z)

# Tokio s�ra�o pirmo elemento pirmo vektoriaus pirmas narys i�skiriamas taip:
z$Pirmas[[1]][1]


# S�ra�o strukt�r� galima supaprastinti apjungiant j� sudaran�ius elementus � 
# vektori�. Tam naudojama funkcija unlist. Jos parametrai:
#
#         x -- s�ra�as, kurio strukt�r� ketiname supaprastinti,
# recursive -- pagal nutyl�jim� TRUE, nurodo s�ra�o elementus apjungti rekursi�kai,
# use.names -- pagal nutyl�jim� TRUE, nurodo s�ra�o elementams i�laikyti vardus.

# Pritaikius �i� funkcij� s�ra�ui l, kuris tur�jo 5 elementus-vektorius, gaunamas 
# vienas ilgas vektorius.
unlist(l)

# Pritaikius �i� funkcij� dviej� lygi� s�ra�ui z taip pat gauname vien� ilg� vektori�.
# Kadangi s�ra�o elementai tur�jo vardus, tai gauto vektoriaus elementai su vardais.
unlist(z)

# Galima nurodyti, kad naujai gautas vektorius netur�t� senojo s�ra�o vard�.
unlist(z, use.names = FALSE)

# Pagal nutyl�jim� s�ra�o, kur� sudaro kiti s�ra�ai, elementai apjungiami rekursi�kai.
# Pakeitus parametro recursive reik�m� � FALSE, gauname s�ra��, kur� sudaro giliau 
# esan�i� s�ra�� elementai, �iuo atveju -- vektoriai.

unlist(z, recursive = FALSE)

unlist(z, recursive = FALSE, use.names = FALSE)

# Panaikinus tokio s�ra�o element� vardus, gauname tok� pat s�ra��, koks buvo 
# gautas su funkcija c apjungus s�ra�us u ir v. Tokiu b�du galima supaprastinti 
# hierarchin� strukt�r� turin�ius s�ra�us.


# U�DUOTIS ------------------------------ 

# 1. U�ra�ykite kaip galima trumpesn� komand�, kuri sukurt� s�ra��, sudaryt� i� 10
#    2*2 dyd�io matric�, kurios pirmo stulpelio elementai lyg�s 1, o antro -- 2. 
# 2. Duotas s�ra�as w <- list(list(list(1:2), list(3:4)), list(list(5:6), list(7:8))).
#    I�nagrin�kite jo strukt�r�. Kiek element� sudaro taip u�ra�yt� s�ra��? 
#    Funkcija unlist(w) i� �io s�ra�o padaro vektori� (1, 2, 3, 4, 5, 6, 7, 8).
#    Gaukite tok� pat vektori� su funkcija unlist, ta�iau su parametru recursive = F.
