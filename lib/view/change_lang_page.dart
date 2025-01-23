import 'package:cook_up/res/asset_app.dart';
import 'package:cook_up/res/color_app.dart';
import 'package:cook_up/res/string_app.dart';
import 'package:cook_up/view/login_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangeLangPage extends StatelessWidget {
  const ChangeLangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp().primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 116, right: 22, left: 22),
              child: SizedBox(
                width: 320,
                height: 174,
                child: Image.asset(AssetApp().COOKER),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 54, right: 38, left: 37),
              child: SizedBox(
                width: 300,
                height: 27,
                child: Text(
                  StringApp().NEXT,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1E1E1E),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120, left: 24),
                  child: InkWell(
                    onTap: () {
                      context.setLocale(const Locale("en"));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: Container(
                      width: 140,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black),
                      child: const Center(
                        child: Text(
                          "English",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120, right: 24, left: 25),
                  child: InkWell(
                    onTap: () {
                      context.setLocale(
                        const Locale("ar"),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: Container(
                      width: 140,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black),
                      child: const Center(
                        child: Text(
                          "العربية",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
