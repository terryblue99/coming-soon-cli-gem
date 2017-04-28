
class ComingSoon::Movie
	attr_accessor :name, :start_date, :url, :synopsis

	def self.movies

		doc = Nokogiri::HTML(open("http://www.fandango.com/moviescomingsoon"))
		# name: doc.css("li.visual-item a.visual-title").text.strip
		# start_date: doc.css("li.visual-item span").text
		# url: doc.css("li.visual-item a").attribute("href").value

		list = doc.css("li.visual-item")

		@movies = []
		@count = 1

		list.each do |movie|
			soon = self.new
			soon.name = movie.css("a.visual-title").text.strip
			soon.start_date = movie.css("span").text
			soon.url = movie.css("a").attribute("href").value
			doc_synop1 = Nokogiri::HTML(open(soon.url))
			if !doc_synop1.css("a.movie-synopsis-link").any?
				soon.synopsis = doc_synop1.css("span#SynopsisTextLabel").text
			else
				synop_url = soon.url.sub(/movieoverview/, 'plotsummary')
				doc_synop2 = Nokogiri::HTML(open(synop_url))
				soon.synopsis = doc_synop2.css("p.subpage-descriptive-content").text
			end
			@movies << soon
			@count+=1
			if @count > 32
				break
			end	
		end	
		@movies
	end

end