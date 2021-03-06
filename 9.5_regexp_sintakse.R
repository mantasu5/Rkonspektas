
#
#   Dalykas: STATISTIN�S DUOMEN� ANALIZ�S SISTEMA IR PROGRAMAVIMO KALBA R
#            Reguliarios i�rai�kos, regexp ir j� sudarymas.
#
#  Autorius: Tomas Reka�ius
#
#   Sukurta: 2016-05-01 | 2016-05-10
#


# TURINYS -------------------------------

#
#   1. Reguliarios i�rai�kos ir regexp:
#      * regexp ir j� panaudojimo galimyb�s
#      * reguliari� i�rai�k� standartai
#
#   2. BRE standarto reguliarios i�rai�kos:
#      * bazinio regexp standarto metasimboliai
#
#   3. ERE standarto reguliarios i�rai�kos:
#      * i�pl�stinio regexp standarto metasimboliai
#      * �od�io ribos nustatymas
#
#   4. POSIX simboli� klas�s:
#      * valdymo simboliai
#      * sutrumpinti simboli� klasi� pa�ym�jimai
#      * POSIX klas�s ir j� hierarchija
#


# PASTABOS ------------------------------

#
# Pamin�ti apie lazy matching.
# Para�yti apie ekranavim� su \Q ir \E.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuvi�ka lokal�. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# I�trinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# REGULIARIOS I�RAI�KOS IR REGEXP         #
# --------------------------------------- #

# Vienoje i� teorin�s informatikos sri�i�, formali� kalb� teorijoje, sakoma, kad 
# kalba yra reguliari, jeigu ji apra�oma reguliariomis i�rai�komis. Tokiu atveju 
# kalba suprantama, kaip tam tikr� �od�i� aib�. I� kitos pus�s, norint nustatyti, 
# ar �odis priklauso tam tikrai kalbai, gali b�ti naudojami baigtiniai automatai. 
# Tokiu b�du susiejamos reguliarios i�rai�kos, reguliarios kalbos bei baigtiniai 
# automatai.

# Praktikoje reguliarios i�rai�kos apibr��iamos �ymiai papras�iau. Galima sakyti,
# kad reguliari i�rai�ka - tai pagal tam tikras taisykles u�ra�yta simboli� seka, 
# kuri apra�o tam tikros simboli� sek� aib�s �ablon� (pattern).

# Bet kurios kalbos tekstas yra simboli� seka. Kokie simboliai naudojami tekste,
# priklauso nuo kalbos. Nat�ralios kalbos tekstas sudarytas i� raid�i�, skyrybos
# �enkl� ir skaitmen�. Programavimo kalb� tekstai u�ra�omi naudojant tuos pa�ius
# simbolius. Kai kuri� kalb� ra�to simboliai mums labai ne�prasti, pvz., graik�,
# arm�n�, gruzin�, arab�, japon�, kor�jie�i�. Apie kai kurias dabar jau mirusias 
# kalbas �inome tik tod�l, kad i�liko tomis kalbomis u�ra�yti tekstai. Tuo pa�iu
# tokios senov�s civilizacij� kalbos, kaip �umer� ar egiptie�i�, i�saugojo savo, 
# da�nai egzoti�k�, ra�to sistem�. Pavyzd�iui, gerai �inomas dantira�tis, runos,
# egiptieti�ki hieroglifai. Ra�to sistema reikalinga ne tik �odinei informacijai
# u�ra�yti ir perduoti. Pvz., natos -- tai muzikiniam tekstui u�ra�yti naudojama 
# �enkl� sistema. Taigi, bet kurios kalbos tekstas yra simboli� seka.

# �prasta sakyti, kad nat�ralios kalbos tekst� sudaro tarpais ir kitais skyrybos 
# �enklais atskirti �od�iai, bet, kaip teksto dalis, �odis taip pat yra simboli� 
# seka. Atsi�velgiant � tai, galima suformuluoti paprastesn� reguliari� i�rai�k� 
# apibr��im�. Taigi, reguliari i�rai�ka --- tai tekstinis �ablonas, kuris apra�o 
# tam tikr� �od�i� aib�. Tok� �ablon� galima panaudoti �od�i� paie�kai ar teksto
# redagavimui. Pavyzd�iui, tekste reikia surasti �od�ius, kurie:
#
#   -- prasideda raide "a";
#   -- prasideda raide "a" arba "A";
#   -- prasideda raide "A", o baigiasi gal�ne "as";
#   -- prasideda i� did�iosios raid�s (bet kurios);
#   -- sudaryti vien i� did�i�j� raid�i�;
#   -- sudaryti i� penki� raid�i�;
#   -- turi dvibals� "uo";
#   -- turi bet kok� dvibals�.

# Tokius �od�i� �ablonus galima panaudoti klaid� �od�iuose paie�kai ir taisymui,
# o taip pat ir kitokiems teksto redagavimams. Pavyzd�iui, reikia atlikti tokius
# veiksmus:
#
#   -- visame tekste �od� "irba" pakeisti � �od� "arba";
#   -- surasti tekste dvigubus tarpus "  " ir pakeisti juos � viengubus " ";
#   -- visame tekste simbol� "\" pakeisti � "/";
#   -- surasti tekste visas simboli� sekas, kurios yra el. pa�to adresas;
#   -- patikrinti, ar �vesta simboli� seka yra data.

# Tokias teksto paie�kos ir pakeitimo galimybes turi visos specializuotos teksto 
# redagavimo programos, pavyzd�iui, vim, emacs, gedit, Light Table, Sublime Text,
# Lime Text, Atom, Notepad++ ir daugelis kit�. Reguliarios i�rai�kos reikalingos
# ir darbui su failais. Pavyzd�iui, reikia:
#
#   -- surasti failus, kuri� pavadinime yra data;
#   -- surasti failus, kuri� i�pl�timas "txt";
#   -- surasti failus su i�pl�timu "txt" ir pakeisti � i�pl�tim� "dat";
#   -- surasti failus su i�pl�timu "R", kuri� viduje yra �odis "plot";
#   -- i�trinti visus failus, kuri� pavadinimas prasideda raide "a".


# PASTABA. �iuo metu priimta reguliariomis i�rai�komis vadinti pana��, ta�iau i�
# esm�s visi�kai skirting� dalyk� -- regex. Kaip ir reguliarios i�rai�kos, regex
# naudojamos simboli� sek� apra�ymui, ta�iau, skirtingai nuo reguliari� i�rai�k�, 
# jau neapra�o reguliari� kalb�. Dabar egzistuoja trys reg. i�rai�k� standartai:
# 
#        BRE -- Basic Regular Syntax,
#        ERE -- Extended Regular Expression,
#        SRE -- Simple Regular Expressions (nebenaudojamas),
#       PCRE -- Perl Compatible Regular Expressions.

# Toliau tekste laikysim�s neteisingos tradicijos ir regex arba regexp i�rai�kas 
# taip pat vadinsime reguliariomis i�rai�komis.


# --------------------------------------- #
# BRE STANDARTO REGULIARIOS I�RAI�KOS     #
# --------------------------------------- #

# Reguliariai i�rai�kai u�ra�yti naudojami simboliai skirstomi � dvi grupes: tai
# simboliai bei metasimboliai. Simboliai reguliarioje i�rai�koje i�rei�kia patys 
# save, o skirting� metasimboli� paskirtis skiriasi: vieni j� naudojami simboli� 
# grupavimui, kiti gali reik�ti simboli� grup� ir t. t. Standartin� metasimboli�
# aib� sudaro �ie simboliai:
#
#                        [ ] ( ) { } \ / ^ $ . * | ?  +
#
# Metasimboli� aib�s skirtinguose reguliari� i�rai�k� standartuose skiriasi, bet 
# did�ioji dalis j� yra tie patys.

# Jei metasimbolis i�rai�koje turi b�ti panaudojamas kaip paprastas simbolis, j� 
# b�tina ekranuoti (u�maskuoti). �iam tikslui naudojamas simbolis "\", kuris yra
# ra�omas prie� maskuojam� metasimbol�. 

# PASTABA. Tabuliacijos �enklas "\t", �vair�s valdymo simboliai, simboli� klas�s
# u�ra�omos naudojant simbol� "\". Kadangi jis pats yra metasimbolis, i�rai�kose
# j� pat� reikia ekranuoti, tod�l ra�ome ne "\", bet "\\".

# PASTABA. Bazinis reguliari� i�rai�k� standartas BRE reikalauja, kad skliaustai
# () ir {}, kurie u�ra�ant reg. i�rai�k� naudojami kaip metasimboliai, turi b�ti 
# ra�omi atitinkamai \(, \), \[ ir \], prie�ingu atveju jie interpretuojami kaip
# �prasti skliaust� simboliai. I�pl�stiniame standarte ERE yra prie�ingai -- �ia
# skliaustai () ir [] yra metasimboliai, o j� ekranuotos versijos \(, \), \[, \] 
# interpretuojamos kaip �prasti skliaust� simboliai. �iame tekste reg. i�rai�kas 
# ra�ysime laikydamiesi ERE standarto.


# [ ]
#
# Lau�tiniai skliaustai nurodo bet kur� vien� tuose skliaustuose �ra�yt� simbol�. 
# Pavyzd�iui, i�rai�ka "[abc]" nurodo raid� "a", "b" arba "c". I� eil�s einan�i�
# raid�i� sek� galima u�ra�yti kompakti�kai -- �ra�ome br�k�neliu atskirt� pirm� 
# ir paskutin� sekos raid�. Tokiu atveju br�k�nelis tik nurodo i� eil�s einan�i�
# simboli� interval� ir kaip simbolis "-" netraktuojamas. Pvz., i�rai�ka "[a-z]" 
# nurodo bet kuri� ma��j� lotyni�kos ab�c�l�s raid�. Galima nurodyti kelet� sek� 
# i� karto. Pvz., "[a-zA-Z]" nurodo bet kuri� ma��j� ar did�i�j� ab�c�l�s raid�. 
# Jeigu tarp nurodyt� simboli� turi b�ti "-", tada jis lau�tiniuose skliaustuose 
# ra�omas arba pirmas, arba paskutinis, pvz., "[-abc]" arba "[abc-]". Jeigu tarp
# i�vardint� simboli� turi b�ti "]" ar "[", tai jis skliaustuose ra�omas pirmas. 
# Pavyzd�iui, "[[abc]" nurodo raid� "a", "b", "c" ir simbol� "[". Pateiksime dar 
# kelet� pavyzd�i�:
#
#        [a-cx-z]" -- nurodo vien� i� raid�i� "a", "b", "c", "x", "y", "z";
#     "[blr]ankas" -- atitinka �od�ius "bankas", "lankas" ir "rankas";
#          "[0-9]" -- nurodo bet kur� vien� skaitmen�;
#            "[[]" -- nurodo tik simbol� "[";
#           "[][]" -- nurodo simbol� "]" arba "[";
#           "[[]]" -- jei reikia gauti "]" arba "[", tada u�ra�yta neteisingai.


# [^ ]
#
# Lau�tiniai skliaustai, kuriuose prie� simbolius �ra�ytas simbolis "^", rei�kia
# bet kok� simbol�, i�skyrus tuos, kurie i�vardinti skliaustuose. Pvz., "[^abc]"
# rei�kia bet kok� simbol�, i�skyrus "a", "b", "c". Jeigu simbolis "^" turi b�ti 
# interpretuojamas kaip simbolis, jis skliaustuose ra�omas ne pirmas. Pateiksime
# �iuos pavyzd�ius:
#
#           "[^x]" -- nurodo bet kok� simbol�, i�skyrus raid� "x";
#         "[^a-z]" -- nurodo bet kok� simbol�, i�skyrus ma��j� raid�;
#         "[^0-9]" -- nurodo bet kok� simbol�, i�skyrus skaitmenis;
#        "[^-0-9]" -- bet koks simbolis, i�skyrus skaitmen� ir br�k�nel�;
#         "[0-9^]" -- nurodo bet kur� skaitmen� arba simbol� "^".


# ( )
#
# Skliaustai reguliariose i�rai�kose naudojami simboli� grupavimui ir operatori� 
# veiksm� tvarkai pakeisti. Simboli� seka, kuri atitinka apskliaust� reguliarios
# i�rai�kos dal� -- blok�, gali b�ti pakartotinai �ra�oma naudojant konstrukcij�
# \n. Tokiu b�du u�ra�omos simboli� sekos su pasikartojimais.


# \n
#
# Konstrukcija \n nurodo n-�j� blok�. �ia n nurodo sveik�j� skai�i� nuo 1 iki 9.
# Kiekvienas blokas reguliarioje i�rai�koje gali b�ti panaudojamas kelet� kart�.
# PASTABA. �ioje konstrukcijoje simbol� "\" reikia ekranuoti. Pavyzd�iui:
#
#      "(abc)-\\1" -- nurodo sek� "abc-abc";
#    "(a)[0-9]\\1" -- nurodo sekas "a0a", "a1a", "a2a" ir t.t.;
#    "([a-z])-\\1" -- nurodo sekas "a-a", "b-b" ir t.t.


# {m,n}
#
# �i konstrukcija naudojama simboli� pasikartojim� skai�iui nurodyti. Egzistuoja
# keli jos u�ra�ymo variantai:
#
#              {n} -- simbolis pakartojamas n kart�;
#             {m,} -- simbolis pakartojamas ne ma�iau, kaip m kart�;
#            {m,n} -- simbolis pakartojamas nuo m iki n kart�.
#
# Pateiksime kelet� papras�iausi� pavyzd�i�:
#
#           "a{3}" -- nurodo sek� "aaa";
#         "a{1,3}" -- nurodo sekas "a", "aa" ir "aaa";
#         "0{1,}1" -- nurodo sekas "01", "001", "0001" ir t.t.
#
# Pakartojim� skai�i� galima nurodyti ne tik atskiram simboliui, bet ir simboli� 
# grupei (blokui) arba visai simboli� klasei. Keletas sud�tingesni� pavyzd�i�:
#
#       "(xy){1,}" -- sekos, kuriose pora "xy" pasirodo bent vien� kart�;
#      "[xy]{4,5}" -- sekos, kuriose "x" ar "y" pasirodo 4 ar 5 kartus i� eil�s;
#  "([abc]{2})\\1" -- sekos, kuriose 2 kartus pasikartoja bet kuri raid�i� pora.


# .
#
# Ta�kas reguliariose i�rai�kose �ymi bet kok� vien� simbol� -- bet kuri� raid�,
# bet kur� skaitmen�, skyrybos �enkl� ir t.t. Lau�tiniuose skliaustuose �ra�ytas 
# ta�kas interpretuojamas kaip "." simbolis. Pavyzd�iui:
#
#         ".ankas" -- atitinka �od�ius "bankas", "tankas", "lankas" ir t.t.;
#          "[a.c]" -- atitinka raides "a", "c" ir ta�k� ".";
#       ".*[.]txt" -- atitinka fail� su i�pl�timu ".txt" pavadinimus.


# *
#
# Simbolis "*" reguliariose i�rai�kose --- tai operatorius Klini �vaig�d�. Prie� 
# j� stovin�io simbolio sekoje gali neb�ti visai arba jis gali pasikartoti vien�, 
# du ar daugiau kart�. Klini �vaig�d� galima pritaikyti ir simboli� blokui. Pvz.:
#
#             "a*" -- nurodo tu��i� sek� "" arba "a", "aa", "aaa", ...
#           "ab*c" -- nurodo sekas "ab", "abc", "abbc", ...
#          "(ab)*" -- nurodo tu��i� sek� "", "ab", "abab", "ababab", ...
#          "[ab]*" -- nurodo bet kokio ilgio sekas sudarytas i� "a" ir "b";
#             ".*" -- nurodo bet kokio ilgio sekas i� vis� �manom� simboli�.


# ^
#
# Simbolis "^" reguliarioje i�rai�koje nurodo tai, kad seka yra simboli� eilut�s
# prad�ioje. Pavyzd�iui:
#
#           "^abc" -- atitinka sek� "abc ...", bet neatitinka sekos "... abc";
#       "^[A-Z].*" -- bet kokio ilgio sekos i� did�iosios raid�s sekos prad�ioje;
#   "^[A-Z][a-z]*" -- i� did�iosios raid�s prasidedantys �od�iai sekos prad�ioje.


# $
#
# Simbolis "$" reguliarioje i�rai�koje nurodo tai, kad seka yra simboli� eilut�s
# gale. Pavyzd�iui:
#
#          ".*as$" -- bet kokio ilgio simboli� sekos su gal�ne "as" sekos gale;
#         ".*[.]$" -- bet kokio ilgio simboli� sekos su ta�ku sekos gale;
#     "^[0-9]{6}$" -- bet kokie �e�ia�enkliai kodai.


# U�DUOTIS ------------------------------ 

# 1. U�ra�ykite reguliari� i�rai�k�, kuri atitinka simbol� "\". Pakeiskite gaut�
#    i�rai�k� taip, kad ji atitikt� du greta stovin�ius simbolius "\".
# 2. U�ra�ykite reguliari� i�rai�k�, kuri simboli� sekoje surast� simbol� "/" ar 
#    "\". Pakeiskite i�rai�k� taip, kad ji atitikt� bet koki� �i� simboli� por�.
# 3. U�ra�ykite reguliari� i�rai�k�, atitinkan�i� bet kokio ilgio �od�ius, kuri� 
#    pirmoji ir paskutin� raid�s sutampa. Pavyzd�iui, "��uol�", "sausas" ir t.t. 
#    Atkreipkite d�mes�, kad simboli� sekoje yra tik tas �odis ir nieko daugiau.
# 4. Daugta�kis -- skyrybos �enklas (ellipsis), kuris nurodo nutyl�t� mint� arba 
#    praleista tekst�. Gali b�ti �ymimas trimis i� eil�s einan�iais ta�kais arba 
#    specialiu simboliu, kurio kodas Alt + 0133. U�ra�ykite reg. i�rai�k�, kuri�
#    atitinka daugta�kis "..." bet kurioje teksto vietoje.
# 5. Palindromas -- tai tokia simboli� seka, kuri skaitoma vienodai i� kair�s ir
#    i� de�in�s, pavyzd�iui, "savas". U�ra�ykite toki� reguliari� i�rai�k�, kuri 
#    bet kur tekste atpa�int� palindromus sudarytus i� 4 ma��j� raid�i�.
# 6. U�ra�ykite reguliari� i�rai�k� palindromui i� 5 skaitmen� atpa�inti. Be to,
#    pirmas skaitmuo (vadinasi -- ir paskutinis) negali b�ti nulis.
# 7. Paprastai failo vardas susideda i� 2 dali�, kurios atskirtos ta�ku. Antroji 
#    dalis vadinama failo i�pl�timu. Windows OS failo pavadinime negali b�ti �i� 
#    simboli�: \ / : * ? " < > ir |. U�ra�ykite toki� reguliari� i�rai�k�, kuri� 
#    atitinka korekti�ki fail� vardai su i�pl�timu i� dviej� arba trij� raid�i�.
#    Pastaba. Simboli� sekoje be failo vardo daugiau neturi b�ti joki� papildom�
#    simboli�.


# --------------------------------------- #
# ERE STANDARTO REGULIARIOS I�RAI�KOS     #
# --------------------------------------- #

# BRE standartas numato tik �iuos metasimbolius. ERE reg. i�rai�k� standarte yra
# naudojami dar trys metasimboliai. Ta�iau ERE standarte n�ra konstrukcijos "\n",
# kuri teori�kai nereguliari, bet d�l standart� suderinamumo j� vis d�lto galima 
# naudoti.


# |
#
# Simbolis "|" yra aibi� s�jungos operatorius (alternation). Jis nurodo simbol�, 
# kuris stovi prie� j� arba u� jo. Ai�ku, �� operatori� galima pritaikyti ne tik 
# atskiriems simboliams, bet ir simboli� grupei (blokui) arba net visai simboli� 
# klasei. Pavyzd�iui:
#
#            "a|e" -- atitinka raid� "a" arba "e";
#      "gray|grey" -- atitinka �od� "gray" arba "grey";
#      "R(i|o)mas" -- atitinka vard� "Rimas" arba "Romas";
#    "(xx|yy)-\\1" -- atitinka sek� "xx-xx" arba "yy-yy", bet ne "xx-yy".
#
# PASTABA. Jei alternatyva yra tik tarp dviej� simboli�, tada geriau yra naudoti 
# konstrukcij� su lau�tiniais skliaustais. Perra�ysime ankstesnius pavyzd�ius:
#
#           "[ae]" -- atitinka raid� "a" arba "e";
#        "gr[ae]y" -- atitinka �od� "gray" arba "grey";
#�      "R[io]mas" -- atitinka vard� "Rimas" arba "Romas".


# ?
#
# Metasimbolis "?" nurodo, kad prie� j� stovintis simbolis pasikartoja nul� arba
# vien� kart�, t. y. simbolis arba yra, arba jo n�ra. Operatori� taip pat galima
# pritaikyti simboli� grupei (blokui) arba simboli� klasei. Pavyzd�iui:
#
#           "ab?c" -- atitinka sekas "ac" ir "abc";
#       "p?laukai" -- atitinka �od�ius "laukai" ir "plaukai";
# "(nu|�|i�)?eiti" -- atitinka �od�ius "eiti", "nueiti", "�eiti", "i�eiti".
#
# PASTABA. Formali� kalb� teorijos po�i�riu �is operatorius yra perteklinis, nes 
# j� galima i�reik�ti standartin�mis priemon�mis: "a?" = "(a|e)", kur simbolis e 
# �ymi tu��i� sek� "".


# +
#
# Reguliariose i�rai�kose metasimbolis "+" nurodo, kad prie� j� esantis simbolis 
# arba simboli� grup� sekoje pasirodo bent vien� kart�. Pavyzd�iui:
#
#             "-+" -- nurodo sekas "-", "--", "---", ... 
#            "0+1" -- nurodo sekas "01", "001", "0001", ...
#          "x\\+y" -- metasimbolis "+" ekranuotas, tod�l gauname sek� "x+y";
#         "(cha)+" -- nurodo sekas "cha", "chacha", "chachacha", ...
#       "k_[0-9]+" -- nurodo sekas "k_0", "k_5", "k_42", "k_1579" ir pan;
#   "[0-9]+[a-z]+" -- sekos, kuriose pirma pus� i� skaitmen�, o kita i� raid�i�;
# "([a-z]{2})\\1+" -- nurodo sekas su bet kokios raid�i� poros pasikartojimu.
#
# PASTABA. �� operatori� galima i�reik�ti per Klini operatori�. Pavyzd�iui, "a+"
# apra�o tokias pa�ia sekas kaip ir reguliari i�rai�ka "aa*".


# NAUDINGA ------------------------------

# Metasimbolius "^" ir "$" �ra�ome tais atvejais, kai reguliari� i�rai�k� reikia 
# patikslinti, kad i� vis� j� atitinkan�i� simboli� sek� b�t� atrenkamos tik tos, 
# kurios yra eilut�s prad�ioje arba jos gale.

# ERE standartas numato dar vien� reg. i�rai�kos lokalizacijos metod� --- �od�io 
# riba. �od�io riba tai tokia simboli� sekos vieta, kuri� i� kair�s arba de�in�s 
# pus�s riboja tarpo simbolis. Analogi�kai galima nurodyti simboli� sekos viet�,
# kuri n�ra �od�io riba. Tam naudojamos \b ir \B konstrukcijos. Pana�iai taikoma
# konstrukcija \< arba \>, kuri nurodo tu��i� sek� �od�io prad�ioje arba jo gale.


# \b ir \B
#
# ERE standarto reg. i�rai�kose konstrukcija \b nurodo �od�io rib�. Priklausomai
# nuo to, kurioje i�rai�kos pus�je ji bus ra�oma, galima nurodyti �od�io prad�i� 
# arba jo pabaig�. Pavyzd�iui:
#
#          "as\\b" -- atitinka �od�io gal�n� "as";
#          "\\bas" -- atitinka �od�io prad�i� "as";
#       "\\bir\\b" -- atitinka �od� "ir", bet neatitinka "asiras" ar "Airija".
#
# Konstrukcija \B prie�ingai -- nurodo, kad reguliari� i�rai�k� atitinkanti seka
# yra ne �od�io riboje. Galima nurodyti, kad ie�koma simboli� seka b�t� grie�tai 
# �od�io viduje. Pateiksime �iuos pavyzd�ius:
#
#          "\\Buo" -- "uo" kair�je turi b�ti ne �od�io riba: "vanduo", "duona";
#          "uo\\B" -- "uo" de�in�je turi b�ti ne �od�io riba: "uoga", "duona";
#       "\\Buo\\B" -- raid�i� junginys "uo" �od�io viduje, pvz., "duona".


# NAUDINGA ------------------------------

# Istori�kai tekstiniuose failuose buvo �ra�omi �vair�s valdymo simboliai, kurie
# neturi grafin�s i�rai�kos ir naudojami �vedimo ir i�vedimo �rengini� valdymui. 
# Pavyzd�iui, komanda CR gr��ina kursori� � eilut�s prad�i�, komanda LF kursori�
# perkelia � kit� eilut�, komanda BS gr��ina kursori� per vien� simbol� atgal, o
# komanda BEL rei�kia garso signal�. �iuo metu tokiems tikslams naudojamos kitos
# priemon�s, tod�l did�ioji dalis valdymo simboli� nenaudojami. POSIX standartas
# numato a�tuonis privalomus valdymo simbolius: \0, \a, \b, \t, \n, \v, \f ir \r.

# Reguliariose i�rai�kose kartu su simboliais, metasimboliais galima nurodyti ir
# valdymo simbolius. J� s�ra�as toks:
#
#           \t -- HT, horizontal tabulation;
#           \v -- VT, vertical tabulation (R nepalaiko);
#           \r -- CR, carriage return;
#           \n -- LF, line feed;
#           \f -- FF, form feed;
#           \a -- BEL, bell character;
#           \e -- ESC, escape character;
#           \b -- BS, backspace (R nepalaiko).


# Praktikoje da�nai naudojamas tabuliacijos �enklas "\t". Pavyzd�iui, tokiu b�du
# tekstiniame faile galima atskirti duomen� stulpelius. Nuskaitant duomen� fail�
# b�tina nurodyti, kad stulpeliai atskirti tabuliacija. Funkcija read.table turi
# special� parametr� sep, kuriam tokiu atveju priskiriamas valdymo simbolis "\t".
# Pavyzd�iui, sukursime virtual� tekstin� fail�, kur reik�m�s eilut�se atskirtos 
# tabuliacijos �enklu. Prie tokio failo jungiam�s naudojant f-j� textConnection.

f <- "X1\tX2\tX3
      11\t12\t13
      21\t22\t23
      31\t32\t33
      41\t42\t43"

d <- read.table(file = textConnection(f), header = TRUE, sep = "\t")
d

# Perk�limo � kit� eilut� simbolis "\n" reikalingas i�vedant prane�imus � ekran�
# ar tekstin� fail�. Pavyzd�iui, jei prane�imas i�vedamas � konsol�, bet jo gale
# n�ra perk�limo � kit� eilut� simbolio, tai kursorius lieka eilut�s gale. Tokiu
# atveju sekantis prane�imas bus i�vedamas toje pa�ioje eilut�je. Palyginsime du
# atvejus. Pirmuoju atveju kursorius neperkeliamas, kitu atveju --- perkeliamas.

for (i in 0:9) cat(i)
for (i in 0:9) cat(i, "\n")


# U�DUOTIS ------------------------------ 

# 1. U�ra�ykite toki� reguliari� i�rai�k�, kuri� atitinka teigiami arba neigiami 
#    sveikieji skai�iai. Pirmas skaitmuo negali b�ti nulis, i�skyrus atvej�, kai
#    pats skai�ius yra nulis.
# 2. Sudarykite toki� reguliari� i�rai�k�, kuri atpa�int� 2 br�k�neliu atskirtas 
#    skaitmen� grupes, kuriose yra nuo 1 iki 3 skaitmen�, ta�iau pirmas skaitmuo
#    negali b�ti nulis. Be to, antrosios grup�s gale gali b�ti arba neb�ti viena 
#    ma�oji raid�. Pavyzd�iui, "15-2", "11-424a".
# 3. Interneto puslapio adresas prasideda "http://" arba "https://". Atkreipkite 
#    d�mes�, kad simboli� seka skiriasi tik raide "s", kuri arba yra, arba n�ra.
#    U�ra�ykite �ias sekas atitinkan�i� reguliari� i�rai�k�.
# 4. Tarkime, kad sakinio pabaig� tekste nurodo ta�kas, daugta�kis, �auktukas ir 
#    klaustukas. Jei sakinys ne paskutinis, tada u� skyrybos �enklo dedamas bent 
#    vienas tarpo simbolis " ", po kurio seka �odis i� did�iosios raid�s. Reikia
#    u�ra�yti reguliari� i�rai�k� sekos i� skyrybos �enkl� sakinio gale radimui.
# 5. Pakeiskite ankstesn�je u�duotyje sudaryt� reg. i�rai�k� atsi�velgdami � tai,
#    kad sakinys gali ir pasibaigti, ir prasid�ti ne tik raide, bet ir skai�iumi.
# 6. U�ra�ykite reguliari� i�rai�k�, kuri atitinka pagal �ias taisykles sudaryt�
#    simboli� sek� --- kodas i� 3 ma��j� raid�i� sekos prad�ioje, tada dvita�kiu 
#    atskirti vienas ar daugiau kableliu atskirt� (sveik�j�) skai�i�. Pavyzd�iui,
#    "fvt:4", "drm:1,5", "uvr:3,8,10,11,12" ir pana�iai.
# 7. U�ra�ykite reguliari� i�rai�k�, kuri� atitinka kodas i� trij� raid�i� sekos 
#    prad�ioje, u� kurio yra dar vienas ar keli kableliu atskirti trij� raid�i� 
#    kodai. Pavyzd�iui, "rts-neu", "kit-oft,ort" ir pana�iai.


# --------------------------------------- #
# POSIX IR KITOS SIMBOLI� KLAS�S          #
# --------------------------------------- #

# Iki �iol reguliarios i�rai�kos buvo u�ra�omos naudojant atskirus simbolius bei
# metasimbolius. Simbolius galima apjungti � grup� ir taip kompakti�kai u�ra�yti
# tam tikr� simboli� aib�. Pavyzd�iui, i�rai�ka "[a-z]" rei�kia bet kuri� ma��j� 
# ab�c�l�s raid�, "[A-Z]" -- bet kuri� did�i�j� raid� ir t.t. Da�nai naudojamoms 
# simboli� klas�ms egzistuoja sutrumpinti pa�ym�jimai:
#
#           \d -- skaitmenys, [0-9];
#           \D -- bet koks simbolis, i�skyrus skaitmenis, [^\d];
#           \w -- raid�s, skaitmenys ir simbolis "_", [A-Za-z0-9_];
#           \W -- bet koks simbolis, i�skyrus raides, skaitmenis ir "_";
#           \s -- tarpas, tabuliacija, kiti atskyrimo simboliai, [ \t\v\r\n\f];
#           \S -- bet koks ne tarpo, tabuliacijos ar atskyrimo simbolis, [^\s].


# Neretai simboli� intervalas priklauso nuo lokalizacijos. Pavyzd�iui, lotyni�ka
# ab�c�l� turi 26 raides, o lietuvi�koje ab�c�l�je yra 32 raid�s. Taigi, raid�i�
# aib� nusakoma nevienareik�mi�kai, nes priklauso nuo naudojamos ab�c�l�s. POSIX 
# standartas suvienodino kai kuri� simboli� klasi� pa�ym�jimus:
#
#    [:lower:] -- ma�osios ab�c�l�s raid�s;
#    [:upper:] -- did�iosios ab�c�l�s raid�s;
#    [:alpha:] -- did�iosios ir ma�osios raid�s: [:lower:] ir [:upper:];
#    [:digit:] -- skaitmenys: 0 1 2 3 4 5 6 7 8 9;
#    [:alnum:] -- visos ab�c�l�s raid�s ir skaitmenys: [:alpha:] ir [:digit:];
#    [:punct:] -- �vair�s skyrybos �enklai;
#    [:graph:] -- visi ra�to �enklai: [:alnum:] ir [:punct:];
#    [:blank:] -- tarpo ir tabuliacijos simboliai: [ \t];
#    [:space:] -- tarpas, tabuliacija, kiti atskyrimo simboliai, (whitespace);
#    [:print:] -- spausdinami simboliai: [:alnum:], [:punct:] ir [:space:];
#    [:cntrl:] -- valdymo simboliai, tarp j� yra ir �ie: [\v\r\n\f];
#   [:xdigit:] -- �e�ioliktainiai skaitmenys.


# Skyrybos �enkl� klas� [:punct:] turi visus simbolius, kurie n�ra skaitmenys ar
# did�iosios ir ma�osios raid�s. � j� patenka ir metasimboliai. Visa aib� atrodo
# taip:
#        ! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [ ] \ ^ _ ` { } | ~         
#
# Atskirai galima pamin�ti klas� [:space:]. J� sudaro simboliai, kurie naudojami
# kit� simboli� atskyrimui. �prastas tarpo simbolis " " naudojamas �od�i� tekste 
# atskyrimui. �ia �odis suprantamas apibendrintai, juo gali b�ti ir viena raid�, 
# skai�ius ir bet kokia kita simboli� seka. Kitas tarpo simbolis -- tabuliacija.
# Tabuliacijos �enklas simboli� sekoje nurodo, kad kursorius turi b�ti perkeltas
# � de�in� pus� iki artimiausios tabuliacijos pozicijos, kurios i�d�stytos kas 8, 
# 4 ar 2 simbolius. Tokiu b�du tabuliacijos �enklas panaudojamas teksto eilut�je 
# i�lyginimui. Tarpo ir tabuliacijos simboliai apjungti � vien� klas� [:blank:]. 
# Ta�iau simboliams atskirti naudojami ir kiti simboliai: vertikali tabuliacija,
# kursoriaus gr��inimo � eilut�s prad�i�, perk�limo � nauj� eilut� bei perk�limo
# � nauj� puslap� simboliai. Visi jie yra valdymo simboliai ir �ymimi \v, \r, \n 
# ir \f. �ie simboliai kartu su tarpu bei horizontalia tabuliacija sudaro bendr�
# atskyrimo simboli� (whitespace) klas� [:space:]. �ie simboliai tekste nematomi,
# ta�iau u�ima tam tikr� viet�.


# Galima pasteb�ti, kad vienos simboli� klas�s gaunamos apjungiant kitas klases.
# Tokiu b�du gauname tam tikr� klasi� hierarchij�, kuri� galima atvaizduoti �tai
# tokia dendrograma:
#
#    [:lower:] --+
#                +-- [:alpha:] --+
#    [:upper:] --+               |
#                                +-- [:alnum:] --+
#    [:digit:] ------------------+               |
#                                                +-- [:graph:] --+
#    [:punct:] ----------------------------------+               |
#                                                                +-- [:print:]
#    [:blank:] --+                                               |
#                +-- [:space:] ----------------------------------+
#   [\v\r\n\f] --+


# Lau�tiniai skliaustai yra POSIX simboli� klas�s pavadinimo dalis. Jeigu reikia
# apjungti kelias klases arba vien� POSIX klas� papildyti kitais simboliais, tam
# naudojame lau�tinius skliaustus [ ], kuriuose �ra�ome piln� klas�s pavadinim�.
# Pavyzd�iui, klas� [:alpha:] gauname kaip [[:lower:][:upper:]], klas� [:space:] 
# gali b�ti u�ra�oma kaip [[:blank:]\v\r\n\f].


# U�ra�ysime kelet� reguliari� i�rai�k� naudojant sutrumpintus arba POSIX klasi� 
# pavadinimus. Pavyzd�iui:
#
#             "\\s+" -- atitinka bet kokio ilgio tarpo simboli� sek�;
#           "k_\\d+" -- nurodo sekas "k_0", "k_5", "k_42", "k_1579" ir pan;
#     "[:alpha:]{4}" -- atitinka �od�ius i� bet koki� keturi� raid�i�;
#         "-?0,\\d+" -- atitinka realiuosius skai�ius nuo -0,999... iki 0,999...


# U�DUOTIS ------------------------------ 

# 1. Reguliari� i�rai�k� "^[0-9]+$" perra�ykite panaudojant POSIX simboli� klas�
#    ir sutrumpint� skaitmen� aib�s pavadinim�.    
# 2. U�ra�ykite toki� reguliari� i�rai�k�, kuri surast� vien� arba daugiau tarpo 
#    ar tabuliacijos simbol� simboli� sekos prad�ioje ar pabaigoje. T� pa�i� reg.
#    i�rai�k� u�ra�ykite panaudojant tinkam� POSIX simboli� klas�.
# 3. U�ra�ykite reguliari� i�rai�k�, kuri� atitinka gif, jpg, jpeg, png grafini�
#    fail� pavadinimai. Tarkime, kad vard� sudaro tik raid�s, skaitmenys ir "_".
#    Pavyzd�iui, "DSC_46290.jpg", "DHUfv0w.png" ir pana�iai. Atkreipkite d�mes�, 
#    kad simboli� sekoje yra tik failo vardas ir nieko daugiau nei priekyje, nei
#    gale. I�rai�kai u�ra�yti panaudokite POSIX ar sutrumpint� tinkamos simboli� 
#    aib�s pavadinim�.
