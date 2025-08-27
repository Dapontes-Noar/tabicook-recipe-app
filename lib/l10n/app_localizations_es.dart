// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get homeTitle => 'TabiCook';

  @override
  String get homeRecommendedTitle => 'Recomendados';

  @override
  String get searchRecipes => 'Buscar recetas';

  @override
  String get notFindRecipes =>
      'No pudimos encontrar ninguna receta. Intenta con otra búsqueda';

  @override
  String get retry => 'Reintentar';
}
