import 'package:architecture_designed/core/platform/network_info.dart';
import 'package:architecture_designed/data/api/dio_client.dart';
import 'package:architecture_designed/data/datasources/local/meal_provider.local.datasource.dart';
import 'package:architecture_designed/data/datasources/remote/photo.remote.datasource.dart';
import 'package:architecture_designed/data/repositories/meal_provider.repository.impl.dart';
import 'package:architecture_designed/data/repositories/photo.repository.impl.dart';
import 'package:architecture_designed/domain/repositories/meal_provider.repository.dart';
import 'package:architecture_designed/domain/repositories/photo.repository.dart';
import 'package:architecture_designed/domain/usecases/meal_provider/get_meal_provider.usecase.dart';
import 'package:architecture_designed/domain/usecases/photo/get_all_photo.usecase.dart';
import 'package:architecture_designed/global/language_manager.dart';
import 'package:architecture_designed/presentation/bloc/meal_provider/meal_provider_bloc.dart';
import 'package:architecture_designed/presentation/bloc/photo/photo_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _registerBlocs();
  _registerUseCases();
  _registerRepositories();
  _registerDataSources();
  _registerDioClient();
  _registerNetworkInfo();
  _registerLogger();
}

void _registerBlocs() {
  sl.registerFactory(() => LanguageManager());
  sl.registerFactory(
    () => MealProviderBloc(
      getAllMealProviderUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => PhotoBloc(
      getAllPhotoUseCase: sl(),
    ),
  );
}

void _registerUseCases() {
  sl.registerLazySingleton(() => GetAllMealProviderUseCase(sl()));
  sl.registerLazySingleton(() => GetAllPhotoUseCase(sl()));
}

void _registerRepositories() {
  sl.registerLazySingleton<MealProviderRepository>(
    () => MealProviderRepositoryImpl(
      remoteDatasource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<PhotoRepository>(
    () => PhotoRepositoryImpl(
      remoteDatasource: sl(),
      networkInfo: sl(),
    ),
  );
}

void _registerDataSources() {
  sl.registerLazySingleton<MealProviderLocalDatasource>(
    () => MealProviderLocalDatasourceImpl(dioClient: sl()),
  );
  sl.registerLazySingleton<PhotoRemoteDataSource>(
    () => PhotoRemoteDataSourceImpl(dioClient: sl()),
  );
}

void _registerDioClient() {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioClient(sl())..configure());
}

void _registerNetworkInfo() {
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl(), logger: sl())..init());
}

void _registerLogger() {
  sl.registerLazySingleton(() => Logger());
}
