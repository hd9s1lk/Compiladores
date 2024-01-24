%{
#include <stdio.h>
int nerros=0;
int bateria=100;
int nvezes=0;
int yyerror(char *s);
int yylex();
char localizacao[50] = "Armazem";
%}
%union{
char *id;
int inteiro;
float real;}
%token <id> MANUTENCAO PARI PARF C R METODO METODOREP RECTI RECTF L E MATERIAL MONTAGEM QUANTIDADE VIRGULA OUTRO ENTREGA
%token <inteiro> INTPEQUENOS
%start inicio
%%
inicio:
| MANUTENCAO PARI INTPEQUENOS PARF inicio {nvezes++; printf("\n %d vezes que foi a manutenção", nvezes);} 
| C PARI INTPEQUENOS PARF inicio {printf ("\n Frase de Carrega-Bateria");}
| ENTREGA PARI MONTAGEM QUANTIDADE VIRGULA MATERIAL VIRGULA QUANTIDADE PARF   
| OUTRO inicio
;
%%
int main(){
printf("\n Bateria: %d", bateria);
printf("\n Localizacao: %s", localizacao);
yyparse();
if(nerros==0){ printf("\n FRASE VÁLIDA!\n"); }
else{ printf ("\n"); }
}
int yyerror(char *s){
nerros++;
}
