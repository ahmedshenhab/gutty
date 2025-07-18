// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Enter your phone number`
  String get enterPhone {
    return Intl.message(
      'Enter your phone number',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get enterName {
    return Intl.message(
      'Enter your username',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Welcome`
  String get welcom {
    return Intl.message('Welcome', name: 'welcom', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In to continue`
  String get signInToContinue {
    return Intl.message(
      'Sign In to continue',
      name: 'signInToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up to continue`
  String get signUpToContinue {
    return Intl.message(
      'Sign Up to continue',
      name: 'signUpToContinue',
      desc: '',
      args: [],
    );
  }

  /// ` Phone Number`
  String get phoneNumber {
    return Intl.message(
      ' Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// ` Enter a valid phone number`
  String get enterValidphone {
    return Intl.message(
      ' Enter a valid phone number',
      name: 'enterValidphone',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long, include uppercase, lowercase, number, and special character`
  String get enterValidPassword {
    return Intl.message(
      'Password must be at least 8 characters long, include uppercase, lowercase, number, and special character',
      name: 'enterValidPassword',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message('User Name', name: 'userName', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Middle Name`
  String get middleName {
    return Intl.message('Middle Name', name: 'middleName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Main Address`
  String get mainAddress {
    return Intl.message(
      'Main Address',
      name: 'mainAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter your main address`
  String get enterMainAddress {
    return Intl.message(
      'Enter your main address',
      name: 'enterMainAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter your first name`
  String get enterFirstName {
    return Intl.message(
      'Enter your first name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your middle name`
  String get enterMiddleName {
    return Intl.message(
      'Enter your middle name',
      name: 'enterMiddleName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your last name`
  String get enterLastName {
    return Intl.message(
      'Enter your last name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone or password`
  String get inValidEmailOrPassword {
    return Intl.message(
      'Invalid phone or password',
      name: 'inValidEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Opps, try again later`
  String get oppsTryLater {
    return Intl.message(
      'Opps, try again later',
      name: 'oppsTryLater',
      desc: '',
      args: [],
    );
  }

  /// `Connection error. Please check your internet.`
  String get error_connection {
    return Intl.message(
      'Connection error. Please check your internet.',
      name: 'error_connection',
      desc: '',
      args: [],
    );
  }

  /// `Connection timed out with server.`
  String get error_timeout {
    return Intl.message(
      'Connection timed out with server.',
      name: 'error_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Request to server was cancelled.`
  String get error_cancelled {
    return Intl.message(
      'Request to server was cancelled.',
      name: 'error_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout with server.`
  String get error_receive_timeout {
    return Intl.message(
      'Receive timeout with server.',
      name: 'error_receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Connection failed due to internet connection.`
  String get error_unknown {
    return Intl.message(
      'Connection failed due to internet connection.',
      name: 'error_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout with server.`
  String get error_send_timeout {
    return Intl.message(
      'Send timeout with server.',
      name: 'error_send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, try again.`
  String get error_bad_response {
    return Intl.message(
      'Something went wrong, try again.',
      name: 'error_bad_response',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong.`
  String get error_something_wrong {
    return Intl.message(
      'Something went wrong.',
      name: 'error_something_wrong',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred.`
  String get error_unknown_general {
    return Intl.message(
      'An unknown error occurred.',
      name: 'error_unknown_general',
      desc: '',
      args: [],
    );
  }

  /// `Connection timed out. Please try again.`
  String get error_connection_timeout {
    return Intl.message(
      'Connection timed out. Please try again.',
      name: 'error_connection_timeout',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred.`
  String get error_default {
    return Intl.message(
      'An unexpected error occurred.',
      name: 'error_default',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred.`
  String get error_unknown_occurred {
    return Intl.message(
      'An unknown error occurred.',
      name: 'error_unknown_occurred',
      desc: '',
      args: [],
    );
  }

  /// `Bad request. Please check your input.`
  String get error_bad_request {
    return Intl.message(
      'Bad request. Please check your input.',
      name: 'error_bad_request',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized access. Please login again.`
  String get error_unauthorized {
    return Intl.message(
      'Unauthorized access. Please login again.',
      name: 'error_unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Access forbidden.`
  String get error_forbidden {
    return Intl.message(
      'Access forbidden.',
      name: 'error_forbidden',
      desc: '',
      args: [],
    );
  }

  /// `Resource not found.`
  String get error_not_found {
    return Intl.message(
      'Resource not found.',
      name: 'error_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error.`
  String get error_server {
    return Intl.message(
      'Internal server error.',
      name: 'error_server',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
