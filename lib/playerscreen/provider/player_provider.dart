import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/homescreen/modal/home_modal.dart';

class PlayerProvider extends ChangeNotifier {

  AssetsAudioPlayer ? assetsAudioPlayer;
  double volu=1;
  int i = 0;
  bool play = false;
  bool init = false;
  bool volum = true;
  bool loop = false;
  Duration totalsduration = Duration(seconds: 0);
  List<Datam> songlist = [
    Datam(
        img: 'https://images.indianexpress.com/2016/06/befikra-tiger-disha-759.jpg',
        name: 'Befikra',
        song: 'assets/music/Befikra.mp3'),
    Datam(
        img: 'http://a10.gaanacdn.com/images/song/25/31644225/crop_480x480_1598605852.jpg',
        name: 'Tum se hi',
        song: 'assets/music/Tumsehi.mp3'),
    Datam(
        img: 'https://pagalnew.com/coverimages/malang-sajna-sachet-tandon-500-500.jpg',
        name: 'Malang sanjna',
        song: 'assets/music/Malang Sajna.mp3'),
    Datam(
        img: 'https://tse4.mm.bing.net/th?id=OIP.5GJacWqZk5tapWb78d1n2gHaHa&pid=Api&P=0',
        name: 'Apna Bana Le',
        song: 'assets/music/Apna Bana Le.mp3'),
    Datam(
        img: 'https://tse1.mm.bing.net/th?id=OIP.h1j97ImsuOrHAkGXBJBzzgHaHa&pid=Api&P=0',
        name: 'Nashe Si Chadh Gayi ',
        song: 'assets/music/Nashe Si Chadh Gayi .mp3'),
    Datam(
        img: 'http://djravish.com/wp-content/uploads/2022/12/MAAN-MERI-JAAN-DJ-RAVISH-DJ-CHICO-CLUB-REMIX-.jpg',
        name: 'Maan Meri Jaan',
        song: 'assets/music/Maan Meri Jaan.mp3'),
    Datam(
        img: 'https://www.allindiandjsclub.in/photo/1574589481448554.jpg',
        name: 'Tera Hone Laga',
        song: 'assets/music/Tera Hone Laga Hoon.mp3'),
    Datam(
        img: 'https://tse2.mm.bing.net/th?id=OIP.oS-FIeE6OTQjhRHJOpThqQHaGP&pid=Api&P=0',
        name: 'Waalian',
        song: 'assets/music/Waalian.mp3'),
    Datam(
        img: 'https://tse4.mm.bing.net/th?id=OIP.6K7bZili_QS78PFCrjsLZgHaHa&pid=Api&P=0',
        name: 'Jeene Laga Hoon',
        song: 'assets/music/Jeene Laga Hoon.mp3'),
    Datam(
        img: 'https://tse4.mm.bing.net/th?id=OIP.SBLgt4epQPdGcG53l8VdawHaHa&pid=Api&P=0',
        name: 'Akh Lad Jaave',
        song: 'assets/music/Akh Lad Jaave.mp3'),
    Datam(
        img: 'https://c.saavncdn.com/035/Kithe-Reh-Gaya-Punjabi-2019-20190131075008-500x500.jpg',
        name: 'Kithe Reh Gaya',
        song: 'assets/music/Kithe Reh Gaya.mp3'),
    Datam(
        img: 'https://tse3.mm.bing.net/th?id=OIP.11Scko5dICcFQj1MmczdLAHaHa&pid=Api&P=0',
        name: 'Tum Mile',
        song: 'assets/music/Tum Mile.mp3'),
  ];

  void initSong() {
    assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer!.open(Audio("${songlist[i].song}"),
      autoStart: true, showNotification: true,);
    init = true;
    play = false;
    totalDuration();
    notifyListeners();
  }
  void setloop()
  {
    loop=!loop;
    notifyListeners();
    if(loop==false)
    {
      assetsAudioPlayer!.setLoopMode(LoopMode.playlist);
    }
    else
      {
        assetsAudioPlayer!.setLoopMode(LoopMode.single);
      }
  }

  Future<void> volume(double vol)
  async {
    volu=vol;
    notifyListeners();
    await assetsAudioPlayer!.setVolume(vol);
    if(vol==0)
    {
      volum=false;
    }
    else
    {
      volum=true;
    }
  }

  void mute()
  {
    assetsAudioPlayer!.setVolume(volum?0:1);
    volum?volu=0:volu=1;
    volum=!volum;
    notifyListeners();
  }

  Widget volumeIcon() {
    return (volum == true)
        ? Icon(
      Icons.volume_up_outlined,
      color: Colors.white,
      size: 25,
    )
        : Icon(
      Icons.volume_off_outlined,
      size: 25,
      color: Colors.white,
    );
  }

  Widget loopicon() {
    return (loop == true)
        ? Icon(
      Icons.loop_sharp,
      color: Colors.white,
      size: 25,
    )
        : Icon(
      Icons.loop_sharp,
      size: 25,
      color: Colors.white54,
    );
  }


  void totalDuration() {
    assetsAudioPlayer!.current.listen((event) {
      totalsduration = event!.audio.duration;
      notifyListeners();
    });
  }

  void stop() {
    if (init == true) {
      assetsAudioPlayer!.pause();
    }
  }

  Future<void> playpause() async {
    await assetsAudioPlayer!.playOrPause();
    play = !play;
    notifyListeners();
  }

  Widget playicon() {
    return (play == true)
        ? Icon(
      Icons.play_arrow_outlined,
      color: Colors.white,
      size: 35,
    )
        : Icon(
      Icons.pause,
      size: 35,
      color: Colors.white,
    );
  }

  void nextsong() {
    if (i < songlist.length - 1) {
      loop=false;
      i++;
      notifyListeners();
    }
  }

  void previoussong() {
    if (i > 0) {
      loop=false;
      i--;
      notifyListeners();
    }
  }
}
