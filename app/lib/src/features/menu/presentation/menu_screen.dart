import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ri_go_demo/src/utils/localization.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../data/menu_repository.dart';
import '../domain/menu.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(context.loc.appTitle),
      ),
      body: AsyncValueWidget<List<Category>>(
        value: ref.watch(fetchMenuProvider),
        //ListView müsste dann eventuell ersetzt werden mit dem Widget das genutzt wird
        //Daten in variable menu
        //Jeder Eintrag in Liste menu ist eine Kategorie mit einer Liste von allen Items in Kategorie
        //Category und Itemklasse ist in /domain/menu.dart
        data: (menu) => ListView.builder(
          itemCount: menu.length,
          itemBuilder: (context, index) {
             return ListTile(
              title: Text(menu[index].category),
            );
          },
        ),
      ),
    );
  }
}
