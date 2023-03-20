import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/screens/basecsreen/provider/baseprovider.dart';
import 'package:spotify_app/screens/basecsreen/view/basescreen.dart';
import 'package:spotify_app/screens/homescreen/provider/homeprovider.dart';
import 'package:spotify_app/screens/homescreen/view/homescreen.dart';
import 'package:spotify_app/screens/musicscreen/provider/musicprovider.dart';
import 'package:spotify_app/screens/openscreen/view/opnescreen.dart';
import 'package:spotify_app/screens/playlistscreen/provider/playlistprovider.dart';
import 'package:spotify_app/screens/playlistscreen/view/playlistscreen.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Baseprovider(),),
        ChangeNotifierProvider(create: (context) => Homeprovider(),),
        ChangeNotifierProvider(create: (context) => Musicprovider(),),
        ChangeNotifierProvider(create: (context) => Playlistprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Basescreen(),
          'home' : (context) => Homescreen(),
          'open' : (context) => Openscreen(),
          'playlist' : (context) => Playlistscreen(),
        },
      ),
    ),
  );
}