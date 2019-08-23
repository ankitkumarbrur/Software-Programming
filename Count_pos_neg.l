%{
    #include<conio.h>
    int negf=0,negi=0,posi=0,posf=0;
%}

DEC [0-9]*.[0-9]+
INT [0-9]+
%%

-{DEC} {
    negf++;
}
-{INT} {
    negi++;
}
{INT} {
    posi++;
}
{DEC} {
    posf++;
}

. ;
%%


int main()
{
    printf("\n");
    yyin=fopen("input.txt","r");
    yylex();
    printf("\nNegative float: %d\nNegative integer: %d\nPositive float: %d\nPositive integer: %d \n",negf,negi,posf,posi);
	return 0;
}
int yywrap()
{
    return 1;
}