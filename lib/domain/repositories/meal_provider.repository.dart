import 'package:architecture_designed/core/errors/failure.dart';
import 'package:architecture_designed/domain/entities/meal_provider.entity.dart';

abstract class MealProviderRepository {
  Future<(Failure?, List<MealProvider>?)> getAll();
}