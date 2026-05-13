#!/bin/bash
echo "what is your username?"
read username
echo "what is your current Domain"
read domain

echo -e " current details of user: $username\n $domain"
#-e Enable escape characters,\n becomes new line
