import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/screens/basecsreen/provider/baseprovider.dart';
import 'package:spotify_app/screens/basecsreen/view/basescreen.dart';
import 'package:spotify_app/screens/homescreen/provider/homeprovider.dart';
import 'package:spotify_app/screens/homescreen/view/homescreen.dart';

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
          '/' : (context) => Basescreen(),
          'home' : (context) => Homescreen(),
        },
      ),
    ),
  );
}