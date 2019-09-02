#==============================================================================================================================#
#   Initialize required files
file = File.open("questions.txt")
file = File.open("results.txt")
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
end

#==============================================================================================================================#

p1 = "What is a boolean? \n(a) A true/false statement \n(b) A whole number \n(c) The capital of North Dakota"
p2 = "Who was George Washington? \n(a) The first president of the USA \n(b) The starting striker for Milan FC \n(c) A civil rights hero"
p3 = "What is 2 + 3? \n(a) Four \n(b) Seven \n(c) Five"
p4 = "What is KFC? \n(a) Kentucky Fried Chicken \n(b) Four \n(c) Green"
p5 = "What is a boolean? \n(a) A true/false statement \n(b) A whole number \n(c) The capital of North Dakota"
p6 = "Who was George Washington? \n(a) The first president of the USA \n(b) The starting striker for Milan FC \n(c) A civil rights hero"
p7 = "What is 2 + 3? \n(a) Four \n(b) Seven \n(c) Five"
p8 = "What is KFC? \n(a) Kentucky Fried Chicken \n(b) Four \n(c) Green"
p9 = "What is a boolean? \n(a) A true/false statement \n(b) A whole number \n(c) The capital of North Dakota"
p10 = "Who was George Washington? \n(a) The first president of the USA \n(b) The starting striker for Milan FC \n(c) A civil rights hero"


questions = [
    Question.new(p1, "a"),
    Question.new(p2, "a"),
    Question.new(p3, "c"),
    Question.new(p4, "a"),
    Question.new(p5, "a"),
    Question.new(p6, "c"),
    Question.new(p7, "a"),
    Question.new(p8, "a"),
    Question.new(p9, "a"),
    Question.new(p10, "c")
]

#==============================================================================================================================#
#   Introductions

puts "Welcome to QuikQuiz!"
puts "Are you a student or teacher?"
entry = gets.chomp.downcase

#==============================================================================================================================#
#   Application Run

if entry == "student"
    def test(questions)
        answer = "" # We will store all of our users answers inside this variable
        score = 0
        counter = 1
        puts "Please enter your name:"
        student_name = gets.chomp.downcase
        for question in questions
            puts "Question #{counter}"
            puts question.prompt
            answer = gets.chomp()
            if answer == question.answer
                score += 1
            end
            system "clear"
            counter += 1
        end

        if score == questions.length()
            puts "Congratulations! You have a perfect score."
        elsif score >= (questions.length() * 0.75)
            puts "Well done! You received #{score}/#{questions.length()}."
        elsif score >= (questions.length() * 0.5)
            puts "You received #{score}/#{questions.length()}."
        else
            puts "You have failed the quiz, with a score of #{score}/#{questions.length}." 
        end
        File.open("results.txt", "w") do |line|
            line.puts student_name 
            line.puts score
            line.puts Time.now
        end
    end

    test(questions)
elsif entry == "teacher"
    puts "Welcome teacher!"
else
    puts "Invalid selection: Please enter 'student' or 'teacher'"
end
