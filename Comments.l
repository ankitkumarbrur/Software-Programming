%{
    #undef yywrap
    #define yywrap() 1
    #include<stdio.h>
    int multiflag=0;
    int sing,multi;
%}

%%

\".*(\n)*\" {
    printf(""); 
}

\/\/.* {
    sing++;
}

\/\* {
    multiflag++;
}

\*\/ {
    multiflag--;
    if(multiflag==0)
    {
        multi++;
    }
}

%%

int main()
{
    yyin=fopen("input.txt","r");
    yylex();
    printf("\n%d\n%d",sing,multi);
    return 0;
}
