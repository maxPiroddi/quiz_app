# Welcome to QuikQuiz!
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
- Remember: No answer is still an answer!

Teacher Portal:
- By default, a terminal screen will display 5-6 recent results - depending on terminal-zoom.
- To see the full results, feel free to zoom in or out, or to scroll up and down.
- To create new questions, it is best to run '$ ruby index.rb -g' in bash. Enter your new question in the file, then execute '$ ruby index.rb -e' in bash.
- Please DO NOT edit the results or questions .JSON files directly.