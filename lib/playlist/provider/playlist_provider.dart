import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class PlayListProvider extends ChangeNotifier {
  double volu=1;
  String img1 = 'https://i.ytimg.com/vi/HyrhF4A1d4I/maxresdefault.jpg';
  String img2 = 'https://www.thestatesman.com/wp-content/uploads/2017/08/1477307138-1477303314-honey-singh-the-punjabi-rapper6.jpg';
  String img3 = 'https://tse1.mm.bing.net/th?id=OIP.QD6cmZ6Squ2QdCvwEtQdmwHaEK&pid=Api&P=0';
  String? boximg;

  List song=[];
  List box=[];

  List song1=['Players','Bad Boy x Bad Girl','DJ Wale Babu','Kar Gayi Chull','Mercy','She Move It Like','Buzz feat Badshah'];
  List box1=['https://tse2.mm.bing.net/th?id=OIP.-f4aXf6_dC8R_35kv3Q6TgHaHa&pid=Api&P=0','https://tse4.mm.bing.net/th?id=OIP.DX00zb8ysbgUp499F7ypjAHaHa&pid=Api&P=0','https://images.genius.com/f4d0a686da024f2919d03ecf55f8daf9.1000x1000x1.jpg','https://images.genius.com/f9452df785e79ef0e4937185e2bb68b6.600x600x1.jpg','https://tse3.mm.bing.net/th?id=OIP.USXpJ71nEGtgmSUuo9f8jwHaHa&pid=Api&P=0','https://tse4.mm.bing.net/th?id=OIP.FHMz2t3Pgys2puXSgtclYgHaHG&pid=Api&P=0','https://tse3.mm.bing.net/th?id=OIP.oEiiKNbEgB6Nw7AZfFrr7AHaHa&pid=Api&P=0'];

  List song2=['Blue Eyes','Birthday Bash','Breakup Party','One Bottle Down','Manali Trance','Urvashi'];
  List box2=['https://tse4.mm.bing.net/th?id=OIP.6v1LhK9SlEc6wSwaK4tjQwHaJQ&pid=Api&P=0','https://tse3.mm.bing.net/th?id=OIP.GhtJ_DOnuxmShuKAG7G27QHaHa&pid=Api&P=0','https://tse2.mm.bing.net/th?id=OIP.OS9gp6xww5WWV9yEMQKBeQHaHa&pid=Api&P=0','https://tse4.mm.bing.net/th?id=OIP.WallrNSgfgX5LgUfTQ2VuAHaHa&pid=Api&P=0','https://tse1.mm.bing.net/th?id=OIP.Z3pz9txvOVIGJBxaVXQkwgHaHa&pid=Api&P=0','https://tse4.mm.bing.net/th?id=OIP.x63zZaPHrbr4BL52DQhnDAHaHa&pid=Api&P=0'];

  List song3=['mile ho tum','La La La','12 Ladke','O Sajna','Manali Trance','DIL KO KARRAR','Maahi VeMaahi Ve'];
  List box3=['https://tse2.mm.bing.net/th?id=OIP.ZugJvM28ozQoFmPG6adRMwAAAA&pid=Api&P=0','https://tse3.explicit.bing.net/th?id=OIP.O9Djz8SxFN1iIQ6YOs6BaQAAAA&pid=Api&P=0','https://tse1.mm.bing.net/th?id=OIP.qjZ14m1RYuVB0LvHmtSgnAHaHa&pid=Api&P=0','https://tse2.mm.bing.net/th?id=OIP.-8Wm2cBt_jp_cpEd1AEjEwAAAA&pid=Api&P=0','https://tse1.mm.bing.net/th?id=OIP.Z3pz9txvOVIGJBxaVXQkwgHaHa&pid=Api&P=0','https://tse3.mm.bing.net/th?id=OIP.qwWErG6IOgZM0rlUV_EPAwHaHa&pid=Api&P=0','https://hindikaraokeshop.com/images/source/Unplugged_Maahi_Ve.png'];

  Duration totalsduration = Duration(seconds: 0);
  List<Audio> imgs1 = [
    Audio('assets/music/Players.mp3'),
    Audio('assets/music/Bad Boy x Bad Girl.mp3'),
    Audio('assets/music/DJ Wale Babu.mp3'),
    Audio('assets/music/Kar Gayi Chull.mp3'),
    Audio('assets/music/Mercy .mp3'),
    Audio('assets/music/She Move It Like .mp3'),
    Audio('assets/music/Buzz feat Badshah .mp3'),
  ];
  List<Audio> imgs2 = [
    Audio('assets/music/Blue Eyes.mp3'),
    Audio('assets/music/Birthday Bash.mp3'),
    Audio('assets/music/Breakup Party.mp3'),
    Audio('assets/music/One Bottle Down.mp3'),
    Audio('assets/music/Manali Trance.mp3'),
    Audio('assets/music/Urvashi.mp3'),
  ];
  List<Audio> imgs3 = [
    Audio('assets/music/Mile Ho Tum.mp3'),
    Audio('assets/music/La La La.mp3'),
    Audio('assets/music/12 Ladke.mp3'),
    Audio('assets/music/O Sajna.mp3'),
    Audio('assets/music/Manali Trance.mp3'),
    Audio('assets/music/DIL KO KARRAR AAYA Reprise.mp3'),
    Audio('assets/music/Maahi Ve.mp3'),
  ];

  AssetsAudioPlayer? assetsAudioPlayer;
  bool init = false;
  bool loop = false;
  bool play = false;
  bool volum = true;
  int i=0;

  void change()
  {
    if (boximg == img1) {
      box=box1;
      song=song1;
    }
    if (boximg == img2) {
      box=box2;
      song=song2;
    }
    if (boximg == img3) {
      box=box3;
      song=song3;
    }
  }

  void initSong() {
    init = true;
    assetsAudioPlayer = AssetsAudioPlayer();
    notifyListeners();
    if (boximg == img1) {
      assetsAudioPlayer!.open(Playlist(audios: imgs1,startIndex: i),autoStart: true,showNotification: true);
      totalDuration();
    }
    if (boximg == img2) {
      assetsAudioPlayer!.open(Playlist(audios: imgs2,startIndex: i),autoStart: true,showNotification: true);
      totalDuration();
    }
    if (boximg == img3) {
      assetsAudioPlayer!.open(Playlist(audios: imgs3,startIndex: i),autoStart: true,showNotification:  true);
      totalDuration();
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

  void totalDuration() {
    assetsAudioPlayer!.current.listen((event) {
      totalsduration = event!.audio.duration;
      notifyListeners();
    });
  }

  void chimg(String img) {
    boximg = img;
    notifyListeners();
  }

  void stop() {
    if (init == true) {
      assetsAudioPlayer!.pause();
    }
  }

  void playpause() {
    assetsAudioPlayer!.playOrPause();
    play = !play;
    notifyListeners();
  }

  void previoussong() {
    if (i > 0) {
      i--;
      assetsAudioPlayer!.previous();
      notifyListeners();
    }
  }

  void nextsong() {
    if (i < song1.length - 1) {
      i++;
      assetsAudioPlayer!.next();
      notifyListeners();
    }
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
}
