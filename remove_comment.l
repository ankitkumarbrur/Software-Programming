%{
    #include<stdio.h>
%}

KNONSTAR [^*]*
PSTAR \*+
NONSTARFWD [^*/]

%%
\"(\\.|[^"\\])*\" {
    fprintf(yyout,yytext);
}

"/*"{KNONSTAR}{PSTAR}({NONSTARFWD}{KNONSTAR}{PSTAR})*"/" ;

\/\/.* ;

. {
    fprintf(yyout,yytext);
};

%%

int main()
{
    yyin = fopen("test2.cpp", "r");
    yyout = fopen("test_2_1.cpp", "w");
    yylex();
    printf("\nComments Removed\n");
    return 0;
}

int yywrap()
{
    return 1;
}
