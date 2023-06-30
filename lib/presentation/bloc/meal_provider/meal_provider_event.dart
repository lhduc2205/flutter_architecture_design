part of 'meal_provider_bloc.dart';

@freezed
class MealProviderEvent with _$MealProviderEvent {
  const factory MealProviderEvent.getAll() = GetAllMealProviderEvent;
}
