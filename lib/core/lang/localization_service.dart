import 'package:flutter/material.dart';
import '../../generated/l10n.dart';

class LocalizationService {
  //private
   LocalizationService._();
  static late S _localizations;

  static void init(BuildContext context) {
    _localizations = S.of(context);
  }

  static S get strings => _localizations;
}