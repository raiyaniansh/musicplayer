import 'package:flutter/material.dart';
import 'package:musicplayer/homescreen/view/home_screen.dart';
import 'package:musicplayer/playerscreen/provider/player_provider.dart';
import 'package:musicplayer/playerscreen/view/player_screen.dart';
import 'package:musicplayer/playlist/provider/playlist_provider.dart';
import 'package:musicplayer/playlist/view/playlist_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlayerProvider(),),
        ChangeNotifierProvider(create: (context) => PlayListProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => HomeScreen(),
          'playerscreen':(context) => PlayerScreen(),
          'playlistscreen':(context) => PlayListScreen(),
        },
      ),
    ),
  );
}
