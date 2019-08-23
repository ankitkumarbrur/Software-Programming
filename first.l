%{

#undef yywrap
#define yywrap() 1

%}

%%

["ankit"] {
	printf("Hello World\n");	
}

%%

int main()
{
	yylex(); //calling the rules section
	return 0;
}
