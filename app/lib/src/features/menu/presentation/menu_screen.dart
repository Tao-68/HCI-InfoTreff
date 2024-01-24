import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_go_demo/src/pop_ups/presentation/filter_popup.dart';
import 'package:ri_go_demo/src/routing/app_router.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../data/menu_repository.dart';
import '../domain/menu.dart';

class MenuPage extends ConsumerWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        const BackgroundAsImage(),
        //Menu
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Headline(theme: theme),
              const Expanded(
                child: SizedBox(
                  child: CategoryList(),
                ),
              ),
            ],
          ),
        ),

        //Filter Button
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          alignment: Alignment.bottomRight,
          child: FilterButton(theme: theme),
        ),

        GestureDetector(
          onHorizontalDragUpdate: (details) {
            const int senitivity = 8;
            if (details.delta.dx < -senitivity) {
              context.go('/${TopLevelDestinations.home.name}');
            }
          },
        ),
      ],
    );
  }
}

class Headline extends StatelessWidget {
  const Headline({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'Menu',
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: 30,
              ),
            ),
          ],
        ),
        BackButton(theme: theme),
      ],
    );
  }
}

class BackButton extends ConsumerWidget {
  const BackButton({
    required this.theme,
    super.key,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => context.go('/${TopLevelDestinations.home.name}'),
      icon: Icon(
        Icons.arrow_forward_ios_rounded,
        color: theme.colorScheme.onPrimary,
      ),
      iconSize: 30,
    );
  }
}

class FilterButton extends ConsumerWidget {
  const FilterButton({
    required this.theme,
    super.key,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: theme.colorScheme.primary),
        color: theme.colorScheme.onSecondary,
      ),
      child: IconButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => const Dialog(
            child: FilterPopUp(),
          ),
        ),
        icon: Icon(
          Icons.filter_list_rounded,
          color: theme.colorScheme.primary,
        ),
        iconSize: 40,
      ),
    );
  }
}

class BackgroundAsImage extends ConsumerWidget {
  const BackgroundAsImage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu_background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CategoryList extends ConsumerWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(fetchMenuProvider),
      data: (menu) => ListView(
        children: [
          //Accordion Liste
          for (final category in menu.categories)
            Category(category.category, category.items),
        ],
      ),
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
  final List<Item> items;

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
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.5,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
              child: ListTile(
                title: Text(
                  item.name,
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  switch (item.diet) {
                    1 => 'vegetarian',
                    2 => 'vegan',
                    _ => '',
                  },
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 38, 107, 40),
                  ),
                ),
                trailing: Text(
                  item.price,
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 16,
                  ),
                ),
                onTap: () => context.goNamed(
                  SubRoutes.menuItemDetails.name,
                  extra: item,
                ),
              ),
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
          AnimatedCrossFade(
            firstChild:  Container(),
            secondChild: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.5,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: widget.childWidget,
            ),
            crossFadeState: _showContent
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
