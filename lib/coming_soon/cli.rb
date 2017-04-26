# CLI Controller
class ComingSoon::CLI

	def call
		puts 'Movies Coming Soon:'
		list_movies
		menu_select
	end

	def list_movies
		puts <<-DOC.gsub /^\s*/, '' 
		1. Guardians of the Galaxy Vol 2 – May 5
		2. The Lovers - May 5
		DOC
	end

end	