import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/playerscreen/provider/player_provider.dart';
import 'package:musicplayer/playlist/provider/playlist_provider.dart';
import 'package:provider/provider.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  PlayerProvider? playerProvidert;
  PlayerProvider? playerProviderf;
  PlayListProvider? playListProvidert;
  PlayListProvider? playListProviderf;
  @override
  Widget build(BuildContext context) {
    playerProviderf = Provider.of<PlayerProvider>(context,listen: false);
    playerProvidert = Provider.of<PlayerProvider>(context,listen: true);
    playListProvidert = Provider.of<PlayListProvider>(context,listen: true);
    playListProviderf = Provider.of<PlayListProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                  (playerProvidert!.init==true)?"${playerProviderf!.songlist[playerProviderf!.i].img}":"${playListProviderf!.box[playListProviderf!.i]}",
                  fit: BoxFit.cover),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.60),
              ),
            ),
            Positioned(top: 20,left: 15,child: InkWell(onTap: () {
              Navigator.pop(context);
            },child: Icon(Icons.arrow_back,color: Colors.white,size: 30,))),
            Padding(
              padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(alignment: Alignment.topLeft,child: Padding(
                        padding: const EdgeInsets.only(left: 20,top: 20),
                        child: Text((playerProvidert!.init==true)?"${playerProviderf!.songlist[playerProviderf!.i].name}":"${playListProviderf!.song[playListProviderf!.i]}",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                      )),
                      PlayerBuilder.currentPosition(player: (playerProvidert!.init==true)?playerProviderf!.assetsAudioPlayer!:playListProviderf!.assetsAudioPlayer!, builder: (context, position) => Column(
                        children: [
                          Slider(
                            min: 0.0,
                            max: (playerProvidert!.init==true)?playerProvidert!.totalsduration.inSeconds.toDouble():playListProviderf!.totalsduration.inSeconds.toDouble(),
                            value: position.inSeconds.toDouble(),
                            onChanged: (value) {
                              (playerProvidert!.init==true)?playerProviderf!.assetsAudioPlayer!.seek(Duration(seconds: value.toInt())):playListProviderf!.assetsAudioPlayer!.seek(Duration(seconds: value.toInt()));
                            },
                            activeColor: Colors.white,
                            inactiveColor: Colors.white54,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25,right: 25),
                            child: Row(
                              children: [
                                Text("${position}",style: TextStyle(color: Colors.white),),
                                Expanded(child: SizedBox()),
                                Text((playerProvidert!.init==true)?"${playerProvidert!.totalsduration}":"${playListProviderf!.totalsduration}",style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                        ],
                      ),),
                      (playerProvidert!.init==true)?Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(onTap: () {
                            playerProviderf!.previoussong();
                            playerProviderf!.stop();
                            playerProviderf!.initSong();
                          },child: Icon(Icons.skip_previous_outlined, size: 35, color: Colors.white)),
                          SizedBox(width: 20,),
                          InkWell(onTap: () {
                            playerProviderf!.playpause();
                          },child: playerProvidert!.playicon()),
                          SizedBox(width: 20,),
                          InkWell(onTap: () {
                            playerProviderf!.nextsong();
                            playerProviderf!.stop();
                            playerProviderf!.initSong();
                          },child: Icon(Icons.skip_next_outlined, size: 35, color: Colors.white)),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () {
                                playerProviderf!.setloop();
                              },
                              child: playerProvidert!.loopicon()),
                        ],
                      ):Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              playListProviderf!.previoussong();
                            },
                            child: Icon(Icons.skip_previous_outlined,
                                size: 35, color: Colors.white),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () {
                                playListProviderf!.playpause();
                              },
                              child: playListProvidert!.playicon()),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              playListProviderf!.nextsong();
                            },
                            child: Icon(Icons.skip_next_outlined,
                                size: 35, color: Colors.white),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () {
                                playListProviderf!.setloop();
                              },
                              child: playListProviderf!.loopicon()),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(onTap: () {
                              (playerProviderf!.init==true)?playerProvidert!.mute()
                              :playListProvidert!.mute();
                            },child: (playerProviderf!.init==true)?playerProvidert!.volumeIcon():playListProvidert!.volumeIcon()),
                            Container(
                              width: 255,
                              child: Slider(value: (playerProviderf!.init==true)?playerProvidert!.volu:playListProvidert!.volu,max: 1, onChanged: (value) {
                                (playerProviderf!.init==true)?playerProvidert!.volume(value):playListProvidert!.volume(value);
                              },
                                activeColor: Colors.white,
                                inactiveColor: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
