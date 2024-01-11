import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IconData event_icon = Icons.celebration_rounded;
    IconData menu_icon = Icons.coffee_rounded;

    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Headline(
              main_axis_alignment: MainAxisAlignment.start,
              headline_icon: menu_icon,
              headline_text: 'Menu',
              headline_color: Color(0xFF401E11),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SwipeLeft(),
                  AppLogo(),
                  SwipeRight(),
                ],
              ),
            ),
            Headline(
              main_axis_alignment: MainAxisAlignment.end,
              headline_icon: event_icon,
              headline_text: 'Events',
              headline_color: Color(0xFFFFF2E3),
            ),
          ],
        ),
      ),
    ]);
  }
}

class Headline extends ConsumerWidget {
  const Headline({
    super.key,
    required this.main_axis_alignment,
    required this.headline_icon,
    required this.headline_text,
    required this.headline_color,
  });

  final MainAxisAlignment main_axis_alignment;
  final IconData headline_icon;
  final String headline_text;
  final Color headline_color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final style = theme.textTheme.displayMedium!.copyWith(
      color: headline_color,
    );
    return Row(
      mainAxisAlignment: main_axis_alignment,
      children: [
        Icon(
          headline_icon,
          color: headline_color,
        ),
        SizedBox(width: 10),
        Text(
          headline_text,
          style: style,
        ),
      ],
    );
  }
}

class SwipeRight extends ConsumerWidget {
  const SwipeRight({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return IconButton(
      constraints: BoxConstraints.tight(Size(80, 100)),
      iconSize: 100,
      onPressed: () {},
      icon: Icon(Icons.arrow_forward_ios_rounded),
      color: theme.colorScheme.onPrimary,
    );
  }
}

class SwipeLeft extends ConsumerWidget {
  const SwipeLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return IconButton(
      constraints: BoxConstraints.tight(Size(80, 100)),
      iconSize: 100,
      onPressed: () {},
      icon: Icon(Icons.arrow_back_ios_new_rounded),
      color: theme.colorScheme.onTertiary,
    );
  }
}

class AppLogo extends ConsumerWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/InfoTreffLogo.png'),
      radius: 80,
    );
  }
}
