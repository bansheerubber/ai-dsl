file(
	GLOB SRC_DSL *.cc *.h
)
list(SORT SRC_DSL)

set(SRC_DSL ${SRC_DSL} PARENT_SCOPE)
