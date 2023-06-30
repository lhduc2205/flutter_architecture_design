import 'package:architecture_designed/core/errors/failure.dart';
import 'package:architecture_designed/core/usecase/use_case.dart';
import 'package:architecture_designed/domain/entities/meal_provider.entity.dart';
import 'package:architecture_designed/domain/usecases/meal_provider/get_meal_provider.usecase.dart';
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

  Future<void> _onGetAllMealProvider(
    GetAllMealProviderEvent event,
    Emitter<MealProviderState> emit,
  ) async {
    emit(const MealProviderState.loading());

    await Future.delayed(const Duration(seconds: 1));

    final (failure, mealProviders) = await getAllMealProviderUseCase(NoParam());
    if (failure != null) {
      emit(MealProviderState.error(failure));
      return;
    }

    emit(MealProviderState.loaded(mealProviders: mealProviders!));
  }
}
