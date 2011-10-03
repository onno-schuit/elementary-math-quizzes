## This one is for the Dutch language only... 
## (Could easily be translated into German as well, but English has different rules)

@@ones = %w[een twee drie vier vijf zes zeven acht negen]
@@tweens = %w[elf twaalf dertien veertien vijftien zestien zeventien achttien negentien]
@@tens = %w[tien twintig dertig veertig vijftig zestig zeventig tachtig negentig]
@@hundreds = %w[honderd tweehonderd driehonderd vierhonderd vijfhonderd zeshonderd zevenhonderd achthonderd negenhonderd]

@@right = 0
@@counter = 0

def written_number(number)
  hundred, ten, single = *number.to_s.split(//)
  written_hundred = @@hundreds[hundred.to_i - 1]
  written_hundred + " " + compose_ten(ten, single)
end


def compose_ten(ten, single)
  return compose_single(single) if ten.to_i == 0
  return @@tens[ten.to_i - 1] if single.to_i == 0
  return @@tweens[single.to_i - 1] if ten.to_i == 1
  @@ones[single.to_i - 1] + "en" + @@tens[ten.to_i - 1]
end


def compose_single(single)
  return "" if single.to_i == 0
  @@ones[single.to_i - 1]
end


def create_number
  integers = (100 .. 999).to_a
  (integers.sort_by { rand }).first
end


def process_question(number)
  print number + " = "
  answer = gets
  if /\S/ !~ answer
    return process_question(number)
  end
  return answer
end


def display_question
  number = create_number
  answer = process_question(written_number(number))
  if answer.chomp == 's' || answer.chomp == 'S'
    puts "Goed: #{@@right}; fout: #{@@counter - @@right}. Totaal aantal vragen: #{@@counter}"
    return
  end
  if answer.to_i == number
    @@right += 1
    puts "Goed!"
  else
    puts "Nee, #{written_number(number)} is: #{number}"
  end  
  @@counter += 1
  #sleep 1 # wait 1 second
  gets
  display_question  
end


def start
  puts "Schrijf het getal in cijfers\n (of type S om te Stoppen) \n"
  display_question
end

start
