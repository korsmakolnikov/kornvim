# Kornvim (Kornvim is not nvim)
### Neovim Configuration Provisioning Script
This project provides a simple and effective way to provision your Neovim
configuration, whether you're setting up a new machine or resetting your
environment after major changes. It leverages a lightweight Lua script to
automate the process, ensuring your setup is consistent and ready to go.
**Kornvim** will generate the code of a minimal Neovim configuration installing
Lazy and my default configuration plugin (or one of your choice). 

### Prerequisites
You need to have **Lua** and **GNU Make** (**git** is needed to clone Lazy)
installed on your system to use this script.

### Getting Started

#### `build-test`
The default task, `build-test`, runs the Lua script to provision your Neovim
configuration. This is typically the first step to set up your environment. To
run the provisioning script, simply execute the following command:

```bash
make
# or explicitly
make build-test
```

This command will run `kornvim.lua` and pass the `./test` directory as an
argument, allowing the script to initialize your Neovim setup.

```bash
KORNVIM_DBG_FLAG=1 make # or explicitly make build-test
```
This command will print the initial configuration on screen before creating the
file. It is useful fast feedback if you want to propose a change and you are
testing it.

#### `test`
The `test` task provides a safe way to test your Neovim configuration without
affecting your main setup. It launches Neovim with an alternative configuration
file.

```bash
make test
```

This command will open Neovim using the `init.lua` file located in your `./test`
directory, which is ideal for testing new plugins or configuration changes.

#### `run`
This task will run your test configuration pointing to the default nvim
configuration directory. This means also you are fetching the plugins in the
Lazy's default directory where your installed plugins are. This could be useful
to mix your current configuration and the new one; and also to avoid installing
the plugins you already have on your machine. 

```bash
make run
```

#### `clean`
The `clean` task is used to remove the test directory and all its contents. This
is useful for resetting your environment or cleaning up after testing.

```bash
make clean
```

This command uses `rm -rf` to remove the `./test` directory, leaving your
environment clean.

### Customization
If you need to change the name of the main script or the test directory, you can
easily modify the variables at the top of the `Makefile`:

```makefile
# Variable for the Lua script name.
LUA_SCRIPT := kornvim.lua

# Variable for the test directory.
TEST_DIR := ./test
```

This structured approach, using a combination of Lua and Make, provides a robust
and easy-to-manage solution for handling your Neovim configuration.
