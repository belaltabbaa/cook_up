// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class MealModel {
  String message;
  List<Meal> meals;
  MealModel({
    required this.message,
    required this.meals,
  });

  MealModel copyWith({
    String? message,
    List<Meal>? meals,
  }) {
    return MealModel(
      message: message ?? this.message,
      meals: meals ?? this.meals,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'meals': meals.map((x) => x.toMap()).toList(),
    };
  }

factory  MealModel.fromMap(Map<String, dynamic> map) {
  return MealModel(
    message: map['message'] as String,
    meals: List<Meal>.from(
      (map['meals'] as List<dynamic>)
          .map((item) => Meal.fromMap(item as Map<String, dynamic>)),
    ),
  );
}



  String toJson() => json.encode(toMap());

  factory MealModel.fromJson(String source) => MealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MealModel(message: $message, meals: $meals)';

  @override
  bool operator ==(covariant MealModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      listEquals(other.meals, meals);
  }

  @override
  int get hashCode => message.hashCode ^ meals.hashCode;
}

class Meal {
  String id;
  String name;
  String description;
  int price;
  String howToSell;
  List<String> images;
  String category;
  String chefId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Meal({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.howToSell,
    required this.images,
    required this.category,
    required this.chefId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  Meal copyWith({
    String? id,
    String? name,
    String? description,
    int? price,
    String? howToSell,
    List<String>? images,
    String? category,
    String? chefId,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return Meal(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      howToSell: howToSell ?? this.howToSell,
      images: images ?? this.images,
      category: category ?? this.category,
      chefId: chefId ?? this.chefId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'howToSell': howToSell,
      'images': images,
      'category': category,
      'chefId': chefId,
      'status': status,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'v': v,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
  return Meal(
    id: map['_id'] ?? '',
    name: map['name'] ?? '',
    description: map['description'] ?? '',
    price: map['price'] ?? 0,
    howToSell: map['howToSell'] ?? '',
    images: List<String>.from(map['images'] ?? []),
    category: map['category'] ?? '',
    chefId: map['chefId'] ?? '',
    status: map['status'] ?? '',
    createdAt: DateTime.parse(map['createdAt']),
    updatedAt: DateTime.parse(map['updatedAt']),
    v: map['__v'] ?? 0,
  );
}



  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) => Meal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Meal(id: $id, name: $name, description: $description, price: $price, howToSell: $howToSell, images: $images, category: $category, chefId: $chefId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(covariant Meal other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.howToSell == howToSell &&
      listEquals(other.images, images) &&
      other.category == category &&
      other.chefId == chefId &&
      other.status == status &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      howToSell.hashCode ^
      images.hashCode ^
      category.hashCode ^
      chefId.hashCode ^
      status.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      v.hashCode;
  }
}
