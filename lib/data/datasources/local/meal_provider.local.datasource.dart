import 'package:architecture_designed/core/constants/endpoint.dart';
import 'package:architecture_designed/data/api/dio_client.dart';
import 'package:dio/dio.dart';

abstract class MealProviderLocalDatasource {
  Future<Response> getAll();
}

class MealProviderLocalDatasourceImpl implements MealProviderLocalDatasource {
  MealProviderLocalDatasourceImpl({required this.dioClient});

  final DioClient dioClient;

  @override
  Future<Response> getAll() async {
    try {
      final Response response = await dioClient.get(LocalEndpoint.mealProviders);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
