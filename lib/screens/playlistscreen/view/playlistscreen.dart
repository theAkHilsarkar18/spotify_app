import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/screens/playlistscreen/provider/playlistprovider.dart';

import '../../../utils/songlist/songlist.dart';

class Playlistscreen extends StatefulWidget {
  const Playlistscreen({Key? key}) : super(key: key);

  @override
  State<Playlistscreen> createState() => _PlaylistscreenState();
}

class _PlaylistscreenState extends State<Playlistscreen> {


  @override
  void initState() {
    Provider.of<Playlistprovider>(context,listen: false).intiLoveSong();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              width: double.infinity,
              child: Image.asset("assets/songplaylist/love/lovep.jpeg",fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.favorite,color: Colors.grey.shade700,size: 12),
                  SizedBox(width: 10,),
                  Text("35,896,126 Likes",style: GoogleFonts.poppins(fontSize: 10,letterSpacing: 1,color: Colors.grey.shade700)),
                  SizedBox(width: 20,),
                  Icon(Icons.timer,color: Colors.grey.shade700,size: 12),
                  SizedBox(width: 10,),
                  Text("2h 36min",style: GoogleFonts.poppins(fontSize: 10,letterSpacing: 1,color: Colors.grey.shade700)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Featuring",style: GoogleFonts.poppins(color: Colors.white70,letterSpacing: 1)),
            ),
            SizedBox(height: 5,),
            Expanded(child: Container(height : 250,child: ListView.builder(itemBuilder: (context, index) => InkWell(onTap: () {

            },child: playListBox(LoveSongImg[index],LoveSongName[index],LoveSongArtistName[index])),itemCount: 5,shrinkWrap: true,scrollDirection: Axis.vertical,physics: BouncingScrollPhysics()))),

          ],
        ),
      ),
    );
  }

  Widget playListBox(String imgPath,String sname, String aname)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white70,
            ),
            child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("${imgPath}",fit: BoxFit.cover,)),
          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${sname}",style: GoogleFonts.poppins(color: Colors.white70,letterSpacing: 1,fontSize: 11)),
              Text("${aname}",style: GoogleFonts.poppins(color: Colors.white60,letterSpacing: 1,fontSize: 8)),
            ],
          ),
          Spacer(),
          //Icon(Icons.play_circle,color: Colors.grey,),
          //SizedBox(width: 10,),
          Icon(Icons.favorite_border,color: Colors.grey.shade700,),
          SizedBox(width: 10,),
          Icon(Icons.more_vert,color: Colors.grey,),
        ],
      ),
    );
  }

}
