import 'package:architecture_designed/domain/entities/meal_provider.entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_provider.model.freezed.dart';
part 'meal_provider.model.g.dart';

@freezed
class MealProviderModel extends MealProvider with _$MealProviderModel {
  const factory MealProviderModel({
    int? id,
    String? name,
    String? address,
    String? phoneNumber,
    String? description,
  }) = $_MealProviderModel;

  factory MealProviderModel.fromJson(Map<String, Object?> json) => _$MealProviderModelFromJson(json);
}
