import 'package:architecture_designed/data/datasources/meal_provider.datasource.dart';
import 'package:architecture_designed/data/network/dio_client.dart';
import 'package:architecture_designed/data/repositories/meal_provider.repository.impl.dart';
import 'package:architecture_designed/domain/repositories/meal_provider.repository.dart';
import 'package:architecture_designed/domain/usecases/get_meal_provider.usecase.dart';
import 'package:architecture_designed/global/language_manager.dart';
import 'package:architecture_designed/presentation/bloc/meal_provider_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final sl = GetIt.instance;

void initDependencies() async {
  _registerBlocs();
  _registerUseCases();
  _registerRepositories();
  _registerDataSources();
  _registerDioClient();
  sl.registerLazySingleton(() => Logger());
}

void _registerBlocs() {
  sl.registerFactory(() => LanguageManager());
  sl.registerFactory(
    () => MealProviderBloc(
      getAllMealProviderUseCase: sl(),
    ),
  );
}

void _registerUseCases() {
  sl.registerLazySingleton(() => GetAllMealProviderUseCase(sl()));
}

void _registerRepositories() {
  sl.registerLazySingleton<MealProviderRepository>(
    () => MealProviderRepositoryImpl(datasource: sl(), logger: sl()),
  );
}

void _registerDataSources() {
  sl.registerLazySingleton<MealProviderRemoteDatasource>(() => MealProviderRemoteDatasourceImpl(
        dioClient: sl(),
      ));
}

void _registerDioClient() {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioClient(sl()));
}
