require 'pry'
class ComingSoon::CLI

	def call
		list_movies
		menu_select
	end

	def list_movies
		puts 'Movies Coming Soon:'
		@movies = ComingSoon::Movie.movies
		@movies.each.with_index(1) do |movie, i|
			puts "#{i}. #{movie.name} - #{movie.start_date}"
		end
	end

	def menu_select
		input = ''
		while input != 'exit'
			puts 'You may enter a movie number for more details or list to see the menu again or exit'
			input = gets.strip

			if input.to_i > 0
				puts @movies[input.to_i-1]	
			elsif input == 'list'
				list_movies
			elsif input == 'exit'
				exit		
			else
				puts 'Invalid selection!'
				menu_select	
			end	
		end	
	end

end	







