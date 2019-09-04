#==============================================================================================================================#
#   Initialize required files
file = File.open("questions.txt")
file = File.open("results.json")
results_file = File.read("results.json")
questions_file = File.read("questions.txt")
require 'json'
#==============================================================================================================================#

system "clear" #Make sure CLI line is cleared once app starts

#==============================================================================================================================#
#   Class required for access to each question
class Question  
    attr_accessor :prompt, :answer

    def initialize(prompt, answer)
        @prompt = prompt
        @answer = answer
    end

    # def pick_random_line
    #     File.readlines("questions.txt").sample  --> TO DO: Get the randomizer working to draw out questions
    # end
end

#==============================================================================================================================#
#   Temporary storage of questions until questins file is functioning

p1 = "What type of animal is Bambi? \n(a) Bear \n(b) Deer \n(c) Bird"
p2 = "Which country features a maple leaf on its flag? \n(a) Canada \n(b) Norway \n(c) Pakistan"
p3 = "What game features the terms love, deuce, match and volley? \n(a) Soccer \n(b) Tennis \n(c) Gold"
p4 = "Name a US state beginning with K. \n(a) Kandeer \n(b) Kennetuck \n(c) Kansas"
p5 = "Who wrote the 'Harry Potter' series? \n(a) JK Rowling \n(b) JRR Tolkien \n(c) Fyodir Dostoyevski"
p6 ="What is the currency of India? \n(a) Indian Dollar \n(b) Gold Pieces \n(c) Rupee"
p7 = "Who is Winnie the Pooh's gloomy donkey friend? \n(a) Tigger \n(b) Eeyore \n(c) Roberto"
p8 = "What is the standard unit of distance in the metric system? \n(a) Meter \n(b) Foot \n(c) Kilometer"
p9 = "What chemical element is diamond made of? \n(a) Carbon \n(b) Jewel \n(c) Ruby"
p10 = "What is the name of the 'tool' needed to play snooker or billiards to hit the ball? \n(a) Stick \n(b) Cue \n(c) Five-Iron"



questions = [
    Question.new(p1, "b"),
    Question.new(p2, "a"),
    Question.new(p3, "b"),
    Question.new(p4, "c"),
    Question.new(p5, "a"),
    Question.new(p6, "c"),
    Question.new(p7, "b"),
    Question.new(p8, "a"),
    Question.new(p9, "a"),
    Question.new(p10, "b")
]

#==============================================================================================================================#
#   Introductions
#==============================================================================================================================#
#   Bring JSON into an array, push the new data on the end, and then submit back 

#==============================================================================================================================#
#   Application Run
while true
    system "clear"
    puts
    puts "●▬▬▬▬▬▬▬▬▬๑۩۩๑▬▬▬▬▬▬▬▬▬●"
    puts "●▬Welcome to QuikQuiz!▬●"     #Decorations & Introductions
    puts "●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●"
    puts "Are you a student or teacher?"
    entry = gets.chomp.downcase

    if entry == "student"       # Student Path
        def test(questions)
            require 'time'
            results_file = File.open("results.json")
            answer = "" # We will store all of our users answers inside this variable
            score = 0
            counter = 1
            while counter < 11
                system "clear"
                puts
                puts "●▬▬▬▬▬▬▬▬▬▬▬๑۩۩๑▬▬▬▬▬▬▬▬▬▬●"
                puts "●▬▬▬Welcome to the Quiz!▬▬●"
                puts "●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●"
                puts "Please enter your name:"
    
                student_name = gets.chomp.downcase

                if student_name.empty?
                    system "clear"
                    puts
                    puts "Invalid selection: Please enter a name."    # TO DO --> MAKE THIS LOOP BACK TO NAME ENTRY
                    next
                
                else
                    for question in questions
                        system "clear"
                        puts "Question #{counter}"
                        puts question.prompt
                        answer = gets.chomp()
                        if answer == question.answer
                            score += 1
                        end
                        counter += 1
                    end
                end
                system "clear"
                    if score == questions.length()
                        puts
                        puts "Congratulations! You have a perfect score."
                        puts
                    elsif score >= (questions.length() * 0.75)
                        puts
                        puts "Well done! You received #{score}/#{questions.length()}."
                        puts
                    elsif score >= (questions.length() * 0.5)
                        puts
                        puts "You received #{score}/#{questions.length()}."
                        puts
                    else
                        puts
                        puts "You have failed the quiz, with a score of #{score}/#{questions.length}." 
                        puts
                    end
                    # File.open("results.json", "a+") do |line|
                    #     line.print "{   \"name\": " + "\"#{student_name.to_s}\"," 
                    #     line.print "    \"score\": " + "\"#{score.to_s}\","
                    #     line.print "    \"date\": " + "\"#{Time.now.strftime("%d-%b-%y")}\" },"
                    #     line.print "]"
                    # end

                    # data_hash=JSON.parse(results_file)
                    #     working_array = []
                    #     data_hash = working_array  ##FIGURE OUT HOW TO MAKE IT SO THAT THIS EXTRACTS THE STRING
                    #     working_array.push("{   \"name\": \"#{student_name.to_s}\", \"score\": \"#{score.to_s}\", \"date\": \"#{Time.now.strftime("%d-%b-%y")}\"}")
                    #     data_hash.close()
                    #     working_array.to_json

                    # File.open("results.json", "w")
                    #     print working_array

                    
            end
        end

        test(questions)
        puts
        puts "Enter any key to try again, or type 'exit' to quit!"
        reply = gets.chomp.downcase
        if reply == "exit"
            break
        else
            next
        end

    elsif entry == "teacher"
        
        system "clear"

        puts "Welcome teacher!"
        puts
        data_hash=JSON.parse(results_file)
        
        for item in data_hash do
            puts "Name: " + item["name"].capitalize
            puts "Score: " + item["score"] + "/10"
            puts "Date: " + item["date"]
            puts
            puts
        end
        puts

        puts "Enter any key to try again, or type 'exit' to quit!"
        reply = gets.chomp.downcase
        if reply == "exit"
            break                           # CHANGE THIS TO REFLECT THE NEEDS OF THE TEACHER SECTION
        else
            next
        end
    
    else
        puts "Invalid selection: Please enter 'student' or 'teacher'"
        next
    end
end
#==============================================================================================================================#
#           Farewell for now!
#==============================================================================================================================#

# begin
#     add()
# rescue      #==> If line 26 is going to return an error, rescue runs. Only shows if an error between begin & end runs.
#     p "I don't want this to crash!"
# end