%option c++
%option yylineno
%option yyclass = "NumLexer"
%x C_COMMENT


%{
    #include <numlexer.hpp>
%}

WS         [ \t\n\v]+
DIGIT      [0-9]
CAP_LETTER [A-Z]
LOW_LETTER [a-z]
TYPE_ID	   {CAP_LETTER}({LOW_LETTER}|{CAP_LETTER}|{DIGIT}|_)*
OBJ_ID	   {LOW_LETTER}({LOW_LETTER}|{CAP_LETTER}|{DIGIT}|_)*




%%

["][^(EOF|\0)]*["]                                  {std::cout << "Token class: STRING, Token value: " << yytext << std::endl; }
"("                                                 {std::cout << "Token class: PAR, Token value: LEFT_PAR: "  << std::endl; }
")"                                                 {std::cout << "Token class: PAR, Token value: RIGHT_PAR: " << std::endl; }
"="                                                 {std::cout << "Token class: OP, Token value: ASSIGN "      << std::endl; }
"+"                                                 {std::cout << "Token class: OP, Token value: ADD "         << std::endl; }
"-"                                                 {std::cout << "Token class: OP, Token value: SUB "         << std::endl; }
"*"                                                 {std::cout << "Token class: OP, Token value: MUL "         << std::endl; }
"/"                                                 {std::cout << "Token class: OP, Token value: DIV "         << std::endl; }

(?i:"if")                                           {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; }
(?i:"else")                                         {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; }
(?i:"loop")                                         {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; }
(?i:"then")                                         {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; }
(?i:"while")                                        {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; }
(?i:"not")                                          {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; }
(?i:"print")                                        {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; }
(?i:"println")                                      {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; }
"t"(?i:"rue")                                       {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; }
"f"(?i:"alse")                                      {std::cout << "Token class: KEYWORD, Token value: " << yytext << std::endl; }

{WS}                                                /* skip blanks and tabs */
"--"[^\n]*\n                                        /* skip comments */
{DIGIT}*                                            process_digit();
{CAP_LETTER}({LOW_LETTER}|{CAP_LETTER}|{DIGIT}|_)*  process_type_id();
{LOW_LETTER}({LOW_LETTER}|{CAP_LETTER}|{DIGIT}|_)*  process_obj_id();  

"/*"            { BEGIN(C_COMMENT); }
<C_COMMENT>"*/" { BEGIN(INITIAL); }
<C_COMMENT>\n   { }
<C_COMMENT>.    { }

.                                                   {std::cout << "Wrong" << std::endl; }

%%
