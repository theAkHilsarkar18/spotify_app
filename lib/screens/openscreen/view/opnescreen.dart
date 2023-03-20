import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/screens/musicscreen/provider/musicprovider.dart';
import 'package:spotify_app/utils/image/singer/singerImg.dart';
import 'package:spotify_app/utils/songlist/songlist.dart';

class Openscreen extends StatefulWidget {
  const Openscreen({Key? key}) : super(key: key);

  @override
  State<Openscreen> createState() => _OpenscreenState();
}

class _OpenscreenState extends State<Openscreen> {


  int i = 0;
  // @override
  // void initState() {
  //   Provider.of<Musicprovider>(context, listen: false).initAudio(i);
  //   super.initState();
  //
  // }


  Musicprovider? musicproviderTrue;
  Musicprovider? musicproviderFalse;

  @override
  Widget build(BuildContext context) {
    musicproviderTrue = Provider.of<Musicprovider>(context, listen: true);
    musicproviderFalse = Provider.of<Musicprovider>(context, listen: false);
    i = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset("${singerImg[i]}", fit: BoxFit.cover),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black26,
            ),
            Container(
              height: 50,
              width: double.infinity,
              //color: Colors.black26,
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.keyboard_arrow_down_outlined,
                        color: Colors.grey.shade300, size: 30),
                  ),
                  Spacer(),
                  Icon(Icons.share, color: Colors.grey.shade300, size: 25),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.more_vert, color: Colors.grey.shade300, size: 25),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 250,
                width: double.infinity,
                color: Colors.black38,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${songName[i]} - ${singerFullName[i]}",
                                style: GoogleFonts.poppins(
                                    color: Colors.white60,
                                    letterSpacing: 1,
                                    fontSize: 14),
                              ),
                              Text(
                                "${albumName[i]}",
                                style: GoogleFonts.poppins(
                                    color: Colors.white60,
                                    letterSpacing: 1,
                                    fontSize: 9),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.all_inclusive,
                              color: Colors.white, size: 25),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite,
                              color: Colors.green, size: 25),
                        ),
                      ],
                    ),
                    PlayerBuilder.currentPosition(
                      player: musicproviderFalse!.assetsAudioPlayer!,
                      builder: (context, position) => Column(
                        children: [
                          Slider(
                            value: position.inSeconds.toDouble(),
                            max: musicproviderTrue!.totalDuration.inSeconds
                                .toDouble(),
                            onChanged: (value) {
                              musicproviderFalse!.assetsAudioPlayer!.seek(Duration(seconds: value.toInt()));
                            },
                            inactiveColor: Colors.grey,
                            activeColor: Colors.green,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 22,
                              ),
                              Text("${position.inSeconds}",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white60,
                                      letterSpacing: 1,
                                      fontSize: 12)),
                              Spacer(),
                              Text(
                                  "${musicproviderTrue!.totalDuration.inSeconds}",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white60,
                                      letterSpacing: 1,
                                      fontSize: 12)),
                              SizedBox(
                                width: 25,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.loop,
                                color: Colors.white60,
                                size: 30,
                              )),
                          InkWell(
                            onTap: () {
                              musicproviderFalse!.previousSong();
                            },
                            child: Icon(
                              Icons.skip_previous,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                musicproviderFalse!.startButton();
                                musicproviderFalse!.onIconChange();
                              },
                              child: musicproviderTrue!.iconChange
                                  ? Icon(
                                      Icons.pause_circle,
                                      color: Colors.green,
                                      size: 60,
                                    )
                                  : Icon(
                                      Icons.play_circle,
                                      color: Colors.green,
                                      size: 60,
                                    )),
                          InkWell(
                            onTap: () {
                              musicproviderFalse!.nextSong();
                            },
                            child: Icon(
                              Icons.skip_next,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                musicproviderFalse!.muteUnmute();
                              },
                              child: musicproviderTrue!.onMute
                                  ? Icon(
                                      Icons.volume_mute_outlined,
                                      color: Colors.white60,
                                      size: 30,
                                    )
                                  : Icon(
                                      Icons.volume_mute,
                                      color: Colors.white60,
                                      size: 30,
                                    )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    musicproviderFalse!.stopAudio();
  }
}
