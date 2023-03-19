import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/screens/basecsreen/provider/baseprovider.dart';
import 'package:spotify_app/screens/basecsreen/view/basescreen.dart';
import 'package:spotify_app/screens/homescreen/provider/homeprovider.dart';
import 'package:spotify_app/screens/homescreen/view/homescreen.dart';
import 'package:spotify_app/screens/openscreen/view/opnescreen.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Baseprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Openscreen(),
          'home' : (context) => Homescreen(),
          'open' : (context) => Openscreen(),
        },
      ),
    ),
  );
}