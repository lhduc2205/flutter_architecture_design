import 'package:architecture_designed/gen/assets.gen.dart';
import 'package:architecture_designed/l10n/l10n.dart';
import 'package:architecture_designed/presentation/views/setting/pages/language_setting_page.dart';
import 'package:architecture_designed/presentation/widgets/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  factory SettingPage.routeBuilder(_, GoRouterState state) {
    return const SettingPage();
  }

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F3F3),
        title: Text(
          context.l10n.settings,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SettingTile(),
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
        context.go('/setting/language');
      },
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.only(left: 20, right: 10),
      leading: const Icon(Icons.g_translate, color: Colors.blue),
      title: Text(
        context.l10n.languages,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
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
      // ),
      trailing: SvgPicture.asset(
        Assets.images.vectors.forwardArrow.path,
        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
      ),
    );
  }
}
