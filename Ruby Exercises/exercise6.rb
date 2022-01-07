def add_song_to_playlist(playlist, new_song)
  # playlist.push new_song
  playlist << new_song
end

puts add_song_to_playlist(["Hotel California", "Bohemian Rhapsody", "Stairway To Heaven"], "Despacito")
