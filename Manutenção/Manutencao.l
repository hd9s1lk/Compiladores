M "Manutencao"
PARI "("
PARF ")"


%%
{M}{PARI}0{PARF}	{printf("Deslocar Imediatamente\n");}
{M}{PARI}1{PARF}	{printf("Terminar tarefa atual\n");}
{M}{PARI}2{PARF}	{printf("Terminar todas as tarefas pendentes\n");} 
. ;
\n ;
<<EOF>> {return 0;}
%%


void main(){
	yylex();
}
