import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:try_tech/src/screen/music_player/audio_model.dart';
import 'package:try_tech/src/screen/music_player/helpers.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AudioModel(),
        )
      ],
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.center,
                  colors: [
                    Color(0xff33333E),
                    Color(0xff201E28),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                ),
              ),
              child: Column(
                children: [
                  CustomAppBar(),
                  DiscImage(),
                  PlayArea(),
                ],
              ),
            ),
            Lyrics(),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(children: [
          Icon(FontAwesomeIcons.chevronLeft),
          Spacer(),
          Icon(FontAwesomeIcons.comment),
          SizedBox(width: 20),
          Icon(FontAwesomeIcons.headphones),
          SizedBox(width: 20),
          Icon(FontAwesomeIcons.expeditedssl),
        ]),
      ),
    );
  }
}

class DiscImage extends StatelessWidget {
  const DiscImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioModel = Provider.of<AudioModel>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            width: 250,
            height: 250,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [
                  Color(0xff484750),
                  Color(0xff1E1C24),
                ],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SpinPerfect(
                    duration: Duration(seconds: 10),
                    infinite: true,
                    manualTrigger: true,
                    controller: (animationController) =>
                        audioModel.controller = animationController,
                    child: Image(
                      image: AssetImage("assets/music/aurora.jpg"),
                    ),
                  ),
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          Container(
            child: Column(
              children: [
                Text(
                  "${audioModel.trackTotalDuration}",
                  style: TextStyle(color: Colors.white.withOpacity(0.4)),
                ),
                Stack(
                  children: [
                    Container(
                      width: 3,
                      height: 270,
                      color: Colors.white.withOpacity(0.1),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 3,
                        height: 230 * audioModel.percentage,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                Text(
                  "${audioModel.currentTotalDuration}",
                  style: TextStyle(color: Colors.white.withOpacity(0.4)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PlayArea extends StatefulWidget {
  const PlayArea({Key? key}) : super(key: key);

  @override
  State<PlayArea> createState() => _PlayAreaState();
}

class _PlayAreaState extends State<PlayArea>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool firstTime = true;
  late AnimationController playAnimation;
  final assetAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();

    playAnimation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    playAnimation.dispose();
    super.dispose();
  }

  void opentrack() {
    final audioModel = Provider.of<AudioModel>(context, listen: false);
    assetAudioPlayer.open(Audio("assets/music/Breaking-Benjamin-Far-Away.mp3"));

    assetAudioPlayer.currentPosition.listen((duration) {
      audioModel.current = duration;
    });

    assetAudioPlayer.current.listen((track) {
      if (track == null) return;
      audioModel.trackDuration = track.audio.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      margin: EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "Track title",
                style: TextStyle(
                    fontSize: 30, color: Colors.white.withOpacity(0.8)),
              ),
              Text(
                "Artist name",
                style: TextStyle(
                    fontSize: 15, color: Colors.white.withOpacity(0.8)),
              ),
            ],
          ),
          Spacer(),
          FloatingActionButton(
            backgroundColor: Colors.yellow,
            highlightElevation: 0,
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: playAnimation,
            ),
            onPressed: () {
              final audioModel =
                  Provider.of<AudioModel>(context, listen: false);
              if (this.isPlaying) {
                playAnimation.reverse();
                this.isPlaying = false;
                audioModel.controller.stop();
              } else {
                playAnimation.forward();
                this.isPlaying = true;
                audioModel.controller.repeat();
              }

              if (firstTime) {
                this.opentrack();
                firstTime = false;
              } else {
                assetAudioPlayer.playOrPause();
              }
            },
          )
        ],
      ),
    );
  }
}

class Lyrics extends StatelessWidget {
  const Lyrics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();
    return Expanded(
      child: Container(
        child: ListWheelScrollView(
          itemExtent: 42,
          diameterRatio: 1.5,
          physics: BouncingScrollPhysics(),
          children: lyrics
              .map(
                (line) => Text(
                  line,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
