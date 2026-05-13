# Day 02 - Bash Variables and User Input
# Complete Beginner to DevOps Engineer Guide

---

# Introduction

Variables are one of the most important concepts in Shell Scripting and DevOps automation.

Without variables:
- automation becomes impossible
- scripts become hardcoded
- reusable scripting cannot happen
- dynamic infrastructure management becomes difficult

Variables allow Shell Scripts to:
- store data
- reuse information
- accept user input
- make scripts dynamic
- automate environments

In real DevOps environments, variables are heavily used in:
- CI/CD pipelines
- Kubernetes deployments
- Jenkins jobs
- Docker automation
- Monitoring scripts
- Infrastructure automation

Understanding variables deeply is extremely important because almost every automation tool uses variables internally.

---

# Learning Objectives

After completing this section, you will understand:

- What variables are
- Why variables are important
- How Bash stores variables internally
- Variable naming rules
- Variable expansion
- User input handling
- Quotes and escape characters
- Difference between static and dynamic data
- Common beginner mistakes
- Real-world DevOps usage of variables
- Professional scripting best practices

---

# What is a Variable?

A variable is a named container used to store data temporarily.

Think of a variable like:
- a labeled box
- where information can be stored and reused later

Example:

```bash
name="Muskan"
```

Here:
- `name` → variable name
- `"Muskan"` → stored value

---

# Why Variables Are Important

Without variables:

```bash
echo "Muskan"
```

Output is fixed and cannot change dynamically.

With variables:

```bash
name="Muskan"

echo $name
```

Output becomes dynamic and reusable.

Variables help:
- avoid repetition
- simplify automation
- improve maintainability
- build scalable scripts

---

# Variable Assignment Syntax

Correct syntax:

```bash
name="Muskan"
```

Wrong syntax:

```bash
name = "Muskan"
```

---

# Why Spaces Are Not Allowed Around '='

Bash treats spaces as separators.

When user writes:

```bash
name = Muskan
```

Bash interprets:

| Part | Interpretation |
|---|---|
| name | command |
| = | argument |
| Muskan | argument |

Since command `name` does not exist:

```text
command not found
```

appears.

---

# Variable Naming Rules

## Allowed

```bash
name="Muskan"
first_name="Muskan"
FIRST_NAME="Muskan"
```

---

## Not Allowed

```bash
1name="Muskan"
first-name="Muskan"
first name="Muskan"
```

---

# Variable Naming Best Practices

Professional naming styles:

## Lowercase

```bash
first_name="Muskan"
```

Used for:
- local variables

---

## Uppercase

```bash
FIRST_NAME="Muskan"
```

Used for:
- environment variables
- constants

---

# Creating First Variable Script

Create file:

```bash
vim variables1.sh
```

Script:

```bash
#!/bin/bash

First_Name="Muskan"
Last_Name="Patel"

echo "Hello Miss $First_Name $Last_Name"
```

---

# Script Explanation

| Line | Purpose |
|---|---|
| `#!/bin/bash` | specifies Bash interpreter |
| `First_Name="Muskan"` | variable creation |
| `Last_Name="Patel"` | variable creation |
| `echo` | prints output |
| `$First_Name` | variable expansion |

---

# What is Variable Expansion?

Variable expansion means:
- replacing variable name with stored value

Example:

```bash
$First_Name
```

internally becomes:

```bash
Muskan
```

---

# Why Dollar Symbol ($) Is Used

`$` tells Bash:

```text
Retrieve value stored inside variable.
```

Example:

```bash
echo $name
```

Without `$`:

```bash
echo name
```

Output:

```text
name
```

With `$`:

```bash
echo $name
```

Output:

```text
Muskan
```

---

# Understanding Quotes in Bash

Correct:

```bash
echo "Hello Muskan"
```

Wrong:

```bash
"echo Hello Muskan"
```

---

# Why Wrong Example Fails

Bash interprets:

```bash
"echo Hello Muskan"
```

as a full command name.

Equivalent meaning:

```text
Run command named:
echo Hello Muskan
```

Since command does not exist:

```text
command not found
```

appears.

---

# Variable Case Sensitivity

Bash variables are case-sensitive.

These are different variables:

```bash
$name
$Name
$NAME
```

---

# User Input in Bash

User input makes scripts interactive.

Instead of hardcoded values:
- users provide values during execution.

---

# read Command

`read` command accepts keyboard input.

Example:

```bash
read username
```

Flow:
1. script pauses
2. user enters value
3. value gets stored in variable

---

# Interactive Script Example

```bash
#!/bin/bash

echo "What is your username?"
read username

echo "What is your current domain?"
read domain

echo -e "Current details of user:\n$username\n$domain"
```

---

# Understanding Escape Characters

Escape characters provide formatting.

| Character | Meaning |
|---|---|
| `\n` | new line |
| `\t` | tab |
| `\\` | backslash |

---

# Why echo -e is Used

Default `echo` does not interpret escape characters.

`-e` enables:
- `\n`
- `\t`
- formatted output

Example:

```bash
echo -e "Hello\nWorld"
```

Output:

```text
Hello
World
```

---

# Practical Production Example

```bash
#!/bin/bash

ENVIRONMENT="production"
APP_NAME="frontend"
VERSION="v1.2"

echo "Deploying $APP_NAME version $VERSION to $ENVIRONMENT"
```

---

# Real-Time DevOps Usage

Variables are heavily used in:

## Jenkins

```bash
BUILD_NUMBER
JOB_NAME
ENVIRONMENT
```

---

## Kubernetes

```bash
NAMESPACE
IMAGE_TAG
REPLICA_COUNT
```

---

## Docker

```bash
CONTAINER_NAME
IMAGE_VERSION
```

---

## CI/CD Pipelines

Variables store:
- secrets
- tokens
- environments
- versions
- configurations

---

# Common Mistakes

## Mistake 1 — Spaces Around '='

Wrong:

```bash
name = Muskan
```

Correct:

```bash
name="Muskan"
```

---

## Mistake 2 — Wrong Quotes

Wrong:

```bash
"echo Hello"
```

Correct:

```bash
echo "Hello"
```

---

## Mistake 3 — Case Sensitivity

Wrong:

```bash
$Last_name
```

Correct:

```bash
$Last_Name
```

---

# Best Practices

- use meaningful variable names
- avoid spaces around '='
- use quotes for string values
- maintain naming consistency
- use uppercase for environment variables
- avoid hardcoding sensitive data

---

# Security Best Practices

Avoid storing:
- passwords
- tokens
- API keys

directly inside scripts.

Use:
- environment variables
- secret managers
- vault systems

---

# Interview Questions

## Beginner Level

### What is a variable?

A variable is a named memory location used to store data temporarily.

---

### Why is `$` used in Bash?

`$` retrieves stored value of variable.

---

## Intermediate Level

### Why spaces are not allowed in variable assignment?

Because Bash interprets spaces as separators between commands and arguments.

---

### What is variable expansion?

Replacing variable name with stored value during execution.

---

## Scenario-Based

### Why would DevOps engineers use variables in CI/CD?

To dynamically manage:
- environments
- versions
- namespaces
- deployments
- configurations

without changing scripts manually.

---

# Summary

In this section we learned:

- variables
- variable assignment
- variable expansion
- quotes
- user input
- read command
- escape characters
- interactive scripting
- DevOps usage of variables

Variables are the foundation of:
- automation
- scripting
- CI/CD
- DevOps engineering
