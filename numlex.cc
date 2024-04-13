#include <iostream>
#include <FlexLexer.h>
#include <stdexcept>
#include <memory>
#include <fstream>
#include "numlexer.hpp"

int yyFlexLexer::yywrap() { return 1; }

int main(int argc, char **argv) {
  if (argc != 2) {
    throw std::runtime_error {"expected one arguement, got: " + std::to_string(argc)};
  }

  auto lexer = std::make_unique<NumLexer>();

  std::ifstream file {argv[1]};
  lexer->switch_streams(std::addressof(file), nullptr);
  lexer->yylex();
}