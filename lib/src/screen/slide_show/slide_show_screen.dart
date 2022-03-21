import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideModel with ChangeNotifier {
  double _currentPage = 0;
  Color primaryColor = Colors.blue;
  Color secoundryColor = Colors.grey;

  double get currentPage => _currentPage;

  set currentPage(double page) {
    this._currentPage = page;
    notifyListeners();
  }
}

class SlideShowScreen extends StatelessWidget {
  const SlideShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide Show'),
      ),
      body: Center(
        child: SlideShow(
          sliders: [
            SvgPicture.asset("assets/svgs/slide-1.svg"),
            SvgPicture.asset("assets/svgs/slide-2.svg"),
            SvgPicture.asset("assets/svgs/slide-3.svg"),
            SvgPicture.asset("assets/svgs/slide-4.svg"),
          ],
        ),
      ),
    );
  }
}

class SlideShow extends StatelessWidget {
  const SlideShow({Key? key, required this.sliders}) : super(key: key);
  final List<Widget> sliders;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SlideModel(),
      child: Container(
        child: Column(
          children: [
            Expanded(
                child: Slide(
              slides: sliders,
            )),
            Container(
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(sliders.length, (index) {
                    return dot(index: index);
                  })),
            )
          ],
        ),
      ),
    );
  }
}

class Slide extends StatefulWidget {
  Slide({Key? key, required this.slides}) : super(key: key);

  final List<Widget> slides;

  @override
  State<Slide> createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      if (pageController.page != null)
        Provider.of<SlideModel>(context, listen: false).currentPage =
            pageController.page!;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: widget.slides,
    );
  }
}

class dot extends StatelessWidget {
  const dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final sModel = Provider.of<SlideModel>(context);

    double dotSize;
    Color dotColor;
    if (sModel.currentPage >= index - 0.5 && sModel.currentPage < index + 0.5) {
      dotSize = 20;
      dotColor = sModel.primaryColor;
    } else {
      dotSize = 12;
      dotColor = sModel.secoundryColor;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: dotSize,
      height: dotSize,
      decoration: BoxDecoration(
        color: dotColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class SlideCell extends StatelessWidget {
  const SlideCell({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: child,
    );
  }
}
