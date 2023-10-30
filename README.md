# Lex sql analizer
> This is the third lab for my compilers class.
> It is a sql analizer created using lex/flex and yacc/bisson

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Features](#features)
* [Setup](#setup)
* [Usage](#usage)
* [Project Status](#project-status)
* [Room for Improvement](#room-for-improvement)
* [Acknowledgements](#acknowledgements)
* [Contact](#contact)
<!-- * [License](#license) -->


## General Information
- This is a project for the compilers class, it doesn't intend to be too consice on refactoring the code, but rather precise at detecting the logic of certain sql commands


## Technologies Used
- flex - version 2.6.4
- bison - version 3.8.2
- gcc - version 11.4.0

## Features
List the ready features here:
- Command words "highlighting"
- A somewhat usefull refactoring


## Setup
To be able to use the analizer you must first generate the c code from the lex file using flex, then generate de c code from the yacc file using bisson and compile both with gcc


## Usage
To get the c code and header from the yacc file use

`bison LAB02.y --header=LAB02.h --output=LAB02.c`

To get the c code from the lex file use

`flex -o LAB01.c LAB01.l`

To get the executable from the c file use

`gcc -o LAB02 LAB02.c LAB01.c -lfl`

Now you can run the executable with

`./LAB02 input.txt > output.txt`

With this you will get the results of the analizer to an output .txt file

## Project Status
Project is: _in progress_


## Room for Improvement

Room for improvement:
- Way of refactoring

To do:
- Understand Bison


## Acknowledgements
Give credit here.
- This project was inspired by professor Marquez
- Many thanks to people's questions in stackoverflow, bing chat and chat-gpt.


## Contact
Created by [@adcerro](https://github.com/adcerro) - feel free to contact me!
