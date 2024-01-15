import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        //BackgroundAsClipPath(),
        const BackgroundAsImage(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Menue Headline
              Row(
                children: [
                  Icon(
                    Icons.coffee_rounded,
                    color: theme.colorScheme.onPrimary,
                    size: 25,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),

              //Navigation and Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      // TODO(Emil): implement switch menu screen.
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    iconSize: 65,
                    color: theme.colorScheme.onPrimary,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: theme.colorScheme.onSecondary,
                      ),
                      shape: BoxShape.circle,
                      color: theme.colorScheme.primary.withOpacity(0.5),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 75,
                      child: Image.asset('assets/InfoTreffLogo.png'),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/InfoTreffLogo.png'),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // TODO(Emil): implement switch to event screen
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    iconSize: 65,
                    color: theme.colorScheme.primary,
                  ),
                ],
              ),
              //Event Headline
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.celebration_rounded,
                    color: theme.colorScheme.primary,
                    size: 25,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Events',
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BackgroundAsImage extends StatelessWidget {
  const BackgroundAsImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/home_background.png'),
          fit: BoxFit.cover,
        ),
      ) /* add child content here */,
    );
  }
}

class BackgroundAsClipPath extends StatelessWidget {
  const BackgroundAsClipPath({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.grey,
        ),
        ClipPath(
          clipper: WaveClipperHomePage(),
          child: FractionallySizedBox(
            heightFactor: 0.73,
            widthFactor: 1,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ),
        ClipPath(
          clipper: WaveClipperHomePage(),
          child: FractionallySizedBox(
            heightFactor: 0.72,
            widthFactor: 1,
            child: Container(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

class WaveClipperHomePage extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    final path = Path();
    path.lineTo(0, size.height);
    final firstPointContol = Offset(size.width / 3, size.height);
    final secondPoint = Offset(size.width / 2, size.height - (size.height / 3));
    path.quadraticBezierTo(
      firstPointContol.dx,
      firstPointContol.dy,
      secondPoint.dx,
      secondPoint.dy,
    );

    final pointThreeContorol =
        Offset(size.width - (size.width / 3), size.height / 3);
    final fourthPoint = Offset(size.width, size.height / 3);

    path
      ..quadraticBezierTo(
        pointThreeContorol.dx,
        pointThreeContorol.dy,
        fourthPoint.dx,
        fourthPoint.dy,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
