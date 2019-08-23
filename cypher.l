%{

#undef yywrap
#define yywrap() 1

%}

%%

[a-z] {
    int a=(int)yytext[0];
    a-=94;
    a=a%26;
    printf("%c",a+97);
}
[A-Z] {
    int a=(int)yytext[0];
    a-=62;
    a=a%26;
    printf("%c",a+65);
}

%%

int main()
{
	yylex();
	return 0;
}
