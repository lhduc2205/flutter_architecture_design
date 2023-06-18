import 'package:architecture_designed/core/usecase/use_case.dart';
import 'package:architecture_designed/domain/entities/meal_provider.entity.dart';
import 'package:architecture_designed/domain/usecases/get_meal_provider.usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_provider_bloc.freezed.dart';

part 'meal_provider_event.dart';

part 'meal_provider_state.dart';

class MealProviderBloc extends Bloc<MealProviderEvent, MealProviderState> {
  MealProviderBloc({
    required this.getAllMealProviderUseCase,
  }) : super(const MealProviderState.initial()) {
    on<GetAllMealProviderEvent>(_onGetAllMealProvider);
  }

  final GetAllMealProviderUseCase getAllMealProviderUseCase;

  _onGetAllMealProvider(
    GetAllMealProviderEvent event,
    Emitter<MealProviderState> emit,
  ) async {
    emit(const MealProviderState.loading());

    final (error, data) = await getAllMealProviderUseCase(NoParam());
    if (error != null) {
      emit(const MealProviderState.error());
      return;
    }

    emit(MealProviderState.loaded(mealProviders: data!));
  }
}
