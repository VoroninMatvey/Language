%option c++
%option yyclass="NumLexer"

%{
#include "numlexer.hpp"
%}

WS         [ \t\n\v]+
DIGIT      [0-9]
CAP_LETTER [A-Z]
LOW_LETTER [a-z]
TYPE_ID	   {CAP_LETTER}({LOW_LETTER}|{CAP_LETTER}|{DIGIT}|_)*
OBJ_ID	   {LOW_LETTER}({LOW_LETTER}|{CAP_LETTER}|{DIGIT}|_)*



%%

"("                                                 {std::cout << "Token class: PAR, Token value: LEFT_PAR: "  << std::endl; return 1;}
")"                                                 {std::cout << "Token class: PAR, Token value: RIGHT_PAR: " << std::endl; return 1;}
"="                                                 {std::cout << "Token class: OP, Token value: ASSIGN "      << std::endl; return 1;}
"+"                                                 {std::cout << "Token class: OP, Token value: ADD "         << std::endl; return 1;}
"-"                                                 {std::cout << "Token class: OP, Token value: SUB "         << std::endl; return 1;}
"*"                                                 {std::cout << "Token class: OP, Token value: MUL "         << std::endl; return 1;}
"/"                                                 {std::cout << "Token class: OP, Token value: DIV "         << std::endl; return 1;}

(?i:"if")                                           {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; return 1;}
(?i:"else")                                         {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; return 1;}
(?i:"loop")                                         {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; return 1;}
(?i:"then")                                         {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; return 1;}
(?i:"while")                                        {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; return 1;}
(?i:"not")                                          {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; return 1;}
(?i:"print")                                        {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; return 1;}
(?i:"println")                                      {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; return 1;}
"t"(?i:"rue")                                       {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; return 1;}
"f"(?i:"alse")                                      {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; return 1;}

{WS}                                                /* skip blanks and tabs */
{DIGIT}*                                            return process_digit();
{CAP_LETTER}({LOW_LETTER}|{CAP_LETTER}|{DIGIT}|_)*  return process_type_id();
{LOW_LETTER}({LOW_LETTER}|{CAP_LETTER}|{DIGIT}|_)*  return process_obj_id();  
.                                                   {std::cout << "ploxo" << std::endl; return 1; }

%%
