
class ComingSoon::Movie
	attr_accessor :name, :start_date, :url

	def self.movies

		movie_1 = self.new
		movie_1.name = 'Guardians of the Galaxy Vol 2'
		movie_1.start_date = 'May 5'
		movie_1.url = 'http://www.imdb.com/title/tt3896198/?ref_=cs_ov_i'

		movie_2 = self.new
		movie_2.name = 'The Lovers'
		movie_2.start_date = 'May 5'
		movie_2.url = 'http://www.imdb.com/title/tt5770620/?ref_=cs_ov_i'

		[movie_1, movie_2]

	end

end