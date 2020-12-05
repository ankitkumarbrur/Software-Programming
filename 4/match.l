%{
    #include<conio.h>
    int negf=0,negi=0,posi=0,posf=0,identifiers=0, singleLineCmt = 0, multiLineCmt = 0, operators=0;
%}

DEC [0-9]*.[0-9]+
INT [0-9]+

KNONSTAR [^*]*
PSTAR \*+
NONSTARFWD [^*/]

RESERVED using|namespace|alignas|alignof|and|and_eq|asm|atomic_cancel|atomic_commit|atomic_noexcept|auto|bitand|bitor|bool|break|case|catch|char|char8_t|char16_t|char32_t|class|compl|concept|const|consteval|constexpr|const_cast|continue|co_await|co_return|co_yield|decltype|default|delete|do|double|dynamic_cast|else|enum|explicit|export|extern|false|float|for|friend|goto|if|inline|int|long|mutable|namespace|new|noexcept|not|not_eq|nullptr|operator|or|or_eq|private|protected|public|reflexpr|register|reinterpret_cast|requires|return|short|signed|sizeof|static|static_assert|static_cast|struct|switch|synchronized|template|this|thread_local|throw|true|try|typedef|typeid|typename|union|unsigned|using|virtual|void|volatile|wchar_t|while|xor|xor_eq
IDENTIFIER [_A-Za-z][A-Za-z0-9_]*

%%

\"(\\.|[^"\\])*\" ;

"/*"{KNONSTAR}{PSTAR}({NONSTARFWD}{KNONSTAR}{PSTAR})*"/" {
    multiLineCmt++;
}

\/\/.* {
    singleLineCmt++;
}

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

{RESERVED} {
    printf("\nRESERVED     : ");
    printf(yytext);
}
{IDENTIFIER} {  
    identifiers++;
    printf("\nIDENTIFIER ");
    printf("%d : ",identifiers);
    printf(yytext);
}

[-+=*/%^] {
    operators++;
}
. ;
\n ;

%%


int main()
{
    printf("\n");
    yyin=fopen("test2.cpp","r");
    yylex();
    printf("\n\nThere are %d identifiers in this program\n",identifiers);
    printf("\nNegative float: %d\nNegative integer: %d\nPositive float: %d\nPositive integer: %d\nOperators : %d \n",negf,negi,posf,posi,operators);
    printf("Multi Line Comments: %d", multiLineCmt);
    printf("\nSingle Line Comments: %d\n", singleLineCmt);
	return 0;
}
int yywrap()
{
    return 1;
}