import 'package:architecture_designed/core/enums/supported_languages.dart';
import 'package:architecture_designed/core/extensions/extension.dart';
import 'package:architecture_designed/core/theme/app_styles.dart';
import 'package:architecture_designed/gen/assets.gen.dart';
import 'package:architecture_designed/global/language_manager.dart';
import 'package:architecture_designed/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LanguageSettingPage extends StatefulWidget {
  const LanguageSettingPage({Key? key}) : super(key: key);

  factory LanguageSettingPage.routeBuilder(_, __) {
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
        iconTheme: IconThemeData(color: context.colorScheme.primary),
        title: Text(
          context.l10n.languages,
          style: AppStyles.bodyXL.copyWith(color: context.colorScheme.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceVariant.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                ...languages.map((language) {
                  TextStyle style = selectedLanguage == language
                      ? AppStyles.bodyLG.copyWith(fontWeight: FontWeight.w600)
                      : AppStyles.bodyLG.copyWith(
                          fontWeight: FontWeight.w300,
                        );
                  return ListTile(
                    onTap: () {
                      context.read<LanguageManager>().changeLanguage(language);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: Text(
                      language.name,
                      style: style,
                    ),
                    title: Text(
                      language.getTranslationName(context),
                      style: style,
                    ),
                    trailing: AnimatedOpacity(
                      opacity: selectedLanguage == language ? 1 : 0,
                      duration: const Duration(milliseconds: 100),
                      child: const FaIcon(
                        FontAwesomeIcons.check,
                        size: 18,
                      ),
                    ),
                  );
                }).toList(),
              ]),
              // child: ListView.builder(
              //   itemCount: languages.length,
              //   itemBuilder: (context, index) {
              //     TextStyle style = selectedLanguage == languages[index]
              //         ? AppStyles.bodyLG.copyWith(fontWeight: FontWeight.w600)
              //         : AppStyles.bodyLG.copyWith(
              //             fontWeight: FontWeight.w300,
              //           );
              //
              //     return ListTile(
              //       onTap: () {
              //         context.read<LanguageManager>().changeLanguage(languages[index]);
              //       },
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       leading: Text(
              //         languages[index].name,
              //         style: style,
              //       ),
              //       title: Text(
              //         languages[index].getTranslationName(context),
              //         style: style,
              //       ),
              //       trailing: AnimatedOpacity(
              //         opacity: selectedLanguage == languages[index] ? 1 : 0,
              //         duration: const Duration(milliseconds: 100),
              //         child: const FaIcon(
              //           FontAwesomeIcons.check,
              //           size: 18,
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
