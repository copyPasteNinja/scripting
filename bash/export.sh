#!/bin/bash

read -p "What is your name?: " name
echo "Hello there $name"

echo $$

echo "export shell=$SHELL" >> ~/.bashrc
source ~/.bashrc

