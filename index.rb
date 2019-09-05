#==============================================================================================================================#
#   Introductions

require 'json'
require 'colorize'
require 'time'
require_relative './lib/class'
system "clear" #Make sure CLI line is cleared once app starts


#==============================================================================================================================#
#   Application Run
while true
    system "clear"
    puts "●▬▬▬▬▬▬▬▬▬▬▬▬▬๑۩۩๑▬▬▬▬▬▬▬▬▬▬▬▬●".colorize(:color => :light_blue)
    puts "●▬▬▬▬Welcome▬▬to▬▬QuikQuiz!▬▬▬●".colorize(:color => :light_blue)     #Decorations & Introductions
    puts "●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●".colorize(:color => :light_blue)
    puts "● Are you a student or teacher?"
    print    "● "
    entry = gets.chomp.downcase

    if entry == "student"       # Student Path
#================================= Time to generate questions
        q_file = File.read('./lib/questions.json')
        question_array = parse_json_questions(q_file)
        
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
        
        working_questions = [
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
        
#================================= Running the test
        system "clear"
        puts "●▬▬▬▬▬▬▬▬▬▬▬▬▬๑۩۩๑▬▬▬▬▬▬▬▬▬▬▬▬●".colorize(:color => :light_blue)
        puts "●▬▬▬▬▬Welcome▬to▬the▬Quiz!▬▬▬▬●".colorize(:color => :light_blue)
        puts "●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●".colorize(:color => :light_blue)
        puts "● Please enter your name:"
        print    "● "
        student_name = gets.chomp.downcase
        
        if student_name.empty?
            system "clear"
            puts
            puts "Invalid selection: Please enter a name."    # TO DO --> MAKE THIS LOOP BACK TO NAME ENTRY
            next
        end
        def test(working_questions)
            results_file = File.open("./lib/results.json")
            answer = "" # We will store all of our users answers inside this variable
            counter = 1
            score = 0
            while counter < 11
                for question in working_questions
                    system "clear"
                    puts "Question #{counter}".colorize(:color => :light_blue)
                    puts question.prompt
                    answer = gets.chomp().downcase
                    if answer == question.answer
                        score += 1
                    end
                    counter += 1
                end
                score_counter = counter - 1 #   Attempt to DRY my code, rather than repeat 'counter-1' 7 times below!
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
            return score
        end

        score = test(working_questions)

        score_string = score.to_s

        date = Time.now.strftime("%d-%b-%y") # Check the time for storage

        file = File.read('./lib/results.json')

        parse_json_results(file)    # Call method

        hash = {"name": student_name, "score": score_string, "date": date.to_s}

        file = File.read('./lib/results.json')

        working = parse_json_results(file)

        working.push(hash)

        File.open('./lib/results.json', "w") do |f|
            f.write(working.to_json)
        end

        puts
        puts "Enter any key to return to the main menu, or type 'exit' to quit!"
        reply = gets.chomp.downcase
        if reply == "exit"
            system "clear"
            break
        else
            system "clear"
            next
        end

    elsif entry == "teacher"
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

            file = File.read('./lib/results.json')
            data_hash = parse_json_results(file)
            
            for item in data_hash do
                puts "Name: " + item["name"].capitalize
                puts "Score: " + item["score"] + "/10"
                puts "Date: " + item["date"]
                puts
                puts
            end
            puts

            puts "Type 'exit' to quit, or any key to return to main menu.".colorize(:color => :light_blue)
            reply = gets.chomp.downcase
            if reply == "exit"
                system "clear"
                break                           # CHANGE THIS TO REFLECT THE NEEDS OF THE TEACHER SECTION
            else
                system "clear"
                next
            end
        else 
            system "clear"
            puts
            puts "●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●"
            puts "Incorrect Password: Please try again."
            puts "●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●"
            puts
            next
        end
    else
        next
    end
end
#==============================================================================================================================#
#           Farewell for now!
#==============================================================================================================================#
