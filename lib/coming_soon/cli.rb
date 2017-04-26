# CLI Controller
class ComingSoon::CLI

	def call
		list_movies
		menu_select
	end

	def list_movies
		puts 'Movies Coming Soon:'
		@movies = ComingSoon::Movie.movies
	end

	def menu_select
		puts 'You may enter a movie number for more details or list to see the menu again or exit'
		input = ''
		while input != 'exit'
			input = gets.strip
			case input
			when '1'
				puts 'More info on movie 1...'
			when '2'
				puts 'More info on movie 2...'
			when 'list'
				list_movies
			when 'exit'
				exit		
			else
				puts 'Invalid selection!'
				menu_select	
			end	
		end	
	end

end	