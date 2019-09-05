#=====Introductions============================================================================================================#

require 'json'
require 'colorize'
require 'time'
require_relative './lib/class'
system "clear" #Make sure CLI line is cleared once app starts

#=====Optional Arguments=======================================================================================================#
argv_copy = ARGV.map{|i| i}
ARGV.clear


if argv_copy.include? "-h"
    puts "Welcome to the help menu!"
    puts "Most queries you have will be answered here:"
    puts
    puts "Student Portal:"
    puts "● If your 'name' entry is blank, the program will return you to the previous screen."
    puts "● Your name must only contain 'a-z' & 'A-Z'. Any special characters or numbers will not be accepted."
    puts "Teacher Portal:"
    puts "● By default, a terminal screen will display 5-6 recent results - depending on terminal-zoom."
    puts "● To see the full results, feel free to zoom in or out, or to scroll up and down."
    puts "● To create new questions, it is best to run '$ ruby index.rb -g' in bash. Enter your new question in the file, then execute '$ ruby index.rb -e' in bash."
    puts "● Please DO NOT edit the results or questions .JSON files directly."
    puts
    exit
end

if argv_copy.include? "-g"
    system 'code ./lib/question_generator.rb'
    exit
end

if argv_copy.include? "-e"
    system 'ruby ./lib/question_generator.rb'
    exit
end
#===Application Run============================================================================================================#
while true
    puts "●▬▬▬▬▬▬▬▬▬▬▬▬▬๑۩۩๑▬▬▬▬▬▬▬▬▬▬▬▬●".colorize(:color => :light_blue)
    puts "●▬▬▬▬Welcome▬▬to▬▬QuikQuiz!▬▬▬●".colorize(:color => :light_blue)     # Decorations & Introductions
    puts "●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●".colorize(:color => :light_blue)
    puts "● Enter \"quit\" to exit."
    puts "● Are you a student or teacher?"
    print    "● "
    entry = gets.chomp.downcase
    system "clear"
    if entry == "quit"
        exit
    end
    if entry == "student"                                                      # Student Path
        while true                                                                          # Time to generate questions
            q_file = File.read('./lib/questions.json')
            question_array = parse_json_questions(q_file)
            begin
                p1 = question_array.delete_at(rand(question_array.length))
                p2 = question_array.delete_at(rand(question_array.length))
                p3 = question_array.delete_at(rand(question_array.length)) 
                p4 = question_array.delete_at(rand(question_array.length))
                p5 = question_array.delete_at(rand(question_array.length)) 
                p6 = question_array.delete_at(rand(question_array.length))
                p7 = question_array.delete_at(rand(question_array.length)) 
                p8 = question_array.delete_at(rand(question_array.length))
                p9 = question_array.delete_at(rand(question_array.length)) 
                p10 = question_array.delete_at(rand(question_array.length))
            rescue                                                                  # If the questions file is blank, we will re-create with []
                puts
                puts "● questions.JSON has been re-created: Please enter new questions."
                puts
                break
            end
            begin
                working_questions = [                                               # Create an array of this sessions questions
                    Question.new(p1["questions"], p1["answer"]),
                    Question.new(p2["questions"], p2["answer"]),
                    Question.new(p3["questions"], p3["answer"]),
                    Question.new(p4["questions"], p4["answer"]),
                    Question.new(p5["questions"], p5["answer"]),
                    Question.new(p6["questions"], p6["answer"]),
                    Question.new(p7["questions"], p7["answer"]),
                    Question.new(p8["questions"], p8["answer"]),
                    Question.new(p9["questions"], p9["answer"]),
                    Question.new(p10["questions"], p10["answer"])
                ]
            rescue
                puts
                puts "Error: Question generation unavailable. Please contact your teacher."
                puts
                puts "● Questions.JSON is functional, but does not have enough entries."
                puts
                break
            end
                                                                        # Running the quiz
            puts "●▬▬▬▬▬▬▬▬▬▬▬▬▬๑۩۩๑▬▬▬▬▬▬▬▬▬▬▬▬●".colorize(:color => :light_blue)
            puts "●▬▬▬▬▬Welcome▬to▬the▬Quiz!▬▬▬▬●".colorize(:color => :light_blue)
            puts "●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●".colorize(:color => :light_blue)
            puts "● To return to the previous screen, please press enter."
            puts "● Please enter your name:"
            print    "● "
            student_name = gets.chomp.downcase
            system "clear"
            if student_name.match? /\A[a-zA-Z'-]{2,20}\z/
                def test(working_questions)
                    results_file = File.open("./lib/results.json")
                    counter = 1
                    score = 0
                    while counter < 11
                        for question in working_questions
                            system "clear"
                            puts "Question #{counter}".colorize(:color => :light_blue)
                            puts question.prompt
                            answer = gets.chomp().downcase
                            if answer.match? /\A[a-c]{1}\z/                             # Answer MUST be a, b or c, else no movement.
                                if answer == question.answer
                                    score += 1
                                end
                                counter += 1
                            else
                                break                                                   # Can not proceed if selection is incorrect
                            end
                        end
                        score_counter = counter - 1                                     # Attempt to DRY my code, rather than repeat 'counter-1' 7 times below!
                        system "clear"
                            if score == score_counter
                                puts
                                puts "Congratulations! You have a perfect score."
                                puts
                            elsif score >= (score_counter * 0.75)
                                puts
                                puts "Well done! You received #{score}/#{score_counter}."
                                puts
                            elsif score >= (score_counter * 0.5)
                                puts
                                puts "You received #{score}/#{score_counter}."
                                puts
                            else
                                puts
                                puts "You have failed the quiz, with a score of #{score}/#{score_counter}." 
                                puts
                            end
                    end
                    return score                                                        # Return score for use in storage
                end
            else
                puts
                puts "Name entered not valid - please try again"
                next
            end                                                                        # Begin storage process
            score = test(working_questions)

            score_string = score.to_s

            date = Time.now.strftime("%d-%b-%y")

            file = File.read('./lib/results.json')

            parse_json_results(file)

            hash = {"name": student_name, "score": score_string, "date": date.to_s}

            file = File.read('./lib/results.json')

            working = parse_json_results(file)

            working.push(hash)

            File.open('./lib/results.json', "w") do |f|
                f.write(working.to_json)
            end
                                                                                    # Storage complete
            puts
            puts "Enter any key to try again, or type 'quit' for main menu!"
            reply = gets.chomp.downcase
            if reply == "exit" || "quit"
                system "clear"
                break
            else
                system "clear"
                next
            end
        end
    elsif entry == "teacher"                                                    # Teacher Path
        system "clear"
        puts
        puts "Please enter your password:"
        password = gets.chomp
        if password == "password"
            system "clear"
            puts
            puts "●▬▬▬▬▬▬▬๑۩۩๑▬▬▬▬▬▬▬●".colorize(:color => :light_blue)
            puts "Student Quiz Results".colorize(:color => :light_blue)
            puts "●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●".colorize(:color => :light_blue)
            puts
                                                                                # Retrieval of data
            file = File.read('./lib/results.json')
            data_hash = parse_json_results(file)
            begin
                for item in data_hash do
                    puts "Name: " + item["name"].capitalize
                    puts "Score: " + item["score"] + "/10"
                    puts "Date: " + item["date"]
                    puts
                    puts
                end
                puts
            rescue
                break
            end
            puts "Type 'quit' to finish, or any key to return to main menu.".colorize(:color => :light_blue)
            reply = gets.chomp.downcase
            if reply == "exit" || "quit"                                                  # Exit option
                system "clear"
                break                        
            else
                system "clear"
                next
            end
        end
    else
        puts "Incorrect selection: please enter 'student' or 'teacher'."
        next
    end
end
#==============================================================================================================================#
#           Farewell for now!
#                   Thank you for reading :)
#==============================================================================================================================#