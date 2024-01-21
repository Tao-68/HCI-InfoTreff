import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FilterPopUp extends ConsumerWidget {
  const FilterPopUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            border: Border.all(width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filter',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 25,
                    ),
                  ),
                  CloseButton(theme: theme),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1.5,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              // TODO(Filter): MenuFilter should be generated based on a list
              MenuFilter(title: 'New', theme: theme),
              MenuFilter(title: 'Vegan', theme: theme),
              MenuFilter(title: 'Vegetarian', theme: theme),
              MenuFilter(title: 'Gluten free', theme: theme),
              MenuFilter(title: 'Lactose free', theme: theme),
              ApplyButton(theme: theme),
            ],
          ),
        ),
      ],
    );
  }
}

class MenuFilter extends ConsumerStatefulWidget {
  const MenuFilter({required this.title, required this.theme, super.key});
  final String title;

  final ThemeData theme;
  @override
  ConsumerState<MenuFilter> createState() => _MenuFilterState();
}

class _MenuFilterState extends ConsumerState<MenuFilter> {
  // Show or hide the content
  bool? _checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: widget.theme.colorScheme.onPrimary,
            fontSize: 16,
          ),
        ),
        Checkbox(
          value: _checked,
          onChanged: (bool? value) {
            setState(() {
              _checked = value;
            });
          },
        ),
      ],
    );
  }
}

class ApplyButton extends ConsumerWidget {
  const ApplyButton({
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
      child: TextButton(
        child: Text(
          'Apply',
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: 16,
          ),
        ),
        onPressed: () {
          // TODO(Filter): filter anwenden
        },
      ),
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
        iconSize: 40,
      ),
    );
  }
}
