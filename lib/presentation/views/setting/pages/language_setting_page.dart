import 'package:architecture_designed/global/language_manager.dart';
import 'package:architecture_designed/core/enums/supported_languages.dart';
import 'package:architecture_designed/core/theme/app_colors.dart';
import 'package:architecture_designed/core/theme/app_styles.dart';
import 'package:architecture_designed/gen/assets.gen.dart';
import 'package:architecture_designed/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LanguageSettingPage extends StatefulWidget {
  const LanguageSettingPage({Key? key}) : super(key: key);

  factory LanguageSettingPage.routeBuilder(_, GoRouterState state) {
    return const LanguageSettingPage(
      key: Key('language_setting_page'),
    );
  }

  @override
  State<LanguageSettingPage> createState() => _LanguageSettingPageState();
}

class _LanguageSettingPageState extends State<LanguageSettingPage> {
  @override
  Widget build(BuildContext context) {
    final selectedLanguage = context.watch<LanguageManager>().state;
    final List<SupportedLanguageType> languages = context.getLanguages();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Assets.images.vectors.arrowIosBack.svg(
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        title: Text(
          context.l10n.languages,
          style: AppStyles.bodyXL.copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  TextStyle style = selectedLanguage == languages[index] ? AppStyles.bodyLG.copyWith(fontWeight: FontWeight.w600) : AppStyles.bodyLG;

                  return ListTile(
                    onTap: () {
                      context.read<LanguageManager>().changeLanguage(languages[index]);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: Text(
                      languages[index].name,
                      style: style,
                    ),
                    title: Text(
                      languages[index].getTranslationName(context),
                      style: style,
                    ),
                    trailing: AnimatedOpacity(
                      opacity: selectedLanguage == languages[index] ? 1 : 0,
                      duration: const Duration(milliseconds: 100),
                      child: Assets.images.vectors.check.image(height: 15),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
