import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_app/utils/image/playlist/playlist.dart';
import 'package:spotify_app/utils/image/singer/singerImg.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello AkhilSarkar !",style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,letterSpacing: 1),),
                      Text("Lets listen something cool Today",style: GoogleFonts.poppins(color: Colors.grey.shade700,fontSize: 11,letterSpacing: 1),),
                    ],
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      shape: BoxShape.circle
                    ),
                    child: Icon(Icons.notification_add_outlined,color: Colors.grey),
                  ),
                  SizedBox(width: 10,),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Your favourite artist",style: GoogleFonts.poppins(color: Colors.white)),
                    Icon(Icons.navigate_next,color: Colors.white,),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Container(height: 115,child: ListView.builder(itemBuilder: (context, index) => singerBox(singerImg[index],singerName[index]),itemCount: singerImg.length,shrinkWrap: true,scrollDirection: Axis.horizontal,)),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent played",style: GoogleFonts.poppins(color: Colors.white)),
                    Icon(Icons.navigate_next,color: Colors.white,),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Container(height: 160,child: ListView.builder(itemBuilder: (context, index) => songBox(playlistImg[index],playlistName[index]),itemCount: playlistImg.length,shrinkWrap: true,scrollDirection: Axis.horizontal,)),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Made for you",style: GoogleFonts.poppins(color: Colors.white)),
                    Icon(Icons.navigate_next,color: Colors.white,),
                  ],
                ),
              ),
              Container(height: 160,child: ListView.builder(itemBuilder: (context, index) => songBox(playlistImg[index],playlistName[index]),itemCount: playlistImg.length,shrinkWrap: true,scrollDirection: Axis.horizontal,)),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Made for you",style: GoogleFonts.poppins(color: Colors.white)),
                    Icon(Icons.navigate_next,color: Colors.white,),
                  ],
                ),
              ),
              Container(height: 160,child: ListView.builder(itemBuilder: (context, index) => songBox(playlistImg[index],playlistName[index]),itemCount: playlistImg.length,shrinkWrap: true,scrollDirection: Axis.horizontal,)),

            ],
          ),
        ),
      ),
    );
  }


  Widget singerBox(String singerImg,String singerName)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.asset("${singerImg}",fit: BoxFit.cover,)),
        ),
        Text("${singerName}",style: GoogleFonts.poppins(color: Colors.white,fontSize: 11,letterSpacing: 1)),
      ],
    );
  }

  Widget songBox(String playlistImg,String playlistName)
  {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 120,
          width: 110,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("${playlistImg}",fit: BoxFit.cover,)),
        ),
        Text("${playlistName}",style: GoogleFonts.poppins(color: Colors.white,fontSize: 11,letterSpacing: 1)),
      ],
    );
  }

}
