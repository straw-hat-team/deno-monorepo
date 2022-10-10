all : format-code test-all
.PHONY : all

format-code:
	@echo "Formatting code..."
	@deno fmt

test-all:
	@deno test --allow-write --allow-read --allow-none
