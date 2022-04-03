import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:try_tech/src/screen/animate_do/sample_launching_screen.dart';

class AnimateDoScreen extends StatelessWidget {
  const AnimateDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate_Do'),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter),
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return SampleLaunchingScreen();
                },
              ));
            },
          ),
          SlideInLeft(
            from: 100,
            child: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return AnimateDoScreen();
                  },
                ));
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: Icon(
                Icons.new_releases,
                color: Colors.blue,
                size: 40,
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text(
                "Title",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 800),
              child: Text(
                "Textt Description",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: BounceInLeft(
        child: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.play),
          onPressed: () {},
        ),
      ),
    );
  }
}
