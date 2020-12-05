%{
    #include<stdio.h>
    int yylex();
    int yyerror()
    {
        printf("\nNOT ACCEPTED!!\n");
        return 0;
    }
%}

%token A B ANY NL

%%
START: A A A A A A A A A S B NL {  printf("\nACCEPTED!!\n"); return 0;    };

S:  A S 
    | A 
    ;

%%

int main()
{
    yyparse();
}