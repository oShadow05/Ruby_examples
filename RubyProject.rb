require 'HTTParty'	# Library for get and open an URL 
require 'Nokogiri'	# For transform HTML string in an Nokogiri object
require 'JSON'		# This not required explanation
require 'Pry'		# Pry are used to printing the HTML code
require 'csv'		# For convert all in a file '.csv' this not important, it's an example



page_url = HTTParty.get('The URL of website')

parse_page = Nokogiri::HTML(page)	#for Nokogiri object

Pry.start(binding)	# For stamp output


# Create an empty array that get the information

	inf_to_get = []
	
# And get content
	parse_page.css('.content').css('.row').css('hdrlnk').map do |a|
		post_page = a.text
		page_push(post_page)
	end
	
#For push array in file csv

	CSV.open('pets.csv', 'a') do |csv|		# The || has highter precedence than or
		csv << pets_array					# The <<  is a method defined like the rest of them
	
	end
	



