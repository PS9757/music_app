import '../../utils/music_player/modal/player/audio_track.dart';

class AudioPlayerLogic {
  // Create a playlist to hold audio tracks
  List<AudioTrack> playlist = [];

  // Constructor to initialize the playlist
  AudioPlayerLogic(String song, String artist, String url) {
    // Define and add audio tracks to the playlist
    AudioTrack song1 = AudioTrack(
      1,
      title: song,
      artist: artist,
      duration: Duration(seconds: 180), // Example duration
      // filePath: 'musics/music.mp3',
      networkUrl: url,
    );

    // AudioTrack song2 = AudioTrack(
    //   2,
    //   title: 'Song 2',
    //   artist: 'Artist 2',
    //   duration: Duration(seconds: 210), // Example duration
    //   filePath: 'path/to/song2.mp3',
    // );

    // Add the tracks to the playlist
    playlist.addAll([song1]);
  }

  // You can add methods to control playback, such as play, pause, skip, etc.
  void play(int trackIndex) {
    // Implement playback logic here
  }

  void pause() {
    // Implement pause logic here
  }

  void skipNext() {
    // Implement skip to the next track logic here
  }

// Add other methods for managing the audio player's state and behavior
}
