# Makefile

# Define phony targets to prevent conflicts with files of the same name.
.PHONY: build-test test clean run

# Variable for the text file to pass to nvim
TEXT_FILE := 

# Variable for the Lua script name.
LUA_SCRIPT := kornvim.lua

# Variable for the test directory.
TEST_DIR := ./test

# ---
# Task 1: "build-test" - This is the default target.
# Runs the Lua script with the test directory as an argument.
build-test:
	@echo "Running build-test with script $(LUA_SCRIPT)..."
	lua $(LUA_SCRIPT) $(TEST_DIR)

# ---
# Task 2: "test"
# Launches vim with a specific init.lua file for testing.
test:
	@echo "Launching vim with test configuration..."
	KORNVIM_TEST_FLAG=1 nvim --cmd "set runtimepath^=./test" -u $(TEST_DIR)/init.lua $1 ${TEXT_FILE}

# ---
# Task 2: "test"
# Launches vim with a specific init.lua pointing to the default original configuration path
# Lazy also will point to its default root folder
run:
	@echo "Launching vim with test configuration..."
	nvim --cmd "set runtimepath^=./test" -u $(TEST_DIR)/init.lua

# ---
# Task 3: "clean"
# Removes the test directory and all its contents.
clean:
	@echo "Removing test directory $(TEST_DIR)..."
	rm -rf $(TEST_DIR)
	@echo "Cleanup complete."
