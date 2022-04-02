import 'package:flutter/material.dart';

class _ListItem {
  final String title;
  final Color color;
  _ListItem(
    this.title,
    this.color,
  );
}

class SliverScreen extends StatelessWidget {
  SliverScreen({Key? key}) : super(key: key);

  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            floating: true,
            delegate: _SLiverHeaderDelegate(
              170,
              250,
              Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: SliverTitle(),
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([]))
        ],
      ),
    );
  }
}

class _SLiverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SLiverHeaderDelegate(this.minheight, this.maxheight, this.child);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => (minheight > maxheight) ? minheight : maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxExtent != oldDelegate.maxExtent ||
        minheight != oldDelegate.minExtent;
  }
}

class SliverTitle extends StatelessWidget {
  const SliverTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "New",
          style: TextStyle(fontSize: 50),
        ),
        Text(
          "List",
          style: TextStyle(
            fontSize: 50,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

class SliverCell extends StatelessWidget {
  const SliverCell({Key? key, required this.item}) : super(key: key);

  final _ListItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      height: 130,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(item.title),
    );
  }
}
