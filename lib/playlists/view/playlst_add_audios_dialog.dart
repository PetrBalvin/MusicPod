import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

import '../../common/data/audio.dart';
import '../../common/view/audio_autocomplete.dart';
import '../../library/library_model.dart';
import '../../local_audio/local_audio_model.dart';

class PlaylistAddAudiosDialog extends StatelessWidget {
  const PlaylistAddAudiosDialog({
    super.key,
    required this.playlistId,
  });

  final String playlistId;

  @override
  Widget build(BuildContext context) {
    final audios = di<LocalAudioModel>().audios?.toList() ?? <Audio>[];
    final libraryModel = di<LibraryModel>();
    return SimpleDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(kYaruPagePadding),
          child: SizedBox(
            // height: 50,
            width: 300,
            child: AudioAutoComplete(
              audios: audios,
              onSelected: (value) {
                if (value == null) return;
                libraryModel.addAudioToPlaylist(playlistId, value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
