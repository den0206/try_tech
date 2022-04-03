import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notification Screen'),
        ),
        body: Container(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: FaIcon(FontAwesomeIcons.play),
          onPressed: () {},
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = Provider.of<_NotificationModel>(context).count;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          label: "sample",
          icon: FaIcon(FontAwesomeIcons.bone),
        ),
        BottomNavigationBarItem(
          label: "Notification",
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0,
                right: 0,
                child: BounceInDown(
                  from: 10,
                  child: Container(
                    width: 12,
                    height: 12,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.redAccent, shape: BoxShape.circle),
                    child: Text(
                      "$count",
                      style: TextStyle(color: Colors.white, fontSize: 7),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: "Dog",
          icon: FaIcon(FontAwesomeIcons.dog),
        ),
      ],
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  set count(int value) {
    this._count = value;
    notifyListeners();
  }
}
