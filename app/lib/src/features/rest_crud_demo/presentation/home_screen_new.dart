import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePageNew extends ConsumerWidget {
  const HomePageNew({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        child: Stack(
      children: [
        Container(
          color: Colors.black,
        ),
        ClipPath(
          clipper: WaveClipper(),
          child: FractionallySizedBox(
            heightFactor: 0.66,
            widthFactor: 1,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ),
        ClipPath(
          clipper: WaveClipper(),
          child: FractionallySizedBox(
            heightFactor: 0.64,
            widthFactor: 1,
            child: Container(
              color: Colors.red,
            ),
          ),
        )
      ],
    ));
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);
    var firstPointContol = Offset(size.width / 3, size.height);
    var secondPoint = Offset(size.width / 2, size.height - (size.height / 3));
    path.quadraticBezierTo(firstPointContol.dx, firstPointContol.dy,
        secondPoint.dx, secondPoint.dy);

    var pointThreeContorol =
        Offset(size.width - (size.width / 3), size.height / 3);
    var fourthPoint = Offset(size.width, size.height / 3);

    path.quadraticBezierTo(pointThreeContorol.dx, pointThreeContorol.dy,
        fourthPoint.dx, fourthPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
