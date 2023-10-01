# Lex sql analizer
> This is the second lab for my compilators class.
> It is a sql analizer created using lex/flex

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Features](#features)
* [Screenshots](#screenshots)
* [Setup](#setup)
* [Usage](#usage)
* [Project Status](#project-status)
* [Room for Improvement](#room-for-improvement)
* [Acknowledgements](#acknowledgements)
* [Contact](#contact)
<!-- * [License](#license) -->


## General Information
- Provide general information about your project here.
- What problem does it (intend to) solve?
- What is the purpose of your project?
- Why did you undertake it?
<!-- You don't have to answer all the questions - just the ones relevant to your project. -->


## Technologies Used
- flex - version 2.6.4
- gcc - version 11.4.0


## Features
List the ready features here:
- Command words "highlighting"
- A somewhat usefull refactoring


## Screenshots
![Example screenshot](./img/screenshot.png)
<!-- If you have screenshots you'd like to share, include them here. -->


## Setup
To be able to use the analizer you must first generate the c code with flex and compile it with gcc


## Usage
To get the c code from the lex file use

`flex -o LAB01.c LAB01.l`

To get the executable from the c file use

`gcc LAB01.c -o LAB01 -ll`

Now you can run the executable with

`./LAB01 input.txt > output.txt`

With this you will get the results of the analizer to an output .txt file

## Project Status
Project is: _in progress_


## Room for Improvement

Room for improvement:
- Way of refactoring

To do:
- Detection of typing errors
- Prper variable detection


## Acknowledgements
Give credit here.
- This project was inspired by professor Marquez
- Many thanks to people's questions in stackoverflox and a bit of help from bing chat


## Contact
Created by [@adcerro](https://github.com/adcerro) - feel free to contact me!
