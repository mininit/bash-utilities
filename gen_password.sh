#!/bin/bash
#
# Password Generator (toy version)
#
# WARNING:
#   DO NOT USE THESE PASSWORDS FOR PRIVILEGED ACCOUNTS.
#   They are simple, predictable, and not secure.
#
# Description:
#   Generates 10 random, easy-to-remember passwords in the format:
#     <number><colour><animal>
#
#   Example output:
#     4BlueCats
#     7PinkDogs
#     2GreenLions
#
set -e

# Numbers 2–9
numbers=(2 3 4 5 6 7 8 9)

# Simple colours
colours=(Red Blue Green Yellow Purple Pink)

# Easy-to-spell plural animals
animals=(Dogs Cats Mice Birds Fish Frogs Bears Lions Tigers Pigs Goats Sheep Ducks Ants)

# Generate 10 passwords
for i in {1..10}; do
    number=${numbers[$((RANDOM % ${#numbers[@]}))]}
    colour=${colours[$((RANDOM % ${#colours[@]}))]}
    animal=${animals[$((RANDOM % ${#animals[@]}))]}
    echo "${number}${colour}${animal}"
done