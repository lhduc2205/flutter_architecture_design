import 'package:architecture_designed/core/constants/endpoint.dart';
import 'package:dio/dio.dart';

class DioClient {
  DioClient(this._dio) {
    _dio
      ..options.baseUrl = Endpoint.baseUrl
      ..options.connectTimeout = Endpoint.connectionTimeout
      ..options.receiveTimeout = Endpoint.receiveTimeout
      ..options.contentType = ResponseType.json.name;
  }

  final Dio _dio;

  Future<Response> get(String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}