%{
#include<stdio.h>
#undef yywrap
#define yywrap() 1
int a=0,s=0,m=0,d=0,ob=0,cb=0;
int flaga=0, flags=0, flagm=0, flagd=0,flagt=0,flage=0;
%}
id [a-zA-Z]+
%%
{id} {printf("\n %s is an identifier\n",yytext);}
[+] {a++;if(flaga==1||flagd==1||flagm==1||flags==1){flagt=1;}else{flaga=1;}}
[-] {s++;if(flaga==1||flagd==1||flagm==1||flags==1){flagt=1;}else{flags=1;}}
[*] {m++;if(flaga==1||flagd==1||flagm==1||flags==1||flage=1){flagt=1;}else{flagm=1;}}
[/] {d++;if(flaga==1||flagd==1||flagm==1||flags==1||flage=1){flagt=1;}else{flagd=1;}}
[=] {d++;if(flaga==1||flagd==1||flagm==1||flags==1||flage=1){flagt=1;}else{flage=1;}}
[(] {ob++;}
[)] {cb++;}
. {flaga=flagd=flagm=flags=0;};
[\n] {return 0;}
%%
int main()
{
    printf("Enter the expression\n");
    yylex();
    if(ob-cb==0&&flagt==0)
        printf("\nValid expression\n");
    else if(flagt==1&&ob-cb!=0)
        printf("\nInvalid expression");
    else
        printf("\nAdd=%d\nSub=%d\nMul=%d\nDiv=%d\n",a,s,m,d);
}