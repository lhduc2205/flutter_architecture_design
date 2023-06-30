import 'package:architecture_designed/core/constants/endpoint.dart';
import 'package:architecture_designed/core/params/photo_params.dart';
import 'package:architecture_designed/data/api/dio_client.dart';
import 'package:dio/dio.dart';

abstract class PhotoRemoteDataSource {
  Future<Response> getAll(PhotoPageLimitParams params);
}

class PhotoRemoteDataSourceImpl implements PhotoRemoteDataSource {
  const PhotoRemoteDataSourceImpl({required this.dioClient});

  final DioClient dioClient;

  @override
  Future<Response> getAll(PhotoPageLimitParams params) async {
    try {
      final Response response = await dioClient.get(
        RemoteEndpoint.photos,
        queryParameters: {
          '_page': params.page,
          '_limit': params.limit,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
