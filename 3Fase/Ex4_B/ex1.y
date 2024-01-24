%{
#include <stdio.h>
#include <string.h>
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
%token <id> MANUTENCAO PARI PARF C R METODO METODOREP RECTI RECTF L E MATERIAL MONTAGEM VIRGULA OUTRO ENTREGA
%token <inteiro> INTPEQUENOS QUANTIDADE
%start inicio
%%
inicio:
| MANUTENCAO PARI INTPEQUENOS PARF inicio {bateria-=10; nvezes++; strcpy(localizacao,"Armazem");} 
| C PARI INTPEQUENOS PARF inicio {bateria=100; printf ("\n Frase de Carrega-Bateria");}{strcpy(localizacao,"Carregamento");}
| ENTREGA PARI MONTAGEM QUANTIDADE VIRGULA MATERIAL VIRGULA QUANTIDADE PARF inicio {bateria-=10;}{strcpy(localizacao,"Entrega");}{printf("\n Frase do Entrega");}
| R PARI RECTI METODO METODOREP RECTF PARF inicio {bateria-=10; printf("Frase do Recolhe");}  
| OUTRO inicio
;
%%
int main(){
yyparse();
if(nvezes=3){nvezes=0; printf("\n Reset a Manutencao"); } else {nvezes++;}
printf("\n Vezes que foi a Manutencao: %d", nvezes);
if(bateria<20){printf("Precisa de carregar... "); strcpy(localizacao,"Carregamento"); bateria=100; printf("\n Bateria a 100...Carro pronto a andar");} else {bateria=bateria;}
printf("\n Bateria: %d", bateria);
printf("\n Localizacao: %s",localizacao);
if(nerros==0){ printf("\n FRASE VÁLIDA!\n"); }
else{ printf ("ERRO\n"); }
}
int yyerror(char *s){
nerros++;
}
