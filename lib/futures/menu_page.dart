import 'dart:developer';

import 'package:cook_up/model/meal_model.dart';
import 'package:cook_up/res/color_app.dart';
import 'package:cook_up/res/string_app.dart';
import 'package:cook_up/service/crud_service.dart';
import 'package:cook_up/widget/btn_text.dart';
import 'package:flutter/material.dart';

late MealModel mealModel;
int index = 1;

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
          FutureBuilder<MealModel?>(
            future: CrudService().getAllMeals(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                log("message1");
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (snapshot.hasData && snapshot.data != null) {
                log("message2");
                print("hohohohohoohoh ${snapshot.data}");
                var meals = snapshot.data!.meals;
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    width: 327,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 53, bottom: 49, right: 16, left: 16),
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.network(meals[1].images[0]),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 24, right: 60, left: 16),
                                  child: Text(
                                    meals[1].name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, right: 60, left: 16),
                                  child: Text(
                                    meals[1].description,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffC4C4C4)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, right: 60, left: 16),
                                  child: Text(
                                    "${meals[1].price}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffC4C4C4)),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 49, right: 16, left: 16),
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(meals[0].images[0]),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 327,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 49, right: 16, left: 16),
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.network(meals[1].images[0]),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 24, right: 60, left: 16),
                                    child: Text(
                                      meals[1].name,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, right: 60, left: 16),
                                    child: Text(
                                      meals[1].description,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffC4C4C4)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, right: 60, left: 16),
                                    child: Text(
                                      "${meals[1].price}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffC4C4C4)),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 53, bottom: 49, right: 16, left: 16),
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.network(meals[0].images[0]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: Text("No data available"));
              }
            },
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: ColorApp().primary,
        surfaceTintColor: ColorApp().primary,
        animationDuration: const Duration(seconds: 3),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home,),
            label: "Menu",
          ),
          NavigationDestination(
              icon: Icon(Icons.person_off_outlined), label: "Profile"),
        ],
      ),
    );
  }
}
