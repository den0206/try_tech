import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PintestMenu extends StatelessWidget {
  PintestMenu({Key? key}) : super(key: key);

  final List<PintestButton> buttons = [
    PintestButton(
      icon: Icons.pie_chart,
      onPressed: () {
        print("snapshot");
      },
    ),
    PintestButton(
      icon: Icons.search,
      onPressed: () {
        print("face");
      },
    ),
    PintestButton(
      icon: Icons.notifications,
      onPressed: () {
        print("cabin");
      },
    ),
    PintestButton(
      icon: Icons.supervised_user_circle,
      onPressed: () {
        print("vaccines");
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PintestMenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: 1,
        child: Container(
          width: 250,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                spreadRadius: -5,
              )
            ],
          ),
          child: PintestMenuArea(buttons: buttons),
        ),
      ),
    );
  }
}

class PintestMenuArea extends StatelessWidget {
  const PintestMenuArea({
    Key? key,
    required this.buttons,
  }) : super(key: key);

  final List<PintestButton> buttons;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        buttons.length,
        (index) {
          final currentIndex =
              Provider.of<PintestMenuModel>(context).currentIndex;
          final b = buttons[index];
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Provider.of<PintestMenuModel>(context, listen: false)
                  .currentIndex = index;
              b.onPressed();
            },
            child: Container(
              child: Icon(
                b.icon,
                size: index == currentIndex ? 30 : 25,
                color: index == currentIndex ? Colors.blue : Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}

class PintestButton {
  final Function() onPressed;
  final IconData icon;
  PintestButton({
    required this.onPressed,
    required this.icon,
  });
}

class PintestMenuModel with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => this._currentIndex;
  set currentIndex(int index) {
    this._currentIndex = index;
    notifyListeners();
  }
}
