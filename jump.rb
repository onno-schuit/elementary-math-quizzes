@@right = 0
@@counter = 0


def start
  puts "Welke sprongen wil je maken: sprongen van 1 of 10?"
  @@jump = gets
  if /\S/ !~ @@jump
    return start
  end
  display_question
end


def process_question(question)
  answer =  Array.new
  answer[0] = gets 
  print " - #{question} - "
  answer[1] = gets
  return answer
end


def display_question
  if @@jump == 10
    question = create_big_jumps
  else
    question = create_small_jumps
  end
  answer = process_question(question)
  if answer.chomp == 's' || answer.chomp == 'S'
    puts "Goed: #{@@right}; fout: #{@@counter - @@right}. Totaal aantal sommen: #{@@counter}"
    return
  end

end


def create_big_jumps
  base = (10 .. 99)
  (base.sort_by { rand }).first * 10
end


def create_small_jumps
  base = (1 .. 9)
  (base.sort_by { rand }).first * 100
end


start   
