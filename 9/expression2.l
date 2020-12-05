%{
    #include <stdio.h> 
	  #include "y.tab.h"
%}

%%

[0-9]+	{
          yylval = atoi(yytext);
          return DIGIT;
        }
[a-z] {   return VARIABLE;   }
[\t];
[\n]  return 0;
[*/%+] {
    yylval = yytext[0];
    return OPERATOR;
}

[;] { return yytext[0]; }
. return yytext[0];
%%

int yywrap()
{
	return 1;
}