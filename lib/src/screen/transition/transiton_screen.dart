import 'package:flutter/material.dart';

class TransitionScreen extends StatelessWidget {
  const TransitionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(child: Text("Transiton")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chevron_right),
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return SecoundryPage();
              },
              transitionDuration: Duration(seconds: 1),
              transitionsBuilder:
                  (context, animation, secoundryAnimation, child) {
                final curvedAniamtion =
                    CurvedAnimation(parent: animation, curve: Curves.easeInOut);

                //  Slide
                // return SlideTransition(
                //   position:
                //       Tween<Offset>(begin: Offset(0.5, 1.0), end: Offset.zero)
                //           .animate(curvedAniamtion),
                //   child: child,
                // );

                //  Scale
                // return ScaleTransition(
                //   scale: Tween<double>(begin: 0.0, end: 1.0)
                //       .animate(curvedAniamtion),
                //   child: child,
                // );

                // Rotation
                // return RotationTransition(
                //   turns: Tween<double>(begin: 0.0, end: 1.0)
                //       .animate(curvedAniamtion),
                //   child: child,
                // );

                // Fade
                // return FadeTransition(
                //   opacity: Tween<double>(begin: 0.0, end: 1.0)
                //       .animate(curvedAniamtion),
                //   child: child,
                // );

                // アニメーションを重ねる
                return RotationTransition(
                    turns: Tween<double>(begin: 0.0, end: 1.0)
                        .animate(curvedAniamtion),
                    child: FadeTransition(
                      opacity: Tween<double>(begin: 0.0, end: 1.0)
                          .animate(curvedAniamtion),
                      child: child,
                    ));
              },
            ),
          );
        },
      ),
    );
  }
}

class SecoundryPage extends StatelessWidget {
  const SecoundryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Secoundry')),
      body: Center(child: const Text('Secoundry')),
    );
  }
}
