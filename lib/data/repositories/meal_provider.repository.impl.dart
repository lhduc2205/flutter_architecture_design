import 'package:architecture_designed/core/errors/exception.dart';
import 'package:architecture_designed/core/errors/failure.dart';
import 'package:architecture_designed/data/datasources/meal_provider.datasource.dart';
import 'package:architecture_designed/data/models/meal_provider/meal_provider.model.dart';
import 'package:architecture_designed/domain/entities/meal_provider.entity.dart';
import 'package:architecture_designed/domain/repositories/meal_provider.repository.dart';
import 'package:logger/logger.dart';

class MealProviderRepositoryImpl implements MealProviderRepository {
  const MealProviderRepositoryImpl({required this.datasource, required this.logger});

  final MealProviderRemoteDatasource datasource;
  final Logger logger;

  @override
  Future<(Failure?, List<MealProvider>?)> getAll() async {
    try {
      final response = await datasource.getAll();
      final mealProviders = (response.data['data'] as List).map((e) => MealProviderModel.fromJson(e)).toList();
      logger.i(mealProviders, "Get all meal providers");
      return (null, mealProviders);
    } on ServerException {
      return (RemoteServerFailure(), null);
    }
  }
}
