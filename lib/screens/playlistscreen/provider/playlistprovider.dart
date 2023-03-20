
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../../../utils/songlist/songlist.dart';


class Playlistprovider extends ChangeNotifier
{
  AssetsAudioPlayer? assetsAudioPlayer;

  void intiLoveSong()
  {
    assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer!.open(Playlist(audios: initLoveSongList,startIndex: 0),autoStart: true,showNotification: true);
  }

  Future<void> startButton() async {
    await assetsAudioPlayer!.playOrPause();
  }
}