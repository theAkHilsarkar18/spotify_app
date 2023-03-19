import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Openscreen extends StatefulWidget {
  const Openscreen({Key? key}) : super(key: key);

  @override
  State<Openscreen> createState() => _OpenscreenState();
}

class _OpenscreenState extends State<Openscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset("assets/singer/ar.jpeg",fit: BoxFit.cover),
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
                  SizedBox(width: 5,),
                  Icon(Icons.keyboard_arrow_down_outlined,color: Colors.grey.shade300,size: 30),
                  Spacer(),
                  Icon(Icons.share,color: Colors.grey.shade300,size: 25),
                  SizedBox(width: 10,),
                  Icon(Icons.more_vert,color: Colors.grey.shade300,size: 25),
                  SizedBox(width: 5,),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 210,
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
                              Text("The Hamma - AR Raheman",style: GoogleFonts.poppins(color: Colors.white60,letterSpacing: 1,fontSize: 14),),
                              Text("OK Jaanu",style: GoogleFonts.poppins(color: Colors.white60,letterSpacing: 1,fontSize: 9),),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.mic,color: Colors.white,size: 25),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite,color: Colors.green,size: 25),
                        ),

                      ],
                    ),
                    Slider(value: 0.5, onChanged: (value) {

                    },inactiveColor: Colors.grey,activeColor: Colors.green,),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.loop,color: Colors.white60,size: 30,),
                          Icon(Icons.skip_next,color: Colors.white,size: 40,),
                          Icon(Icons.play_circle,color: Colors.green,size: 60,),
                          Icon(Icons.skip_previous,color: Colors.white,size: 40,),
                          Icon(Icons.volume_mute_outlined,color: Colors.white60,size: 30,),

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
}
