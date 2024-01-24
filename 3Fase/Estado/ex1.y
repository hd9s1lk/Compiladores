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
%token <id> ESTADO LETRAS PARI PARF 
%start inicio
%%
inicio:
| ESTADO PARI LETRAS PARF  {printf ("Frase do Estado");}
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
