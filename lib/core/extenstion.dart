import 'package:flutter/material.dart';
import 'package:gutty/core/lang/localization_service.dart';
import 'package:gutty/generated/l10n.dart';

extension LocalizationExtension on BuildContext {
  S get strings => LocalizationService.strings;
}