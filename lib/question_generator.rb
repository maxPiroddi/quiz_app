#   ____  __  ___________________________  _   __   _____________   ____________  ___  __________  ____ 
#  / __ \/ / / / ____/ ___/_  __/  _/ __ \/ | / /  / ____/ ____/ | / / ____/ __ \/   |/_  __/ __ \/ __ \
# / / / / / / / __/  \__ \ / /  / // / / /  |/ /  / / __/ __/ /  |/ / __/ / /_/ / /| | / / / / / / /_/ /
#/ /_/ / /_/ / /___ ___/ // / _/ // /_/ / /|  /  / /_/ / /___/ /|  / /___/ _, _/ ___ |/ / / /_/ / _, _/ 
#\___\_\____/_____//____//_/ /___/\____/_/ |_/   \____/_____/_/ |_/_____/_/ |_/_/  |_/_/  \____/_/ |_|  
#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV                                                                                           
#                                           
#       TO CREATE A QUESTION, FILL IN THE CODE BELOW
#
# 1. Enter question & answers, keeping the format the same (\n(a/b/c) between EVERY option)
question = "Enter question here \n(a) Answer A \n(b) Answer B \n(c) Answer C"
#
# 2. Enter correct option below.
answer = "a"            
#
#       PLEASE SAVE THIS FILE, AND RUN IN TERMINAL: $ ruby ./lib/question_generator.rb
#
#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
hash = {"questions": question, "answer": answer}
                                          
require 'json'                           
file = File.read(__dir__ + '/questions.json')       
                                          
def parse_json(file)                      
    JSON.parse(file)                            
rescue                                             
    File.open(__dir__ + '/questions.json', "a") do |f|
    f.write([]).to_json                    
    end                                  
end                                
parse_json(file)                           
file = File.read(__dir__ + '/questions.json')
working = parse_json(file)
working.push(hash)
File.open(__dir__ + '/questions.json',"w") do |f|
    f.write(working.to_json)               
end
puts "Question successfully added."