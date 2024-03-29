" Vim keymap file for Bulgarian and Russian characters, `phonetic' layout.
" Can be used with utf-8 or cp1251 file encodings.
" This file itself is in utf-8

" Maintainer:   Boyko Bantchev <boykobb@gmail.com>
" URI: http://www.math.bas.bg/softeng/bantchev/misc/vim/bulgarian-phonetic.vim
" Last Changed: 2006 Oct 18

" This keymap corresponds to what is called `phonetic layout' in Bulgaria:
" Cyrillic letters homophonous with Latin letters tend to take the same
" places as the latter ones.  Most of the keys corresponding to punctuation
" characters are left unmapped, so they retain their usual (qwerty) meanings
" while typing in Cyrillic.
"
" In addition to the Bulgarian alphabet, the keymap defines the following
" characters:
"     —  The Cyrillic letters Ё and ё, Э and э, and Ы and ы (in pairs of
"        capital and small).  These are the letters in the Russian alphabet
"        that are not present in Bulgarian, so using the bulgarian-phonetic
"        keymap one can type in Russian, too.
"     —  „ and “ (Bulgarian quotation style), and « and » (Russian quotation
"        style).
"     —  §, №, —, •, ·, ±, ¬, ¤, and €

scriptencoding utf-8

let b:keymap_name = "pho"

loadkeymap
A       А       CYRILLIC CAPITAL LETTER A
B       Б       CYRILLIC CAPITAL LETTER BE
W       В       CYRILLIC CAPITAL LETTER VE
G       Г       CYRILLIC CAPITAL LETTER GHE
D       Д       CYRILLIC CAPITAL LETTER DE
E       Е       CYRILLIC CAPITAL LETTER IE
E::     Ё       CYRILLIC CAPITAL LETTER IO
V       Ж       CYRILLIC CAPITAL LETTER ZHE
Z       З       CYRILLIC CAPITAL LETTER ZE
I       И       CYRILLIC CAPITAL LETTER I
J       Й       CYRILLIC CAPITAL LETTER SHORT I
K       К       CYRILLIC CAPITAL LETTER KA
L       Л       CYRILLIC CAPITAL LETTER EL
M       М       CYRILLIC CAPITAL LETTER EM
N       Н       CYRILLIC CAPITAL LETTER EN
O       О       CYRILLIC CAPITAL LETTER O
P       П       CYRILLIC CAPITAL LETTER PE
R       Р       CYRILLIC CAPITAL LETTER ER
S       С       CYRILLIC CAPITAL LETTER ES
T       Т       CYRILLIC CAPITAL LETTER TE
U       У       CYRILLIC CAPITAL LETTER U
F       Ф       CYRILLIC CAPITAL LETTER EF
H       Х       CYRILLIC CAPITAL LETTER HA
C       Ц       CYRILLIC CAPITAL LETTER TSE
~       Ч       CYRILLIC CAPITAL LETTER CHE
{       Ш       CYRILLIC CAPITAL LETTER SHA
}       Щ       CYRILLIC CAPITAL LETTER SHCHA
Y       Ъ       CYRILLIC CAPITAL LETTER HARD SIGN
YJ      Ы       CYRILLIC CAPITAL LETTER YERU
X       Ь       CYRILLIC CAPITAL LETTER SOFT SIGN
YE      Э       CYRILLIC CAPITAL LETTER REVERSED E
|       Ю       CYRILLIC CAPITAL LETTER YU
Q       Я       CYRILLIC CAPITAL LETTER YA
a       а       CYRILLIC SMALL LETTER A
b       б       CYRILLIC SMALL LETTER BE
w       в       CYRILLIC SMALL LETTER VE
g       г       CYRILLIC SMALL LETTER GHE
d       д       CYRILLIC SMALL LETTER DE
e       е       CYRILLIC SMALL LETTER IE
e::     ё       CYRILLIC SMALL LETTER IO
v       ж       CYRILLIC SMALL LETTER ZHE
z       з       CYRILLIC SMALL LETTER ZE
i       и       CYRILLIC SMALL LETTER I
j       й       CYRILLIC SMALL LETTER SHORT I
k       к       CYRILLIC SMALL LETTER KA
l       л       CYRILLIC SMALL LETTER EL
m       м       CYRILLIC SMALL LETTER EM
n       н       CYRILLIC SMALL LETTER EN
o       о       CYRILLIC SMALL LETTER O
p       п       CYRILLIC SMALL LETTER PE
r       р       CYRILLIC SMALL LETTER ER
s       с       CYRILLIC SMALL LETTER ES
t       т       CYRILLIC SMALL LETTER TE
u       у       CYRILLIC SMALL LETTER U
f       ф       CYRILLIC SMALL LETTER EF
h       х       CYRILLIC SMALL LETTER HA
c       ц       CYRILLIC SMALL LETTER TSE
`       ч       CYRILLIC SMALL LETTER CHE
[       ш       CYRILLIC SMALL LETTER SHA
]       щ       CYRILLIC SMALL LETTER SHCHA
y       ъ       CYRILLIC SMALL LETTER HARD SIGN
yj      ы       CYRILLIC SMALL LETTER YERU
x       ь       CYRILLIC SMALL LETTER SOFT SIGN
ye      э       CYRILLIC SMALL LETTER REVERSED E
\\      ю       CYRILLIC SMALL LETTER YU
q       я       CYRILLIC SMALL LETTER YA
!!      §       SECTION SIGN (PARAGRAPH SIGN)
##      №       NUMERO SIGN
--      —       EM DASH
,,      „       DOUBLE LOW-9 QUOTATION MARK
``      “       LEFT DOUBLE QUOTATION  MARK
<<      «       LEFT-POINTING DOUBLE ANGLE QUOTATION MARK
>>      »       RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK
00      •       BULLET
..      ·       MIDDLE DOT      
+-      ±       PLUS-MINUS SIGN
~~      ¬       NOT SIGN
@@      ¤       CURRENCY SIGN
$$      €       EURO SIGN
