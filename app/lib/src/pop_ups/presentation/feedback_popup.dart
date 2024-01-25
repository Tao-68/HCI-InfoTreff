import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FeedbackPopup extends ConsumerWidget {
  const FeedbackPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.primary,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            alignment: Alignment.topRight,
            child: HeadBar(theme: theme),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
            alignment: Alignment.topRight,
            child: FeedbackContent(theme: theme),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 340, horizontal: 30),
            alignment: Alignment.topRight,
            child: SendButton(theme: theme),
          ),
        ],
      ),
    );
  }
}

class HeadBar extends ConsumerWidget {
  const HeadBar ({required this.theme, super.key});
  final ThemeData theme;

 @override
  Widget build (BuildContext context, WidgetRef ref) {
    return Row (
      children: [
        Expanded (
          child: Text (
            'Feedback',
            style: TextStyle (
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
              fontSize: 35,
            ),
          ),
        ),
        CloseButton(theme : theme),
      ],
    );
  }
}

class FeedbackContent extends ConsumerStatefulWidget {
  const FeedbackContent ({required this.theme, super.key});
  final ThemeData theme;

  @override
  FeedbackContentState createState() => FeedbackContentState(theme: theme);
}

class FeedbackContentState extends ConsumerState<FeedbackContent> {
  FeedbackContentState ({required this.theme});
  final ThemeData theme;

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  void _handleTap() {
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => _handleTap(),
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container (
            padding: const EdgeInsets.only(bottom: 15),
            alignment: Alignment.center,
            child: Divider (
              color: theme.colorScheme.secondary,
              thickness: 2,
            ),
          ),
          Container (
            padding: const EdgeInsets.only(bottom: 15),
            child: Text (
              'What would you like to tell us?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
          TextField(
            focusNode: _focusNode,
            minLines: 5,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            style: TextStyle(color: theme.colorScheme.onPrimary),
            decoration: InputDecoration (
              filled: true,
              fillColor: Colors.white,
              labelStyle: TextStyle (
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
          ),import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FeedbackPopup extends ConsumerWidget {
  const FeedbackPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.primary,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            alignment: Alignment.topRight,
            child: HeadBar(theme: theme),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
            alignment: Alignment.topRight,
            child: FeedbackContent(theme: theme),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 340, horizontal: 30),
            alignment: Alignment.topRight,
            child: SendButton(theme: theme),
          ),
        ],
      ),
    );
  }
}

class HeadBar extends ConsumerWidget {
  const HeadBar ({required this.theme, super.key});
  final ThemeData theme;

 @override
  Widget build (BuildContext context, WidgetRef ref) {
    return Row (
      children: [
        Expanded (
          child: Text (
            'Feedback',
            style: TextStyle (
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
              fontSize: 35,
            ),
          ),
        ),
        CloseButton(theme : theme),
      ],
    );
  }
}

class FeedbackContent extends ConsumerStatefulWidget {
  const FeedbackContent ({required this.theme, super.key});
  final ThemeData theme;

  @override
  FeedbackContentState createState() => FeedbackContentState(theme: theme);
}

class FeedbackContentState extends ConsumerState<FeedbackContent> {
  FeedbackContentState ({required this.theme});
  final ThemeData theme;

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  void _handleTap() {
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => _handleTap(),
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container (
            padding: const EdgeInsets.only(bottom: 15),
            alignment: Alignment.center,
            child: Divider (
              color: theme.colorScheme.secondary,
              thickness: 2,
            ),
          ),
          Container (
            padding: const EdgeInsets.only(bottom: 15),
            child: Text (
              'What would you like to tell us?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
          TextField(
            focusNode: _focusNode,
            minLines: 5,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            style: TextStyle(color: theme.colorScheme.onPrimary),
            decoration: InputDecoration (
              filled: true,
              fillColor: Colors.white,
              labelStyle: TextStyle (
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
      ),
    );
  }
}

class SendButton extends ConsumerWidget {
  const SendButton ({required this.theme, super.key});
  final ThemeData theme;

  @override
  Widget build (BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>
          (theme.colorScheme.secondary),
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

        ],
      ),
    );
  }
}

class SendButton extends ConsumerWidget {
  const SendButton ({required this.theme, super.key});
  final ThemeData theme;

  @override
  Widget build (BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>
          (theme.colorScheme.secondary),
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
