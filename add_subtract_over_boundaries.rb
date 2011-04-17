@@right = 0
@@counter = 0

def create_question(max = 9)
  operators = %w(+ -)
  integers = (1 .. max).to_a

  decimal_base = 10 * ((integers.sort_by { rand }).first)
  under_ten = ( ((1 .. 8).to_a).sort_by { rand } ).first
  operand1 = decimal_base + under_ten
  operand2 = find_higher_than(under_ten)
  operator = (operators.sort_by {rand}).first
  question = "#{operand1} #{operator} #{operand2}"
  if operator == '-'
    return question if (eval(question) < decimal_base)
    return create_question(max)
  end
  if operator == '+'
    return question if (eval(question) > (decimal_base + 10))
    return create_question(max)
  end
end


def find_higher_than(under_ten)
  bigger_number = ( ((1 .. 9).to_a).sort_by { rand } ).first
  return bigger_number if  bigger_number > under_ten
  return find_higher_than(under_ten)
end


def display_question
  question = create_question
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
  display_question
end


start

