#================================= CLASS
#   Required for retrieval of questions & answers during the test method.
require 'json'

class Question
    attr_accessor :prompt, :answer

    def initialize(prompt, answer)
        @prompt = prompt
        @answer = answer
    end
end

#================================= RESULTS
#   Required to allow the teacher portal to parse the results file, and ensure no critical errors are encountered if file is empty.
file = File.read('./lib/results.json')

def parse_json_results(file)
    JSON.parse(file)            # Try parse the file --> If it's empty, we initialize it with []
rescue
    File.open("./lib/results.json", "a") do |f|
    f.write([]).to_json
    puts "Error: Results file corruped."
    puts
    puts "● results.JSON has been re-created: Results will now be recorded."
    puts "● Until new results are recorded, the teacher portal will display blank."
    end
end

#================================= QUESTIONS
#   As above, this method allows our 'test' method to generate a set of randomised questions each time a quiz begins.

q_file = File.read('./lib/questions.json')

def parse_json_questions(file)
    JSON.parse(file)            # Try parse the file --> If it's empty, we initialize it with []
rescue
    File.open("./lib/questions.json", "a") do |f|
    f.write([]).to_json
    puts
    puts "Error: Question file corrupted. Please contact your teacher."
    end
end