@@right = 0
@@counter = 0
@@tables = Array.new

def create_question(max = 10)
  operators = %w(+ -)
  integers = (1 .. 20).to_a
  operand1 = (integers.sort_by { rand }).first
  operand2 = (integers.sort_by { rand }).first
  operator = (operators.sort_by {rand}).first
  question = "#{operand1} #{operator} #{operand2}"
  if (eval(question) > max || eval(question) <= 0)
    return create_question(max)
  else
    question 
  end
end

def display_question
  question = create_question(100)
  answer = process_question(question)
  #raise "answer = #{answer} and answer.class = #{answer.class}"
  if answer.chomp == 's' || answer.chomp == 'S'
    puts "Goed: #{@@right}; fout: #{@@counter - @@right}. Totaal aantal sommen: #{@@counter}"
    return
  end
  if answer.to_i == eval(question)
    @@right += 1
    puts "Goed!"
  else
    puts "Fout: #{question} = #{eval(question)}"
  end  
  @@counter += 1
  #sleep 1 # wait 1 second
  gets
  display_question  
end


def process_question(question)
  print  question + " = "
  answer = gets
  if /\S/ !~ answer
    return process_question(question)
  end
  return answer
end


def start
  puts "Welke tafels wil je oefenen?"
  @@tables = gets.split(",")
  display_multiplication
end


def create_multiplication
  integers = (1 .. 10).to_a
  operand1 = (integers.sort_by { rand }).first
  operand2 = (@@tables.sort_by { rand }).first
  question = "#{operand1} x #{operand2}"
end


def display_multiplication
  question = create_multiplication()
  answer = process_question(question)
  #raise "answer = #{answer} and answer.class = #{answer.class}"
  if answer.chomp == 's' || answer.chomp == 'S'
    puts "Goed: #{@@right}; fout: #{@@counter - @@right}. Totaal aantal sommen: #{@@counter}"
    return
  end
  parsed_question = question.gsub('x', '*');
  if answer.to_i == eval(parsed_question)
    @@right += 1
    puts "Goed!"
  else
    puts "Fout: #{question} = #{eval(parsed_question)}"
  end  
  @@counter += 1
  #sleep 1 # wait 1 second
  gets
  display_multiplication  
end


start

