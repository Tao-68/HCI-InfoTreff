import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ri_go_demo/src/features/rest_crud_demo/presentation/home_screen.dart';
import 'package:ri_go_demo/src/features/rest_crud_demo/presentation/menu_screen.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final _controller = PageController(
    initialPage: 1,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          MenuePage(),
          HomePage(),
        ],
      ),
    );
  }
}
