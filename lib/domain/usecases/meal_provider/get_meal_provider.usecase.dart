import 'package:architecture_designed/core/errors/failure.dart';
import 'package:architecture_designed/core/usecase/use_case.dart';
import 'package:architecture_designed/domain/entities/meal_provider.entity.dart';
import 'package:architecture_designed/domain/repositories/meal_provider.repository.dart';

class GetAllMealProviderUseCase extends UseCase<List<MealProvider>, NoParam> {
  GetAllMealProviderUseCase(this.mealProviderRepository);

  final MealProviderRepository mealProviderRepository;

  @override
  Future<(Failure?, List<MealProvider>?)> call(NoParam param) async {
    return await mealProviderRepository.getAll();
  }
}