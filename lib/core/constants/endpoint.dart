import 'dart:io';

class LocalEndpoint {
  const LocalEndpoint._();

  static const String _androidBaseUrl = 'http://10.0.2.2:9000';
  static const String _iosBaseUrl = 'http://localhost:9000';
  static String baseUrl = Platform.isAndroid ? _androidBaseUrl : _iosBaseUrl;

  static const Duration receiveTimeout = Duration(seconds: 10);
  static const Duration connectionTimeout = Duration(seconds: 10);

  static String mealProviders = '$baseUrl/meal-provider';
}

class RemoteEndpoint {
  const RemoteEndpoint._();

  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static const Duration receiveTimeout = Duration(seconds: 15000);
  static const Duration connectionTimeout = Duration(seconds: 15000);

  static const String photos = '$baseUrl/photos';
}
