import 'package:cook_up/res/asset_app.dart';
import 'package:cook_up/res/color_app.dart';
import 'package:cook_up/view/change_lang_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ChangeLangPage(),
          )),
    );
    return Scaffold(
      backgroundColor: ColorApp().primary,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 305, bottom: 305, right: 113, left: 112),
        child: SizedBox(
          width: 150,
          height: 202,
          child: Image.asset(
            AssetApp().lOGO,
          ),
        ),
      ),
    );
  }
}
