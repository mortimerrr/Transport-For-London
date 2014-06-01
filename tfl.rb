require 'pry'

victoria = ["Kings Cross", "Euston", "Warren Street", "Oxford Circus", "Green Park", "Victoria", "Pimlico"]
bakerloo = ["Elephant & Castle", "Lambeth North", "Waterloo", "Embankment", "Charing Cross", "Picadilly Circus", "Oxford Circus", "Regent's Park", "Baker Street"]
central = ["Notting Hill Gate", "Queensway", "Lancaster Gate", "Marble Arch", "Bond Street", "Oxford Circus", "Tottenham Court Road", "Holborn", "Chancery Lane"]
prompt = ">>>  "

puts ""
puts "WELCOME TO THE LONDON JOURNEY PLANNER"
puts "THE FOLLOWING 3 LINES ARE RUNNING TODAY: VICTORIA / BAKERLOO / CENTRAL"
puts "PLEASE CHOOSE YOUR STARTING LINE"
puts "PLEASE TYPE VICTORIA, BAKERLOO OR CENTRAL AND PRESS ENTER"
print prompt


# CHOOSING STARTING LINE AND STARTING STATION
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
		# in case of a typo alert the user and ask him to choose starting line again
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
puts "PLEASE TYPE THE NAME OF THE STATION EXACTLY AS IT IS LISTED"
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
puts "PLEASE TYPE THE NAME OF THE STATION EXACTLY AS IT IS LISTED"
print prompt
ending_station = gets.strip.chomp.downcase
puts "YOUR ENDING STATION IS #{ending_station.upcase}"

# DEFINING THE INDEXES OF THE STARTING AND ENDING STATIONS WITHIN THEIR OWN LINES
starting_station_capitalized = starting_station.split.map(&:capitalize).join(' ')
start_index = tube_lines[starting_line].index(starting_station_capitalized)

ending_station_capitalized = ending_station.split.map(&:capitalize).join(' ')
end_index = tube_lines[ending_line].index(ending_station_capitalized)

# IF STARTING LINE AND ENDING LINE ARE THE SAME PRINT OUT THE NUMBER OF STOPS AND STATION NAMES
# ELSE WE NEED TO CHANGE AT OXFORD CIRCUS...
if starting_line == ending_line
	distance = (end_index - start_index).abs
	puts "YOU HAVE #{distance} STOPS TO GO"
else
	puts "* * * NOTICE * * *: YOU NEED TO CHANGE LINES AT OXFORD CIRCUS STATION!"
	oxford_circus_index = tube_lines[starting_line].index("Oxford Circus")
	distance_to_oxford_circus = (start_index - oxford_circus_index).abs 
	puts "YOU NEED TO GO #{distance_to_oxford_circus} STOPS TO OXFORD CIRCUS"
	oxford_circus_index = tube_lines[ending_line].index("Oxford Circus")
	distance_from_oxford_circus = (end_index - oxford_circus_index).abs
	puts "AFTER CHANGING LINES YOU HAVE #{distance_from_oxford_circus} MORE STOPS TO GO"
end
