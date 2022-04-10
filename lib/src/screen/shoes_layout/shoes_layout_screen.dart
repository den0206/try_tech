import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:try_tech/src/screen/shoes_layout/shoes_detail_screen.dart';

class ShoesLayputScreen extends StatelessWidget {
  const ShoesLayputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // status bar Color
    services.SystemChrome.setSystemUIOverlayStyle(
        services.SystemUiOverlayStyle.dark);

    return Scaffold(
        body: Column(
      children: [
        CustomAppBar(),
        SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ShoesSizePreview(),
                ShoesDescription(
                  title: "Nike Air Max 720",
                  description:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
              ],
            ),
          ),
        ),
        CalculateArea(total: 180),
      ],
    ));
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.only(top: 30),
        child: Row(children: [
          Text(
            "For You",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          Spacer(),
          Icon(
            Icons.search,
            size: 30,
          )
        ]),
      ),
    );
  }
}

class ShoesSizePreview extends StatelessWidget {
  const ShoesSizePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Shoes_Image",
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Container(
          width: double.infinity,
          height: 430,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xffFFCF53),
          ),
          child: Column(
            children: [
              _ShoesImage(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_SizeCell(size: 9)],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SizeCell extends StatelessWidget {
  const _SizeCell({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        child: Text(
          "${size.toString().replaceAll(".0", "")} ",
          style: TextStyle(
              color: this.size == 9 ? Colors.white : Color(0xffF1A23A),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
          color: this.size == 9 ? Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: this.size == 9 ? Color(0xffF1A23A) : Colors.white,
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ],
        ),
      ),
    );
  }
}

class _ShoesImage extends StatelessWidget {
  const _ShoesImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          // shoes shadow
          Positioned(
            bottom: 0,
            right: 0,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                width: 230,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
                  ],
                ),
              ),
            ),
          ),
          Image(image: AssetImage("assets/images/amarillo.png"))
        ],
      ),
    );
  }
}

class ShoesDescription extends StatelessWidget {
  const ShoesDescription(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: TextStyle(color: Colors.black54, height: 1.6),
          ),
        ],
      ),
    );
  }
}

class CalculateArea extends StatelessWidget {
  const CalculateArea({Key? key, required this.total}) : super(key: key);

  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            "$total",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          CartButton(
            title: "Add To Cart",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ShoesDetailScreen();
                },
              ));
            },
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
