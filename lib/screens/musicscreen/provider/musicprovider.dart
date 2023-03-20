import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/utils/songlist/songlist.dart';

class Musicprovider extends ChangeNotifier {
  AssetsAudioPlayer? assetsAudioPlayer;
  bool iconChange = false;
  bool onMute = true;
  Duration totalDuration = Duration(seconds: 0);

  void onIconChange() {
    iconChange = !iconChange;
    notifyListeners();
  }

  void initAudio(int clickIndex) {
    assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer!.open(
        Playlist(
          audios: initSongList,
          startIndex: clickIndex
        ),
        showNotification: true,
        autoStart: false);
    totalDurationAudio();
  }

  Future<void> startButton() async {
    await assetsAudioPlayer!.playOrPause();
  }

  void muteUnmute() {
    assetsAudioPlayer!.setVolume(onMute ? 0 : 1);
    onMute = !onMute;
    notifyListeners();
  }

  Future<void> stopAudio()
  async {
    await assetsAudioPlayer!.stop();
  }

  void totalDurationAudio() {
    assetsAudioPlayer!.current.listen((event) {
      totalDuration = event!.audio.duration;
      notifyListeners();
    });
  }

  Future<void> nextSong() async {
    await assetsAudioPlayer!.next();
  }

  Future<void> previousSong() async {
    await assetsAudioPlayer!.previous();
  }
}
