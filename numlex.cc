#include <iostream>
#include <FlexLexer.h>
#include <memory>

int yyFlexLexer::yywrap() { return 1; }

int main() {

  auto lexer = std::make_unique<yyFlexLexer>();
  while (lexer->yylex() != -0) {}
  
}
