// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeTitle => 'TabiCook';

  @override
  String get homeRecommendedTitle => 'Recommended';

  @override
  String get searchRecipes => 'Search recipes';

  @override
  String get notFindRecipes =>
      'We couldn\'t find any recipes. Try another search';

  @override
  String get retry => 'Retry';
}
