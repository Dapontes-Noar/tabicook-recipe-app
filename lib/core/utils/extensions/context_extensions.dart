import 'package:flutter/widgets.dart';
import 'package:flutter_core_clean_mvvm/l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n {
    final localizations = AppLocalizations.of(this);
    if (localizations == null) {
      throw Exception(
        'AppLocalizations is not initialized for the current context.',
      );
    }
    return localizations;
  }
}
