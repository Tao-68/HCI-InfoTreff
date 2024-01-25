import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FeedbackPopup extends ConsumerWidget {
  const FeedbackPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            border: Border.all(width: 2,color: theme.colorScheme.onPrimary,),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              HeadBar(theme: theme),
              FeedbackContent(theme: theme),
              SendButton(theme: theme),
            ],
          ),
        ),
      ],
    );
  }
}

class HeadBar extends ConsumerWidget {
  const HeadBar({required this.theme, super.key});
  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Feedback',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
              fontSize: 35,
            ),
          ),
        ),
        CloseButton(theme: theme),
      ],
    );
  }
}

class FeedbackContent extends ConsumerWidget {
  const FeedbackContent({required this.theme, super.key});
  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 15),
          alignment: Alignment.center,
          child: Divider(
            color: theme.colorScheme.secondary,
            thickness: 2,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            'What would you like to tell us?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        TextField(
          minLines: 5,
          maxLines: 5,
          keyboardType: TextInputType.multiline,
          style: TextStyle(color: theme.colorScheme.onPrimary),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelStyle: TextStyle(
              color: theme.colorScheme.onPrimary,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.onPrimary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.onPrimary,
              ), // Customize the color as needed
            ),
          ),
        ),
      ],
    );
  }
}

class SendButton extends ConsumerWidget {
  const SendButton({required this.theme, super.key});
  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(theme.colorScheme.secondary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: theme.colorScheme.onPrimary, width: 2),
          ),
        ),
      ),
      onPressed: () => Navigator.pop(context),
      child: Text(
        'Accept',
        style: TextStyle(
          color: theme.colorScheme.onPrimary,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
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
        iconSize: 30,
      ),
    );
  }
}
