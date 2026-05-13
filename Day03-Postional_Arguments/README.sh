# Day 03 - Positional Arguments in Bash
# Beginner to DevOps Engineer Deep Dive

---

# Introduction

Positional Arguments are one of the most important concepts in Shell Scripting.

They allow users to pass values directly while running a script.

Without positional arguments:
- scripts become hardcoded
- automation becomes less reusable
- dynamic execution becomes difficult

Positional arguments are heavily used in:
- DevOps automation
- deployment scripts
- CI/CD pipelines
- Kubernetes automation
- backup scripts
- monitoring scripts

Understanding positional arguments deeply is important because real-world automation depends heavily on dynamic user-provided values.

---

# Learning Objectives

After completing this section, you will understand:

- What positional arguments are
- Why positional arguments are important
- How Bash stores positional arguments internally
- Difference between static and dynamic scripting
- Special positional variables
- Command-line argument passing
- Real-world DevOps usage
- Common beginner mistakes
- Professional scripting practices

---

# What are Positional Arguments?

Positional arguments are values passed to a script during execution.

Example:

```bash
./script.sh Muskan Patel Kolhapur 3.8
```

Here:

| Position | Value |
|---|---|
| $0 | script name |
| $1 | Muskan |
| $2 | Patel |
| $3 | Kolhapur |
| $4 | 3.8 |

---

# Why Called Positional Arguments?

Because values are identified based on their position.

Example:

```bash
$1
$2
$3
```

Each variable depends on position number.

---

# First Positional Argument Script

Create file:

```bash
vim Day03-Postional_Arguments.sh
```

---

# Script Example

```bash
#!/bin/bash

echo "hello $1 $2"

echo "$1 is living in $3 city"

echo "$1 is having around total $4 years of Experience in IT world"
```

---

# Give Execute Permission

```bash
chmod u+x Day03-Postional_Arguments.sh
```

---

# Execute Script Without Arguments

```bash
./Day03-Postional_Arguments.sh
```

Output:

```text
hello
Muskan is living in city
Muskan is having around total years of Experience in IT world
```

---

# Why Output Was Empty?

Because:
- no arguments were passed
- variables like `$1`, `$2`, `$3` had no values

Bash replaces missing positional arguments with empty values.

---

# Execute Script With Arguments

```bash
./Day03-Postional_Arguments.sh Muskan Patel Kolhapur 3.8
```

---

# Output

```text
hello Muskan Patel
Muskan is living in Kolhapur city
Muskan is having around total 3.8 years of Experience in IT world
```

---

# Script Explanation

| Line | Purpose |
|---|---|
| `#!/bin/bash` | Bash interpreter |
| `$1` | first argument |
| `$2` | second argument |
| `$3` | third argument |
| `$4` | fourth argument |

---

# Important Positional Variables

| Variable | Meaning |
|---|---|
| `$0` | script name |
| `$1-$9` | positional arguments |
| `$#` | total argument count |
| `$*` | all arguments |
| `$@` | all arguments separately |
| `$$` | current process ID |
| `$?` | previous command exit status |

---

# Understanding $0

Example:

```bash
echo $0
```

Output:

```text
./Day03-Postional_Arguments.sh
```

Meaning:
- current script name

---

# Understanding $# 

Example:

```bash
echo $#
```

Returns:
- total number of arguments passed

---

# Example

Command:

```bash
./script.sh A B C
```

Output:

```text
3
```

---

# Understanding $@

Returns:
- all arguments individually

Example:

```bash
echo $@
```

Output:

```text
A B C
```

---

# Practical DevOps Example

```bash
#!/bin/bash

ENVIRONMENT=$1
VERSION=$2

echo "Deploying application version $VERSION to $ENVIRONMENT environment"
```

Execution:

```bash
./deploy.sh production v1.2
```

---

# Real-Time DevOps Usage

Positional arguments are heavily used in:

## Deployment Scripts

```bash
./deploy.sh production v1.0
```

---

## Kubernetes Automation

```bash
./namespace.sh frontend
```

---

## Backup Scripts

```bash
./backup.sh /data
```

---

## Monitoring Scripts

```bash
./monitor.sh server1
```

---

# Common Beginner Mistakes

---

# Mistake 1
# Forgetting to Pass Arguments

Example:

```bash
./script.sh
```

Variables become empty.

---

# Mistake 2
# Wrong Argument Position

Example:

```bash
./script.sh Kolhapur Muskan
```

Output changes because positions changed.

---

# Mistake 3
# Spelling Errors

Example:

```bash
Postional
```

Correct:

```text
Positional
```

---

# Best Practices

- validate arguments
- provide usage messages
- use meaningful variable names
- check argument count
- handle missing inputs properly

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

# Security Best Practices

Never pass sensitive information like:
- passwords
- tokens
- secrets

directly through positional arguments.

Because they may become visible in:
- process lists
- command history

---

# Interview Questions

## What are positional arguments?

Arguments passed to script during execution.

---

## What does $0 represent?

Script name.

---

## What does $# represent?

Total number of arguments passed.

---

## Difference between $* and $@?

Both represent all arguments.
`$@` preserves argument separation better.

---

## Why are positional arguments important in DevOps?

They make scripts dynamic and reusable.

---

# Summary

In this section we learned:

- positional arguments
- argument passing
- special variables
- dynamic scripting
- argument validation
- DevOps usage
- best practices

Positional arguments are foundation for:
- automation
- deployment scripting
- CI/CD pipelines
- infrastructure scripting
