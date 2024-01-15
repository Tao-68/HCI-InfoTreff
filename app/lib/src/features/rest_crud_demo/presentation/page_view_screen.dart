import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ri_go_demo/src/features/rest_crud_demo/presentation/home_screen.dart';
import 'package:ri_go_demo/src/features/rest_crud_demo/presentation/menu_screen.dart';

class MyPageView extends ConsumerStatefulWidget {
  const MyPageView({
    required this.initialPageIndex,
    super.key,
  });

  final int initialPageIndex;

  @override
  ConsumerState<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends ConsumerState<MyPageView> {
  final _controller = PageController(
    initialPage: 1,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: const [
          MenuPage(),
          HomePage(),
        ],
      ),
    );
  }
}
