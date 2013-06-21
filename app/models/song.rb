class Song
	attr_reader :title, :artist, :audio_sample, :img
	def initialize(data)
		@title = data[:title]
		@artist = data[:artist]
		@audio_sample = data[:audio_sample]
		@img = data[:img]
	end
end