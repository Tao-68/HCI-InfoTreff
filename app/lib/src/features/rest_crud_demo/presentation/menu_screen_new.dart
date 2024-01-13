import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ri_go_demo/src/features/rest_crud_demo/presentation/menu_screen.dart';

class MenuPageNew extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        //BackgoundAsClipPath(),
        BackgroundAsImage(),

        //Menu
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: CategoryList(),
        ),

        //Filter Button
        Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2, color: Colors.amber),
                color: Colors.white),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_list_rounded,
                color: Colors.amber,
              ),
              iconSize: 50,
            ),
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/menu_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: null /* add child content here */,
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var categories = <String>['Snacks', 'Cofé', 'Tee'];
    var snackItems = <String>[];
    var cofeItems = <String>[
      'Late',
      'Espreso',
    ];
    var teeItems = <String>[
      'Black',
      'Roibush',
      'Green',
      'Earl Grey',
      'Chamomile'
    ];

    if (categories.isEmpty) {
      return Center(
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
  final String categoryTitle;
  final List<String> items;

  const Category(
    this.categoryTitle,
    this.items, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (items.isEmpty)
      return Accordion(
          title: categoryTitle, childWidget: Text('No items in this category'));

    return Accordion(
      title: categoryTitle,
      childWidget: Column(
        children: [
          for (var item in items)
            ListTile(
              leading: Text(item),
              trailing: Icon(Icons.open_in_new),
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
    //final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 4,
      child: Column(
        children: [
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
    var path = new Path();
    path.lineTo(0, size.height);
    var firstPointContol = Offset(size.width / 3, size.height);
    var secondPoint = Offset(size.width / 2, size.height - (size.height / 10));
    path.quadraticBezierTo(firstPointContol.dx, firstPointContol.dy,
        secondPoint.dx, secondPoint.dy);

    var pointThreeContorol = Offset(
        size.width - (size.width / 3), size.height - (size.height / 5.2));
    var fourthPoint = Offset(size.width, size.height - (size.height / 5.2));

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
