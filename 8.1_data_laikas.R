
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Datos ir laiko formatas POSIX.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2015-11-05 | 2015-12-12
#


# TURINYS -------------------------------

#
#   1. Sisteminio laiko ir datos funkcijos:
#      * funkcija date()
#      * funkcija Sys.Date()
#      * funkcija Sys.time()
#      * funkcija Sys.timezone()
#      * funkcija OlsonNames()
#      * funkcija format
#
#   2. POSIX datos ir laiko formatas:
#      * funkcija as.POSIXlt
#      * funkcija as.POSIXct
#
#   3. Datos ir laiko sudarymas i� teksto:
#      * funkcija strptime
#      * funkcija strftime
#
#   4. Datos ir laiko sudarymas i� skai�i�:
#      * funkcija ISOdatetime
#      * funkcija ISOdate
#
#   5. Datos kintamojo sudarymas:
#      * funkcija as.Date
#


# PASTABOS ------------------------------

#
# Galima sugalvoti daugiau u�duo�i�.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# STANDARTIN�S DATOS IR LAIKO FUNKCIJOS   #
# --------------------------------------- #

# R turi kelet� standartini� datos ir laiko nustatymo funkcij�: kai kurios i� j�
# parodo tik dat�, kitos parodo ir dat�, ir laik�. Kadangi data arba laikas gali 
# b�ti u�ra�omi kaip paprastas tekstas arba u�ra�omi naudojant tam skirtus datos
# ir laiko formatus, �i� funkcij� reik�m� yra vis kitokio tipo.

date()
Sys.Date()
Sys.time()
Sys.timezone()


# Datos ir laiko u�ra�ymui naudojami tam tikri standartiniai pa�ym�jimai. Kelet�
# i� j� galima pamin�ti:
#
#         %Y -- metai,
#         %y -- metai (be pirm�j� dviej� skai�i�),
#         %m -- m�nesio numeris,
#         %d -- dienos numeris,
#         %e -- dienos numeris (be nulio priekyje),
#
#         %H -- valandos (00�23),
#         %M -- minut�s (00�59),
#         %S -- sekund�s (00�61),
#
#         %A -- savait�s dienos pavadinimas,
#         %a -- sutrumpintas savait�s dienos pavadinimas,
#         %B -- m�nesio pavadinimas,
#         %b -- sutrumpintas m�nesio pavadinimas,
#         %C -- am�ius, �imtmetis,
#         %W -- met� savait�s numeris,
#         %w -- savait�s dienos numeris (sekmadienis 0),
#         %Z -- laiko zona,
#         %z -- laiko pokytis nuo GMT.

# Kai kurios �alys turi savo datos ir laiko u�ra�ymo format�. Laikantis ISO 8601
# standarto, metai, m�nuo ir dienos atskiriami br�k�neliu, ta�iau Lietuvoje gali
# b�ti atskiriami ir ta�ku. D�l tos prie�asties data bei laikas gali b�ti rodomi
# prisitaikant prie lokal�s:
#
#         %X -- laikas pagal vietinio laiko u�ra�ymo taisykles,
#         %x -- data pagal vietinio laiko u�ra�ymo taisykles.

# Da�niausiai pasitaikan�ios laiko element� kombinacijos turi savus pa�ym�jimus:
#
#         %T == %H:%M:%S
#         %R == %H:%M
#         %F == %Y-%m-%d
#         %D == %m/%d/%y
#         %c == %a %b %e %H:%M:%S %Y


# Kiekviena sisteminio laiko ir datos funkcija dat� rodo tam tikru savo formatu, 
# ta�iau t� pa�i� dat� galima u�ra�yti keliais skirtingais b�dais. Tam naudojama 
# funkcija format. Jos parametrai:
#
#          x -- data,
#     format -- datos formatas,
#         tz -- laiko zona,
#      usetz -- loginis, ar rodyti laiko zon�.

# Pavyzd�iui, �ios dienos dat� galima u�ra�yti taip: m�nuo-diena, savait�s diena.
# Toks datos u�ra�ymo pavidalas atitinka "%m-%d, %A" format�.

format(Sys.Date(), format = "%m-%d, %A")

# Pavyzd�iui, laiko moment� galima nurodyti t�kstant�j� sekund�i� tikslumu. Toks
# laiko u�ra�ymas atitinka "%H:%M:%OS3" format�.

format(Sys.time(), format = "%H:%M:%OS3")

# Turint laiko moment�, galima parodyti, koks vietinio laiko skirtumas nuo laiko 
# pagal Grinvi��. Papildomai nurodome, kad b�t� parodomas ir laiko zonos kodas.

format(Sys.time(), format = "%z", usetz = TRUE)

# Naudojant funkcij� format, t� pat� laik� galima "pervesti" � kit� laiko juost�.
# R kalboje naudojama taip vadinama Olson laiko zon� duomen� baz� (TZ database). 

OlsonNames()

# Pavyzd�iui, u�fiksuosime laiko moment� ir atvaizduosime j� Vilniaus, Tokijo ir 
# Londono laiku.

t <- Sys.time()
t

format(t, "%T", usetz = TRUE, tz = "Europe/Vilnius")
format(t, "%T", usetz = TRUE, tz = "Asia/Tokyo")
format(t, "%T", usetz = TRUE, tz = "Europe/London")


# U�DUOTIS ------------------------------ 

# 1. �ios dienos dat� u�ra�ykite tokiais formatais: a) tik metai, b) tik m�nesio 
#    pavadinimas, c) tik diena, d) savait�s diena, m�nesio pavadinimas ir dienos 
#    numeris, d) metai, m�nuo ir diena atskirti ta�ku.
# 2. Sistemin� laik� u�ra�ykite tokiu formatu: a) tik data, b) tik laikas c) tik
#    metai, d) valandos ir minut�s, e) savait�s numeris, dienos numeris metuose,
#    f) valandos, minut�s ir sekund�s atskirtos simboliu |.
# 3. Did�ioji dalis Lietuvos teritorijos yra UTC+2 laiko juostoje. Olson duomen�
#    baz�je tokios laiko zonos pavadinimo n�ra, ta�iau vietoje UTC yra naudojama 
#    Etc/GMT laiko zon� sistema, kur teigiamas laiko post�mis atitinka tok� pat� 
#    post�m� � prie�ing� pus� UTC sistemoje. Sistemin� laik� u�ra�ykite Etc/GMT
#    sistemoje.
# 4. JAV ir kai kuri� kit� valstybi� kariuomen�s savo tikslams naudoja specifin� 
#    laiko sistem�, kur laiko zon� pavadinimai susieti su NATO fonetine ab�c�le. 
#    Pvz., raid� A �ymi "Alpha" laiko zon�, kuri atitinka UTC+1, raid� B "Bravo",
#    kuri atitinka UTC+2 ir t. t. Sistemin� laik� u�ra�ykite "Zulu" laiko zonoje.
#    Nustatykite, kok� UTC laik� ji atitinka.


# --------------------------------------- #
# POSIX DATOS IR LAIKO FORMATAS           #
# --------------------------------------- #

# UNIX ir kai kuriose kitose operacin�se sistemose naudojama POSIX laiko sistema. 
# �ioje sistemoje laiko momentas nurodomas sekund�i� skai�iumi nuo 1970 sausio 1 
# dienos 00:00:00 val. Tokiu b�du POSIX laikas yra sveikasis skai�ius, kuris kas 
# sekund� padid�ja vienu vienetu. �ia prasme POSIX suderinta su pasaulinio laiko 
# sistema UTC, kurioje laiko vienetas yra sekund�. Paprastai viena para sudaryta
# i� 86400 sekund�i�. D�l �em�s sukimosi l�t�jimo pasaulinis laikas nesutampa su 
# astronominiu laiku, tod�l, atliekant sinchronizacij�, prie UTC laiko pridedama 
# papildoma sekund�. Tokios papildomos sekund�s POSIX sistemoje neskai�iuojamos, 
# tod�l POSIX laikas n�ra nei tikrasis astronominis, nei tikrasis pasaulinis UTC 
# laikas. Galima su�inoti, kada buvo prid�tos papildomos sekund�s:

.leap.seconds

# R kalboje naudojami du datos ir laiko formatai: POSIXct ir POSIXlt. Abi klas�s
# atitinka POSIX laiko apibr��im� - tai teigiamas arba neigiamas skai�ius, kuris 
# lygus sekund�i� skai�iui nuo 1970-01-01 00:00:00. Viena nuo kitos jos skiriasi 
# tuo, kad POSIXct objektas i� tikro yra skai�ius, o POSIXlt objektas - tai toks 
# s�ra�as, kurio elementai nurodo atskiras datos ir laiko komponentes:
# 
#        sec -- 0�61: sekund�s;
#        min -- 0�59: minut�s;
#       hour -- 0�23: valandos;
#       mday -- 1�31: m�nesio diena;
#        mon -- 0�11: m�nesio numeris metuose;
#       year -- met� nuo 1900 skai�ius;
#       wday -- 0�6: savait�s dienos numeris pradedant sekmadieniu;
#       yday -- 0�365: met� dienos numeris;
#      isdst -- vasaros laiko indikatorius;
#       zone -- laiko zonos identifikatorius (neb�tinas);
#     gmtoff -- laiko post�mis sekund�mis nuo GTM (neb�tinas).
#
# Kadangi POSIXct formatu u�ra�ytas laikas yra vienas skai�ius, jis u�ima ma�iau 
# vietos ir tod�l labiau tinka �vairiems veiksmams su datomis arba j� saugojimui
# duomen� lentel�se. POSIXlt formatas naudojamas tada, kai i� datos reikia gauti
# koki� nors vien� atskir� dal�, pvz., savait�s dien� arba dienos numer� metuose.


# POSIX objekto klas� kei�iama naudojant funkcijas as.POSIXct ir as.POSIXlt. Tos
# funkcijos naudojamos ir POSIX objekto sudarymui i� tekstiniu formatu u�ra�ytos
# datos. Pagrindiniai argumentai:
#
#          x -- datos objektas, POSIXct arba POSIXlt tipo objektas,
#         tz -- laiko zona.
#
# Funkcija as.POSIXlt, priklausomai nuo to, koks yra datos objektas, gali tur�ti
# dar du parametrus:
#
#     format -- datos formatas, kai x yra "character" tipo,
#     origin -- datos atskaitos ta�kas, kai x yra "numeric" tipo.


# Pvz., sudarysime POSIXct klas�s vektori� i� %Y-%m-%d %H:%M:%S formatu u�ra�yto
# laiko momento. Tarkime, kad laiko zona bus Lietuvos.

laikas <- "2015-11-08 14:31:17"
laikas

t <- as.POSIXct(laikas, tz = "Europe/Vilnius")
t

# Matome, kad POSIXct klas�s objektas yra double tipo skai�ius, kuris ir rei�kia 
# sekund�i� skai�i� nuo 1970-01-01 00:00:00. Galima pasteb�ti, kad toks objektas
# turi atribut� tzone, kuriam priskirtas laiko zonos pavadinimas.

class(t)
mode(t)
typeof(t)
attributes(t)


# Sudarysime to paties laiko momento POSIXlt klas�s objekt�.

t <- as.POSIXlt(laikas, tz = "Europe/Vilnius")
t

# Nesunkiai galima patikrinti, kad POSIXlt klas�s objektas yra laiko komponen�i�
# s�ra�as. 

class(t)
mode(t)
typeof(t)
attributes(t)

# I� tokio s�ra�o galima gauti atskiras datos arba laiko komponentes. Pavyzd�iui,
# valandas, minutes ir sekundes, savait�s dienos ar met� dienos numer�.

t[["sec"]]      # sekund�i� skai�ius
t[["year"]]     # met� skai�ius nuo 1900 met�
t[["yday"]]     # dienos metuose numeris (skai�iuojant nuo 0)
t[["zone"]]     # laiko zonos kodas

# Panaikinant objekto klas�, galima pamatyti i� karto visus �io s�ra�o elementus.

unlist(t)
unclass(t)


# Jei laikas u�ra�ytas nestandartiniu pavidalu, sukuriant POSIXlt klas�s objekt�,
# reikia nurodyti jo u�ra�ymo format�.

laikas <- "14:31:17 08/11/2015"
laikas

t <- as.POSIXlt(laikas, format = "%H:%M:%S %d/%m/%Y")
t

# Laiko moment� galima nurodyti sekund�iu skai�iumi nuo tam tikro momento. Pvz.,
# 12 valand� yra 43200 sekund�i�. Tegul atskaitos ta�kas yra 2015-01-01 00:00:00 
# pagal UTC. Sukursime atitinkam� laiko moment�.

laikas <- 43200
laikas

t <- as.POSIXlt(laikas, origin = "2015-01-01 00:00:00", tz = "GMT")
t


# NAUDINGA ------------------------------

# Laiko momentas paprastai susietas su laiko zona, bet kartais laiko zon� reikia 
# pakeisti. Kei�iant laiko zon� galimi du laiko momento perskai�iavimo variantai:
#
#  a) palikti t� pat� laik�,
#  b) perskai�iuoti laik�.

# Pavyzd�iui, turime POSIXlt objekt� su laiko momentu pagal pasaulin� UTC laik�.
# Galima pasteb�ti, kad laiko zon� nurodantis kodas yra laiko objekto atributas.

t <- as.POSIXlt("2015-11-07 00:00:25", format = "%F %T", tz = "UTC")
t

attributes(t)

# Tam, kad laik� b�t� galima perskai�iuoti, jis turi b�ti saugomas kaip skai�ius
# ir tod�l turi b�ti u�ra�ytas POSIXct formatu. Jei, konvertuojant POSIX objekt� 
# nurodoma nauja laiko zona, tai kei�iasi tik laiko zona, bet ne laiko momentas. 
# Pavyzd�iui, konvertuojant dat� � POSIXct klas�, nurodysime kit� laiko zon� --
# "Europe/Vilnius".

a <- as.POSIXct(t, tz = "Europe/Vilnius")
a

attributes(a)

# Galima pasteb�ti, kad laiko zona pasikeit�, ta�iau laiko momentas nepasikeit�.
# Tuo atveju, kai kei�iant laiko zon� laiko momentas turi b�ti perskai�iuojamas, 
# laikas i� prad�i� konvertuojamas � POSIXct klas�, o tada pakei�iamas atributas.

b <- as.POSIXct(t)
b

attributes(b)
attr(b, "tzone") <- "Europe/Vilnius"
attributes(b)

b

# Jeigu laikas yra POSIXct klas�s objektas, pakeisti laiko zon� ir perskai�iuoti
# laik� galima naudojant funkcij� format -- taip gauname tekstin� laiko i�rai�k�.
# Pavyzd�iui, u�ra�ysime t� pat� laik� Tokijo laiku.

format(b, "%T", usetz = TRUE, tz = "Asia/Tokyo")


# U�DUOTIS ------------------------------ 

# 1. Tarkime, kad laiko momentas pagal UTC u�ra�ytas taip: "2015.12.12 07|54|25".
#    Sudarykite POSIXct ir POSIXlt formato laiko objektus.
# 2. Sudarykite POSIXct laiko objekt�, kuris rei�kia laiko moment� pra�jus 1 mln. 
#    sekund�i� nuo dabar. Kokia tai bus m�nesio ir savait�s diena?
# 3. Perskai�iuokite ir nustatykite, kok� laiko moment� pagal UTC atitinka laiko
#    momentas "2015-12-12 10:07:26" EET laiko zonoje, kurioje yra ir Lietuva.


# --------------------------------------- #
# POSIXlt OBJEKTO SUDARYMAS I� TEKSTO     #
# --------------------------------------- #

# �vairiuose duomen� failuose data ir laikas paprastai u�ra�yti kaip tekstas. Jo
# konvertavimui � POSIXlt format� naudojama funkcija strptime. F-jos parametrai:
#
#          x -- character tipo laiko reik�mi� vektorius,
#     format -- formatas, kuriuo u�ra�ytas laikas,
#         tz -- laiko zonos kodas.


# Laikantis ISO 8601 standarto, metai, m�nuo ir diena vienas nuo kito atskiriami 
# br�k�neliu, tod�l data nurodoma YYYY-MM-DD formatu, kuris u�ra�omas "%Y-%m-%d"
# arba sutrumpintai "%F". Pavyzd�iui, nuskaitysime tokiu formatu u�ra�ytas datas.

x <- c("1961-04-12", "1965-03-18", "1969-07-24")
x

t <- strptime(x, format = "%Y-%m-%d")
t

# Tos pa�ios datos gali b�ti u�ra�ytos kitokiu formatu. Pavyzd�iui, labai da�nai
# metai, m�nuo ir diena atskiriami pasviru br�k�neliu.

x <- c("1961/04/12", "1965/03/18", "1969/07/24")
x

t <- strptime(x, format = "%Y/%m/%d")
t

# Kai kurie laiko momentai n�ra susieti su jokia konkre�ia vietove ar laiko zona. 
# Pvz., toks universalus laikas reikalingas or� prognozei, l�ktuv�, traukini� ir
# kit� transporto priemoni� tvarkara��iams sudaryti, jis naudojamas internete ir
# astronomijoje, tarptautin�je kosmin�je stotyje. Iki 1972 met� pasaulyje laikas 
# buvo matuojamas pagal astronomin� Grinvi�o laik�. Nuo 1972 naudojama pasaulin� 
# UTC laiko sistema ir laikas sinchronizuojamas pagal atomin� laikrod�.
#
#        UTC -- Coordinated Universal Time,
#        GMT -- Greenwich Mean Time.

# Pavyzd�iui, sudarysime tris laiko momentus pagal UTC laik�. Format� nurodysime
# naudodami piln� ir sutrumpint� datos ir laiko kod�.

#       Skrydis � kosmos�      I��jimas � kosmos�     Nusileidimas M�nulyje
#      ---------------------  ---------------------  ---------------------
x <- c("1961-04-12 06:07:00", "1965-03-18 08:34:51", "1969-07-24 16:50:35")
x

t <- strptime(x, format = "%Y-%m-%d %H:%M:%S", tz = "UTC")
t <- strptime(x, format = "%F %T", tz = "UTC")
t

# Jeigu laiko momentas susietas su konkre�ia vietove, reikia nurodyti laiko zon�.
# Laiko zonos turi vardus, kurie paprastai susideda i� dviej� dali�. Pavyzd�iui,
# "Europe/Vilnius", "Europe/London", "America/Toronto", "Asia/Hong_Kong" ir pan.
# Pavyzd�iui, u�ra�ant Japonijos miest� Hiroshima ir Nagasaki bombardavimo laik�, 
# reikia nurodyti Japonijos laiko zon�.

#       Hiroshima              Nagasaki
#      ---------------------  ---------------------
x <- c("1945-08-06 08:15:00", "1945-08-09 11:02:00")
x

t <- strptime(x, format = "%Y-%m-%d %H:%M:%S", tz = "Asia/Tokyo")
t <- strptime(x, format = "%Y-%m-%d %H:%M:%S", tz = "Japan")
t

# � t� pa�i� laiko juost� patenkan�ios �alys gali b�ti apjungiamos � vien� laiko 
# zon�. Pvz., Suomija, Estija, Latvija, Lietuva, Ukraina ir dar kelios UTC +2:00
# juostoje esan�ios �alys sudaro Ryt� Europos laiko zon�. Beveik viso �ios laiko
# zonos �alys pereina � vasaros laik�, kuris turi atskir� pavadinim�:
#
#        EET -- Eastern European Time (EET),
#        EST -- Eastern European Summer Time (EEST).

# Vietinis laikas pagal ISO 8601 standart� nustatomas per skirtum� nuo UTC laiko. 
# Pavyzd�iui, EET laiko zona atitinka UTC +2:00 laik�, "Europe/Vilnius" taip pat 
# atitinka UTC +2:00 laik�. 

# Etc yra speciali sritis, kuri naudojama nekonkre�ioms laiko zonoms. Pavyzd�iui, 
# Etc/UTC atitinka universal� pasaulin� laik�. Pridedant laiko skirtum�, gauname
# t� skirtum� atitinkan�ios laiko juostos laik�. POSIX sistemoje vietoje Etc/UTC 
# naudojamos Etc/GMT laiko juostos, ta�iau -- su prie�ingu laiko skirtumo �enklu!
# O tai rei�kia, kad, pvz., EET laiko zona atitinka Etc/GMT -2:00, bet ne +2:00, 
# kaip �prasta.


# Jei laiko reik�mes reikia �ra�yti � tekstin� fail�, tai POSIX formatu u�ra�yt� 
# laik� pirmiausia reikia konvertuoti � tekst�. Tam galima naudoti f-j� strftime. 
# �ios funkcijos parametrai tokie:
#
#          x -- data, kuri gali b�ti u�ra�oma POSIXlt formatu,
#     format -- datos i�vedimo formatas,
#         tz -- laiko zona,
#      usetz -- loginis, nustato ar rodyti laiko zon�.


# Pavyzd�iui, tekstiniu formatu u�ra�ysime Japonijos miest� bombardavimo datas.

datos <- strftime(t, format = "%F %T", usetz = TRUE)
datos

# �ra�ysime gaut� dat� vektori� � tekstin� fail�. Tam panaudosime dvi skirtingas
# funkcijas: writeLines ir write. Norint �sitikinti, kad datos �ra�ytos � fail�,
# j� galima atidaryti. Kadangi gautas failas �iaip nereikalingas, j� i�trinsime.

writeLines(datos, con = "datos.txt")
file.show("datos.txt")

write(datos, file = "datos.txt")
file.show("datos.txt")

file.remove("datos.txt")


# Laiko ir datos u�ra�ymui tekstiniu formatu galima panaudoti ir funkcij� format. 

format(t, format = "%F %T", usetz = TRUE)


# U�DUOTIS ------------------------------ 

# 1. Tarkime, kad laiko momentas u�ra�ytas tokiu pavidalu: "2015 12 12 10 40 15".
#    Matome, kad metai, m�nuo, diena ir t. t. vienas nuo kito atskirti tik tarpo
#    simboliu. Funkcijai strptime nurodykite datos ir laiko u�ra�ym� atitinkant� 
#    format� ir sudarykite POSIX laiko objekt�.
# 2. Duotas toks dat� vektorius: c("1918 2 m�n. 16 d.", "1990 3 m�n. 11 d."). ��
#    dat� vektori� paverskite � POSIX laiko objekt�.
# 3. Prie� tai gaut� POSIX dat� vektori� �ra�ykite � tekstin� fail�: a) be laiko
#    zonos, b) tik metus, c) savait�s dien�, m�nuo ir diena.


# --------------------------------------- #
# POSIXlt OBJEKTO SUDARYMAS I� SKAI�I�    #
# --------------------------------------- #

# Jeigu data arba laikas u�ra�yti kaip tekstas, naudojant pilnus ar sutrumpintus 
# m�nesi� pavadinimus, tada konvertavimui � POSIXlt laiko format� naudojama f-ja 
# strptime. Jei visos laiko komponent�s -- metai, m�nuo diena, valandos, minut�s 
# ir sekund�s -- u�ra�omos skai�iais, tada POSIXlt klas�s laiko moment� sudaryti 
# patogu naudojant funkcij� ISOdatetime arba analogi�k� jai funkcij� ISOdate. J�
# parametrai visi vienodi:
#
#       year -- metai,
#      month -- m�nuo,
#        day -- diena,
#       hour -- valanda,
#        min -- minut�s,
#        sec -- sekund�s,
#         tz -- laiko zona.

# I� esm�s �ios funkcijos yra vienodos ir skiriasi tik pradin�mis savo parametr� 
# reik�m�mis:
#
#   ISOdatetime(year, month, day, hour, min, sec, tz = "")
#   ISOdate    (year, month, day, hour = 12, min = 0, sec = 0, tz = "GMT")
#
# Matosi, kad pagal nutyl�jim� f-jos ISOdatetime parametrui tz priskirta reik�m� 
# "", o f-jos ISOdate -- "GMT". Pirmuoju atveju laiko momentui nustatoma vietin� 
# laiko zona, o antruoju gaunamas laiko momentas pagal pasaulin� UTC laik�.

# Kuri� funkcij� naudoti, priklauso nuo situacijos. Jei reikia u�ra�yti tikslaus 
# laiko moment�, tada labiau tinka ISOdatetime. 

ISOdatetime(year = 2015, month = 11, day = 15, hour = 17, min = 48, sec = 18)

# Kaip visada - jeigu reik�m�s parametrams priskiriamos eil�s tvarka, pavadinim� 
# galima ir nera�yti.

ISOdatetime(2015, 11, 15, 17, 48, 18)

# Jeigu nurodome ne tik dat�, bet ir laik�, tada galima naudoti ir f-j� ISOdate.
# Papildomai nurodysime laiko zon�, nes �iai funkcijai pagal nutyl�jim� yra UTC.

ISOdate(2015, 11, 15, 17, 48, 18, tz = "Europe/Vilnius")

# Jei reikalinga tik data be tikslaus laiko, tada labiau tinka funkcija ISOdate.
# Pavyzd�iui, nurod�ius tik metus, m�nes� ir dien�, sudaromas tos dienos 12 val.
# atitinkantis laiko momentas pagal UTC laik�.

ISOdate(2015, 11, 15)

# Jeigu kuriam nors parametrui priskiriame skai�i� sek�, galime sugeneruoti dat�
# sek�. Pavyzd�iui, sudarysime 2015 met� vis� 12-os m�nesi� pirm�j� dien� sek�.

ISOdate(2015, 1:12, 1)


# U�DUOTIS ------------------------------ 

# 1. Naudodami f-j� ISOdatetime, sudarykite 24 laiko moment� vektori�, i�d�styt�
#    tolygiai kas valand� ir pradedant nuo 00:00.


# --------------------------------------- #
# DATOS FORMATAS                          #
# --------------------------------------- #

# Vien dat� nurodan�io objekto sudarymui naudojama f-ja as.Date. Gaunamas "Date"
# klas�s vektorius, kurio elementas yra data. Prie tokiu formatu u�ra�ytos datos
# galima prid�ti ar atimti tam tikr� dien� skai�i�, galima apskai�iuoti skirtum� 
# tarp dviej� dat�. Jei data u�ra�yta kaip tekstas, tada f-jos parametrai tokie:
#
#          x -- data kaip "character",
#     format -- datos formatas.
#
# Data, kaip ir POSIX laikas, gali b�ti u�ra�yta kaip skai�ius, kuris �ia nurodo
# dien� skai�i� nuo tam tikros datos. Tokiu atveju funkcijos parametrai tokie:
#
#          x -- data kaip "numeric",
#     origin -- atskaitos ta�kas.
#
# T� pa�i� funkcij� galima naudoti "POSIXct" formato laiko konvertavimui � dat�.
# Tada parametrai tokie:
#
#          x -- "POSIXct" formato laikas,
#         tz -- laiko zonos kodas.

# Pvz., tekstin� dat� vektori� konvertuosime � "Date" klas�s vektori�. �ia visos
# datos u�ra�ytos standartiniu "%Y-%m-%d" formatu, kuris ir nurodomas funkcijai.

#          Saul�s        Durb�s        �algirio      Or�os         Salaspilio
#         ------------  ------------  ------------  ------------  ------------ 
data <- c("1236-09-22", "1260-07-13", "1410-07-15", "1514-09-08", "1605-09-27")
data

d <- as.Date(data, format = "%Y-%m-%d")
d

class(d)


# Naudojant funkcij� format, t� pa�i� dat� galima pavaizduoti daugeliu skirting� 
# b�d�, pavyzd�iui:

format(d, format = "%Y")
format(d, format = "%m")
format(d, format = "%d")
format(d, format = "%B")
format(d, format = "%b")

format(d, format = "%Y-%m")
format(d, format = "%m-%d")
format(d, format = "%Y %B")


# U�DUOTIS ------------------------------ 

# 1. Tarkime, kad 1965 met� gegu��s 14 diena u�ra�yta sutrumpintai -- "65-05-14". 
#    Komanda as.Date("65-05-14", "%y-%m-%d") �i� dat� supranta kaip "2065-05-14". 
#    Sugalvokite, kaip korekti�kai konvertuoti taip sutrumpintai u�ra�ytas datas.
