class Endpoint {
  const Endpoint._();

  static String baseUrl = 'http://10.0.2.2:9000';

  static const Duration receiveTimeout = Duration(seconds: 15000);
  static const Duration connectionTimeout = Duration(seconds: 15000);

  static const String mealProvider = '/meal-provider';
}