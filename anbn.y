%{
    #include<stdio.h>
    int yylex();
    int yyerror()
    {
        printf("\nENTERED INPUT IS WRONG\n\n"); 
        return 0;
    }
%}

%token A B ERROR

%%

START: A N B {  printf("\nSTRING ACCEPTED!!\n\n");   }
    |A B {       printf("\nSTRING ACCEPTED!!\n\n");   }
    ;

N: A N B
    |A B
    ;
%%

int main()
{
    yyparse();
    return 0;
}