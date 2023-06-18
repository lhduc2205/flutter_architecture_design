import 'package:architecture_designed/core/constants/endpoint.dart';
import 'package:architecture_designed/data/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

abstract class MealProviderRemoteDatasource {
  Future<Response> getAll();
}

class MealProviderRemoteDatasourceImpl implements MealProviderRemoteDatasource {
  MealProviderRemoteDatasourceImpl({required this.dioClient});

  final DioClient dioClient;

  @override
  Future<Response> getAll() async {
    try {
      final Response response = await dioClient.get(Endpoint.mealProvider);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
