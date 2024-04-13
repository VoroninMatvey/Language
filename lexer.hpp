#pragma once
#include <iostream>

#ifndef yyFlexLexer
#include <FlexLexer.h>
#endif

class NumLexer : public yyFlexLexer {
	std::string current_lexem;
	std::string current_value;

	void process_digit() {
		current_lexem = "NUM";
		current_value = yytext;
		print_current_lexem();
	}

	void process_type_id() {
		current_lexem = "TYPE_ID";
		current_value = yytext;
		print_current_lexem();
	}

	void process_obj_id() {
		current_lexem = "OBJ_ID";
		current_value = yytext;
		print_current_lexem();
	}

public:
	int yylex() override;

	void print_current_lexem() const {
		std::cout << "Token class: " << current_lexem << "; Token value: " << current_value <<  std::endl;
	}
};

