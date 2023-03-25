import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/playerscreen/provider/player_provider.dart';
import 'package:musicplayer/playlist/provider/playlist_provider.dart';
import 'package:musicplayer/utils/widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PlayerProvider? homeProviderf;
  PlayerProvider? homeProvidert;

  PlayListProvider? playListProviderf;
  PlayListProvider? playListProvidert;

  @override
  Widget build(BuildContext context) {
    homeProviderf = Provider.of<PlayerProvider>(context, listen: false);
    homeProvidert = Provider.of<PlayerProvider>(context, listen: true);
    playListProviderf = Provider.of<PlayListProvider>(context,listen: false);
    playListProvidert = Provider.of<PlayListProvider>(context,listen: true);
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
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Top chart songs",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 5,),
                      Text("Top singers of 2023",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,bottom: 20),
                  child: Container(
                    height: 200,
                    child: CarouselSlider(
                      items: [
                        InkWell(onTap: () {
                          playListProviderf!.chimg(playListProviderf!.img1);
                          Navigator.pushNamed(context, 'playlistscreen');
                        },child: Box('${playListProviderf!.img1}')),
                        InkWell(onTap: () {
                          playListProviderf!.chimg(playListProviderf!.img2);
                          Navigator.pushNamed(context, 'playlistscreen');
                        },child: Box('${playListProviderf!.img2}')),
                        InkWell(onTap: () {
                          playListProviderf!.chimg(playListProviderf!.img3);
                          Navigator.pushNamed(context, 'playlistscreen',);
                        },child: Box('${playListProviderf!.img3}')),
                      ], options: CarouselOptions(
                      aspectRatio: 1.7,
                      autoPlayAnimationDuration: Duration(seconds: 5),
                      enlargeCenterPage: true,
                      autoPlay: true
                    ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 20),
                        physics: BouncingScrollPhysics(),
                        itemCount: homeProviderf!.songlist.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            homeProviderf!.stop();
                            Provider.of<PlayListProvider>(context,listen: false).stop();
                            Provider.of<PlayListProvider>(context,listen: false).init=false;
                            Provider.of<PlayerProvider>(context, listen: false).i = index;
                            homeProviderf!.initSong();
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
                                            "${homeProviderf!.songlist[index].img}",
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.cover)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${homeProviderf!.songlist[index].name}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Container(
                                        width: 30,
                                        height: 30,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Icon(
                                          CupertinoIcons.play_arrow,
                                          color: Colors.white,
                                          size: 20,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 65,)
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: (homeProviderf!.init == true)
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
                    )
                  : (playListProviderf!.init == true)?InkWell(
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
                          "${playListProviderf!.song1[playListProviderf!.i]}",
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
              ):Container(),
            ),
          ],
        ),
      ),
    );
  }
}
