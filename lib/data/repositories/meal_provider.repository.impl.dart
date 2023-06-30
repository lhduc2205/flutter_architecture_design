import 'package:architecture_designed/core/constants/endpoint.dart';
import 'package:architecture_designed/core/errors/exception.dart';
import 'package:architecture_designed/core/errors/failure.dart';
import 'package:architecture_designed/core/platform/network_info.dart';
import 'package:architecture_designed/data/datasources/local/meal_provider.local.datasource.dart';
import 'package:architecture_designed/data/models/meal_provider/meal_provider.model.dart';
import 'package:architecture_designed/domain/entities/meal_provider.entity.dart';
import 'package:architecture_designed/domain/repositories/meal_provider.repository.dart';

class MealProviderRepositoryImpl implements MealProviderRepository {
  const MealProviderRepositoryImpl({
    required this.remoteDatasource,
    required this.networkInfo,
  });

  final MealProviderLocalDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  @override
  Future<(Failure?, List<MealProvider>?)> getAll() async {
    if (await networkInfo.isConnected) {
      return await _getLocalData();
    } else {
      return (NetworkFailure(), null);
    }
  }

  Future<(Failure?, List<MealProvider>?)> _getLocalData() async {
    try {
      final response = await remoteDatasource.getAll();
      final mealProviders = (response.data['data'] as List).map((e) => MealProviderModel.fromJson(e)).toList();
      return (null, mealProviders);
    } on ServerException {
      // String failureMessage = 'Can not connect to Local Server\n${LocalEndpoint.mealProviders}';
      return (LocalServerFailure(properties: {'endpoint': LocalEndpoint.mealProviders}), null);
    }
  }
}
