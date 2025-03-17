extends Node

@onready var musicPlayer: AudioStreamPlayer = get_node("BackMusic"); ## Backmusic node reference.

var musicNum: int = 0 ## Index for each song in the playlist.

## Playlist of musics
var musicDatabase: Array = [ 
]

## Dicionário de Sound Effects
var soundsDict : Dictionary = {
}


## Control and readability function for playing the current song.
func playMusic(index) -> void:
	musicPlayer.stream = musicDatabase[index]; # Selects the song from the playlist based on the index.
	musicPlayer.play();

## Plays incoming sounds and sets their volume.
func playSFX(song: String, decibels: float = -10.0) -> void:
	var soundToPlayer = soundsDict.get(song);
	
	# Adds a new sfx node to play the sent song.
	var sfxNode = AudioStreamPlayer.new();
	add_child(sfxNode);
	
	# Assign the song to the player and play it back.
	sfxNode.stream = soundToPlayer;
	sfxNode.volume_db = decibels  # Set the sfx volume.(Defalt = -10.0)
	sfxNode.play();
	
	# When sfx finishes, delete the node.
	await sfxNode.finished;
	sfxNode.queue_free();
