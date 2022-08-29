cmake_minimum_required(VERSION 3.5)
find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)

project (ai_dsl)

add_subdirectory(src)

flex_target(lexer bison/calc.lex "${CMAKE_CURRENT_BINARY_DIR}/lexer.cc")

bison_target(
	parser bison/calc.y ${CMAKE_CURRENT_BINARY_DIR}/parser.cpp
  DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/parser.h
)

add_flex_bison_dependency(lexer parser)

message(STATUS ${BISON_parser_OUTPUTS})

add_executable(ai_dsl ${SRC_DSL} ${BISON_parser_OUTPUTS} ${FLEX_lexer_OUTPUTS})

target_compile_options(ai_dsl PUBLIC -O2 -Wall -std=c++20 -Werror=return-type)
