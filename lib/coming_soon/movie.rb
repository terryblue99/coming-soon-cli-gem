class ComingSoon::Movie
	attr_accessor :name, :start_date, :url, :synopsis

	def self.movies

		self.scrape_movies			
		@movies

	end

	def self.scrape_movies

		doc = Nokogiri::HTML(open("http://www.fandango.com/moviescomingsoon"))
		# name: doc.css("li.visual-item a.visual-title").text.strip
		# start_date: doc.css("li.visual-item span").text
		# url: doc.css("li.visual-item a").attribute("href").value

		list = doc.css("li.visual-item")
		@movies = []
		@count = 1

		list.each do |movie|
			@soon = self.new
			@soon.name = movie.css("a.visual-title").text.strip
			@soon.start_date = movie.css("span").text
			@soon.url = movie.css("a").attribute("href").value
			@soon_https_url = movie.css("a").attribute("href").value.sub(/http:/, 'https:')
			self.scrape_synopses
			@movies << @soon
			@count+=1
			if @count > 20
				break
			end
		end
		
	end

	def self.scrape_synopses

		begin
			doc_synop1 = Nokogiri::HTML(open(@soon_https_url))
		rescue
			@soon_https_url = @soon_https_url.sub(/movieoverview/, 'plotsummary').sub(/http:/, 'https:')
			doc_synop1 = Nokogiri::HTML(open(@soon_https_url))
			redirect_failed = true # An HTTP to HTTPS redirect failed
		end
		if !doc_synop1.css("a.movie-synopsis-link").any? && !redirect_failed
			@soon.synopsis = doc_synop1.css("span#SynopsisTextLabel").text
		else
			synop_url = @soon_https_url.sub(/movieoverview/, 'plotsummary').sub(/http:/, 'https:')
			doc_synop2 = Nokogiri::HTML(open(synop_url))
			@soon.synopsis = doc_synop2.css("p.subpage-descriptive-content").text
		end

	end

end
