%{
#include "ex1.tab.h"
%}
%option nounput
%option noinput
%option noyywrap
%%
Recolhe return RECOLHE;
"("[a-zA-Z0-9]{5}","[1-9][0-9]*")"	   yylval.inteiro=atoi(yytext);return METODO;
(",""("[a-zA-Z0-9]{5}","[1-9][0-9]*")")*			   return METODOREP;
","				   return VIRGULA;
"("				   return PARI;
")"				   return PARF;
"["				   return RECTI;
"]"				   return RECTF;
[ \t] ;
[ \s] ;
\n return 0;
<<EOF>> return 0;
%%
