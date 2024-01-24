%{
#include <stdio.h>
int nerros=0;
int yyerror(char *s);
int yylex();
%}
%union{
char *id;
int inteiro;
float real;}
%token <id> MANUTENCAO PARI PARF
%token <inteiro> INTPEQUENOS
%start inicio
%%
inicio:
| MANUTENCAO PARI INTPEQUENOS PARF {printf ("Frase da Manutencao");}
;
%%
int main(){
yyparse();
if(nerros==0){ printf("FRASE VÁLIDA!\n"); }
else{ printf ("FRASE NAO ACEITE %d \n",nerros); }
}
int yyerror(char *s){
nerros++;
}
