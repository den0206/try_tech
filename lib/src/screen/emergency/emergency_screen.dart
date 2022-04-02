import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  EmergencyScreen({Key? key}) : super(key: key);

  final items = <ItemBoton>[
    new ItemBoton(
        Icons.cabin, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(
        Icons.abc, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6)),
    new ItemBoton(
        Icons.abc, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(Icons.abc, 'Awards', Color(0xff317183), Color(0xff46997D)),
    new ItemBoton(
        Icons.abc, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(
        Icons.abc, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6)),
    new ItemBoton(
        Icons.abc, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(Icons.abc, 'Awards', Color(0xff317183), Color(0xff46997D)),
    new ItemBoton(
        Icons.abc, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(
        Icons.abc, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6)),
    new ItemBoton(
        Icons.abc, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(Icons.abc, 'Awards', Color(0xff317183), Color(0xff46997D)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return ButtonCard(
                  title: item.title,
                  startColor: item.startColor,
                  endColor: item.endColor,
                  icon: item.icon,
                  onPress: () {
                    print(index);
                  },
                );
              },
            ),
          ),
          Positioned(child: IconHeader()),
        ],
      ),
    );
  }
}

class IconHeader extends StatelessWidget {
  const IconHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff526BF6),
                Color(0xff67ACF2),
              ],
            ),
          ),
        ),
        Positioned(
          top: -50,
          left: -70,
          child: Icon(
            Icons.add,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 80),
              Text(
                "Emegency",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 20),
              Icon(
                Icons.add,
                size: 50,
                color: Colors.white,
              )
            ],
          ),
        )
      ],
    );
  }
}

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    Key? key,
    required this.title,
    required this.startColor,
    required this.endColor,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color startColor;
  final Color endColor;

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: GestureDetector(
        onTap: onPress,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // background
            Container(
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(4, 6),
                    blurRadius: 0.3,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    startColor,
                    endColor,
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Positioned(
                      right: -20,
                      top: -20,
                      child: Icon(
                        icon,
                        color: Colors.white.withOpacity(0.2),
                        size: 150,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // content
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(
                  icon,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ItemBoton {
  final IconData icon;
  final String title;
  final Color startColor;
  final Color endColor;

  ItemBoton(this.icon, this.title, this.startColor, this.endColor);
}
