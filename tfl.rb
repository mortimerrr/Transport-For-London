require 'pry'

victoria = ["Kings Cross", "Euston", "Warren Street", "Oxford Circus", "Green Park", "Victoria", "Pimlico"]
bakerloo = ["Elephant & Castle", "Lambeth North", "Waterloo", "Embankment", "Charing Cross", "Picadilly Circus", "Oxford Circus", "Regent's Park", "Baker Street"]
central = ["Notting Hill Gate", "Queensway", "Lancaster Gate", "Marble Arch", "Bond Street", "Oxford Circus", "Tottenham Court Road", "Holborn", "Chancery Lane"]
prompt = ">>>  "

puts "WELCOME TO THE LONDON JOURNEY PLANNER"
puts "THE FOLLOWING 3 LINES ARE RUNNING TODAY: VICTORIA / BAKERLOO / CENTRAL"
puts "PLEASE CHOOSE YOUR STARTING LINE"
puts "PLEASE TYPE VICTORIA, BAKERLOO OR CENTRAL AND PRESS ENTER"
print prompt

# check if the user has put in the right string
# in case of a typo alert the user and ask him to choose starting line again

starting_line = gets.strip.chomp.downcase

while true 
	case starting_line
	  when "victoria"
	  	puts "YOUR STARTING LINE IS #{starting_line.upcase}"
	  when "bakerloo"
	  	puts "YOUR STARTING LINE IS #{starting_line.upcase}"
	  when "central"
		puts "YOUR STARTING LINE IS #{starting_line.upcase}"  	
	  else
		puts "I DIDN'T QUITE GET THAT, YOU MAY HAVE MISTYPED IT, PLEASE CHOOSE AGAIN\!"
		print prompt
		starting_line = gets.strip.chomp.downcase  
		redo	
	end
	break
end

tube_lines = {"victoria" => victoria, "bakerloo" => bakerloo, "central" => central}

puts "THE STATIONS ON THE #{starting_line.upcase} LINE ARE THE FOLLOWING: "
puts tube_lines[starting_line]
puts "PLEASE CHOOSE YOUR STARTING STATION\!"
print prompt
starting_station = gets.strip.chomp.downcase
puts "YOUR STARTING STATION IS #{starting_station.upcase}"


# CHOOSING ENDING LINE AND ENDING STATION
puts "PLEASE CHOOSE YOUR ENDING LINE"
puts "PLEASE TYPE VICTORIA, BAKERLOO OR CENTRAL AND PRESS ENTER"
print prompt
ending_line = gets.strip.chomp.downcase

while true 
	case ending_line
	  when "victoria"
	  	puts "YOUR ENDING LINE IS #{ending_line.upcase}"
	  when "bakerloo"
	  	puts "YOUR ENDING LINE IS #{ending_line.upcase}"
	  when "central"
		puts "YOUR ENDING LINE IS #{ending_line.upcase}"  	
	  else
		puts "I DIDN'T QUITE GET THAT, YOU MAY HAVE MISTYPED IT, PLEASE CHOOSE AGAIN\!"
		print prompt
		ending_line = gets.strip.chomp.downcase  
		redo	
	end
	break
end

puts "THE STATIONS ON THE #{ending_line.upcase} LINE ARE THE FOLLOWING: "
puts tube_lines[ending_line]
puts "PLEASE CHOOSE YOUR ENDING STATION\!"
print prompt
ending_station = gets.strip.chomp.downcase
puts "YOUR ENDING STATION IS #{ending_station.upcase}"


binding.pry

# [2] pry(main)> tube_lines[starting_line].index("victoria")
# => nil
# [3] pry(main)> tube_lines[starting_line].index("Victoria")
# => 5
# [4] pry(main)>