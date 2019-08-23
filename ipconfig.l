%{
    #include<conio.h>
%}

VIP1 [0-1][0-9][0-9].[0-1][0-9][0-9].[0-1][0-9][0-9].[0-1][0-9][0-9]
VIP2 [2][0-5][0-5].[2][0-5][0-5].[2][0-5][0-5].[2][0-5][0-5]
IIP1 [3-9][0-9][0-9].[3-9][0-9][0-9].[3-9][0-9][0-9].[3-9][0-9][0-9]
IIP2 [2][6-9][6-9].[2][6-9][6-9].[2][6-9][6-9].[2][6-9][6-9]

%%


Connection-specific.*: {
    printf("CSDS :");    
}
Link-local.*: {
    printf("IPv6 :");
}
IPv4.*: {
    printf("IPv4 :");
}
Subnet.*: {
    printf("mask :");
}
Default.*: {
    printf("gateway :");
}
{IIP1} {
    printf("\nInvalid IP");
}
{IIP2} {
    printf("Invalid IP")
}

%%

int main()
{
    printf("\n\n");
    yyin=fopen("ipconfig.txt","r");
    yylex();
    printf("\n\n");
    return 0;
}
int yywrap()
{
    return 1;
}