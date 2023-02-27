import 'package:music/data/audio.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

class PlaylistModel extends SafeChangeNotifier {
  final Set<Audio> _likedAudios = {};
  Set<Audio> get likedAudios => _likedAudios;
  void addLikedAudio(Audio audio) => _likedAudios.add(audio);
  void removeLikedAudio(Audio audio) => _likedAudios.remove(audio);

  final Set<Audio> _starredStations = {};
  Set<Audio> get starredStations => _starredStations;
  void addStarredStation(Audio station) => _starredStations.add(station);

  final Map<String, Set<Audio>> _playlists = {};
  Map<String, Set<Audio>> get playlists => _playlists;
  List<Audio> getPlaylistAt(int index) =>
      _playlists.entries.elementAt(index).value.toList();
  void addPlaylist(String name, List<Audio> audios) =>
      _playlists.putIfAbsent(name, () => Set.from(audios));

  void addAudioToPlaylist(String playlist, Audio audio) {
    final p = _playlists[playlist];
    if (p != null) {
      p.add(audio);
    }
  }

  void removeAudioFromPlaylist(String playlist, Audio audio) {
    final p = _playlists[playlist];
    if (p != null && p.contains(audio)) {
      p.remove(audio);
    }
  }

  Future<void> init() async {
    _playlists.putIfAbsent('likedAudio', () => _likedAudios);
  }
}