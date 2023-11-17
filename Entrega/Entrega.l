%{
#include <stdio.h>
#include <string.h>
#include "strForm.h"
%}

L "Entrega"
PARI "("
MONTAGEM [A-Z]{2}(100|[1-9]|[1-9][0-9])","
MATERIAL [a-zA-Z0-9]{5}
QUANTIDADE (","[1-9][0-9]*)
PARF ")"

%%
{L}{PARI}{MONTAGEM}{MATERIAL}{QUANTIDADE}{PARF} strform1(yytext);
. ;
\n ;
<<EOF>> return 0;
%%

int main() {
    yylex();

    return 0;
}
