import 'package:cook_up/res/color_app.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BtnText extends StatelessWidget {
  BtnText({super.key, required this.text});

  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorApp().primary,
      ),
      child: SizedBox(
        width: 83,
        height: 36,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
