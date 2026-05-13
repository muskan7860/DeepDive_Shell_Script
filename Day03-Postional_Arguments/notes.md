# Day 03 - Positional Arguments
# Deep Dive Notes | Beginner to Production DevOps Engineering

---

# 1. Introduction

Positional Arguments are one of the core building blocks of Shell Scripting.

They allow users to pass dynamic values to scripts during execution.

Without positional arguments:
- scripts become static
- automation becomes hardcoded
- scripts cannot scale for multiple environments

Positional arguments make scripts:
- reusable
- flexible
- dynamic
- automation-friendly

In real-world DevOps environments, positional arguments are heavily used in:
- deployment automation
- CI/CD pipelines
- Kubernetes management scripts
- backup automation
- infrastructure scripts
- monitoring tools
- Jenkins automation
- Docker runtime scripts

Understanding positional arguments deeply is extremely important because almost every production-grade shell script depends on runtime input values.

---

# 2. Why Positional Arguments Exist

Before positional arguments, scripts often contained fixed values.

Example:

```bash
#!/bin/bash

echo "Deploying application to production"
```

Problem with hardcoded scripts:
- works only for production
- difficult to reuse
- not scalable
- difficult to automate
- poor DevOps practice

Imagine maintaining:
- one script for production
- another for testing
- another for staging

This becomes operationally difficult.

Engineers needed a way to:
- pass values dynamically
- reuse same script everywhere
- automate multiple environments

This problem led to the use of positional arguments.

Now same script can work everywhere:

```bash
./deploy.sh production
./deploy.sh staging
./deploy.sh testing
```

Single script becomes reusable across environments.

This is exactly why positional arguments are critical in DevOps automation.

---

# 3. Internal Working

Understanding internal working separates:
- beginner scripting knowledge
from
- professional engineering understanding

When user executes:

```bash
./Day03-Postional_Arguments.sh Muskan Patel Kolhapur 3.8
```

multiple internal operations happen.

---

# Step-by-Step Internal Execution Flow

---

# Step 1 - User Executes Command

User types:

```bash
./Day03-Postional_Arguments.sh Muskan Patel Kolhapur 3.8
```

Shell receives:
- command
- arguments

---

# Step 2 - Bash Parses Command

Bash parser separates command into tokens.

Internally:

| Token | Meaning |
|---|---|
| ./Day03-Postional_Arguments.sh | script |
| Muskan | argument 1 |
| Patel | argument 2 |
| Kolhapur | argument 3 |
| 3.8 | argument 4 |

---

# Step 3 - Linux Kernel Creates Process

Linux kernel:
- creates child process
- allocates memory
- prepares execution environment

Every running script becomes a process.

---

# Step 4 - Kernel Checks Shebang

Kernel reads first line:

```bash
#!/bin/bash
```

This is called:
- Shebang

Meaning:

```text
Use Bash interpreter to execute this file.
```

Kernel loads:
- `/bin/bash`

---

# Step 5 - Bash Maps Positional Arguments

Bash internally assigns arguments:

| Variable | Value |
|---|---|
| $0 | script name |
| $1 | Muskan |
| $2 | Patel |
| $3 | Kolhapur |
| $4 | 3.8 |

These variables are temporarily stored in process memory.

---

# Step 6 - Script Execution Starts

Bash starts reading script line by line.

Whenever Bash sees:

```bash
$1
```

It replaces value dynamically.

Example:

```bash
echo "$1 is living in $3 city"
```

Internally becomes:

```bash
echo "Muskan is living in Kolhapur city"
```

This process is called:
- Variable Expansion

---

# 4. Syntax Breakdown

Command:

```bash
./Day03-Postional_Arguments.sh Muskan Patel Kolhapur 3.8
```

---

# Detailed Breakdown

| Component | Meaning |
|---|---|
| `./` | current directory |
| `Day03-Postional_Arguments.sh` | script name |
| `Muskan` | first positional argument |
| `Patel` | second positional argument |
| `Kolhapur` | third positional argument |
| `3.8` | fourth positional argument |

---

# Understanding `./`

`./` means:
- current working directory

Without `./`:
Linux searches script inside:
- PATH environment variable

Current directory is NOT searched automatically for security reasons.

---

# Understanding `$0`

`$0` stores:
- current script name

Example:

```bash
echo $0
```

Output:

```text
./Day03-Postional_Arguments.sh
```

---

# Understanding `$1`, `$2`, `$3`

These represent:
- runtime positional variables

Mapped based on:
- argument order

---

# 5. Deep Concept Understanding

Positional arguments are temporary runtime variables.

They exist only while process is running.

After script execution:
- process terminates
- memory released
- arguments destroyed

This is important Linux process understanding.

---

# How Bash Stores Arguments Internally

Internally Bash maintains:
- argument array
- process environment
- execution context

Arguments passed during execution are stored temporarily in process memory.

Professional engineers understand:
- variables are not permanent
- positional arguments exist only during runtime

---

# Dynamic vs Hardcoded Scripting

---

# Hardcoded Script

```bash
echo "Deploying to production"
```

Problems:
- inflexible
- not reusable
- difficult automation

---

# Dynamic Script

```bash
./deploy.sh production
```

Advantages:
- reusable
- scalable
- automation friendly

This is professional scripting approach.

---

# Variable Expansion Internally

When Bash sees:

```bash
echo "$1"
```

Bash performs:
- variable expansion first
- command execution second

Execution flow:

```text
1. Parse line
2. Replace variables
3. Execute command
```

This internal execution flow is very important for shell scripting mastery.

---

# 6. Beginner Mistakes

---

# Mistake 1 - Running Script Without Arguments

Example:

```bash
./script.sh
```

Output:
- blank values

Reason:
- positional variables empty

Bash does NOT validate automatically.

---

# Mistake 2 - Wrong Argument Order

Example:

```bash
./script.sh Kolhapur Muskan
```

Internally:

| Variable | Value |
|---|---|
| $1 | Kolhapur |
| $2 | Muskan |

Output changes unexpectedly.

---

# Mistake 3 - Forgetting Quotes

Example:

```bash
./script.sh Muskan Patel New York
```

Internally:
- New
- York

become separate arguments.

Correct:

```bash
./script.sh Muskan Patel "New York"
```

---

# Mistake 4 - Assuming Variables Persist Forever

Positional arguments disappear after process exits.

They are temporary runtime variables.

---

# Mistake 5 - Typographical Errors

Example:

```text
Postional
```

Correct spelling:

```text
Positional
```

Professional documentation should avoid spelling mistakes.

---

# 7. Troubleshooting Section

---

# Problem

Variables printing blank.

---

# Cause

Arguments not passed during execution.

---

# Incorrect

```bash
./script.sh
```

---

# Correct

```bash
./script.sh Muskan Patel Kolhapur 3.8
```

---

# Problem

Unexpected output.

---

# Cause

Wrong positional order.

---

# Incorrect

```bash
./script.sh Kolhapur Muskan
```

---

# Correct

```bash
./script.sh Muskan Kolhapur
```

---

# Problem

Arguments split unexpectedly.

---

# Cause

Space-containing values not quoted.

---

# Incorrect

```bash
./script.sh New York
```

---

# Correct

```bash
./script.sh "New York"
```

---

# Problem

Permission denied.

---

# Cause

Script lacks execute permission.

---

# Fix

```bash
chmod u+x script.sh
```

---

# 8. Real DevOps Usage

Positional arguments are heavily used in production automation.

---

# Deployment Automation

```bash
./deploy.sh production v1.2
```

---

# Kubernetes Namespace Scripts

```bash
./namespace-create.sh frontend
```

---

# Jenkins Build Automation

```bash
./build.sh dev backend
```

---

# Docker Runtime Automation

```bash
./docker-run.sh nginx latest
```

---

# Backup Automation

```bash
./backup.sh /data
```

---

# Monitoring Automation

```bash
./monitor.sh server01
```

---

# Infrastructure Automation

```bash
./terraform-wrapper.sh staging
```

---

# Why DevOps Engineers Use Positional Arguments

DevOps automation must be:
- reusable
- scalable
- environment independent
- parameter driven

Positional arguments solve this problem efficiently.

---

# 9. Security Considerations

Most beginner repositories ignore security concepts.

Professional engineers NEVER ignore security.

---

# Avoid Passing Sensitive Data

Do NOT pass:
- passwords
- API tokens
- secret keys
- credentials

through positional arguments.

---

# Why?

Linux process list may expose arguments.

Example:

```bash
ps -ef
```

may reveal:
- passwords
- tokens
- secrets

This creates security risks.

---

# Better Approach

Use:
- environment variables
- secret managers
- vault systems

instead of positional arguments for sensitive data.

---

# 10. Professional Best Practices

Professional shell scripts should always:

- validate arguments
- handle missing inputs
- use proper logging
- use meaningful variable names
- return proper exit codes
- avoid hardcoded values
- handle edge cases

---

# Professional Validation Example

```bash
#!/bin/bash

if [ $# -lt 2 ]
then
    echo "Usage: ./script.sh <name> <city>"
    exit 1
fi
```

---

# Why Validation Matters

Without validation:
- automation may fail silently
- CI/CD pipelines may break
- deployments may become inconsistent

Professional scripts always validate inputs.

---

# 11. Interview Questions

---

# Beginner Questions

## What are positional arguments?

Runtime values passed to script during execution.

---

## What does `$0` represent?

Script name.

---

## What does `$1` represent?

First positional argument.

---

## What does `$#` represent?

Total number of arguments passed.

---

# Intermediate Questions

## Why are positional arguments important?

They make scripts reusable and dynamic.

---

## What happens if arguments are not passed?

Variables become empty.

---

## Difference between `$*` and `$@`?

Both represent all arguments.

`$@` preserves argument boundaries better.

---

# Scenario-Based Questions

## How would you validate mandatory arguments in production scripts?

Using:
- conditional checks
- argument count validation
- exit codes

---

## Why should secrets not be passed as positional arguments?

Because process list may expose sensitive data.

---

# 12. Future Learning Connection

Positional arguments connect directly with advanced shell scripting concepts.

Future topics depending on positional arguments:

- conditions
- loops
- functions
- automation frameworks
- CI/CD scripting
- Jenkins pipelines
- Kubernetes automation
- deployment systems

Without strong positional argument understanding:
advanced shell scripting becomes difficult.

---

# 13. Final Summary

In this topic we learned:

- what positional arguments are
- why positional arguments exist
- internal Bash execution flow
- Linux process behavior
- variable expansion
- runtime execution
- troubleshooting
- security considerations
- professional scripting practices
- DevOps automation usage

Positional arguments are one of the foundational building blocks of:
- Shell Scripting
- Linux automation
- CI/CD pipelines
- DevOps engineering
- infrastructure automation
- production deployment systems
