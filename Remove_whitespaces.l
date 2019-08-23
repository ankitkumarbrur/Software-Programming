%{
    #include<stdio.h>
    #undef yywrap
    #define yywrap() 1
%}

%%

[ \t]+ {fprintf(yyout," ");}
. {fprintf(yyout,"%s",yytext);}
\n* {fprintf(yyout,"\n");}

%%

int main()
{
    yyin=fopen("input2.txt","r");
    yyout=fopen("output.txt","w");
    yylex();
    return 0;
}