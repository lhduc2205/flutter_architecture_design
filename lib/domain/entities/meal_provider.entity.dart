
import 'package:architecture_designed/domain/entities/meal.entity.dart';

abstract class MealProvider {
  const MealProvider({
    this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    this.description,
    required this.image,
    required this.meals,
  });

  final int? id;
  final String name;
  final String address;
  final String phoneNumber;
  final String? description;
  final String image;
  final List<Meal> meals;
}
