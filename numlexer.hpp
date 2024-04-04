#pragma once
#include <iostream>

#ifndef yyFlexLexer
#include <FlexLexer.h>
#endif

class NumLexer : public yyFlexLexer {
	std::string current_lexem;
	std::string current_value;

	int process_digit() {
		current_lexem = "NUM";
		current_value = yytext;
		return 1;
	}

	int process_type_id() {
		current_lexem = "TYPE_ID";
		current_value = yytext;
		return 1;
	}

	int process_obj_id() {
		current_lexem = "OBJ_ID";
		current_value = yytext;
		return 1;
	}

public:
	int yylex() override;
	void print_current_lexem() const {
		std::cout << current_lexem << " <" << current_value << ">" << std::endl;
	}
};

