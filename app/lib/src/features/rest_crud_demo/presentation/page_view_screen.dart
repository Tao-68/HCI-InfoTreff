import 'package:flutter/material.dart';
import 'package:ri_go_demo/src/features/rest_crud_demo/presentation/home_screen.dart';
import 'package:ri_go_demo/src/features/rest_crud_demo/presentation/menu_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      appBar: AppBar(
        //leading: Padding(
        //  padding: const EdgeInsets.all(5),
        //  child: AppLogo(),
        //),
        title: Text(
          'InfoTreff',
          selectionColor: theme.colorScheme.onTertiary,
        ),
        backgroundColor: theme.colorScheme.onPrimary,
        shadowColor: theme.colorScheme.primary,
        surfaceTintColor: theme.colorScheme.onPrimary,
        elevation: 4,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: Icon(Icons.comment)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
        ],
      ),
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
