
class ComingSoon::Movie
	attr_accessor :name, :start_date, :url

	def self.movies

		doc = Nokogiri::HTML(open("http://www.fandango.com/moviescomingsoon"))
		# name: doc.css("li.visual-item a.visual-title").text.strip
		# start_date: doc.css("li.visual-item span").text
		# url: doc.css("li.visual-item a").attribute("href").value

		list = doc.css("li.visual-item")

		@movies = []

		list.each do |movie|
			soon = self.new
			soon.name = movie.css("a.visual-title").text.strip
			soon.start_date = movie.css("span").text
			soon.url = movie.css("a").attribute("href").value
			@movies << soon
		end	
		@movies
	end

end