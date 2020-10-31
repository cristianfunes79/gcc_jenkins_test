.PHONY: all
all:  src/main.opp
	@echo "Building $@"
	g++ -o build/test_fw $<
	@echo "Built!"

src/%.opp: src/%.cpp
	@echo "Compiling $@"
	gcc -c -o $@ $<

.PHONY: clean
clean:
	@echo "Removing files..."
	@rm -rf src/*.opp build/test_fw index.html
	@echo "Done!"


.PHONY: test
test:
	@echo "Generating tests results"
	@python3 tools/gen_results.py
	@echo "Done!"
