import 'package:architecture_designed/core/enums/supported_languages.dart';
import 'package:bloc/bloc.dart';


class LanguageManager extends Cubit<SupportedLanguageType> {
  LanguageManager() : super(SupportedLanguageType.en);

  void changeLanguage(SupportedLanguageType type) => emit(type);
}
