%option c++

%{

%}

WS         [ \t\n\v]+
DIGIT      [0-9]
DIGIT1     [1-9]
CAP_LETTER [A-Z]
LOW_LETTER [a-z]
TYPE_ID	   {CAP_LETTER}({LOW_LETTER}|{CAP_LETTER}|{DIGIT}|_)*
OBJ_ID	   {LOW_LETTER}({LOW_LETTER}|{CAP_LETTER}|{DIGIT}|_)*
ASSIGN     [=]
ADD        [+]
SUB	   [-]
MUL        [*]
DIV        [/]
LEFT_PAR   [(]
RIGHT_PAR  [)]
IF	   [i|I][f|F]
ELSE  	   [e|E][l|L][s|S][e|E]
LOOP	   [l|L][o|O][o|O][p|P]
THEN       [t|T][h|H][e|E][n|N]
WHILE      [w|W][h|H][i|I][l|L][e|E]
NOT	   [n|N][o|O][t|T]
PRINT      [p|P][r|R][i|I][n|N][t|T]
PRINTLN    [p|P][r|R][i|I][n|N][t|T][l|L][n|N]
TRUE       [t][r|R][u|U][e|E]
FALSE      [f|F][a|A][L][s|S][e|E]
STR        ["]({LOW_LETTER}|{CAP_LETTER}|{DIGIT}|{WS})*["]


%%

{WS}              /* skip blanks and tabs */
{DIGIT}*  	  { std::cout << "Token class: NUM, Token value: " << yytext << std::endl; return 1; }
{IF}		  { std::cout << "Token class: KEYWORD, Token value: IF" <<  std::endl; return 1;}
{ELSE}		  { std::cout << "Token class: KEYWORD, Token value: ELSE" <<  std::endl; return 1;}
{LOOP}		  { std::cout << "Token class: KEYWORD, Token value: LOOP" << std::endl; return 1;}
{THEN}		  { std::cout << "Token class: KEYWORD, Token value: THEN" << std::endl; return 1;}
{WHILE}		  { std::cout << "Token class: KEYWORD, Token value: WHILE" << std::endl; return 1;}
{NOT}		  { std::cout << "Token class: KEYWORD, Token value: NOT" << std::endl; return 1;}
{PRINT}		  { std::cout << "Token class: KEYWORD, Token value: PRINT" << std::endl; return 1;}
{PRINTLN}	  { std::cout << "Token class: KEYWORD, Token value: PRINTLN" << std::endl; return 1;}
{TRUE}		  { std::cout << "Token class: KEYWORD, Token value: TRUE" << std::endl; return 1;}
{FALSE}		  { std::cout << "Token class: KEYWORD, Token value: FALSE" << std::endl; return 1;}
{TYPE_ID}	  { std::cout << "Token class: TYPE_ID, Token value: " << yytext << std::endl; return 1; }
{OBJ_ID}	  { std::cout << "Token class: OBJ_ID, Token value: " << yytext << std::endl; return 1; }
{ASSIGN}	  { std::cout << "Token class: OP, Token value ASSIGN: " << std::endl; return 1; }
{ADD}		  { std::cout << "Token class: OP, Token value: ADD" << std::endl; return 1;}
{SUB} 		  { std::cout << "Token class: OP, Token value: SUB" << std::endl; return 1;}
{MUL}		  { std::cout << "Token class: OP, Token value: MUL" << std::endl; return 1;}
{DIV}		  { std::cout << "Token class: OP, Token value: DIV" << std::endl; return 1;}
{LEFT_PAR}        { std::cout << "Token class: PAR, Token value: LEFT_PAR: " << std::endl; return 1;}
{RIGHT_PAR}       { std::cout << "Token class: PAR, Token value: RIGHT_PAR: " << std::endl; return 1;}
{STR}		  { std::cout << "Token class: STR, Token value: " << yytext << std::endl; return 1;}
.                 { std::cout << " UNKNOWN <" << yytext[0] << ">" << std::endl; return 1; }

%%
