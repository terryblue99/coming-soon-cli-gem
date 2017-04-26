# CLI Controller
class ComingSoon::CLI

	def call
		list_movies
		menu_select
	end

	def list_movies
		puts 'Movies Coming Soon:'
		puts <<-DOC.gsub /^\s*/, '' 
		1. Guardians of the Galaxy Vol 2 – May 5
		2. The Lovers - May 5
		DOC
	end

	def menu_select
		puts 'You may enter a movie number for more details or exit'
		input = ''
		while input != 'exit'
			input = gets.strip
			case input
			when '1'
					puts 'More info on movie 1...'
			when '2'
					puts 'More info on movie 2...'
			when 'exit'
				exit		
			else
				puts 'Invalid selection!'
				menu_select	
			end	
		end	
	end

end	