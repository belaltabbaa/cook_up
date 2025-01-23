import 'package:cook_up/config/service_locator.dart';
import 'package:cook_up/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  storage = await SharedPreferences.getInstance();
  setup();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translate',
      fallbackLocale: const Locale('en', 'ar'),
      child: const MyApp(),
    ),
  );
}
