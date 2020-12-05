%{
    #include<stdio.h>
    int yylex();
    int yyerror()
    {
        printf("\nNOT ACCEPTED!!\n");
        return 0;
    }
%}

%token A B ANY

%%

START: A S B NL{  printf("\nACCEPTED!!\n"); return 0;    };

S: A B|A S B;

%%

int main()
{
    yyparse();
}