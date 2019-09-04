#==============================================================================================================================#
#   Initialize required files
require 'json'
require 'colorize'
require 'time'
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
#   Method to try parse the file --> If it is empty, it will print a fresh array
file = File.read('results.json')

def parse_json(file)
    JSON.parse(file)            # Try parse the file --> If it's empty, we initialize it with []
rescue
    File.open("results.json", "a") do |f|
    f.write([]).to_json
    end
end

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
        def test(questions)
            results_file = File.open("results.json")
            answer = "" # We will store all of our users answers inside this variable
            counter = 1
            score = 0
            while counter < 11
                for question in questions
                    system "clear"
                    puts "Question #{counter}".colorize(:color => :light_blue)
                    puts question.prompt
                    answer = gets.chomp().downcase
                    if answer == question.answer
                        score += 1
                    end
                    counter += 1
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
            end
            return score
        end

        score = test(questions)

        score_string = score.to_s

        date = Time.now.strftime("%d-%b-%y") # Check the time for storage

        file = File.read('results.json')

        parse_json(file)    # Call method

        hash = {"name": student_name, "score": score_string, "date": date}

        file = File.read('results.json')

        working = parse_json(file)

        working.push(hash)

        File.open('results.json', "w") do |f|
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
            data_hash=JSON.parse(results_file)
            
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

# begin
#     add()
# rescue      #==> If line 26 is going to return an error, rescue runs. Only shows if an error between begin & end runs.
#     p "I don't want this to crash!"
# end