import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:try_tech/src/screen/pintest/pintest_menu.dart';

class PintestScreen extends StatelessWidget {
  PintestScreen({Key? key}) : super(key: key);

  final List<int> items = List.generate(200, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PintestLayout(items: items),
        Positioned(bottom: 30, child: PintestMenu()),
      ],
    ));
  }
}

class PintestLayout extends StatelessWidget {
  const PintestLayout({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<int> items;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.custom(
        padding: EdgeInsets.symmetric(horizontal: 10),
        gridDelegate: SliverWovenGridDelegate.count(
          pattern: [
            WovenGridTile(1),
            WovenGridTile(
              5 / 7,
              crossAxisRatio: 0.9,
              alignment: AlignmentDirectional.centerEnd,
            )
          ],
          crossAxisCount: 2,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return PintestCell(index: index);
          },
          childCount: items.length,
        ),
      ),
    );
  }
}

class PintestCell extends StatelessWidget {
  const PintestCell({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
          child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text("$index"),
      )),
    );
  }
}
