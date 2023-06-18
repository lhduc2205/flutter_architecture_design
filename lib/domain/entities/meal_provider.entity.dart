import 'package:architecture_designed/data/models/meal_provider/meal_provider.model.dart';

abstract class MealProvider {
  const MealProvider({
    this.id,
    this.name,
    this.address,
    this.phoneNumber,
    this.description,
  });

  final int? id;
  final String? name;
  final String? address;
  final String? phoneNumber;
  final String? description;
}
