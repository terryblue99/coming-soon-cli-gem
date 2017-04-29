require 'pry'
class ComingSoon::CLI

	def call
		list_movies
		menu_select
	end

	def list_movies
		puts 'Movies Coming Soon (Please wait!):'
		@movies = ComingSoon::Movie.movies
		@movies.each.with_index(1) do |movie, i|
			puts "#{i}. #{movie.name} - #{movie.start_date}"
		end
	end

	def list_saved_movies
		puts 'Movies Coming Soon:'
		@movies.each.with_index(1) do |movie, i|
			puts "#{i}. #{movie.name} - #{movie.start_date}"
		end
	end

	def menu_select
		input = ''
		while input != 'exit'
			puts ''
			puts 'You may enter a movie number for more details or "list" to see the menu again or "exit"'
			input = gets.strip

			if input.to_i > 0 && input.to_i < @movies.size+1
				puts @movies[input.to_i - 1].synopsis	
			elsif input == 'list'
				list_saved_movies
			elsif input == 'exit'
				exit	
			else
				puts 'Invalid selection!'
				menu_select	
			end	
		end	
	end

end	
