import 'package:flutter/material.dart';
import 'lang/localization_service.dart';
import '../generated/l10n.dart';

extension LocalizationExtension on BuildContext {
  S get strings => LocalizationService.instance.strings;
}