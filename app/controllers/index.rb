get '/' do
  erb :index
end

post '/find_song' do 
	song_choices = get_song_choices_from_lyrics(params[:lyrics])
	p song_choices
	@songs = []
	song_choices.each do |choice|
		results = JSON.parse(search_song(choice[0], choice[1]))
		p choice
		results['response']['songs'].each do |song|
			if song['tracks'].count > 0
				song = Song.new({
												:artist => song['artist_name'],
												:title => song['title'],
												:img => song['tracks'][0]['release_image'],
												:audio_sample => song['tracks'][0]['preview_url']
												})
				@songs << song
				p song
			end
		end
	end
	erb :_song_square, :layout => false
end	


