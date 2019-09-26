
q_file = File.read('./lib/questions.json')
question_array = parse_json_questions(q_file)

p1 = question_array.delete_at(rand(question_array.length))
p2 = question_array.delete_at(rand(question_array.length))

working_questions = [                                         
    Question.new(p1["questions"], p1["answer"]),
    Question.new(p2["questions"], p2["answer"]),
