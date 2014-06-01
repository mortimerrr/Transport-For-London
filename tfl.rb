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
	if end_index >= start_index
		starting_line_stations = tube_lines[starting_line][start_index..end_index].join(", ")
	else
		x = ((tube_lines[starting_line].length) - 1) - start_index
		binding.pry
		x.times do
			tube_lines[starting_line].pop
		end
		binding.pry
		station_stack = []
		a = (start_index + 1) - end_index
		a.times do
			station_stack.push (tube_lines[starting_line].pop)
		end
		starting_line_stations = station_stack.join(", ")
		binding.pry	
	end
	distance = (end_index - start_index).abs
	puts "YOU HAVE #{distance} STOPS TO GO"
	puts "YOUR STOPS ARE THE FOLLOWING: #{starting_line_stations}"
	binding.pry
else
	puts "* * * NOTICE * * *: YOU NEED TO CHANGE LINES AT OXFORD CIRCUS STATION!"
	oxford_circus_index_start = tube_lines[starting_line].index("Oxford Circus")
	distance_to_oxford_circus = (start_index - oxford_circus_index_start).abs 
	puts "YOU NEED TO GO #{distance_to_oxford_circus} STOPS TO OXFORD CIRCUS"
	oxford_circus_index_end = tube_lines[ending_line].index("Oxford Circus")
	distance_from_oxford_circus = (end_index - oxford_circus_index_end).abs
	puts "AFTER CHANGING LINES YOU HAVE #{distance_from_oxford_circus} MORE STOPS TO GO"
	if start_index <= oxford_circus_index_start
		starting_line_stations = tube_lines[starting_line][start_index..(oxford_circus_index_start - 1)].join(", ")
	else
		station_stack = []
		x = start_index - oxford_circus_index_start
		x.times do
			station_stack.push (tube_lines[starting_line].pop)
		end
		starting_line_stations = station_stack.join(", ")
		binding.pry
	end

	if end_index >= oxford_circus_index_end
		ending_line_stations = tube_lines[ending_line][oxford_circus_index_end..end_index].join(", ")
		binding.pry
	else
		station_stack = []
		y = (oxford_circus_index_end + 1) - end_index
		y.times do
			station_stack.push (tube_lines[ending_line].pop)
		end
		ending_line_stations = station_stack.join(", ")
	end

	puts "YOUR STOPS ARE THE FOLLOWING: #{starting_line_stations} , #{ending_line_stations}"
	binding.pry
end
