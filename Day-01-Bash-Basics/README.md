# Day 01 - Bash Basics

# What is Bash?

Bash stands for Bourne Again Shell.

It is a command-line interpreter used in Linux systems.

Bash accepts commands from users and executes them.

Example:

```bash
echo "Hello"
```

Output:

```text
Hello
```

---

# What is a Shell?

A shell is a program that acts as an interface between:
- User
- Linux Kernel

Responsibilities:
- Execute commands
- Run scripts
- Automate tasks

---

# Types of Shells

| Shell | Description |
|------|-------------|
| sh | Bourne Shell |
| bash | Bourne Again Shell |
| zsh | Z Shell |
| ksh | Korn Shell |

---

# How to Check Current Shell

Command:

```bash
echo $SHELL
```

Example Output:

```text
/usr/bin/bash
```

---

# How to Find Bash Location

```bash
which bash
```

Output:

```text
/usr/bin/bash
```

---

# What is Shebang?

```bash
#!/bin/bash
```

This is called shebang.

It tells Linux to execute the script using Bash shell.

---

# First Bash Script

Create file:

```bash
nano hello.sh
```

Script:

```bash
#!/bin/bash

echo "Hello DevOps"
```

---

# Execute Permission

Give execute permission:

```bash
chmod +x hello.sh
```

Run:

```bash
./hello.sh
```

---

# Why Execute Permission is Needed

Linux treats files as normal files unless execute permission is added.

Without permission:

```bash
./hello.sh
```

Error:

```text
Permission denied
```

---

# Difference Between

| Command | Meaning |
|---|---|
| bash hello.sh | Bash reads file |
| ./hello.sh | Linux executes file directly |

---

# Important Commands Learned

| Command | Purpose |
|---|---|
| pwd | Current directory |
| ls | List files |
| cd | Change directory |
| which bash | Find bash location |
| bash --version | Check version |
| chmod +x | Add execute permission |

---

# Interview Questions

## What is Bash?

Bash is a Unix shell and command language used for command execution and scripting.

---

## What is Shebang?

Shebang specifies the interpreter used to execute the script.

Example:

```bash
#!/bin/bash
```

---

# Real-Time DevOps Usage

Bash is used for:
- CI/CD automation
- Kubernetes scripts
- Docker automation
- Cron jobs
- Server monitoring
- Deployment automation
