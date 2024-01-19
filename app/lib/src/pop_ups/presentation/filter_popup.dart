import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_go_demo/src/routing/app_router.dart';

class FilterPopUp extends ConsumerWidget {
  const FilterPopUp({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Stack(children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        alignment: Alignment.topRight,
        child: CloseButton(theme: theme),
      ),
    ]);
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
