def create_acronyms(words)
  if words.empty?
    nil
  end

  word = words.split
  acronym = ""

  word.each { |char| acronym += char[0].upcase }

  acronym
end

puts "Назви:"
cpu = "central processing unit"
puts cpu
gpu = "graphics processing unit"
puts gpu

puts "\nАбревіатури:"
puts create_acronyms(cpu)
puts create_acronyms(gpu)