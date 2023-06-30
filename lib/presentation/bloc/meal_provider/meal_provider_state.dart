part of 'meal_provider_bloc.dart';

@freezed
class MealProviderState with _$MealProviderState {
  const factory MealProviderState.initial() = _MealProviderInitialState;

  const factory MealProviderState.loading() = _MealProviderLoadingState;

  const factory MealProviderState.loaded({
    required List<MealProvider> mealProviders,
  }) = _MealProviderLoadedState;

  const factory MealProviderState.error(Failure failure) = _MealProviderErrorState;
}
