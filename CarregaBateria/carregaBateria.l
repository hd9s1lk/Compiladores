C "Carrega-Bateria"
PARI "("
PARF ")"


%%
{C}{PARI}0{PARF}	{printf("Deslocar Imediatamente\n");}
{C}{PARI}1{PARF}	{printf("Terminar tarefa atual\n");}
{C}{PARI}2{PARF}	{printf("Terminar todas as tarefas pendentes\n");} 
. ;
\n ;
<<EOF>> {return 0;}
%%


void main(){
	yylex();
}
