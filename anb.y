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

START: N B {  printf("\nSTRING ACCEPTED!!\n\n");   }
    |N B M { yyerror();};

N: A N
    |A
    ;

M: B M
    |B
    ;

%%

int main()
{
    yyparse();
    return 0;
}