import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart' as services;

import 'package:flutter/material.dart';
import 'package:try_tech/src/screen/shoes_layout/shoes_layout_screen.dart';

class ShoesDetailScreen extends StatelessWidget {
  const ShoesDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // status bar Color
    services.SystemChrome.setSystemUIOverlayStyle(
        services.SystemUiOverlayStyle.light);

    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            ShoesSizePreview(),
            Positioned(
              top: 50,
              left: 20,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 60,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ShoesDescription(
                  title: "Nike Air Max 720",
                  description:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "180",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Bounce(child: CartButton(title: "Buy Now"))
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(children: [
                    ShoesColorWidget(color: Colors.red),
                    Spacer(),
                    CartButton(title: "Related Item")
                  ]),
                ),
                ButtonsArea()
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class ShoesColorWidget extends StatelessWidget {
  const ShoesColorWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class ButtonsArea extends StatelessWidget {
  const ButtonsArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 30),
      // margin: EdgeInsets.symmetric(vertical: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ShoesButton(
          icon: Icon(
            Icons.star,
            color: Colors.red,
          ),
        ),
        ShoesButton(
          icon: Icon(
            Icons.add_shopping_cart,
            color: Colors.grey.withOpacity(0.4),
          ),
        ),
        ShoesButton(
          icon: Icon(
            Icons.settings,
            color: Colors.grey.withOpacity(0.4),
          ),
        ),
      ]),
    );
  }
}

class ShoesButton extends StatelessWidget {
  const ShoesButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            // spreadRadius: -5,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Center(child: icon),
    );
  }
}
