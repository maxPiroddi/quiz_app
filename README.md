# Welcome to QuikQuiz!
An application by *Max Piroddi*

My Github: https://github.com/maxPiroddi
#
Most queries you have will be answered here:

To begin, please ensure the 'colorize' gem for ruby is installed.

If this is not the case, please run the following command in your terminal:

    $ gem install colorize

To run the main application, run:

    $ ruby index.rb
#
### Walkthrough

From the landing page, you will be able to enter the student or teacher portals. At this time, the teacher portal password is *'_password_'*.

Within the student portal, you will be asked to enter your name. Once this is complete, the quiz will begin automatically. Each question will present you with 3 answers, which you will simply type the corresponding letter to answer.
Once the quiz is completed, you will be given a score and the option to try again or to exit the program.

Within the teacher portal, you will be asked to enter the password. Once this is complete, a complete history of student results will be displayed with names, scores and dates. You will have the option to exit the program once you are finished checking grades.
#
The app has three optional arguments for added functionality:

 *Help*, (-h) - The help argument will display a quick-reference guide to frequently asked questions regarding the app.

    $ ruby index.rb -h

*Generate*, (-g) - The generate argument will open the question-generator code. Follow the instructions within the code to set your new question for the generator.

    $ ruby index.rb -g

*Execute*, (-e) - The execute argument will run the question-generator, passing your previously written question into the question bank.

    $ ruby index.rb -e

#

## Application FAQ's
Student Portal:
- If your 'name' entry is blank, the program will return you to the previous screen.
- Your name must only contain 'a-z' & 'A-Z'. Any special characters or numbers will not be accepted.

Teacher Portal:
- By default, a terminal screen will display 5-6 recent results - depending on terminal-zoom.
- To see the full results, feel free to zoom in or out, or to scroll up and down.
- To create new questions, it is best to run '$ ruby index.rb -g' in bash. Enter your new question in the file, then execute '$ ruby index.rb -e' in bash.
- Please DO NOT edit the results or questions .JSON files directly.

#
# Development Log

## Log 1
*4th Sep, 2019*

Checked in with Hamish regarding the progress of the application. Everything outside of the application is running smoothly - documentation is mostly completed, flowchart has been completed and the implementation plan is being followed and updated.
Within the application, I have run into a significant roadblock regarding the reading and writing of JSON files - I have spent a full day attempting to work out the issue, however, I repeatedly receive the same error when attempting to parse the JSON file to be read in the app.
Will be spending some time with Hamish this afternoon attempting to work out where my code has slipped up. Until then, I have been focussing on cleaning up the apps appearance and finishing the other minor features.

## Log 2
*5th Sep, 2019*

Check in with Garret regarding my progress with the application. Informed him that after my session with Hamish yesterday, I was able to understand and implement the usage of JSON files, allowing me to complete my application. Implemented features last night, and spent the morning today cleaning up the code and doing preliminary error handling/checking. The rest of today will be spent finalising my documentation and error checking. I have completed the required terminal arguments within my application, as well as creating the required executable to move files to a new directory. The project should be finished by this evening, allowing me to spend tomorrow double checking all errors and cleaning up the user-interface of the application. I feel confident that I will be happy with everything completed on time.
#
# Software Development Plan

## Introduction
QuikQuiz is a CLI quiz application written in Ruby for my first assessment at CoderAcademy.

The application functions as a quick and simple quiz generator, with the capability to both quiz students with randomly generated questions, and display test results to their teachers. The application stores previously written questions within a JSON file, from which questions are retrieved at random and generated into a set of questions when using the ‘student’ portal. Once the quiz is completed, the student name, score and a timestamp are stored within another JSON file, which can be retrieved via the ‘teacher’ portal and displayed in a human-readable format. The application also has the ability to generate new questions, via a terminal command.

Many quiz applications available, for example Kahoot!, require teachers to write new questions each session, limiting the range of questions available and the scope of assessment. QuikQuiz allows teachers to write any number of questions within a file, from which questions will be randomly selected and presented to students. This will allow educators to broaden the scope of their assessment, and with repeated use of the application, ensure that students have a strong grasp of a broader range of learning outcomes.

QuikQuiz is targeted towards students and educators at any stage of education due to its ease of use, simple interface and completely modular question generation. Teachers of subjects requiring repeated excercises, such as mathematics and programming, could find a simple and intuitive teaching tool within the application, as it allows many small problems to be presented and resolved by students. The readability of results allows teachers to see, in a simple format, how well each of their students is faring with the current material.

The application is controlled via text inputs in the terminal, with an initial option of whether to access the student or teacher portal. Students are required to enter their name for record-keeping purposes, after which they will be presented with a previously generated set of questions. Once completed, students will receive their grade and the option to take the quiz again or exit. Teachers are required to enter a password for security purposes, after which they will be presented with a readable list of all previously completed tests, featuring student names, scores and timestamps. Teachers will have the option to exit the application once they are finished checking the data.
#
## Development Plan
### _Features_

#### _Generation of Question Set_
- Parse information from questions.JSON *(class.rb, line 35)*
- Converts JSON data to an array within the student portal, from which 10 questions and answers are selected using a loop and stored for display during the students quiz. The generation removes each hash as it is selected from the array, to ensure questions are not selected multiple times. *(index.rb, line 48)*

#### _Storage of student results and details_
- Parse information from results.JSON *(class.rb, line 18)*
- Converts JSON data to an array within the test, which then has the students test results pushed to the array. This is then converted back to JSON and stored within results.JSON for retrieval. *(index.rb, line 138)*

#### _Display Student Results_
- Parse information from results.JSON
- Converts the JSON to a variable, which is then looped through, printing each students name, score & date with well-formatted strings. *(index.rb, line 184)*

#### _Error Handling - Backup Data Storage & Empty-Input checks_
- If corrupted/empty, JSON files will be re-initialized for use. *(class.rb, lines 20 & 37)*
- All input fields outside of the quiz section require a text input - If none is found, the application will loop back and request again.
#
### User Interaction Outline
1. Landing page - user must state whether they are a teacher or student.
   - If a student, the user will be asked to enter their name.
   - If a teacher, the user will be asked to enter the required password.
     - If the input is incorrect/blank for either of these requests, the user will be taken to the previous prompt to try again.

2. Within the teacher portal, a complete history of student results stored within results.JSON will be presented in a readable format. If the results file is corrupted, a notice will inform the teacher that it has been re-created for future use. The teacher will then have the option to exit the application.

3. Within the student portal, the quiz will begin automatically once a name has been submitted. Each question will display a question number, question and the three available responses. The user will input their response (a, b or c) and be taken to the next question.

4. Once a student has completed all of the questions, they will receive a prompt informing them of their grade, and the option to re-try the quiz or to exit the application.
#
### Control Flow Diagram

[Control Flow](./docs/max_piroddi_T1A2-5_flowchart.pdf)
 #
### Implementation Plan
[Image One](./docs/max_piroddi_T1A2-14_screen_one.pdf)

[Image Two](./docs/max_piroddi_T1A2-14_screen_two.pdf)
#
### Error Testing
[Error Test](./docs/max_piroddi_T1A2-12_error_test.pdf)
#
