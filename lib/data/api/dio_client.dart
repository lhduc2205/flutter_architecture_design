import 'package:architecture_designed/core/constants/endpoint.dart';
import 'package:architecture_designed/core/errors/exception.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  DioClient(this._dio);

  void configure() {
    final options = BaseOptions(
      // baseUrl: LocalEndpoint.baseUrl,
      connectTimeout: LocalEndpoint.connectionTimeout,
      receiveTimeout: LocalEndpoint.receiveTimeout,
      contentType: ResponseType.json.name,
    );

    final interceptors = [
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    ];

    _dio.options = options;
    _dio.interceptors.addAll(interceptors);
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
      throw ServerException();
    }
  }
}