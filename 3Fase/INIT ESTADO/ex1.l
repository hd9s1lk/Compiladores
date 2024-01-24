%{
#include "ex1.tab.h"
%}
%option nounput
%option noinput
%option noyywrap
%%
Init-Estado return INIT;
[a-zA-z]* return LOCAL;
[0-9]*  return BATERIAMANUT;
"," return VIRGULA;
[a-zA-Z0-9]* return MATERIAL;
"(" return PARI;
")" return PARF;
[ \t] ;
[ \n] ;
<<EOF>> return 0;
%%
