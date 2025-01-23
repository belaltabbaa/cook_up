import 'package:cook_up/res/asset_app.dart';
import 'package:cook_up/res/color_app.dart';
import 'package:cook_up/res/string_app.dart';
import 'package:cook_up/service/crud_service.dart';
import 'package:cook_up/widget/btn_text.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  top: 34, bottom: 24, right: 24, left: 24),
              child: BtnText(text: StringApp().ADDMEAL)),
          FutureBuilder(
            future: CrudService().getAllMeals(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.meals.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(
                            snapshot.data!.meals[index].images[0]),
                        title: Text(snapshot.data!.meals[index].name),
                        subtitle: Text(snapshot.data!.meals[index].description),
                        trailing: Image.asset(AssetApp().ICONIMAGE),
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: ColorApp().primary,
        surfaceTintColor: ColorApp().primary,
        animationDuration: const Duration(seconds: 3),
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home,
            ),
            label: "Menu",
          ),
          NavigationDestination(
              icon: Icon(Icons.person_off_outlined), label: "Profile"),
        ],
      ),
    );
  }
}
