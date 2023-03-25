import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/playerscreen/provider/player_provider.dart';
import 'package:musicplayer/playlist/provider/playlist_provider.dart';
import 'package:provider/provider.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PlayListProvider>(context,listen: false).change();
  }
  @override
  PlayerProvider? homeProviderf;
  PlayerProvider? homeProvidert;
  PlayListProvider? playListProviderf;
  PlayListProvider? playListProvidert;
  @override
  Widget build(BuildContext context) {
    playListProviderf = Provider.of<PlayListProvider>(context,listen: false);
    playListProvidert = Provider.of<PlayListProvider>(context,listen: true);

    homeProviderf = Provider.of<PlayerProvider>(context, listen: false);
    homeProvidert = Provider.of<PlayerProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
                height: 1,
                width: 1,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.blue, blurRadius: 300, spreadRadius: 150)
                ])),
            Positioned(
                top: 200,
                left: 200,
                child: Container(
                    height: 1,
                    width: 1,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.red.withOpacity(0.50),
                          blurRadius: 300,
                          spreadRadius: 150)
                    ]))),
            Positioned(
                top: 500,
                left: 200,
                child: Container(
                    height: 1,
                    width: 1,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withOpacity(0.50),
                          blurRadius: 300,
                          spreadRadius: 150)
                    ]))),
            Positioned(
                top: 400,
                left: 10,
                child: Container(
                    height: 1,
                    width: 1,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.teal.withOpacity(0.50),
                          blurRadius: 300,
                          spreadRadius: 150)
                    ]))),
            Positioned(
                top: 700,
                left: 200,
                child: Container(
                    height: 1,
                    width: 1,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.teal.withOpacity(0.50),
                          blurRadius: 300,
                          spreadRadius: 150)
                    ]))),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.60),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Center(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                    child: Image.network('${playListProviderf!.boximg}', fit: BoxFit.cover),
                  ),
                )),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 25),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Top Playlist",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                      IconButton(onPressed: () {
                        playListProviderf!.initSong();
                      }, icon: Icon(Icons.play_circle,color: Colors.white,size: 50,))
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: ListView.builder(physics: BouncingScrollPhysics(),itemCount: playListProviderf!.box.length,itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Provider.of<PlayerProvider>(context,listen: false).stop();
                      Provider.of<PlayerProvider>(context,listen: false).init=false;
                      playListProviderf!.stop();
                      Provider.of<PlayListProvider>(context, listen: false).i = index;
                      playListProviderf!.initSong();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, top: 20, right: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      "${playListProviderf!.box[index]}",
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover)
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${playListProviderf!.song[index]}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),),
                ),
                SizedBox(height: 65,)
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: (playListProvidert!.init == true)
                  ? InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'playerscreen');
                },
                child: Container(
                  height: 65,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.50),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                "${playListProviderf!.box[playListProviderf!.i]}",
                                fit: BoxFit.cover,
                              ))),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          "${playListProviderf!.song[playListProviderf!.i]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          playListProviderf!.previoussong();
                        },
                        child: Icon(Icons.skip_previous_outlined,
                            size: 35, color: Colors.white),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                          onTap: () {
                            playListProviderf!.playpause();
                          },
                          child: playListProvidert!.playicon()),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          playListProviderf!.nextsong();
                        },
                        child: Icon(Icons.skip_next_outlined,
                            size: 35, color: Colors.white),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ),
              )
                  : (homeProviderf!.init==true)?InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'playerscreen');
                },
                child: Container(
                  height: 65,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.50),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                "${homeProviderf!.songlist[homeProviderf!.i].img}",
                                fit: BoxFit.cover,
                              ))),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          "${homeProviderf!.songlist[homeProviderf!.i].name}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          homeProviderf!.previoussong();
                          homeProviderf!.stop();
                          homeProviderf!.initSong();
                        },
                        child: Icon(Icons.skip_previous_outlined,
                            size: 35, color: Colors.white),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      InkWell(
                          onTap: () {
                            homeProviderf!.playpause();
                          },
                          child: homeProvidert!.playicon()),
                      SizedBox(
                        width: 7,
                      ),
                      InkWell(
                        onTap: () {
                          homeProviderf!.nextsong();
                          homeProviderf!.stop();
                          homeProviderf!.initSong();
                        },
                        child: Icon(Icons.skip_next_outlined,
                            size: 35, color: Colors.white),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ),
              ):Container(),
            ),
          ],
        ),
      ),
    );
  }
}
