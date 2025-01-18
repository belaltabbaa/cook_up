import 'package:cook_up/futures/menu_page.dart';
import 'package:cook_up/model/user_model.dart';
import 'package:cook_up/res/asset_app.dart';
import 'package:cook_up/res/string_app.dart';
import 'package:cook_up/service/auth_service.dart';
import 'package:cook_up/widget/btn_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisibile = true;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(AssetApp().BACKGROUND),
                Center(
                  child: SizedBox(
                    width: 327,
                    height: 38,
                    child: Center(
                      child: Text(
                        StringApp().WELCOMEBACK,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 103, right: 24, left: 24),
              child: SizedBox(
                width: 327,
                height: 48,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: email,
                  decoration: InputDecoration(
                    hintText: StringApp().E_MAIL,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(strokeAlign: 1),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, right: 24, left: 24),
              child: SizedBox(
                width: 327,
                height: 48,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: password,
                  obscureText: isVisibile,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisibile = !isVisibile;
                        });
                      },
                      icon: const Icon(Icons.visibility_off_outlined),
                    ),
                    hintText: StringApp().PASSWORD,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(strokeAlign: 1),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 24, right: 200),
              child: SizedBox(
                width: 130,
                height: 20,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    StringApp().FORGETPASSWORD,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffB5B7B8),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 64, left: 24, right: 24),
              child: InkWell(
                onTap: () async {
                  bool status = await AuthService().login(
                      UserModel(email: email.text, password: password.text));
                  if (status == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuPage(),
                        ));
                  }
                  // if (status == true) {
                  //   Navigator.push(
                  //     // ignore: use_build_context_synchronously
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const MenuPage(),
                  //     ),
                  //   );
                  // } else if (_formKey.currentState!.validate()) {
                  //   // ignore: use_build_context_synchronously
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       content: Text("Failed"),
                  //       backgroundColor: Colors.red,
                  //     ),
                  //   );
                  // }
                },
                child: BtnText(text: StringApp().SIGNIN),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 72, left: 59, right: 59),
              child: Row(
                children: [
                  Text(
                    StringApp().DONTHAVEANACCOUNT,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff7D8FAB),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      StringApp().SIGNUP,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFA9A0C),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
