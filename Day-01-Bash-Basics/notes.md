# Day 01 - Bash Fundamentals Deep Dive Notes
# From Zero to DevOps Engineer Level Understanding

---

# Introduction

Before learning shell scripting, automation, DevOps, Kubernetes, CI/CD, Docker, Jenkins, or Linux administration, the first thing a person must understand is:

```text
How humans communicate with Linux systems.
```

Most beginners directly start learning commands like:

```bash
ls
pwd
cd
```

but they never understand:
- what actually happens internally
- who executes commands
- where commands exist
- how Linux understands instructions
- why permissions exist
- why shell scripting exists
- what problem Bash solves

This notes file is written to build strong foundational understanding from absolute zero level.

Goal:
- Beginner friendly
- Interview ready
- Real-world DevOps understanding
- Internal Linux working
- Deep conceptual clarity

---

# What is an Operating System?

An Operating System (OS) is software that manages:
- CPU
- memory
- storage
- hardware
- applications
- networking

Examples:
- Linux
- Windows
- macOS

Without Operating System:
- computer hardware is useless
- users cannot interact with machine

Operating System acts as a manager between:
- hardware
- software
- users

---

# What is Linux?

Linux is an Operating System kernel.

Kernel is the core part of Operating System.

Linux is heavily used in:
- servers
- cloud
- DevOps
- Kubernetes
- Docker
- supercomputers
- cybersecurity
- embedded systems

Most internet servers run Linux.

Examples:
- Google servers
- AWS infrastructure
- Kubernetes nodes
- Docker containers

---

# What is Kernel?

Kernel is the brain/core of Operating System.

Responsibilities of kernel:
- process management
- memory management
- hardware communication
- disk management
- networking
- security

Kernel directly communicates with hardware.

Users cannot directly communicate with kernel.

Why?

Because kernel operations are sensitive and dangerous.

Example:
- deleting memory incorrectly can crash system
- hardware misuse can damage system

Therefore:
users communicate through controlled interfaces.

---

# How Users Communicate with Linux

Flow:

```text
User → Shell → Kernel → Hardware
```

Explanation:

1. User types command
2. Shell reads command
3. Shell sends instruction to kernel
4. Kernel performs operation
5. Output returns to user

---

# What is Shell?

Shell is a command interpreter.

Simple meaning:

```text
Shell understands human commands and converts them into system actions.
```

Shell acts as middle layer between:
- user
- Linux kernel

Without shell:
- users would need to communicate directly with kernel using machine-level instructions.

That would be extremely difficult.

---

# Why is it Called Shell?

Think of an egg.

Egg has:
- outer shell
- inner core

Similarly:
- shell surrounds kernel
- users interact with shell instead of directly interacting with kernel

---

# What Does Shell Actually Do?

Shell responsibilities:
- read commands
- interpret commands
- execute programs
- manage scripts
- handle automation
- manage processes
- redirect outputs
- manage environment variables

---

# Types of Shells

Linux supports multiple shells.

Common shells:

| Shell | Description |
|---|---|
| sh | Bourne Shell |
| bash | Bourne Again Shell |
| zsh | Z Shell |
| ksh | Korn Shell |
| csh | C Shell |
| fish | Friendly Interactive Shell |

---

# What is Bash?

Bash stands for:

```text
Bourne Again Shell
```

Bash is:
- a shell
- a scripting language
- a command interpreter

Bash is most popular Linux shell.

---

# Why Bash Became Popular

Reasons:
- free and open source
- powerful scripting features
- default shell in many Linux distributions
- automation support
- supports variables, loops, conditions, functions

DevOps engineers heavily use Bash because:
- automation is core part of DevOps
- Bash automates repetitive Linux tasks

---

# Real Meaning of Automation

Automation means:

```text
Making systems perform tasks automatically without manual work.
```

Example without automation:
- manually deploy application every day

Example with automation:
- Bash script performs deployment automatically

---

# Real-World Example of Bash Usage

Imagine:
A company deploys applications 20 times daily.

Without Bash:
- engineer manually types commands repeatedly

With Bash:
- one script automates entire deployment

Example:

```bash
#!/bin/bash

git pull
docker build -t app .
docker-compose up -d
```

One script replaces multiple manual steps.

---

# What is Command Line?

Command line means:
- interacting with computer by typing text commands

Example:

```bash
pwd
ls
date
```

Each line is a command.

---

# What is CLI?

CLI means:

```text
Command Line Interface
```

Interface where users interact using commands instead of graphical buttons.

---

# CLI vs GUI

| CLI | GUI |
|---|---|
| text-based | graphical |
| faster | easier for beginners |
| automation friendly | manual operations |
| used by DevOps engineers | used by normal users |

---

# What is Terminal?

Terminal is application window where users type commands.

Examples:
- GNOME Terminal
- Konsole
- xterm

Important understanding:

```text
Terminal is NOT shell.
```

Terminal only provides interface.

Shell executes commands inside terminal.

---

# Difference Between Terminal and Shell

| Terminal | Shell |
|---|---|
| application window | command interpreter |
| provides interface | executes commands |
| graphical software | CLI software |

---

# What Happens Internally When We Run a Command?

Example:

```bash
ls
```

Internal flow:

```text
1. User types command
2. Terminal sends input to Bash
3. Bash interprets command
4. Bash searches executable
5. Kernel loads executable into memory
6. CPU executes program
7. Output displayed on terminal
```

---

# What is Executable?

Executable means:
- runnable program

Examples:
- bash
- ls
- cat
- grep

Linux commands are actual executable files stored in system directories.

---

# Where Commands Are Stored?

Most user commands are stored inside:

```text
/usr/bin
```

Examples:

```text
/usr/bin/bash
/usr/bin/ls
/usr/bin/cat
/usr/bin/find
/usr/bin/grep
```

---

# Meaning of /usr/bin

Breakdown:

| Directory | Meaning |
|---|---|
| / | root filesystem |
| usr | user programs/resources |
| bin | binaries/executables |

Meaning:

```text
/usr/bin stores executable programs.
```

---

# What is Binary?

Binary means:
- machine executable file

Computers understand:
- 0
- 1

Programs are converted into binary instructions for CPU execution.

---

# How Linux Finds Commands

When user types:

```bash
ls
```

Linux does NOT magically know command location.

Shell searches command using PATH variable.

---

# What is PATH Variable?

PATH is environment variable containing directories where executables are stored.

Check PATH:

```bash
echo $PATH
```

Example:

```text
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
```

---

# Internal Command Search Process

When user types:

```bash
ls
```

Bash searches:

```text
/usr/local/sbin/ls
/usr/local/bin/ls
/usr/sbin/ls
/usr/bin/ls
```

Once found:
- executable runs.

---

# How to Find Bash Location

Command:

```bash
which bash
```

Output:

```text
/usr/bin/bash
```

Meaning:
Bash executable exists there.

---

# Another Way to Check

```bash
type bash
```

Output:

```text
bash is /usr/bin/bash
```

---

# How to Check Current Shell

```bash
echo $SHELL
```

Output:

```text
/usr/bin/bash
```

---

# What is a Script?

Script means:
- file containing commands

Instead of typing commands repeatedly:
- store them inside file

Example:

```bash
#!/bin/bash

echo "Hello"
date
pwd
```

---

# Why Shell Scripting Exists

Problem:
repeating same commands daily wastes time.

Solution:
automation using scripts.

---

# Real DevOps Importance of Shell Scripting

Shell scripting is used for:
- CI/CD pipelines
- Kubernetes automation
- deployment scripts
- backups
- monitoring
- cron jobs
- server management
- Docker automation

Without shell scripting:
- DevOps work becomes manual and slow.

---

# What is Shebang?

Example:

```bash
#!/bin/bash
```

This line is called:
- shebang
- hashbang

Purpose:
- tells Linux which interpreter should execute script

---

# Why Shebang is Important

Without shebang:
- wrong shell may execute script
- syntax errors may occur

Best practice:
always use shebang.

---

# Understanding Interpreters

Interpreter:
- reads code line by line
- executes immediately

Examples:
- Bash
- Python

---

# Interpreter vs Compiler

| Interpreter | Compiler |
|---|---|
| line-by-line execution | converts full code first |
| slower | faster |
| easy debugging | optimized execution |
| examples: Bash/Python | examples: C/C++ |

---

# What is Permission in Linux?

Linux is multi-user operating system.

Permissions prevent:
- unauthorized access
- accidental modifications
- security issues

---

# Types of Permissions

| Permission | Meaning |
|---|---|
| r | read |
| w | write |
| x | execute |

---

# Why Execute Permission Needed?

Without execute permission:
- Linux treats file as normal text file

After execute permission:
- Linux allows program execution

---

# Understanding chmod

Command:

```bash
chmod +x hello.sh
```

Breakdown:

| Part | Meaning |
|---|---|
| chmod | change mode |
| + | add |
| x | execute permission |

---

# Difference Between bash hello.sh and ./hello.sh

## bash hello.sh

Bash manually reads file.

Execute permission not mandatory.

---

## ./hello.sh

Linux directly executes script.

Execute permission mandatory.

---

# Why ./ Means Current Directory

```bash
./hello.sh
```

Breakdown:

| Symbol | Meaning |
|---|---|
| . | current directory |
| / | inside |
| hello.sh | file |

Meaning:

```text
Run hello.sh from current location.
```

---

# What is Home Directory?

Each Linux user gets personal directory.

Example:

```text
/home/muskan
```

Purpose:
- store personal files
- isolate users

---

# Why Permission Denied Happened Earlier

Attempt:

```bash
mkdir /home/shell-scripting
```

Problem:
- modifying parent system directory
- normal users lack permission

Correct approach:

```bash
cd ~
mkdir shell-scripting
```

---

# What Happens During git init

Git creates hidden folder:

```text
.git
```

This stores:
- commit history
- branches
- repository metadata
- tracking information

---

# Why DevOps Engineers Must Learn Bash Deeply

Because Bash exists everywhere:
- Linux servers
- Jenkins pipelines
- Kubernetes nodes
- Docker containers
- cloud systems
- automation tools

Strong Bash knowledge improves:
- troubleshooting
- automation
- debugging
- infrastructure management

---

# Interview-Level Understanding

Most beginners memorize commands.

Strong engineers understand:
- internal working
- process flow
- Linux architecture
- permissions
- command execution flow
- automation concepts

That difference creates senior-level understanding.

---

# Final Understanding

Bash is not just "commands."

Bash is:
- communication layer
- automation engine
- scripting language
- DevOps foundation
- Linux interaction system

Without understanding Bash deeply:
- advanced DevOps becomes difficult.

Strong foundation in Bash makes:
- Kubernetes easier
- Docker easier
- CI/CD easier
- Linux administration easier
- automation easier
