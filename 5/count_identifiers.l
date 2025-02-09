%{
    #include<stdio.h>
    #undef yywrap
    #define yywrap() 1
    int identifiers=0;
%}

KNONSTAR [^*]*
PSTAR \*+
NONSTARFWD [^*/]

RESERVED using|namespace|alignas|alignof|and|and_eq|asm|atomic_cancel|atomic_commit|atomic_noexcept|auto|bitand|bitor|bool|break|case|catch|char|char8_t|char16_t|char32_t|class|compl|concept|const|consteval|constexpr|const_cast|continue|co_await|co_return|co_yield|decltype|default|delete|do|double|dynamic_cast|else|enum|explicit|export|extern|false|float|for|friend|goto|if|inline|int|long|mutable|namespace|new|noexcept|not|not_eq|nullptr|operator|or|or_eq|private|protected|public|reflexpr|register|reinterpret_cast|requires|return|short|signed|sizeof|static|static_assert|static_cast|struct|switch|synchronized|template|this|thread_local|throw|true|try|typedef|typeid|typename|union|unsigned|using|virtual|void|volatile|wchar_t|while|xor|xor_eq
IDENTIFIER [_A-Za-z][A-Za-z0-9_]*

%%

^"#".* ;
\"(\\.|[^"\\])*\" ;
"/*"{KNONSTAR}{PSTAR}({NONSTARFWD}{KNONSTAR}{PSTAR})*"/" ;
\/\/ ;

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

. ;
\n ;

%%

int main()
{
   yyin=fopen("input.cpp","r");
   yylex();
   printf("\n\nThere are %d identifiers in this program\n",identifiers);
   return 0;
}