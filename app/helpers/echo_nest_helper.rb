def search_song(artist, title)
	begin
		open("http://developer.echonest.com/api/v4/song/search?api_key=YSL7BW6NQX2I6CVSZ&format=json&bucket=tracks&bucket=id:7digital-US&artist=#{URI.escape(artist)}&title=#{URI.escape(title)}&results=100&bucket=artist_familiarity&sort=artist_familiarity-desc").read
	rescue
		p "something went wrong"
	end
end

def search_song_by_title(title)
	open("http://developer.echonest.com/api/v4/song/search?api_key=YSL7BW6NQX2I6CVSZ&format=json&bucket=tracks&bucket=id:7digital-US&title=#{URI.escape(title)}&results=20&bucket=artist_familiarity&sort=artist_familiarity-desc").read
end

def get_song_choices_from_lyrics(lyrics)
	song_options = []
	lyrics = lyrics.split(' ').join('-')
	doc = Nokogiri::HTML(open("http://www.lyrster.com/songs-lyrics/#{lyrics}.html"))
	doc.css('div.search-result a').each do |link|
		if link.content.split(' - ',2).length > 1
			song_options << link.content.split(' - ',2).map! {|section| section.gsub(/lyrics/i, '').strip}
		end
	end
	song_options
end


# http://developer.echonest.com/api/v4/song/search?api_key=YSL7BW6NQX2I6CVSZ&format=json&results=1&artist=bob%20marley&title=one%20love&bucket=id:7digital-US&bucket=audio_summary&bucket=tracks