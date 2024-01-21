import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_go_demo/src/features/events/presentation/like_event_controller.dart';
import 'package:ri_go_demo/src/features/favourites/data/favourites_repository.dart';
import 'package:ri_go_demo/src/features/menu/data/menu_repository.dart';

import '../../features/menu/domain/menu.dart';

class MenuItemDetailsPopUp extends ConsumerWidget {
  const MenuItemDetailsPopUp({required this.item, super.key});
  final Item item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    late final controller = ref.watch(menuRepositoryProvider);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                Text(
                item.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
                  Container(
                    child: FloatingActionButton(
                      onPressed: () => controller.changeMenuLike(item: item,
                          like: item.favorite,),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      child:Icon(
                        item.favorite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: item.favorite
                            ? const Color.fromRGBO(115, 66, 23, 1)
                            : null,
                      ),
                  ),
                  ),
                  Icon(
                    item.active
                        ? Icons.check_circle
                        : Icons.check_circle_outline_outlined,
                    color: item.favorite
                        ? const Color.fromRGBO(115, 66, 23, 1)
                        : null,
                  ),
              ],
              ),
                  Text(
                  switch (item.diet) {
                  1 => 'vegetarian',
                  2 => 'vegan',
                  _ => '',
                  },),

              Text('Allergens: ${item.allergens}'),

              Text('Nutrition: ${item.nutrition}'),
              Text('Price: ${item.price}'),
              Text('Likes: ${item.likes}'),
              Text('Picture: ${item.picture}'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          alignment: Alignment.topRight,
          child: CloseButton(theme: theme),
        ),
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
        border: Border.all(width: 2, color: theme.colorScheme.primary),
        color: theme.colorScheme.onSecondary,
      ),
      child: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Icons.close,
          color: theme.colorScheme.primary,
        ),
        iconSize: 40,
      ),
    );
  }
}
