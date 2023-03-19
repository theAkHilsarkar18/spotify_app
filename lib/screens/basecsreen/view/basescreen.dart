import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/screens/basecsreen/provider/baseprovider.dart';
import 'package:spotify_app/screens/homescreen/provider/homeprovider.dart';
import 'package:spotify_app/screens/homescreen/view/homescreen.dart';

class Basescreen extends StatefulWidget {
  const Basescreen({Key? key}) : super(key: key);

  @override
  State<Basescreen> createState() => _BasescreenState();
}

class _BasescreenState extends State<Basescreen> {

  Baseprovider? baseproviderTrue;
  Baseprovider? baseproviderFalse;

  @override
  Widget build(BuildContext context) {

    baseproviderTrue = Provider.of<Baseprovider>(context,listen: true);
    baseproviderFalse = Provider.of<Baseprovider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Homescreen(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: baseproviderTrue!.navigationIndex,
          onTap: (value) {
            baseproviderFalse!.onNavigationTap(value);
            print("${baseproviderTrue!.navigationIndex}");
          },
          items: [
            BottomNavigationBarItem(icon: IconButton(onPressed: () {},icon: Icon(Icons.home_outlined),),label: "Home",backgroundColor: Colors.black),
            BottomNavigationBarItem(icon: IconButton(onPressed: () {},icon: Icon(Icons.search),),label: "Search",backgroundColor: Colors.black),
            BottomNavigationBarItem(icon: IconButton(onPressed: () {},icon: Icon(Icons.library_music_outlined),),label: "Library",backgroundColor: Colors.black),
            BottomNavigationBarItem(icon: IconButton(onPressed: () {},icon: Icon(Icons.person_outline),),label: "Profile",backgroundColor: Colors.black),
          ],
        ),
      ),
    );
  }
}
