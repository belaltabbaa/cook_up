// import 'dart:developer';
// import 'package:cook_up/model/meal_model.dart';
// import 'package:cook_up/my_app.dart';
// import 'package:dio/dio.dart';

// class CrudService {
//   Dio dio = Dio();

//   Future<MealModel?> getAllMeals() async {
//     try {
//       var token = storage.getString("token");
//       print(token);
//       var response = await dio.get(
//         "https://food-api-omega.vercel.app/api/v1/chef/get-chef/66166877047e0824bcaa3368/meals",
//         options: Options(
//           headers: {
//             'token': 'FOODAPI ${storage.getString("token")}',
//           },
//         ),
//       );
//       MealModel meals = MealModel.fromMap(response.data);
//       return meals;
//     } catch (e) {
//       log("catch");
//       // ignore: avoid_print
//       print(e);
//       return null;
//     }
//   }
// }

import 'package:cook_up/model/meal_model.dart';
import 'package:cook_up/my_app.dart';
import 'package:dio/dio.dart';

class CrudService {
  Dio dio = Dio();
  late Response response;

  Future<MealModel?> getAllMeals() async {
    try {
      response = await dio.get(
        'https://food-api-omega.vercel.app/api/v1/chef/get-chef/66166877047e0824bcaa3368/meals',
        options: Options(headers: {
          'token': 'FOODAPI ${storage.getString('token')}',
        }),
      );
      MealModel meals = MealModel.fromMap(response.data);
      return meals;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }
}
