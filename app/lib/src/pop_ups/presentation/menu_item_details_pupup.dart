import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_go_demo/src/features/favourites/data/favourites_repository.dart';
import '../../global_value/global_value.dart';

import '../../features/menu/domain/menu.dart';

class MenuItemDetailsPopUp extends ConsumerWidget {
  const MenuItemDetailsPopUp({required this.item, super.key});
  final Item item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    late final controller = ref.watch(favouritesRepositoryProvider);
    return Stack(
      children: [
        Container(
          color: theme.colorScheme.primary,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headline(item: item, controller: controller, theme: theme),
              Text(
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
              Container(
                alignment: Alignment.center,
                child: Divider(
                  color: theme.colorScheme.secondary,
                  thickness: 2,
                ),
              ),
              Accordion(
                title: 'Allergens:',
                childWidget: Text(
                  item.allergens,
                ),
              ),
              Accordion(
                title: 'Ingredients:',
                childWidget: Text(
                  item.ingredients,
                ),
              ),
              Accordion(
                title: 'Nutrition:',
                childWidget: Text(
                  item.nutrition,
                ),
              ),
              ShowText(item: item),
            ],
          ),
        ),
      ],
    );
  }
}

class Headline extends ConsumerWidget {
  const Headline({
    required this.item,
    required this.controller,
    required this.theme,
    super.key,
  });

  final Item item;
  final FavouritesRepository controller;
  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          item.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            controller.changeFavouriteItem(item);
            ref.invalidate(favouritesRepositoryProvider);
          },
          backgroundColor: theme.colorScheme.primary,
          elevation: 0,
          child: Icon(
            controller.isLikedItem(item)
                ? Icons.star_rounded
                : Icons.star_outline_rounded,
            color: item.favorite ? theme.colorScheme.onPrimary : null,
          ),
        ),
        Icon(
          item.active
              ? Icons.check_circle
              : Icons.check_circle_outline_outlined,
          color: item.favorite ? const Color.fromRGBO(115, 66, 23, 1) : null,
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Text(
          item.price,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        CloseButton(theme: theme),
      ],
    );
  }
}

class CloseButton extends ConsumerWidget {
  const CloseButton({
    required this.theme,
    super.key,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: theme.colorScheme.onSecondary),
        color: theme.colorScheme.secondary,
      ),
      child: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Icons.close,
          color: theme.colorScheme.onSecondary,
        ),
        iconSize: 30,
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
            firstChild: Container(),
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

class ShowText extends ConsumerStatefulWidget {
  const ShowText ({required this.item, super.key});
  final Item item;

  @override
  ShowTextState createState() => ShowTextState(item: item);
}

class ShowTextState extends ConsumerState<ShowText> {
  ShowTextState({required this.item});
  final Item item;
  late bool showNoLike;

  @override
  Widget build(BuildContext context) {
    final showNoLike = ref.watch(showNumberOfLikeProvider);
    if (showNoLike) { 
      return Column (
        children: [           
          Text('Likes: ${item.likes}'),
          Text('Picture: ${item.picture}'),
        ],
      );
    }
    return Text('Picture: ${item.picture}');


  } 
}
