%{
#include "ex1.tab.h"
%}
%option nounput
%option noinput
%option noyywrap
%%
Estado return ESTADO;
(B|T|M)(","(B|T|M))* return LETRAS;
"(" return PARI;
")" return PARF;
[ \t] ;
[ \s] ;
[ \n] ;
<<EOF>> return 0;
%%
