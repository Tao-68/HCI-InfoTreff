import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/menu_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: MenueCategories(),
      ),
      Center(
          child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.filter_list_rounded),
        iconSize: 50,
      )),
    ]);
  }
}

class MenueCategories extends ConsumerStatefulWidget {
  const MenueCategories({super.key});

  @override
  ConsumerState<MenueCategories> createState() => _MenueCategoriesState();
}

class _MenueCategoriesState extends ConsumerState<MenueCategories> {
  @override
  Widget build(BuildContext context) {
    var categories = <String>["Snacks", "Cofe", "Tee"];

    if (categories.isEmpty) {
      return Center(
        child: Text('No Menue found.'),
      );
    }

    return Stack(alignment: const Alignment(0.6, 0.6), children: [
      ListView(
        children: [
          for (var title in categories)
            Accordion(
              title: title,
              childWidget: Text("Items"),
            ),
        ],
      ),
    ]);
  }
}

class MenueItems extends ConsumerWidget {
  var items = <String>["Burger", "Cola", "Mate"];

  Widget build(BuildContext context, WidgetRef ref) {
    if (items.isEmpty) {
      return Center(
        child: Text('No Menue found.'),
      );
    }

    return Stack(alignment: const Alignment(0.6, 0.6), children: [
      ListView(
        children: [
          for (var item in items)
            ListTile(
              title: Text(item),
            ),
        ],
      ),
    ]);
  }
}

class Accordion extends ConsumerStatefulWidget {
  final String title;
  final Widget childWidget;

  const Accordion({Key? key, required this.title, required this.childWidget})
      : super(key: key);
  @override
  ConsumerState<Accordion> createState() => _AccordionState();
}

class _AccordionState extends ConsumerState<Accordion> {
  // Show or hide the content
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 4,
      color: theme.colorScheme.onPrimary,
      surfaceTintColor: theme.colorScheme.onPrimary,
      child: Column(children: [
        // The title
        ListTile(
          title: Text(widget.title),
          trailing: IconButton(
            icon: Icon(
                _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            onPressed: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
          ),
        ),
        // Show or hide the content based on the state
        _showContent
            ? Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: widget.childWidget,
              )
            : Container()
      ]),
    );
  }
}
