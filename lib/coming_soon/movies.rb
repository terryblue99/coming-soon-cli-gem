class ComingSoon::Movie
	attr_accessor :name, :start_date, :url

	def self.movies
		puts <<-DOC.gsub /^\s*/, '' 
		1. Guardians of the Galaxy Vol 2 – May 5
		2. The Lovers - May 5
		DOC
	end

end