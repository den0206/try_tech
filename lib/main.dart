import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_tech/src/screen/music_player/music_player_screen.dart';
import 'package:try_tech/src/screen/music_player/theme.dart';
import 'package:try_tech/src/screen/shoes_layout/shoes_layout_screen.dart';

import 'package:try_tech/src/screen/theme_changer/theme_changer_screen.dart';
import 'package:try_tech/src/theme/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeChanger(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: currentTheme,
      theme: miTema,
      home: OrientationBuilder(
        builder: (context, orientation) {
          return MusicPlayerScreen();
        },
      ),
    );
  }
}
