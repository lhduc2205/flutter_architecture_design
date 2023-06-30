import 'package:architecture_designed/core/extensions/extension.dart';
import 'package:architecture_designed/l10n/l10n.dart';
import 'package:architecture_designed/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  factory SettingPage.routeBuilder(_, __) {
    return const SettingPage();
  }

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settings),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingTile(),
          ],
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.push(RouterPath.language);
      },
      tileColor: context.colorScheme.surfaceVariant,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      leading: const Icon(Icons.g_translate, color: Colors.blue),
      title: Text(
        context.l10n.languages,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: const FaIcon(FontAwesomeIcons.chevronRight, size: 18),
      // trailing: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 10),
      //   child: ToggleButtons(
      //     onPressed: (int newIndex) {
      //       // setState(() {
      //       //   for (int index = 0; index < isSelected.length; index++) {
      //       //     if (index == newIndex) {
      //       //       isSelected[index] = !isSelected[index];
      //       //     } else {
      //       //       isSelected[index] = false;
      //       //     }
      //       //   }
      //       // });
      //     },
      //     borderColor: Colors.blue,
      //     selectedBorderColor: Colors.blue,
      //     isSelected: [true, false],
      //     selectedColor: Theme.of(context).colorScheme.primary,
      //     color: Colors.grey,
      //     borderRadius: BorderRadius.circular(10),
      //     children: const [Text('EN'), Text('VI')],
      //   ),
      // )
    );
  }
}
