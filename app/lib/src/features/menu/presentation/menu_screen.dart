import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuPage extends ConsumerWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        //BackgoundAsClipPath(),
        const BackgroundAsImage(),

        //Menu
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: CategoryList(),
        ),

        //Filter Button
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          alignment: Alignment.bottomRight,
          child: FilterButton(theme: theme),
        ),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    required this.theme,
    super.key,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: theme.colorScheme.primary),
        color: theme.colorScheme.onSecondary,
      ),
      child: IconButton(
        onPressed: () {
          // TODO(Emil): open Filter PopUp
        },
        icon: Icon(
          Icons.filter_list_rounded,
          color: theme.colorScheme.primary,
        ),
        iconSize: 40,
      ),
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
          image: AssetImage('assets/menu_background.png'),
          fit: BoxFit.cover,
        ),
      ) /* add child content here */,
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = <String>['Snacks', 'Cofé', 'Tee'];
    final snackItems = <String>[];
    final cofeItems = <String>[
      'Late',
      'Espreso',
    ];
    final teeItems = <String>[
      'Black',
      'Roibush',
      'Green',
      'Earl Grey',
      'Chamomile',
    ];

    if (categories.isEmpty) {
      return const Center(
        child: Text('No Menu found.'),
      );
    } //end of if

    return ListView(
      children: [
        //Accordion Liste
        // for (var title in categories) Category(title, snackItems),
        Category(categories[0], snackItems),
        Category(categories[1], cofeItems),
        Category(categories[2], teeItems),
      ],
    );
  }
}

class Category extends ConsumerWidget {
  const Category(
    this.categoryTitle,
    this.items, {
    super.key,
  });
  final String categoryTitle;
  final List<String> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    if (items.isEmpty) {
      return Accordion(
        title: categoryTitle,
        childWidget: const Text(
          'No items in this category',
        ),
      );
    }

    return Accordion(
      title: categoryTitle,
      childWidget: Column(
        children: [
          for (final item in items)
            ListTile(
              leading: Text(
                item,
                style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 16,
                ),
              ),
              trailing: Icon(
                Icons.open_in_new,
                size: 18,
                color: theme.colorScheme.onPrimary,
              ),
              onTap: () {
                // TODO(Emil): implement open Detail PopUp
              },
            ),
        ],
      ),
    );
  }
}

class Accordion extends ConsumerStatefulWidget {
  const Accordion({required this.title, required this.childWidget, super.key});
  final String title;
  final Widget childWidget;

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
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2, color: theme.colorScheme.onPrimary),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      margin: const EdgeInsets.all(10),
      elevation: 4,
      color: theme.colorScheme.primary,
      shadowColor: theme.colorScheme.onSecondary,
      child: Column(
        children: [
          // The title
          ListTile(
            title: Text(
              widget.title,
              style:
                  TextStyle(color: theme.colorScheme.onPrimary, fontSize: 20),
            ),
            onTap: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
            trailing: Icon(
              _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          // Show or hide the content based on the state
          if (_showContent)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: widget.childWidget,
            )
          else
            Container(),
        ],
      ),
    );
  }
}

class BackgoundAsClipPath extends StatelessWidget {
  const BackgoundAsClipPath({
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
          clipper: WaveClipperMenuPage(),
          child: FractionallySizedBox(
            heightFactor: 0.90,
            widthFactor: 1,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ),
        ClipPath(
          clipper: WaveClipperMenuPage(),
          child: FractionallySizedBox(
            heightFactor: 0.89,
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

class WaveClipperMenuPage extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    final path = Path();
    path.lineTo(0, size.height);
    final firstPointContol = Offset(size.width / 3, size.height);
    final secondPoint =
        Offset(size.width / 2, size.height - (size.height / 10));
    path.quadraticBezierTo(
      firstPointContol.dx,
      firstPointContol.dy,
      secondPoint.dx,
      secondPoint.dy,
    );

    final pointThreeContorol = Offset(
      size.width - (size.width / 3),
      size.height - (size.height / 5.2),
    );
    final fourthPoint = Offset(size.width, size.height - (size.height / 5.2));

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
