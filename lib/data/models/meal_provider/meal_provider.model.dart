import 'package:architecture_designed/data/models/meal/meal.model.dart';
import 'package:architecture_designed/domain/entities/meal_provider.entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_provider.model.freezed.dart';
part 'meal_provider.model.g.dart';

@freezed
class MealProviderModel extends MealProvider with _$MealProviderModel {
  const factory MealProviderModel({
    int? id,
    required String name,
    required String address,
    required String phoneNumber,
    required String? description,
    required String image,
    required List<MealModel> meals,
  }) = $_MealProviderModel;

  factory MealProviderModel.fromJson(Map<String, Object?> json) => _$MealProviderModelFromJson(json);
}
