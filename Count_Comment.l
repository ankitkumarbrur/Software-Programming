%{
    #include<stdio.h>
    int singleLineCmt = 0, multiLineCmt = 0;
%}

KNONSTAR [^*]*
PSTAR \*+
NONSTARFWD [^*/]

%%
\"((\\\")|[^"])*\" ;

"/*"{KNONSTAR}{PSTAR}({NONSTARFWD}{KNONSTAR}{PSTAR})*"/" {
    multiLineCmt++;
}

\/\/ {
    printf("%s\n", yytext);
    singleLineCmt++;
}

\n ;

. ;

%%

int main()
{
    yyin = fopen("test.cpp", "r");
    yylex();
    printf("Multi Line Comments: %d", multiLineCmt);
    printf("\nSingle Line Comments: %d", singleLineCmt);
    return 0;
}

int yywrap()
{
    return 1;
}
