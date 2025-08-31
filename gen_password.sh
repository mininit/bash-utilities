#!/bin/bash
#
# DO NOT USE THESE PASSWORDS FOR PRIVILEGED ACCOUNTS - THEY ARE NOT SECURE
#

set -e 

# Numbers 2–9
numbers=(2 3 4 5 6 7 8 9)

# Simple colors
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
