%{
#include <stdio.h>
#include "strForm.h"
%}

L "Recolhe"
PARI "("
RECTI "["
MATERIAL [a-zA-Z0-9]{5}
QUANTIDADE (","[1-9][0-9]*)
RECTF "]"
PARF ")"
METODO "("[a-zA-Z0-9]{5}","[1-9][0-9]*")"
METODOREP (",""("[a-zA-Z0-9]{5}","[1-9][0-9]*")")*

%%
{L}{PARI}{RECTI}{METODO}{METODOREP}{RECTF}{PARF} strform(yytext);

.  ;
\n ;
<<EOF>> return 0;
%%

int main() {
    yylex();
    return 0;
}
