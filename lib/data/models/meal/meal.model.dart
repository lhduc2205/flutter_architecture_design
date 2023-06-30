import 'package:architecture_designed/domain/entities/meal.entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal.model.freezed.dart';
part 'meal.model.g.dart';

@freezed
class MealModel extends Meal with _$MealModel {
  const factory MealModel({
    int? id,
    required String name,
    required int price,
    required String image,
    required String description,
  }) = $_MealModel;

  factory MealModel.fromJson(Map<String, Object?> json) => _$MealModelFromJson(json);
}
