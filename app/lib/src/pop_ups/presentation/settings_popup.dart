import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../global_value/global_value.dart';

class SettingsPopUp extends ConsumerWidget {
  const SettingsPopUp({super.key});

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
            border: Border.all(
              width: 2,
              color: theme.colorScheme.onPrimary,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              HeadBar(theme: theme),
              OptionContent(theme: theme),
            ],
          ),
        ),
      ],
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

    final ShowNumberOfLikePreference showNumberOfLikePreference 
    = ShowNumberOfLikePreference();
    final HideNumberParticipantPreference hideNumberParticipantPreference 
    = HideNumberParticipantPreference();
    final ShowVeganOnlyPreference showVeganOnlyPreference 
    = ShowVeganOnlyPreference();
    final MainLanguagePreference mainLanguagePreference 
    = MainLanguagePreference();

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
                      'language',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SettingDropDownMenu (
                    pref: mainLanguagePreference,
                    theme: theme,
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
              padding: const EdgeInsets.only(bottom: 5),
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
                    theme: theme,
                    pref: showNumberOfLikePreference,
                    onChanged: (bool? value) async {
                      await showNumberOfLikePreference
                        .saveValue(value: value ?? false);
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
                    theme: theme,
                    pref: hideNumberParticipantPreference,
                    onChanged: (bool? value) async {
                      await hideNumberParticipantPreference
                      .saveValue(value: value ?? false);
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
    required this.pref,
    required this.onChanged, 
    super.key,
  });
  final void Function (bool?) onChanged;
  final SharedPreferencesBoolHelper pref;
  final ThemeData theme;

  @override
  _SettingCheckBoxState createState() => _SettingCheckBoxState(
    theme: theme, 
    onChanged: onChanged,
  );
}

class _SettingCheckBoxState extends ConsumerState<SettingCheckBox> {
  _SettingCheckBoxState({
    required this.theme, 
    required this.onChanged,
  });

  final ThemeData theme;
  final void Function (bool?) onChanged;

  bool isChecked = false;

   @override
  void initState() {
    super.initState();
    _loadValue();
  }

  Future<void> _loadValue() async {
    bool fetchedData = await widget.pref.getStoredValue() ?? false;
    setState(() {
      isChecked = fetchedData;
    });
  }

  @override
  Widget build (BuildContext context) {
    return Checkbox (
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
        side: BorderSide(
          color: theme.colorScheme.primary,
          width: 2, 
        ),
      ),
      value: isChecked,
      onChanged: (bool? value) {
        onChanged(value);
        _loadValue();
      },
    );
  }
}

class SettingDropDownMenu extends ConsumerStatefulWidget {
  const SettingDropDownMenu({
    required this.theme, 
    required this.pref, 
    super.key,
  });
  final ThemeData theme;
  final SharedPreferencesStringHelper pref;

  SettingDropDownMenuState createState() => SettingDropDownMenuState(theme: theme);
}

class SettingDropDownMenuState extends ConsumerState<SettingDropDownMenu> {
  SettingDropDownMenuState({required this.theme});
  final ThemeData theme;
  late String defaultLanguage;

  @override

  void initState() {
    super.initState();
    _loadValue();
  }

  Future<void> _loadValue() async {
    final String fetchData = await widget.pref.getStoredValue() ?? 'English';
    setState(() {
      defaultLanguage = fetchData;
    });
    print(defaultLanguage);
  }

  @override
  Widget build (BuildContext context) 
  {
    return DropdownMenu<LanguageSetting>(
      initialSelection: LanguageSetting.getEnum(defaultLanguage)
        ?? LanguageSetting.english,
      requestFocusOnTap: false,
      onSelected: (LanguageSetting? ls) {
        if (ls != null) {
          widget.pref.saveValue(value: ls.name);
        } 
      },
      dropdownMenuEntries: LanguageSetting.values
        .map<DropdownMenuEntry<LanguageSetting>>(
        (LanguageSetting language) {
          return DropdownMenuEntry<LanguageSetting>(
            value: language,
            label: language.name,
          );
      }).toList(),
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
