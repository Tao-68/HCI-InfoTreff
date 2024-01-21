import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../global_value/global_value.dart';

/*
class SettingsPopUp extends ConsumerWidget {
  const SettingsPopUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          alignment: Alignment.topRight,
          child: CloseButton(theme: theme),
        ),
      ],
    );
  }
}
*/

class OptionButton extends ConsumerWidget {
  const OptionButton({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref)
  {
    final theme = Theme.of(context);
    return IconButton(
            //onPressed: () => context.goNamed(SubRoutes.settings.name),
      icon: const Icon(Icons.settings_outlined),
      color: theme.colorScheme.onPrimary,
      onPressed: () {
          showDialog (
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog (
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: theme.colorScheme.primary),
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
                backgroundColor: theme.colorScheme.primary,
                scrollable: true,
                title: HeadBar(theme: theme),
                content:
                  SizedBox (
                    width: 500,
                    height: 265,
                    child: OptionContent(theme: theme),
                  ),
                  actions: [SaveButton(theme: theme)],
              );
            },
          );
        },
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

class HeadBar extends ConsumerWidget {
  const HeadBar ({required this.theme, super.key});
  final ThemeData theme;

 @override
  Widget build (BuildContext context, WidgetRef ref) {
    return Row (
      children: [
        Expanded (
          child: Text (
            'Settings',
            style: TextStyle (
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        CloseButton(theme : theme),
      ],
    );
  }
}

class OptionContent extends ConsumerWidget {
  const OptionContent ({required this.theme, super.key});
  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column (
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
          padding: const EdgeInsets.only(bottom: 5),
            child: const Text (
              'General',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container (
            padding: const EdgeInsets.only(bottom: 7),
              child: Row (
                children: [
                  const Expanded( 
                    child: Text (
                      'some Settings',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              
            ),
            Container (
                child: const Text (
                  'Menu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
            ),
            Container (
              padding: const EdgeInsets.only(bottom: 7),
              child: Row (
                children: [
                  const Expanded(
                    child: Text (
                      'show Number of like',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SettingCheckBox (
                    provider: likeViewProvider,
                    theme: theme,
                    onChanged: (bool? value) {
                      ref.read(likeViewProvider.notifier).changeValue(value);
                    },
                  ),
                ],
              ),
            ),
            Container (
              padding: const EdgeInsets.only(bottom: 5),
              child: const Text (
                'Event',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container (
              child: Row (
                children: [
                  const Expanded( 
                    child: Text (
                      'Hide Number of participants',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SettingCheckBox (
                    provider: hideParticipantProvider,
                    theme: theme,
                    onChanged: (bool? value) {
                      ref.read(hideParticipantProvider.notifier)
                        .changeValue(value);
                    },
                  ),
                ],
              ),
            ),
          ],
      );
  }
}

class SettingCheckBox extends ConsumerStatefulWidget {
  const SettingCheckBox({
    required this.theme,
    required this.provider,
    required this.onChanged, 
    super.key,});
  final void Function (bool?) onChanged;
  final StateNotifierProvider<StateNotifier<bool?>, bool?> provider;
  final ThemeData theme;

  @override
  _SettingCheckBoxState createState() => _SettingCheckBoxState(
    theme: theme, 
    provider: provider,
    onChanged: onChanged,
  );
}

class _SettingCheckBoxState extends ConsumerState<SettingCheckBox> {
  _SettingCheckBoxState({
    required this.theme, 
    required this.provider,
    required this.onChanged,
  });
  final ThemeData theme;
  final StateNotifierProvider<StateNotifier<bool?>, bool?> provider;
  final void Function (bool?) onChanged;

  @override
  Widget build (BuildContext context) {
    final bool? isChecked = ref.watch(provider);
    return Checkbox (
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
        side: BorderSide(
          color: theme.colorScheme.primary,
          width: 2, 
        ),
      ),
      value: isChecked,
      onChanged: onChanged,
    );
  }
}

class SaveButton extends ConsumerWidget {
  const SaveButton ({required this.theme, super.key});
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
        ),
      ),
    );
  }
}
